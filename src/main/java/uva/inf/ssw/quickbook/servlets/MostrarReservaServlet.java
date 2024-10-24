package uva.inf.ssw.quickbook.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uva.inf.ssw.quickbook.modelo.Empresa;
import uva.inf.ssw.quickbook.modelo.EmpresaDB;

@WebServlet(name = "MostrarReservaServlet", urlPatterns = {"/reserva"})
public class MostrarReservaServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String encoding = request.getCharacterEncoding();
        if (encoding == null) {
            request.setCharacterEncoding("UTF-8");
        }
        String idServicio = request.getParameter("idServicio");

        Empresa servicio = EmpresaDB.selectEmpresaPorId(idServicio);
        String url = "/reserva.jsp";
        HttpSession session = request.getSession();
        session.setAttribute("servicio", servicio);
        session.setAttribute("idServicio", idServicio);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}
