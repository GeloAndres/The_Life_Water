package proyecto.agua.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proyecto.agua.entities.UbicacionEntity;
import proyecto.agua.services.UbicacionService;

@Controller
@RequestMapping("/ubicacion")
@CrossOrigin(origins = "*")
public class UbicacionController {
    
    @Autowired
    private UbicacionService ubicacionService;

    @GetMapping
    public ResponseEntity<List<UbicacionEntity>> getUbicaciones(){
        List<UbicacionEntity> ubicaciones = ubicacionService.getUbicaciones();
        return ResponseEntity.ok().body(ubicaciones);
    }

}
