import 'package:newton_meter/math/accel_math.dart';

class NewtonResults {
  NewtonResults(
      {required this.acceleration,
      required this.velocity,
      required this.position,
      required this.magAcceleration,
      required this.magVelocity,
      required this.magPosition,
      required this.avgMagVel});

  List<Vec3Time> acceleration;
  List<Vec3Time> velocity;
  List<Vec3Time> position;

  List<double> magAcceleration;
  List<double> magVelocity;
  List<double> magPosition;

  double avgMagVel;

  String get elapsed {
    return acceleration.last.seconds.toStringAsPrecision(3);
  }

  String get averageVelocity {
    return avgMagVel.toStringAsPrecision(3);
  }

  String averageMomentum(double mass) {
    return (avgMagVel * mass).toStringAsPrecision(3);
  }

  String get displacement {
    return magPosition.last.toStringAsPrecision(3);
  }

  String netForce(double mass) {
    return (magVelocity.last * mass / velocity.last.seconds)
        .toStringAsPrecision(3);
  }

  static NewtonResults build(List<Vec3Time> acceleration) {
    var velocity = integrate(acceleration);
    var position = integrate(velocity);

    var magAcceleration = scalarize(acceleration);
    var magVelocity = scalarize(velocity);
    var magPosition = scalarize(position);

    var avgMagVel = average(magVelocity);

    return NewtonResults(
        acceleration: acceleration,
        velocity: velocity,
        position: position,
        magAcceleration: magAcceleration,
        magVelocity: magVelocity,
        magPosition: magPosition,
        avgMagVel: avgMagVel);
  }
}
