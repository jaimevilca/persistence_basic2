package es.urjc.code.modelo;

import jakarta.persistence.Id;

import java.util.List;


public class Provincia {

    @Id
    private String id;
    private String nombre;
    private String ca;
    private long superficie;
    private List<Datos> datos;

    public Provincia(String nombre, String ca, long superficie) {
        this.nombre = nombre;
        this.ca = ca;
        this.superficie = superficie;
    }

    public Provincia(String nombre, String ca, long superficie, List<Datos> datos) {
        this.nombre = nombre;
        this.ca = ca;
        this.superficie = superficie;
        this.datos = datos;
    }

    @Override
    public String toString() {
        return "Provincia {" +
                "nombre='" + nombre + '\'' +
                ", ca='" + ca + '\'' +
                ", superficie=" + superficie +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCa() {
        return ca;
    }

    public void setCa(String ca) {
        this.ca = ca;
    }

    public long getSuperficie() {
        return superficie;
    }

    public void setSuperficie(long superficie) {
        this.superficie = superficie;
    }

    public List<Datos> getDatos() {
        return datos;
    }

    public void setDatos(List<Datos> datos) {
        this.datos = datos;
    }
}
