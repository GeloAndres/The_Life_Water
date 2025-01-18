import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_life_water/domain/entities/order.dart';

final pedidoStateProvider =
    StateNotifierProvider<ListNotifier, List<Order>>(((ref) => ListNotifier()));

class ListNotifier extends StateNotifier<List<Order>> {
  ListNotifier() : super([]);

  void agregarPedido(Order orden) {
    if (state.isEmpty) {
      orden.idCompra == 1;
    } else {
      orden.idCompra == state.length++;
    }

    state = [...state, orden];
  }

  void borrarOrden(int idCompra) {
    state.removeWhere((orden) => orden.idCompra == idCompra);
  }

  void modificarOrden(Order ordenModificado) {
    state.map((orden) {
      if (orden.idCompra == ordenModificado.idCompra) {
        return ordenModificado;
      }
    });
  }
}
