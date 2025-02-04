package proyecto.agua.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "pedido")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PedidoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;
    private boolean borrado;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_usuario")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private UsuarioEntity id_usuario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_ruta")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private RutaEntity id_ruta;

    private Date fecha_compra;
    private Date fecha_entrega;

    private boolean entregado;
    
}
