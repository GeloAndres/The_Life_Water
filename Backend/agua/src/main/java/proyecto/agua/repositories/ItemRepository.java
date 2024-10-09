package proyecto.agua.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import proyecto.agua.entities.ItemEntity;

@Repository
public interface ItemRepository extends JpaRepository<ItemEntity, Long> {
    
    @Query(value = "SELECT i.* FROM item_pedido as ip, item as i WHERE ip.id_pedido = :id_pedido and ip.id_item = i.id", nativeQuery = true)
    List<ItemEntity> findByPedidoId(@Param("id_pedido") Long id_pedido);
}
