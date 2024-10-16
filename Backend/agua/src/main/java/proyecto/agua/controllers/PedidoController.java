package proyecto.agua.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proyecto.agua.entities.PedidoEntity;
import proyecto.agua.services.PedidoService;

@Controller
@RequestMapping("/pedido")
@CrossOrigin(origins = "*")
public class PedidoController {
    
    @Autowired
    private PedidoService pedidoService;

    // Get de todos los pedidos
    @GetMapping
    public ResponseEntity<List<PedidoEntity>> getPedidos(){
        List<PedidoEntity> pedidos = pedidoService.getPedidos();
        return ResponseEntity.ok().body(pedidos);
    }

    // Post de un pedido
    @PostMapping
    public ResponseEntity<PedidoEntity> savePedido(PedidoEntity pedido){
        PedidoEntity pedidoSaved = pedidoService.savePedido(pedido);
        if(pedidoSaved == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().body(pedidoSaved);
    }

    // Get de un pedido por id
    @GetMapping("/{id}")
    public ResponseEntity<PedidoEntity> getPedidoById(@PathVariable(value = "id") Long id){
        PedidoEntity pedido = pedidoService.getPedidoById(id);
        if(pedido == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().body(pedido);
    }

    // Get de pedidos por usuario
    @GetMapping("/usuario/{id}")
    public ResponseEntity<List<PedidoEntity>> getPedidosByUsuario(@PathVariable(value = "id") Long id){
        List<PedidoEntity> pedidos = pedidoService.getPedidosByUsuario(id);
        return ResponseEntity.ok().body(pedidos);
    }

    // Get de pedidos por ruta
    @GetMapping("/ruta/{id}")
    public ResponseEntity<List<PedidoEntity>> getPedidosByRuta(@PathVariable(value = "id") Long id){
        List<PedidoEntity> pedidos = pedidoService.getPedidosByRuta(id);
        return ResponseEntity.ok().body(pedidos);
    }
}
