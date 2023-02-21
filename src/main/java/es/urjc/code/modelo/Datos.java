package es.urjc.code.modelo;

import jakarta.persistence.Id;


public class Datos {

    @Id
    private String id;
    private int anyo;
    private int valor;

    public Datos(int anyo, int valor) {
        this.anyo = anyo;
        this.valor = valor;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getAnyo() {
        return anyo;
    }

    public void setAnyo(int anyo) {
        this.anyo = anyo;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
}
