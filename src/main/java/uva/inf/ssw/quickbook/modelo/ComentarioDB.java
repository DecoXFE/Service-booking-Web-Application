package uva.inf.ssw.quickbook.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import uva.inf.ssw.quickbook.conexionbd.ConnectionPool;

public class ComentarioDB {

    public static ArrayList<Comentario> selectComentariosDeEmpresa(String idEmpresa) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Comentario WHERE empresa=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, idEmpresa);
            rs = ps.executeQuery();
            ArrayList<Comentario> comentarios = new ArrayList<>();
            Comentario comentario;
            while (rs.next()) {
                comentario = new Comentario();
                comentario.setIdComentario(rs.getInt("idComentario"));
                comentario.setIdReserva(rs.getInt("idReserva"));
                comentario.setCliente(rs.getString("cliente"));
                comentario.setEmpresa(rs.getString("empresa"));
                comentario.setComentario(rs.getString("comentario"));
                comentario.setVoto(rs.getBoolean("voto"));
                comentario.setFecha(rs.getTimestamp("fecha").toLocalDateTime());

                comentarios.add(comentario);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return comentarios;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ArrayList<Comentario> selectComentariosDeCliente(String idCliente) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Comentario WHERE cliente=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, idCliente);
            rs = ps.executeQuery();
            ArrayList<Comentario> comentarios = new ArrayList<>();
            Comentario comentario;
            while (rs.next()) {
                comentario = new Comentario();
                comentario.setIdComentario(rs.getInt("idComentario"));
                comentario.setIdReserva(rs.getInt("idReserva"));
                comentario.setCliente(rs.getString("cliente"));
                comentario.setEmpresa(rs.getString("empresa"));
                comentario.setComentario(rs.getString("comentario"));
                comentario.setVoto(rs.getBoolean("voto"));
                comentario.setFecha(rs.getTimestamp("fecha").toLocalDateTime());

                comentarios.add(comentario);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return comentarios;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

}
