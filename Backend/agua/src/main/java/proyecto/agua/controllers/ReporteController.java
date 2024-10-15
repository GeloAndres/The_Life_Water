package proyecto.agua.controllers;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proyecto.agua.entities.ReporteModel;
import proyecto.agua.services.ExcelGenerator;

@Controller
@RequestMapping("/reporte")
@CrossOrigin(origins = "*")
public class ReporteController {
    
    @Autowired
    private ExcelGenerator excelGenerator;

    // crear entidad ReporteModel
    private ReporteModel createReporte() {
        ReporteModel reporte = new ReporteModel();
        reporte.setId_pedido(1L); // Asignar el valor 1 al campo id_pedido
        reporte.setCliente("Juan Perez");
        reporte.setProducto("Bidón de Agua");
        reporte.setCantidad(10);
        reporte.setPrecio(50.0);
        reporte.setTotal(500.0);
        return reporte;
    }

    @PostMapping
    public ResponseEntity<InputStreamResource> generarReporte() {
        // Crear el reporte (simulando la generación de un reporte con datos)
        ReporteModel reporte = createReporte();
        List<ReporteModel> reportes = new ArrayList<>();
        reportes.add(reporte);

        // Generar el Excel
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try {
            ExcelGenerator.generateExcel(reportes); // Método para generar el Excel
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build(); // Devuelve un 500 si ocurre algún error
        }

        // Convertir el OutputStream a un InputStream para enviarlo en la respuesta
        ByteArrayInputStream in = new ByteArrayInputStream(out.toByteArray());

        // Configurar la respuesta HTTP con el archivo Excel
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=reporte_pedidos.xlsx");

        return ResponseEntity
                .ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(in)); // Devolver el archivo como un recurso de entrada
    }
}
