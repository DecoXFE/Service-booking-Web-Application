package uva.inf.ssw.quickbook.modelo;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import uva.inf.ssw.quickbook.conexionbd.ConnectionPool;

public class EmpresaDB {

    /**
     * Insertar una nueva empresa en la base de datos
     *
     * @param empresa
     */
    public static void insert(Empresa empresa) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        PreparedStatement ps2;
        
        String query1 = "INSERT INTO Usuario "
                + "(idUsuario,correo,contra,telefono,direccion,tipoUsuario) "
                + "VALUES (?,?,?,?,?,?)";
        
        String query2 = "INSERT INTO Empresa "
                + "(idUsuario,tipoServicio,nombre,publicado) "
                + "VALUES (?,?,?,?)";
        
        try {
            ps = connection.prepareStatement(query1);
            ps.setString(1, empresa.getIdUsuario());
            ps.setString(2, empresa.getCorreo());
            ps.setString(3, empresa.getContraseña());
            ps.setString(4, empresa.getTelefono());
            ps.setString(5, empresa.getDireccion().getDireccion());
            ps.setBoolean(6, false);
            ps.executeUpdate();
            ps.close();
            
            ps2 = connection.prepareStatement(query2);
            ps2.setString(1, empresa.getIdUsuario());
            ps2.setString(2, "N.D");
            ps2.setString(3, empresa.getNombre());
            ps2.setBoolean(4, false);
            ps2.executeUpdate();
            ps2.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Empresa> obtenerServiciosDelTipo(String tipoServicio) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Usuario NATURAL JOIN Empresa WHERE tipoServicio=? and publicado=1";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, tipoServicio);
            rs = ps.executeQuery();
            ArrayList<Empresa> servicios = new ArrayList<>();
            Empresa empresa;
            while (rs.next()) {
                empresa = new Empresa();
                String idUsuario = rs.getString("idUsuario");
                empresa.setIdUsuario(idUsuario);
                empresa.setCorreo(rs.getString("correo"));
                empresa.setTelefono(rs.getString("telefono"));
                empresa.setDireccion(new Direccion(rs.getString("direccion")));
                empresa.setTipoServicio(rs.getString("tipoServicio"));
                empresa.setNombre(rs.getString("nombre"));
                empresa.setDescripcion(rs.getString("descripcion"));
                empresa.setPuntuacion(rs.getInt("puntuacion"));
                empresa.setServicios(selectPreciosPorId(idUsuario));
                
                servicios.add(empresa);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return servicios;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Empresa selectEmpresaPorId(String idUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Usuario NATURAL JOIN Empresa WHERE idUsuario=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, idUsuario);
            rs = ps.executeQuery();
            Empresa empresa = null;
            if (rs.next()) {
                empresa = new Empresa();
                empresa.setIdUsuario(rs.getString("idUsuario"));
                empresa.setCorreo(rs.getString("correo"));
                empresa.setTelefono(rs.getString("telefono"));
                empresa.setDireccion(new Direccion(rs.getString("direccion")));
                empresa.setTipoServicio(rs.getString("tipoServicio"));
                empresa.setNombre(rs.getString("nombre"));
                empresa.setDescripcion(rs.getString("descripcion"));
                empresa.setIban(rs.getString("iban"));
                empresa.setPuntuacion(rs.getInt("puntuacion"));
                empresa.setPublicado(rs.getBoolean("publicado"));
                empresa.setServicios(selectPreciosPorId(idUsuario));
                empresa.setHorarios(selectHorariosPorId(idUsuario));
                empresa.setComentarios(ComentarioDB.selectComentariosDeEmpresa(idUsuario));
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return empresa;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static HashMap<String, Float> selectPreciosPorId(String idUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT nombreServicio, precio FROM Servicio WHERE idUsuario=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, idUsuario);
            rs = ps.executeQuery();
            HashMap<String, Float> precios = new HashMap<>();
            while (rs.next()) {
                String nombre = rs.getString("nombreServicio");
                float precio = rs.getFloat("precio");
                precios.put(nombre, precio);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return precios;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static HashMap<String, String> selectHorariosPorId(String idUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT nombre, horas FROM Horario INNER JOIN Dia ON dia = id WHERE idUsuario=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, idUsuario);
            rs = ps.executeQuery();
            HashMap<String, String> horarios = new HashMap<>();
            while (rs.next()) {
                String dia = rs.getString("nombre");
                String horas = rs.getString("horas");
                horarios.put(dia, horas);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return horarios;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static ArrayList<String> selectTiposServicios() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT DISTINCT tipoServicio FROM Empresa";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<String> tipos = new ArrayList<>();
            while (rs.next()) {
                String tipo = rs.getString("tipoServicio");
                tipos.add(tipo);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return tipos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static void getImagenFondo(String idUsuario, OutputStream respuesta) {
        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement statement = null;
            statement = connection.prepareStatement("SELECT imagenFondo FROM Empresa WHERE idUsuario=?");
            statement.setString(1, idUsuario);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Blob blob = rs.getBlob("imagenFondo");
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
    
    /**
     * Modificar una empresa en la base de datos
     *
     * @param empresa
     */
    public static void modificarEmpresa(Empresa empresa) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        PreparedStatement ps2;

        String query1 = "UPDATE Usuario "
                + "SET correo = ?, contra = ?, telefono = ? "
                + "WHERE idUsuario = ?";

        String query2 = "UPDATE Empresa "
                + "SET nombre = ?, iban = ? "
                + "WHERE idUsuario = ?";

        try {
            ps = connection.prepareStatement(query1);
            ps.setString(1, empresa.getCorreo());
            ps.setString(2, empresa.getContraseña());
            ps.setString(3, empresa.getTelefono());
            ps.setString(4, empresa.getIdUsuario());
            ps.executeUpdate();
            ps.close();

            ps2 = connection.prepareStatement(query2);
            ps2.setString(1, empresa.getNombre());
            ps2.setString(2, empresa.getIban());
            ps2.setString(3, empresa.getIdUsuario());
            ps2.executeUpdate();
            ps2.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * Modificar una empresa en la base de datos para anuncio
     *
     * @param empresa
     */
    public static void modificarEmpresaAnuncio(Empresa empresa) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        PreparedStatement ps2;

        String query1 = "UPDATE Usuario "
                + "SET direccion = ? "
                + "WHERE idUsuario = ?";

        String query2 = "UPDATE Empresa "
                + "SET tipoServicio = ?, descripcion = ?, iban = ?, publicado = ? "
                + "WHERE idUsuario = ?";

        try {
            ps = connection.prepareStatement(query1);
            ps.setString(1, empresa.getDireccion().getDireccion());
            //ps.setString(2, empresa.getContraseña());
            ps.setString(2, empresa.getIdUsuario());
            ps.executeUpdate();
            ps.close();

            ps2 = connection.prepareStatement(query2);
            ps2.setString(1, empresa.getTipoServicio());
            ps2.setString(2, empresa.getDescripcion());
            ps2.setString(3, empresa.getIban());
            ps2.setBoolean(4, true);
            ps2.setString(5, empresa.getIdUsuario());
            ps2.executeUpdate();
            ps2.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * Insertar Horarios Empresa
     *
     * @param empresa
     */
    public static void insertarHorariosEmpresa(int dia, String horario, Empresa empresa) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        
        String query1 = "INSERT INTO Horario "
                + "(idUsuario,dia,horas) "
                + "VALUES (?,?,?)";


        try {
            ps = connection.prepareStatement(query1);
            ps.setString(1, empresa.getIdUsuario());
            ps.setInt(2, dia);
            ps.setString(3, horario);
            ps.executeUpdate();
            ps.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * Insertar Servicio
     *
     * @param empresa
     */
    public static void insertarServiciosEmpresa(Empresa empresa, String nombreServicio, float precio) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        
        String query1 = "INSERT INTO Servicio "
                + "(idUsuario,nombreServicio,precio) "
                + "VALUES (?,?,?)";


        try {
            ps = connection.prepareStatement(query1);
            ps.setString(1, empresa.getIdUsuario());
            ps.setString(2, nombreServicio);
            ps.setFloat(3, precio);
            ps.executeUpdate();
            ps.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void actualizarHorarioEmpresa(int dia, String horario, Empresa empresa) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        
        String query1 = "UPDATE Horario "
                + "SET horas = ? "
                + "WHERE idUsuario = ? AND dia = ?";


        try {
            ps = connection.prepareStatement(query1);
            ps.setString(1, horario);
            ps.setString(2, empresa.getIdUsuario());
            ps.setInt(3, dia);
            ps.executeUpdate();
            ps.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static boolean existeServicio(Empresa empresa, String servicio) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        String query1 = "SELECT COUNT(*) FROM Servicio WHERE nombreServicio = ? AND idUsuario = ?";

        try {
            ps = connection.prepareStatement(query1);
            ps.setString(1, servicio);
            ps.setString(2, empresa.getIdUsuario());

            resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }

            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Cerrar recursos
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

    }
    
    
    public static void actualizarServiciosEmpresa(Empresa empresa, String nombreServicio, float precio) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        
        String query1 = "UPDATE Servicio "
                + "SET precio = ? "
                + "WHERE idUsuario = ? AND nombreServicio = ?";


        try {
            ps = connection.prepareStatement(query1);
            ps.setFloat(1, precio);
            ps.setString(2, empresa.getIdUsuario());
            ps.setString(3, nombreServicio);
            ps.executeUpdate();
            ps.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
