import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stream_gold_rate/src/features/gold/data/fake_gold_api.dart';
// Stellen Sie sicher, dass Sie diese Zeile importieren

class GoldScreen extends StatefulWidget {
  const GoldScreen({super.key});

  @override
  State<GoldScreen> createState() => _GoldScreenState();
}

class _GoldScreenState extends State<GoldScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 40),
              Text('Live Kurs:',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 40),
              StreamBuilder<double>(
                // Double, weil Komma-Preis möglich ist!
                stream: getGoldPriceStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      NumberFormat.simpleCurrency(locale: 'de_DE')
                          .format(snapshot.data),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: Theme.of(context).colorScheme.primary),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Fehler beim Laden des Goldpreises");
                  }
                  // Zeigt ein Lade-Widget an, während der erste Wert abgerufen wird
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        const Center(
          child: Image(
            image: AssetImage('assets/bars.png'),
            width: 200,
          ),
        ),
        Text('Gold ', style: Theme.of(context).textTheme.headlineLarge),
      ],
    );
  }
}
