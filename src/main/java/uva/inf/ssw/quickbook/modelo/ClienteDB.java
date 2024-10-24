package uva.inf.ssw.quickbook.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import uva.inf.ssw.quickbook.conexionbd.ConnectionPool;

public class ClienteDB {

    /**
     * Insertar una nuevo cliente en la base de datos
     *
     * @param cliente
     */
    public static void insert(Cliente cliente) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        PreparedStatement ps2;

        String query1 = "INSERT INTO Usuario "
                + "(idUsuario,correo,contra,telefono,direccion,tipoUsuario) "
                + "VALUES (?,?,?,?,?,?)";

        String query2 = "INSERT INTO Cliente "
                + "(idUsuario,nombre,apellidos) "
                + "VALUES (?,?,?)";

        try {
            ps = connection.prepareStatement(query1);
            ps.setString(1, cliente.getIdUsuario());
            ps.setString(2, cliente.getCorreo());
            ps.setString(3, cliente.getContraseña());
            ps.setString(4, cliente.getTelefono());
            ps.setString(5, cliente.getDireccion().getDireccion());
            ps.setBoolean(6, true);
            ps.executeUpdate();
            ps.close();

            ps2 = connection.prepareStatement(query2);
            ps2.setString(1, cliente.getIdUsuario());
            ps2.setString(2, cliente.getNombre());
            ps2.setString(3, cliente.getApellidos());
            ps2.executeUpdate();
            ps2.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Seleccionar un cliente de la base de datos a partir de su id de usuario
     *
     * @param idUsuario
     * @return
     */
    public static Cliente selectClientePorId(String idUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Usuario NATURAL JOIN Cliente WHERE idUsuario = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, idUsuario);
            rs = ps.executeQuery();
            Cliente cliente = null;

            if (rs.next()) {
                cliente = new Cliente();
                cliente.setIdUsuario(rs.getString("idUsuario"));
                cliente.setCorreo(rs.getString("correo"));
                cliente.setContraseña(rs.getString("contra"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setDireccion(new Direccion(rs.getString("direccion")));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellidos(rs.getString("apellidos"));
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return cliente;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    /**
     * Modificar una empresa en la base de datos
     *
     * @param empresa
     */
    public static void modificarCliente(Cliente cliente) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        PreparedStatement ps2;

        String query1 = "UPDATE Usuario "
                + "SET correo = ?, contra = ?, telefono = ? "
                + "WHERE idUsuario = ?";

        

        try {
            ps = connection.prepareStatement(query1);
            ps.setString(1, cliente.getCorreo());
            ps.setString(2, cliente.getContraseña());
            ps.setString(3, cliente.getTelefono());
            ps.setString(4, cliente.getIdUsuario());
            ps.executeUpdate();
            ps.close();

           
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
