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
import uva.inf.ssw.quickbook.modelo.Cliente;
import uva.inf.ssw.quickbook.modelo.ClienteDB;
import uva.inf.ssw.quickbook.modelo.Direccion;
import uva.inf.ssw.quickbook.modelo.Empresa;
import uva.inf.ssw.quickbook.modelo.EmpresaDB;
import uva.inf.ssw.quickbook.modelo.UsuarioDB;

/**
 *
 * @author adrsanz
 */
@MultipartConfig
@WebServlet(name = "EditarCuentaClienteServlet", urlPatterns = {"/EditarCuentaClienteServlet"})
public class EditarCuentaClienteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String encoding = request.getCharacterEncoding();
        if (encoding == null) {
            request.setCharacterEncoding("UTF-8");
        }
        response.setContentType("text/html;charset=UTF-8");
        
        String nombre = request.getParameter("nombreC");
        String email = request.getParameter("emailC");
        String passwd = request.getParameter("passwordC");
        

        HttpSession s = request.getSession();
        Cliente cliente = (Cliente) s.getAttribute("cliente");
        cliente.setNombre(nombre);
        cliente.setCorreo(email);
        cliente.setContraseña(passwd);
       
       
        String url;
        PrintWriter out = response.getWriter();
        
        ClienteDB.modificarCliente(cliente);
        url = "/pagina_perfil_cliente.jsp";
        HttpSession session = request.getSession();
        session.setAttribute("cliente", cliente);
  
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

}
