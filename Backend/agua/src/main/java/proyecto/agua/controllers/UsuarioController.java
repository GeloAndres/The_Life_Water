package proyecto.agua.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import proyecto.agua.entities.UsuarioEntity;
import proyecto.agua.services.UsuarioService;

@Controller
@RequestMapping("/usuario")
@CrossOrigin(origins = "*")
public class UsuarioController {
    
    @Autowired
    private UsuarioService usuarioService;

    @GetMapping
    public ResponseEntity<List<UsuarioEntity>> getUsuarios(){
        List<UsuarioEntity> usuarios = usuarioService.getUsuarios();
        return ResponseEntity.ok().body(usuarios);
    }

    @PostMapping
    public ResponseEntity<UsuarioEntity> saveUsuario(@RequestBody UsuarioEntity usuario){
        UsuarioEntity usuarioSaved = usuarioService.saveUsuario(usuario);
        if(usuarioSaved == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().body(usuarioSaved);
    }

    @GetMapping("/{id}")
    public ResponseEntity<UsuarioEntity> getUsuarioById(@PathVariable(value = "id") Long id){
        UsuarioEntity usuario = usuarioService.getUsuarioById(id);
        if(usuario == null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().body(usuario);
    }

    // borrar usuario
    @PostMapping("/delete")
    public ResponseEntity<String> deleteUsuario(@RequestBody UsuarioEntity usuario){
        usuarioService.deleteUsuario(usuario);
        return ResponseEntity.ok().body("Usuario eliminado");
    }
}
