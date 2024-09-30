package proyecto.agua.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import proyecto.agua.entities.PedidoEntity;

@Repository
public interface PedidoRepository extends JpaRepository<PedidoEntity, Long> {
    
}
