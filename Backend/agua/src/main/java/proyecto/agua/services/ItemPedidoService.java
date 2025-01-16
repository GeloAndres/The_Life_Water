package proyecto.agua.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proyecto.agua.entities.ItemPedidoEntity;
import proyecto.agua.repositories.ItemPedidoRepository;

@Service
public class ItemPedidoService {
    
    @Autowired
    private ItemPedidoRepository itemPedidoRepository;

    public List<ItemPedidoEntity> getItemPedidos(){
        return itemPedidoRepository.findAll();
    }

    public ItemPedidoEntity getItemPedidoById(Long id){
        return itemPedidoRepository.findById(id).get();
    }

    public ItemPedidoEntity saveItemPedido(ItemPedidoEntity itemPedido) {
        return itemPedidoRepository.save(itemPedido);
    }
}
