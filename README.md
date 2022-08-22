# future_delayed

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Future<T>.delayed constructor Null safety
Future<T>.delayed(
Duration duration,
[FutureOr<T> computation()?]
)
Creates a future that runs its computation after a delay.

The computation will be executed after the given duration has passed, and the future is completed with the result of the computation.

If computation returns a future, the future returned by this constructor will complete with the value or error of that future.

If the duration is 0 or less, it completes no sooner than in the next event-loop iteration, after all microtasks have run.

If computation is omitted, it will be treated as if computation was () => null, and the future will eventually complete with the null value. In that case, T must be nullable.

If calling computation throws, the created future will complete with the error.

See also Completer for a way to create and complete a future at a later time that isn't necessarily after a known fixed duration.

Example:

Future.delayed(const Duration(seconds: 1), () {
  print('One second has passed.'); // Prints after 1 second.
});
Implementation
factory Future.delayed(Duration duration, [FutureOr<T> computation()?]) {
  if (computation == null && !typeAcceptsNull<T>()) {
    throw ArgumentError.value(
        null, "computation", "The type parameter is not nullable");
  }
  _Future<T> result = new _Future<T>();
  new Timer(duration, () {
    if (computation == null) {
      result._complete(null as T);
    } else {
      try {
        result._complete(computation());
      } catch (e, s) {
        _completeWithErrorCallback(result, e, s);
      }
    }
  });
  return result;
}
