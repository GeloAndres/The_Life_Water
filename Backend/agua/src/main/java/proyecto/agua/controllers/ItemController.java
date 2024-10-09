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

import proyecto.agua.entities.ItemEntity;
import proyecto.agua.services.ItemService;

@Controller
@RequestMapping("/item")
@CrossOrigin(origins = "*")
public class ItemController {
    
    @Autowired
    private ItemService itemService;

    @GetMapping
    public ResponseEntity<List<ItemEntity>> getItems(){
        List<ItemEntity> items = itemService.getItems();
        return ResponseEntity.ok().body(items);
    }

    @PostMapping
    public ResponseEntity<ItemEntity> saveItem(ItemEntity item){
        ItemEntity itemSaved = itemService.saveItem(item);
        if(itemSaved == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().body(itemSaved);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ItemEntity> getItemById(@PathVariable(value = "id") Long id){
        ItemEntity item = itemService.getItemById(id);
        if(item == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().body(item);
    }
}
