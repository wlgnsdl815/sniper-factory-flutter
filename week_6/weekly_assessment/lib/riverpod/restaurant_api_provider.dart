import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_assessment/models/item_model.dart';
import 'package:weekly_assessment/services/restaurant_service.dart';

final restaurantApiProvider =
    FutureProvider<List<Item>>((ref) => RestaurantService().getData());
