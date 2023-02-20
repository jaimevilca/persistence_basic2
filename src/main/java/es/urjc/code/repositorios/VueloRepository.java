package es.urjc.code.repositorios;

import es.urjc.code.modelo.IAvionMecanicoDTO;
import es.urjc.code.modelo.Vuelo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Repositorio para vuelos.
 *
 *  @author J. Manuel Colmenar
 */
public interface VueloRepository extends JpaRepository<Vuelo, Long> {

    // Between incluye extremos.
    @Query("select v from Vuelo v where v.origen.ciudad = ?1 and " +
            "v.fechaSalida >= STR_TO_DATE(?2, '%d/%m/%Y') " +
            "and v.fechaSalida < STR_TO_DATE(?2, '%d/%m/%Y')+1 " +
            "ORDER BY v.fechaSalida")
    List<Vuelo> vuelosCiudadFecha(String ciudad, String fecha);


    @Query(value = "SELECT avion.id, avion.fabricante, avion.modelo, GROUP_CONCAT(mecanico.nombre, \" \", mecanico.apellidos) as mecanicosResponsables\n" +
            "FROM avion,\n" +
            "     JSON_TABLE(revision, '$[*]' COLUMNS (\n" +
            "         mecanico_encargado_id  int  PATH '$.mecanico_encargado_id')\n" +
            "         ) revision,\n" +
            "     mecanico where mecanico.id = revision.mecanico_encargado_id group by  avion.id", nativeQuery = true)
    List<IAvionMecanicoDTO> getMecanicosResponsables();
}
