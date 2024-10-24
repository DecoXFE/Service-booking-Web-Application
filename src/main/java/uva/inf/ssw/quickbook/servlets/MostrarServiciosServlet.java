package uva.inf.ssw.quickbook.servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uva.inf.ssw.quickbook.modelo.Direccion;
import uva.inf.ssw.quickbook.modelo.Empresa;
import uva.inf.ssw.quickbook.modelo.EmpresaDB;

@WebServlet(name = "MostrarServiciosServlet", urlPatterns = {"/servicios"})
public class MostrarServiciosServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String encoding = request.getCharacterEncoding();
        if (encoding == null) {
            request.setCharacterEncoding("UTF-8");
        }
        String ubicacion = request.getParameter("ubicacion");
        String tipoServicio = request.getParameter("tipoServicio");

        ArrayList<Empresa> servicios = EmpresaDB.obtenerServiciosDelTipo(tipoServicio);
        String url = "/servicios.jsp";
        HttpSession session = request.getSession();

        if (ubicacion.equals("")) {
            session.removeAttribute("direccion");
        } else {
            Direccion direccion = new Direccion(ubicacion);
            session.setAttribute("direccion", direccion);
        }
        session.setAttribute("tipoServicio", tipoServicio);
        session.setAttribute("servicios", servicios);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}
