/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uva.inf.ssw.quickbook.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uva.inf.ssw.quickbook.modelo.Direccion;
import uva.inf.ssw.quickbook.modelo.Empresa;
import uva.inf.ssw.quickbook.modelo.EmpresaDB;

/**
 *
 * @author kevinxe
 */
@MultipartConfig
@WebServlet(name = "AnadirAnuncioServlet", urlPatterns = {"/AnadirAnuncioServlet"})
public class AnadirAnuncioServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String encoding = request.getCharacterEncoding();
        if (encoding == null) {
            request.setCharacterEncoding("UTF-8");
        }
        response.setContentType("text/html;charset=UTF-8");
        
        String tipoServicio = request.getParameter("servicio-empresa");
        String descripcion = request.getParameter("descripcion-empresa");
        String iban = request.getParameter("iban-empresa");
        String direccion = request.getParameter("direccion-empresa");
        String horarioL = request.getParameter("horarioL-empresa");
        String horarioM = request.getParameter("horarioM-empresa");
        String horarioMi = request.getParameter("horarioMi-empresa");
        String horarioJ = request.getParameter("horarioJ-empresa");
        String horarioV = request.getParameter("horarioV-empresa");
        String horarioS = request.getParameter("horarioS-empresa");
        String horarioD = request.getParameter("horarioD-empresa");

        HttpSession s = request.getSession();
        Empresa empresa = (Empresa) s.getAttribute("empresa");
        empresa.setTipoServicio(tipoServicio);
        empresa.setDescripcion(descripcion);
        empresa.setIban(iban);
        empresa.setDireccion(new Direccion(direccion));
        
        EmpresaDB.modificarEmpresaAnuncio(empresa);
        EmpresaDB.insertarHorariosEmpresa(1, horarioL, empresa);
        EmpresaDB.insertarHorariosEmpresa(2, horarioM, empresa);
        EmpresaDB.insertarHorariosEmpresa(3, horarioMi, empresa);
        EmpresaDB.insertarHorariosEmpresa(4, horarioJ, empresa);
        EmpresaDB.insertarHorariosEmpresa(5, horarioV, empresa);
        EmpresaDB.insertarHorariosEmpresa(6, horarioS, empresa);
        EmpresaDB.insertarHorariosEmpresa(7, horarioD, empresa);
        
        
        int i = 0;
        String servicio = request.getParameter("servicio_" + i);
        String precio = request.getParameter("precio_" + i);

        while (servicio != null && precio != null) {
            float precioF = Float.parseFloat(precio);
            EmpresaDB.insertarServiciosEmpresa(empresa, servicio, precioF);

            i++;
            servicio = request.getParameter("servicio_" + i);
            precio = request.getParameter("precio_" + i);
        }
       
        String url;
        PrintWriter out = response.getWriter();
        url = "/index.jsp";
        request.getSession().removeAttribute("empresa");
        request.getSession().removeAttribute("cliente");
  
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

}
