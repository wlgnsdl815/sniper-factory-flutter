import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverp/layout/default_layout.dart';
import 'package:riverp/providers/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);
    return DefaultLayout(
        title: 'Stream Provider Screen',
        body: Center(
          child: state.when(
            data: (data) {
              return Text(data.toString());
            },
            error: (error, stack) {
              return Text(error.toString());
            },
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
