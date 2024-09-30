package proyecto.agua.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proyecto.agua.entities.ItemPedidoEntity;
import proyecto.agua.services.ItemPedidoService;

@Controller
@RequestMapping("/itemPedido")
public class ItemPedidoController {
    
    @Autowired
    private ItemPedidoService itemPedidoService;

    @GetMapping
    public ResponseEntity<List<ItemPedidoEntity>> getItemPedidos(){
        List<ItemPedidoEntity> itemPedidos = itemPedidoService.getItemPedidos();
        return ResponseEntity.ok().body(itemPedidos);
    }
}
