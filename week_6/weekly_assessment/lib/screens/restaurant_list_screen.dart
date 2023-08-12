import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_assessment/riverpod/restaurant_api_provider.dart';

class RestaurantListScreen extends ConsumerWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantApiProvider);
    return Scaffold(
      appBar: AppBar(),
      body: state.when(
        data: (restaurant) {
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                restaurant[index].TITLE.toString(),
              ),
              trailing: Icon(Icons.map),
            ),
          );
        },
        error: (error, stack) {
          throw Exception(error);
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
