package proyecto.agua.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proyecto.agua.entities.PedidoEntity;
import proyecto.agua.services.PedidoService;

@Controller
@RequestMapping("/pedido")
public class PedidoController {
    
    @Autowired
    private PedidoService pedidoService;

    @GetMapping
    public ResponseEntity<List<PedidoEntity>> getPedidos(){
        List<PedidoEntity> pedidos = pedidoService.getPedidos();
        return ResponseEntity.ok().body(pedidos);
    }
}
