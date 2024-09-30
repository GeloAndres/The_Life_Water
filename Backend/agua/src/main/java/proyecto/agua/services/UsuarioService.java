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
        return usuarioRepository.findAll();
    }

    public UsuarioEntity getUsuarioById(Long id){
        return usuarioRepository.findById(id).get();
    }

}
