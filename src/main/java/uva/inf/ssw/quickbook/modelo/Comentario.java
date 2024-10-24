package uva.inf.ssw.quickbook.modelo;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Comentario implements Serializable {

    private int idComentario;
    private int idReserva;
    private String cliente;
    private String empresa;
    private String comentario;
    private boolean voto;
    private LocalDateTime fecha;

    public Comentario() {
        idComentario = -1;
        idReserva = -1;
        cliente = null;
        empresa = null;
        comentario = null;
        voto = false;
        fecha = null;
    }

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public boolean isVoto() {
        return voto;
    }

    public void setVoto(boolean voto) {
        this.voto = voto;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

}
