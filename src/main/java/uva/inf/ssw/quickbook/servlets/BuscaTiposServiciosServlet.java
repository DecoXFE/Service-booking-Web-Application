package uva.inf.ssw.quickbook.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uva.inf.ssw.quickbook.modelo.EmpresaDB;

@WebServlet(name = "BuscaTiposServiciosServlet", urlPatterns = {"/tipos"})
public class BuscaTiposServiciosServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();

        ArrayList<String> tipos = EmpresaDB.selectTiposServicios();
        for (String t : tipos) {
            out.println("<option>" + t + "</option>");
        }
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
