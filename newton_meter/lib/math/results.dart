import 'package:newton_meter/math/accel_math.dart';

class NewtonResults {
  NewtonResults(
      {required this.acceleration,
      required this.velocity,
      required this.position,
      required this.magAcceleration,
      required this.magVelocity,
      required this.magPosition});

  List<Vec3Time> acceleration;
  List<Vec3Time> velocity;
  List<Vec3Time> position;

  List<double> magAcceleration;
  List<double> magVelocity;
  List<double> magPosition;

  static NewtonResults build(List<Vec3Time> acceleration) {
    var velocity = integrate(acceleration);
    var position = integrate(velocity);

    var magAcceleration = scalarize(acceleration);
    var magVelocity = scalarize(velocity);
    var magPosition = scalarize(position);

    return NewtonResults(
        acceleration: acceleration,
        velocity: velocity,
        position: position,
        magAcceleration: magAcceleration,
        magVelocity: magVelocity,
        magPosition: magPosition);
  }
}
