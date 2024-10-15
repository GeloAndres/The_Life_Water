package proyecto.agua.services;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import proyecto.agua.entities.ReporteModel;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Service
public class ExcelGenerator {

    public static void generateExcel(List<ReporteModel> reportes) throws IOException {

        // Definir la ruta relativa donde se guardará el archivo, en este caso el nombre del archivo en la raíz del proyecto
        String filePath = "reporte_pedidos.xlsx";  // Guardar en la carpeta raíz del backend

        // Crear un nuevo workbook (libro de Excel)
        Workbook workbook = new XSSFWorkbook();

        // Crear una hoja (sheet)
        Sheet sheet = workbook.createSheet("Reporte de Pedidos");

        // Crear una fila en el índice 0 (encabezados)
        Row headerRow = sheet.createRow(0);

        // Encabezados de las columnas
        String[] columnHeaders = {"ID Pedido", "Cliente", "Producto", "Cantidad", "Precio", "Total"};
        for (int i = 0; i < columnHeaders.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columnHeaders[i]);
        }

        // Llenar el contenido de las filas a partir de la lista de reportes
        int rowNum = 1;
        for (ReporteModel reporte : reportes) {
            Row row = sheet.createRow(rowNum++);

            // Crear celdas y asignar valores
            row.createCell(0).setCellValue(reporte.getId_pedido());
            row.createCell(1).setCellValue(reporte.getCliente());
            row.createCell(2).setCellValue(reporte.getProducto());
            row.createCell(3).setCellValue(reporte.getCantidad());
            row.createCell(4).setCellValue(reporte.getPrecio());
            row.createCell(5).setCellValue(reporte.getTotal());
        }

        // Redimensionar las columnas para que se ajusten al contenido
        for (int i = 0; i < columnHeaders.length; i++) {
            sheet.autoSizeColumn(i);
        }

        // Escribir el archivo en el sistema
        try (FileOutputStream fileOut = new FileOutputStream(filePath)) {
            workbook.write(fileOut);
        }

        // Cerrar el workbook para liberar recursos
        workbook.close();
    }
}
