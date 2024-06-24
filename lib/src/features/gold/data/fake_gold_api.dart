import 'dart:math';

/// Returns a stream of a fake gold prices.
/// The prices are generated randomly.
Stream<double> getGoldPriceStream() {
  Random random = Random();
  return Stream<double>.periodic(
    const Duration(seconds: 2),
    (int _) {
      return 50 + random.nextDouble() * 20;
    },
  );
}
