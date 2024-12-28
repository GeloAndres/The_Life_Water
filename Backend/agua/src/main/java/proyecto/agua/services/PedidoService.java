package proyecto.agua.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proyecto.agua.repositories.PedidoRepository;
import proyecto.agua.entities.PedidoEntity;

@Service
public class PedidoService {
    
    @Autowired
    private PedidoRepository pedidoRepository;

    public List<PedidoEntity> getPedidos(){
        return pedidoRepository.getAllPedidos();
    }

    public PedidoEntity getPedidoById(Long id){
        return pedidoRepository.findById(id).get();
    }

    public PedidoEntity savePedido(PedidoEntity pedido){
        return pedidoRepository.save(pedido);
    }

    public List<PedidoEntity> getPedidosByUsuario(Long id){
        return pedidoRepository.findByUsuarioId(id);
    }

    public List<PedidoEntity> getPedidosByRuta(Long id){
        return pedidoRepository.findByRutaId(id);
    }
}
