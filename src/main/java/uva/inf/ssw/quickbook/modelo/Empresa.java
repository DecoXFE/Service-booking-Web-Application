package uva.inf.ssw.quickbook.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import javax.servlet.http.Part;

public class Empresa implements Serializable {

    private String idUsuario;
    private String correo;
    private String contraseña;
    private String telefono;
    private Direccion direccion;
    private Part icono;
    private String tipoServicio;
    private String nombre;
    private String descripcion;
    private String iban;
    private int puntuacion;
    private Part imagenFondo;
    private boolean publicado;
    private HashMap<String, Float> servicios;
    private HashMap<String, String> horarios;
    private ArrayList<Comentario> comentarios;

    public Empresa() {
        idUsuario = "";
        correo = "";
        contraseña = "";
        telefono = "";
        direccion = null;
        icono = null;
        tipoServicio = "";
        nombre = "";
        descripcion = "";
        iban = "";
        puntuacion = 0;
        imagenFondo = null;
        publicado = false;
        servicios = null;
        horarios = null;
        comentarios = null;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }

    public Part getIcono() {
        return icono;
    }

    public void setIcono(Part icono) {
        this.icono = icono;
    }

    public String getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getIban() {
        return iban;
    }

    public void setIban(String iban) {
        this.iban = iban;
    }

    public int getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(int puntuacion) {
        this.puntuacion = puntuacion;
    }

    public Part getImagenFondo() {
        return imagenFondo;
    }

    public void setImagenFondo(Part imagenFondo) {
        this.imagenFondo = imagenFondo;
    }

    public boolean isPublicado() {
        return publicado;
    }

    public void setPublicado(boolean publicado) {
        this.publicado = publicado;
    }

    public HashMap<String, Float> getServicios() {
        return servicios;
    }

    public void setServicios(HashMap<String, Float> servicios) {
        this.servicios = servicios;
    }

    public HashMap<String, String> getHorarios() {
        return horarios;
    }

    public void setHorarios(HashMap<String, String> horarios) {
        this.horarios = horarios;
    }

    public ArrayList<Comentario> getComentarios() {
        return comentarios;
    }

    public void setComentarios(ArrayList<Comentario> comentarios) {
        this.comentarios = comentarios;
    }

    public float getPrecioMax() {
        float precioMax;
        if (servicios == null || servicios.isEmpty()) {
            precioMax = 0;
        } else {
            precioMax = Collections.max(servicios.values());
        }
        return precioMax;
    }

    public float getPrecioMin() {
        float precioMin;
        if (servicios == null || servicios.isEmpty()) {
            precioMin = 0;
        } else {
            precioMin = Collections.min(servicios.values());
        }
        return precioMin;
    }

}
