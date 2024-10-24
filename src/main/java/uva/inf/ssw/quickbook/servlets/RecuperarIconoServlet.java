package uva.inf.ssw.quickbook.servlets;

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uva.inf.ssw.quickbook.modelo.UsuarioDB;

@WebServlet(name = "RecuperarIconoServlet", urlPatterns = {"/icono"})
public class RecuperarIconoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String encoding = request.getCharacterEncoding();
        if (encoding == null) {
            request.setCharacterEncoding("UTF-8");
        }
        response.setContentType("image/jpg");
        OutputStream respuesta = response.getOutputStream();
        String idUsuario = request.getParameter("idUsuario");
        UsuarioDB.getIcono(idUsuario, respuesta);
        respuesta.close();
        response.flushBuffer();
    }

}
