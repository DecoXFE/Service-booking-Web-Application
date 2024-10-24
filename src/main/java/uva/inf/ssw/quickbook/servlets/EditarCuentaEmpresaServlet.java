/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uva.inf.ssw.quickbook.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
import uva.inf.ssw.quickbook.modelo.UsuarioDB;

/**
 *
 * @author kevinxe
 */
@MultipartConfig
@WebServlet(name = "EditarCuentaEmpresaServlet", urlPatterns = {"/EditarCuentaEmpresaServlet"})
public class EditarCuentaEmpresaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String encoding = request.getCharacterEncoding();
        if (encoding == null) {
            request.setCharacterEncoding("UTF-8");
        }
        response.setContentType("text/html;charset=UTF-8");
        
        String nombre = request.getParameter("nombre-empresa");
        String email = request.getParameter("email-empresa");
        String passwd = request.getParameter("password-empresa");
        String phone = request.getParameter("phone-empresa");
        String iban = request.getParameter("iban-empresa");

        HttpSession s = request.getSession();
        Empresa empresa = (Empresa) s.getAttribute("empresa");
        empresa.setNombre(nombre);
        empresa.setCorreo(email);
        empresa.setContraseña(passwd);
        empresa.setTelefono(phone);
        empresa.setIban(iban);
       
        String url;
        PrintWriter out = response.getWriter();
        
        EmpresaDB.modificarEmpresa(empresa);
        url = "/pagina_perfil_empresa.jsp";
        HttpSession session = request.getSession();
        session.setAttribute("empresa", empresa);
  
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

}
