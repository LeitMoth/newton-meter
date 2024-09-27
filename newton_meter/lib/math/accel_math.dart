import 'dart:math';

class Vec3Time {
  Vec3Time(
      {required this.x,
      required this.y,
      required this.z,
      required this.seconds});
  double x = 0, y = 0, z = 0, seconds = 0;
}

/*
For the first Vec3Time, its time component is discarded,
and its values are used as the initial condition.
For our purposes, we always want the first Vec3Time
to be the zero vector
*/
List<Vec3Time> integrate(List<Vec3Time> vs) {
  List<Vec3Time> integrated = List.of(vs);

  for (int i = 1; i < vs.length; ++i) {
    var dt = vs[i].seconds - vs[i - 1].seconds;
    integrated[i].x = integrated[i - 1].x + integrated[i].x * dt;
    integrated[i].y = integrated[i - 1].y + integrated[i].y * dt;
    integrated[i].z = integrated[i - 1].z + integrated[i].z * dt;
  }

  return integrated;
}

List<double> scalarize(List<Vec3Time> vs) {
  return vs.map((e) => sqrt(e.x * e.x + e.y * e.y + e.z * e.z)).toList();
}
