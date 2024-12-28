package proyecto.agua.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import proyecto.agua.entities.PedidoEntity;

@Repository
public interface PedidoRepository extends JpaRepository<PedidoEntity, Long> {
    
    @Query(value = "SELECT * FROM pedido WHERE id_usuario = :id_usuario", nativeQuery = true)
    List<PedidoEntity> findByUsuarioId(@Param("id_usuario") Long id_usuario);

    @Query(value = "SELECT * FROM pedido WHERE id_ruta = :id_ruta", nativeQuery = true)
    List<PedidoEntity> findByRutaId(@Param("id_ruta") Long id_ruta);

    @Query(value = "SELECT * FROM pedido order by fecha desc", nativeQuery = true)
    List<PedidoEntity> getAllPedidos();
}
