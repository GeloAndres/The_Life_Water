package proyecto.agua.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.*;
@Entity
@Table(name = "item")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;
    private String nombre;
    private String descripcion;
    private double precio;
    private boolean borrado;
}
