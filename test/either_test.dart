import "package:unittest/unittest.dart";
import "package:either/either.dart";
import "package:option/option.dart";

leftTests() {
  group("Left Test:", () {
    var instance = new Left(3);

    test("isLeft() should return true", () {
      expect(instance.isLeft(), isTrue);
    });

    test("isRight() should return false", () {
      expect(instance.isRight(), isFalse);
    });

    test("cata() should run the left case", () {
      var result = instance.cata(
        (e) => true,
        (s) => false
      );
      expect(result, isTrue, reason: "The right case ran for cata() on a Left");
    });

    test("map() should return the same Left instance", () {
      var result = instance.map((e) => e);
      expect(result is Left, isTrue);
      expect(result.left().get(), equals(3));
    });

    test("flatMap() should return the same Left instace", () {
      var result = instance.flatMap((e) => new Right(e));
      expect(result is Left, isTrue);
    });

    test("left() should return an option projection of Some", () {
      var result = instance.left();
      expect(result is Some, isTrue);
      expect(result.get(), equals(3));
    });

    test("right() should return an option projection of None", () {
      expect(instance.right() is None, isTrue);
    });

    test("swap() should return a Right with the same inner value", () {
      var result = instance.swap();
      expect(result is Right, isTrue);
      expect(result.right().get(), equals(3));
    });

  });
}

rightTests() {
  group("Right Test:", () {
    var instance = new Right(3);

    test("isLeft() should return false", () {
      expect(instance.isLeft(), isFalse);
    });

    test("isRight() should return true", () {
      expect(instance.isRight(), isTrue);
    });

    test("cata() should run the right case", () {
      var result = instance.cata(
        (e) => false,
        (s) => true
      );
      expect(result, isTrue, reason: "The left case ran for cata() on a Right");
    });

    test("map() should apply the mapper", () {
      var result = instance.map((e) => e * 2);
      expect(result is Right, isTrue);
      expect(result.right().get(), equals(6));
    });

    test("flatMap() should apply the flatMapper", () {
      var result = instance.flatMap((e) => new Left(e * 2));
      expect(result is Left, isTrue);
      expect(result.left().get(), equals(6));
    });

    test("left() should return an option projection of None", () {
      expect(instance.left() is None, isTrue);
    });

    test("right() should return an option projection of Some", () {
      var result = instance.right();
      expect(result is Some, isTrue);
      expect(result.get(), equals(3));
    });

    test("swap() should return a Left with the same inner value", () {
      var result = instance.swap();
      expect(result is Left, isTrue);
      expect(result.left().get(), equals(3));
    });

  });
}

main() {

  leftTests();
  rightTests();

}