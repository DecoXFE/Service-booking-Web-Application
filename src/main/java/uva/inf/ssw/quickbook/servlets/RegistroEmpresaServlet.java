package uva.inf.ssw.quickbook.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
import uva.inf.ssw.quickbook.modelo.UsuarioDB;

@WebServlet(name = "RegistroEmpresaServlet", urlPatterns = {"/registroEmpresa"})
public class RegistroEmpresaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String encoding = request.getCharacterEncoding();
        if (encoding == null) {
            request.setCharacterEncoding("UTF-8");
        }
        response.setContentType("text/html;charset=UTF-8");

        String idUsuario = request.getParameter("idUsuario-empresa");
        String fullname = request.getParameter("fullname-empresa");
        String email = request.getParameter("email-empresa");
        String phone = request.getParameter("phone-empresa");
        String direccion = request.getParameter("direccion-empresa");
        String passwd = request.getParameter("password-empresa");

        Empresa empresa = new Empresa();

        empresa.setIdUsuario(idUsuario);
        empresa.setNombre(fullname);
        empresa.setCorreo(email);
        empresa.setTelefono(phone);
        empresa.setDireccion(new Direccion(direccion));
        empresa.setContraseña(passwd);

        String url;
        PrintWriter out = response.getWriter();

        if (UsuarioDB.existeUsuario(idUsuario)) {
            out.println("<script>alert('idUsuario no disponible'); </script>");
            url = "/index.jsp";
        } else if (UsuarioDB.existeEmail(email)) {
            out.println("<script>alert('correo ya registrado'); </script>");
            url = "/index.jsp";
        } else {
            EmpresaDB.insert(empresa);
            HttpSession session = request.getSession();
            url = "/index.jsp";
            request.getSession().removeAttribute("empresa");
            request.getSession().removeAttribute("cliente");
        }

        RequestDispatcher rs = request.getRequestDispatcher(url);
        rs.include(request, response);
    }
}
