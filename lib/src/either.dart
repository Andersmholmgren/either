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