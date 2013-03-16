part of option;

import 'package:option/option.dart';

class Left<L, R> extends Either<L, R> {

  final L _inner;

  /**
   * Constant constructor because we like immutability
   *
   * @param {L} _inner - The inner value to wrap
   */
  const Left(this._inner);

  /**
   * Returns true
   *
   * @return {Boolean} - True
   */
  bool isLeft() {
    return true;
  }

  /**
   * Returns false
   *
   * @return {Boolean} - False
   */
  bool isRight() {
    return false;
  }

  /**
   * Calls `leftCase` with the inner value and returns the result
   *
   * @param {dynamic(L)} leftCase  - The left case to run
   * @param {dynamic(R)} rightCase - The right case to ignore
   * @return {dynamic}             - The result of the `leftCase`
   */
  dynamic fold(dynamic leftCase(L left), dynamic rightCase(R right)) {
    return leftCase(this._inner);
  }

  /**
   * Returns a `Some` projection
   *
   * @return {Option<L>} - The `Some` projection
   */
  Option<L> left() {
    return new Some(this._inner);
  }

  /**
   * Returns a `None` projection
   *
   * @return {Option<R>} - The `None` projection
   */
  Option<R> right() {
    return new None<R>();
  }

  /**
   * Returns the inner value wrapped in a `Right`
   *
   * @return {Either<R, L>} - The swapped `Either` type
   */
  Either<R, L> swap() {
    return new Right(this._inner);
  }

}