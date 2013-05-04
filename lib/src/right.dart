part of option;

class Right<L, R> extends Either<L, R> {

  final R _inner;

  /**
   * Constant constructor because we like immutability
   *
   * @param R _inner - The inner value to wrap
   */
  const Right(this._inner);

  /**
   * Returns false
   *
   * @return Boolean - False
   */
  bool isLeft() {
    return false;
  }

  /**
   * Returns true
   *
   * @return Boolean - True
   */
  bool isRight() {
    return true;
  }

  /**
   * Calls `rightCase` with the inner value and returns the result
   *
   * @param dynamic(L) leftCase  - The left case to ignore
   * @param dynamic(R) rightCase - The right case to run
   * @return dynamic             - The result of the `rightCase`
   */
  dynamic fold(dynamic leftCase(L left), dynamic rightCase(R right)) {
    return rightCase(this._inner);
  }

  /**
   * Given a `mapper` this function applies the mapper to the inner value.
   *
   * @param dynamic(R) mapper   - The mapper to apply to the inner value
   * @return Either<L, dynamic> - The result of applying the mapper
   */
  Either<L, dynamic> map(dynamic mapper(R n)) {
    return new Right(mapper(this._inner));
  }

  /**
   * Given a `flatMapper` this function applies the flatMapper to the inner
   * value.
   *
   * @param Either<dynamic, dynamic>(R) flatMapper - The flatMapper to apply
   * @return Either<dynamic, dynamic> - The result of applying the flatMapper
   */
  Either<dynamic, dynamic> flatMap(Either<dynamic, dynamic> flatMapper(R n)) {
    return flatMapper(this._inner);
  }

  /**
   * Returns a `None` projection
   *
   * @return Option<L> - The `None` projection
   */
  Option<L> left() {
    return new None<L>();
  }

  /**
   * Returns a `Some` projection
   *
   * @return Option<R> - The `Some` projection
   */
  Option<R> right() {
    return new Some(this._inner);
  }

  /**
   * Returns the inner value wrapped in a `Left
   *
   * @return Either<R, L> - The swapped `Either` type
   */
  Either<R, L> swap() {
    return new Left(this._inner);
  }

}