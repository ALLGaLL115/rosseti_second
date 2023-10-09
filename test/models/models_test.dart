import 'package:flutter_test/flutter_test.dart';
import 'package:rosseti_second/data/models/models.dart';

void main() {
  test('Get men name and age', () async {
    final men = Men(34, 'joskg');

    expect(men.name, "joskg");
    expect(men.age, 34);
  });

  test("Change mens age and name ", () {
    final men = Men(21342, "Namdf");
    expect(men.age, 21342);
    expect(men.name, "Namdf");

    men.renaim("adsf");
    men.newAge(12);

    expect(men.age, 12);
    expect(men.name, "adsf");
  });
}
