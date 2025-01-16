package proyecto.agua.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import proyecto.agua.entities.ItemPedidoEntity;
import proyecto.agua.services.ItemPedidoService;

@Controller
@RequestMapping("/itemPedido")
@CrossOrigin(origins = "*")
public class ItemPedidoController {
    
    @Autowired
    private ItemPedidoService itemPedidoService;

    // Get de todos los itemPedidos
    @GetMapping
    public ResponseEntity<List<ItemPedidoEntity>> getItemPedidos(){
        List<ItemPedidoEntity> itemPedidos = itemPedidoService.getItemPedidos();
        return ResponseEntity.ok().body(itemPedidos);
    }

    // Get de un itemPedido por id
    @GetMapping("/{id}")
    public ResponseEntity<ItemPedidoEntity> getItemPedidoById(@PathVariable(value = "id") Long id){
        ItemPedidoEntity itemPedido = itemPedidoService.getItemPedidoById(id);
        if(itemPedido == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().body(itemPedido);
    }

    // Save de un itemPedido
    @PostMapping    
    public ResponseEntity<ItemPedidoEntity> saveItemPedido(@RequestBody ItemPedidoEntity itemPedido){
        ItemPedidoEntity itemPedidoSaved = itemPedidoService.saveItemPedido(itemPedido);
        if(itemPedidoSaved == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().body(itemPedidoSaved);
    }
}
