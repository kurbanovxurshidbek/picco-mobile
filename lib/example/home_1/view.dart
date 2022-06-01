import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class Home_1Page extends StatelessWidget {
  const Home_1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Home_1Provider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<Home_1Provider>();
    final countTwo = context.select((Home_1Provider provider) => provider.countTwo);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: provider.tapOne,
                  child: Text(provider.textOne),
                ),
                const DataOne(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: provider.tapTwo,
                  child: Text(provider.textTwo),
                ),
                Text('$countTwo'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DataOne extends StatelessWidget {
  const DataOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.select((Home_1Provider provider) => provider);

    return Text('${provider.countOne}');
  }
}

