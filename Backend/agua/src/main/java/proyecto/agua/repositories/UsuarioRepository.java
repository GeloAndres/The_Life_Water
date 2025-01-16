package proyecto.agua.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import proyecto.agua.entities.UsuarioEntity;

@Repository
public interface UsuarioRepository extends JpaRepository<UsuarioEntity, Long> {
    
    @Query(value = "SELECT * FROM usuario WHERE usuario.borrado = 0", nativeQuery = true)
    List<UsuarioEntity> getUsuarios();
}
