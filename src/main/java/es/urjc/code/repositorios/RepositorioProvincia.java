package es.urjc.code.repositorios;

import es.urjc.code.modelo.Provincia;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface RepositorioProvincia extends MongoRepository<Provincia, String> {

}