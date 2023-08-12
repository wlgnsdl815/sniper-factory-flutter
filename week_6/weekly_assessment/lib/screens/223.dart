import 'package:flutter/material.dart';
import 'package:weekly_assessment/models/item_model.dart';
import 'package:weekly_assessment/services/restaurant_service.dart';

class RestaurantListScreen2 extends StatelessWidget {
  const RestaurantListScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Item>>(
        future: RestaurantService().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data![index].TITLE.toString(),
                  ),
                  trailing: Icon(
                    Icons.map,
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
