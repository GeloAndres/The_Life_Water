package proyecto.agua.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proyecto.agua.entities.ItemEntity;
import proyecto.agua.repositories.ItemRepository;

@Service
public class ItemService {
    
    @Autowired
    private ItemRepository itemRepository;

    public List<ItemEntity> getItems(){
        return itemRepository.findAll();
    }

    public ItemEntity getItemById(Long id){
        return itemRepository.findById(id).get();
    }

    public ItemEntity saveItem(ItemEntity item){
        return itemRepository.save(item);
    }
}
