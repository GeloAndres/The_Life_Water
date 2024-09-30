package proyecto.agua.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proyecto.agua.entities.ItemEntity;
import proyecto.agua.services.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
    
    @Autowired
    private ItemService itemService;

    @GetMapping
    public ResponseEntity<List<ItemEntity>> getItems(){
        List<ItemEntity> items = itemService.getItems();
        return ResponseEntity.ok().body(items);
    }
}
