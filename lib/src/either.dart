part of option;

abstract class Either<L, R> {

  const Either();

  /**
   * Returns true if this `Either` type is `Left`, fasle otherwise
   *
   * @return Boolean
   */
  bool isLeft();

  /**
   * Returns true if this `Either` type is `Right`, false otherwise
   *
   * @return Boolean
   */
  bool isRight();

  /**
   * If this `Either` type is `Left` then `leftCase` will be called with the
   * inner value of `Left` and the result of `leftCase` will be returned. The
   * same applies for `rightCase` in the event that this `Either` type
   * is `Right`
   *
   * @param dynamic(L) leftCase  - The computation to run on `Left` type
   * @param dynamic(R) rightCase - The computation to run on `Right` type
   * @return dynamic             - The result of the computation that was ran
   */
  dynamic fold(dynamic leftCase(L left), dynamic rightCase(R right));

  /**
   * Given a `mapper` this function applies the mapper to the inner value of
   * this `Either` if and only if this `Either` type is `Right`. If this
   * `Either` type is `Left`, then this function returns `this` immediately
   *
   * @param dynamic(R) mapper - The mapper to apply to the inner right value
   * @return Either<dynamic, dynamic> - The result of the map opperation
   */
  Either<L, dynamic> map(dynamic mapper(R n));


  /**
   * Given a `flatMapper` this function applies the flatMapper to the inner
   * value of this `Either` if and only if this `Either` type is `Right`.
   * If this `Either` type is `Left`, then this function returns `this`
   * immediately
   *
   * @param Either<dynamic, dynamic>(R n) flatMapper - The flatMapper to apply
   * @return Either<dynamic, dynamic> - The result of the flatMap
   */
  Either<dynamic, dynamic> flatMap(Either<dynamic, dynamic> flatMapper(R n));

  /**
   * Returns an `Option` projection of the `Left` value of this `Either` type.
   * So if this is type `Left` it returns an instance of `Some` but if this is
   * a `Right` type this returns an instance of `None`
   *
   * @return Option<L> - The optional left projection
   */
  Option<L> left();

  /**
   * Returns an `Option` projection of the `Right` value of this `Either` type.
   * So fi this is type `Right` it returns an instance of `Some` but if this is
   * a `Left` type thin this returns an instance of `None`
   *
   * @return Option<R> - The optional right projection
   */
  Option<R> right();

  /**
   * When ran on a `Left` type this returns a `Right` with the same inner value.
   * When ran on a `Right` type this returns a `Left` with the same inner value.
   *
   * @return Either<R, L> - The swapped `Either` type
   */
  Either<R, L> swap();

}