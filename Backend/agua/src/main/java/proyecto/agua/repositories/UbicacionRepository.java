package proyecto.agua.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import proyecto.agua.entities.UbicacionEntity;

@Repository
public interface UbicacionRepository extends JpaRepository<UbicacionEntity, Long> {
    
}
