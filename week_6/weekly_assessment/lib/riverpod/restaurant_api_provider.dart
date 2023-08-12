import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_assessment/services/restaurant_service.dart';

final restaurantApiProvider =
    FutureProvider((ref) => RestaurantService().getData());
