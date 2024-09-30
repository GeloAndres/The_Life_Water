package proyecto.agua.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import proyecto.agua.entities.UbicacionEntity;
import proyecto.agua.repositories.UbicacionRepository;

@Service
public class UbicacionService {
    
    @Autowired
    private UbicacionRepository ubicacionRepository;

    public List<UbicacionEntity> getUbicaciones(){
        return ubicacionRepository.findAll();
    }

    public UbicacionEntity getUbicacionById(Long id){
        return ubicacionRepository.findById(id).get();
    }
}
