package es.urjc.code;

import es.urjc.code.modelo.*;
import es.urjc.code.repositorios.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

/**
 * Cargador de la BD y solución de apartados de la práctica.
 *
 * @author J. Manuel Colmenar
 */
@Controller
public class DatabaseLoader implements CommandLineRunner {


    @Autowired
    private VueloRepository vueloRepository;

    @Override
    public void run(String... args) throws Exception {

        // Para cada avión, mostrar el nombre y apellidos de los mecánicos responsables de sus revisiones
        List<IAvionMecanicoDTO> mecanicos = vueloRepository.getMecanicosResponsables();
        System.out.println("Avión con sus mecánicos responsables");
        System.out.println("-----------------------------------------");
        mecanicos.forEach(m -> System.out.println("id: " + m.getId() + " | Fabricante: " + m.getFabricante()
                + " | Modelo: " + m.getModelo() + " | Mecánicos Responsables: " + m.getMecanicosResponsables()));


    }

}
