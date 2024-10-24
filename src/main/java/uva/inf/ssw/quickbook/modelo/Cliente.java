package uva.inf.ssw.quickbook.modelo;

import java.io.Serializable;
import javax.servlet.http.Part;

public class Cliente implements Serializable {

    private String idUsuario;
    private String correo;
    private String contraseña;
    private String telefono;
    private Direccion direccion;
    private Part icono;
    private String nombre;
    private String apellidos;

    public Cliente() {
        idUsuario = "";
        correo = "";
        contraseña = "";
        telefono = "";
        direccion = null;
        icono = null;
        nombre = "";
        apellidos = "";
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Part getIcono() {
        return icono;
    }

    public void setIcono(Part icono) {
        this.icono = icono;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

}
