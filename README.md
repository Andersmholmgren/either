Either
======

A more expressive way to return error or success values via the type system.
Instead of throwing exeptions return an error state of any type, even if it
conflicts with the type of the success return value. The higher kinded type
of the `Either` will be used to determine if the value contains an error or
a success value.

`Either` is an interface implemented by the two concrete types of `Left`
and `Right`. By convention, `Left` is used to encapsulate an error value
while `Right` is used to encapsulate a success value.

`Left` and `Right` are both projectable to `Option` types so you can chain
and compose operations together based on success or failure values in the
typical monadic flow style via `Option#map`, `Option#flatMap`, etc.

Public Interface
----------------
This is the `Either` interface implemented by both `Left` and `Right`
```dart
part of option;

import 'package:option/option.dart';

abstract class Either<L, R> {

  /**
   * Returns true if this `Either` type is `Left`, fasle otherwise
   *
   * @return {Boolean}
   */
  bool isLeft();

  /**
   * Returns true if this `Either` type is `Right`, false otherwise
   *
   * @return {Boolean}
   */
  bool isRight();

  /**
   * If this `Either` type is `Left` then `leftCase` will be called with the
   * inner value of `Left` and the result of `leftCase` will be returned. The
   * same applies for `rightCase` in the event that this `Either` type
   * is `Right`
   *
   * @param {dynamic(L)} leftCase  - The computation to run on `Left` type
   * @param {dynamic(R)} rightCase - The computation to run on `Right` type
   * @return {dynamic}             - The result of the computation that was ran
   */
  dynamic fold(dynamic leftCase(L left), dynamic rightCase(R right));

  /**
   * Returns an `Option` projection of the `Left` value of this `Either` type.
   * So if this is type `Left` it returns an instance of `Some` but if this is
   * a `Right` type this returns an instance of `None`
   *
   * @return {Option<L>} - The optional left projection
   */
  Option<L> left();

  /**
   * Returns an `Option` projection of the `Right` value of this `Either` type.
   * So fi this is type `Right` it returns an instance of `Some` but if this is
   * a `Left` type thin this returns an instance of `None`
   *
   * @return {Option<R>} - The optional right projection
   */
  Option<R> right();

  /**
   * When ran on a `Left` type this returns a `Right` with the same inner value.
   * When ran on a `Right` type this returns a `Left` with the same inner value.
   *
   * @return {Either<R, L>} - The swapped `Either` type
   */
  Either<R, L> swap();

}
```
