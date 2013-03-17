import 'package:either/either.dart';

main() {

  var left  = new Left<String, String>("left");
  var right = new Right<String, String>("right");

  var leftIsLeft          = left.isLeft();
  var leftIsRight         = left.isRight();
  var leftLeftProjection  = left.left();
  var leftRightProjection = left.right();
  var leftSwapped         = left.swap();
  var leftFold    = left.fold(
    (v) => "folded ${v}",
    (v) => "never executed"
  );

  var rightIsLeft = right.isLeft();
  var rightIsRight = right.isRight();
  var rightLeftProjection = right.left();
  var rightRightProjection = right.right();
  var rightSwapped = right.swap();
  var rightFold = right.fold(
    (v) => "never executed",
    (v) => "folded ${v}"
  );

}