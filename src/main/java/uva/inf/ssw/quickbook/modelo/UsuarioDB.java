package uva.inf.ssw.quickbook.modelo;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import uva.inf.ssw.quickbook.conexionbd.ConnectionPool;

public class UsuarioDB {

    /**
     * Valida si el username y la contraseña coinciden con algun usuario del
     * sistema
     *
     * @param user
     * @param password
     * @return
     */
    public static boolean validate(String user, String password) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Usuario WHERE idUsuario = ? and contra = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, password);
            rs = ps.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Comprueba si existe un usuario en la base de datos a partir de su id
     *
     * @param idUsuario
     * @return
     */
    public static boolean existeUsuario(String idUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT idUsuario FROM Usuario WHERE idUsuario = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, idUsuario);
            rs = ps.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Comprueba si existe el correo en la base de datos
     *
     * @param correo
     * @return true si existe, false si no existe
     */
    public static boolean existeEmail(String correo) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT correo FROM Usuario WHERE correo = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Consulta el tipo de usuario
     *
     * @param idUsuario
     * @return false si el usuario es una empresa, true si es un cliente
     */
    public static boolean selectTipoUsuarioPorId(String idUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT tipoUsuario FROM Usuario WHERE idUsuario = ?";

        boolean tipoUsuario = false;
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, idUsuario);
            rs = ps.executeQuery();
            if (rs.next()) {
                tipoUsuario = rs.getBoolean("tipoUsuario");
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tipoUsuario;
    }

    public static void getIcono(String idUsuario, OutputStream respuesta) {
        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement statement = null;
            statement = connection.prepareStatement("SELECT icono FROM Usuario WHERE idUsuario=?");
            statement.setString(1, idUsuario);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Blob blob = rs.getBlob("icono");
                if (!rs.wasNull() && blob.length() > 1) {
                    InputStream imagen = blob.getBinaryStream();
                    byte[] buffer = new byte[1000];
                    int len = imagen.read(buffer);
                    while (len != -1) {
                        respuesta.write(buffer, 0, len);
                        len = imagen.read(buffer);
                    }
                    imagen.close();
                }
            }
            pool.freeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
