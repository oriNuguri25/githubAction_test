import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartListNotifier extends StateNotifier<List<Map<String, String>>> {
  CartListNotifier() : super([]);

  void add(Map<String, String> item) {
    state = [...state, item];
  }

  void remove(int index) {
    state = [...state]..removeAt(index);
  }

  int get itemCount => state.length;

  int get totalPrice {
    return state.fold(0, (sum, item) => sum + int.parse(item['price']!));
  }
}

final cartListProvider =
    StateNotifierProvider<CartListNotifier, List<Map<String, String>>>(
        (ref) => CartListNotifier());
