alter table vuelo
    add tripulante JSON DEFAULT NULL;


alter table avion
    add revision JSON DEFAULT NULL;

UPDATE vuelo
SET tripulante = (select JSON_ARRAYAGG(tripulante_id) from tripulante_vuelo where vuelo_id = vuelo.id);

UPDATE avion
SET revision = (SELECT JSON_ARRAYAGG(JSON_OBJECT('id', id,
                                   'descripcion', descripcion,
                                   'fecha_fin', CAST(fecha_fin AS DATE),
                                   'fecha_inicio', CAST(fecha_inicio AS DATE),
                                   'horas_mecanico', horas_mecanico,
                                   'tipo_revision', tipo_revision,
                                   'aeropuerto_id', aeropuerto_id,
                                   'mecanico_encargado_id', mecanico_encargado_id))
                FROM revision
                where avion_id = avion.id);