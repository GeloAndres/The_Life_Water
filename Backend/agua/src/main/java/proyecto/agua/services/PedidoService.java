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
        return pedidoRepository.findAll();
    }

    public PedidoEntity getPedidoById(Long id){
        return pedidoRepository.findById(id).get();
    }
}
