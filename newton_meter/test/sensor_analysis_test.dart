
import 'package:flutter_test/flutter_test.dart';
import 'package:newton_meter/widgets/sensor_page.dart';

void main() {
    test("Basic integration of vectors", () {
        List<Vec3Time> vs = [
            Vec3Time(x: 0, y: 0, z: 0, seconds: 0),
            Vec3Time(x: 1, y: 2, z: 3, seconds: 1),
            Vec3Time(x: 5, y: 1, z: 7, seconds: 2),
            Vec3Time(x: 8, y: 8, z: 8, seconds: 4),
        ];
        var intVs = integrate(vs);

        expect(intVs[1].x, 1);
        expect(intVs[1].y, 2);
        expect(intVs[1].z, 3);
        expect(intVs[1].seconds, 1);

        expect(intVs[2].x, 5+1*1);
        expect(intVs[2].y, 1+2*1);
        expect(intVs[2].z, 7+3*1);
        expect(intVs[2].seconds, 2);

        expect(intVs[3].x, 5+1*1+8*2);
        expect(intVs[3].y, 1+2*1+8*2);
        expect(intVs[3].z, 7+3*1+8*2);
        expect(intVs[3].seconds, 4);
    });

    test("Integrating a constant", () {
        List<Vec3Time> vs = [
            Vec3Time(x: 0, y: 0, z: 0, seconds: 0),
            Vec3Time(x: 0, y: 0, z: 5, seconds: 1),
            Vec3Time(x: 0, y: 0, z: 5, seconds: 2),
            Vec3Time(x: 0, y: 0, z: 5, seconds: 3),
            Vec3Time(x: 0, y: 0, z: 5, seconds: 4),
            Vec3Time(x: 0, y: 0, z: 5, seconds: 5),
        ];
        var intVs = integrate(vs);
        for(int i = 0; i < 5; ++i) {
            expect(intVs[i+1].z, 5*(i+1));
        }

        expect(intVs.last.z, 25);
    });

    test("Integrating a constant with nonuniform sample times", () {
        List<Vec3Time> vs = [
            Vec3Time(x: 0, y: 0, z: 0, seconds: 0),
            Vec3Time(x: 0, y: 0, z: 5, seconds: 1),
            Vec3Time(x: 0, y: 0, z: 5, seconds: 3),
            Vec3Time(x: 0, y: 0, z: 5, seconds: 5),
        ];
        var intVs = integrate(vs);

        expect(intVs.last.z, 25);
    });

    test("Integrating constant function twice", () {
        List<Vec3Time> vs = [
            Vec3Time(x: 0, y: 0, z: 0, seconds: 0),
            Vec3Time(x: 0, y: 6, z: 0, seconds: 1),
            Vec3Time(x: 0, y: 6, z: 0, seconds: 2),
            Vec3Time(x: 0, y: 6, z: 0, seconds: 3),
            Vec3Time(x: 0, y: 6, z: 0, seconds: 4),
            Vec3Time(x: 0, y: 6, z: 0, seconds: 5),
        ];
        var intVsBetween = integrate(vs);
        var intVs = integrate(intVsBetween);

        expect(intVs[0].y, 0);
        expect(intVs[1].y, 6);
        expect(intVs[2].y, 18);
        expect(intVs[3].y, 36);
        expect(intVs[4].y, 60);
        expect(intVs[5].y, 90);

        expect(intVs.last.y, 90);
    });
}
