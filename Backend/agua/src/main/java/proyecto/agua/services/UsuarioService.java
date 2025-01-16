package proyecto.agua.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proyecto.agua.entities.UsuarioEntity;
import proyecto.agua.repositories.UsuarioRepository;

@Service
public class UsuarioService {
    
    @Autowired
    private UsuarioRepository usuarioRepository;

    public List<UsuarioEntity> getUsuarios(){
        return usuarioRepository.getUsuarios();
    }

    public UsuarioEntity getUsuarioById(Long id){
        return usuarioRepository.findById(id).get();
    }

    public UsuarioEntity saveUsuario(UsuarioEntity usuario){
        return usuarioRepository.save(usuario);
    }

    public void deleteUsuario(UsuarioEntity usuario) {
        UsuarioEntity usuarioToDelete = usuarioRepository.findById(usuario.getId()).get();
        usuarioToDelete.setBorrado(true);
        usuarioRepository.save(usuarioToDelete);
    }

}
