// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverp/layout/default_layout.dart';
import 'package:riverp/screens/future_provider_screen.dart';
import 'package:riverp/screens/state_notifier_provider_screen.dart';
import 'package:riverp/screens/state_provider_screen.dart';
import 'package:riverp/screens/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home Screen',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => StateProviderScreen()));
              },
              child: Text('State Provider Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => StateNotifierProviderScreen()));
              },
              child: Text('State Notifier Provider Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FutureProviderScreen()));
              },
              child: Text('Future Provider Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => StreamProviderScreen()));
              },
              child: Text('Stream Provider Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
