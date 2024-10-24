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
import uva.inf.ssw.quickbook.modelo.Cliente;
import uva.inf.ssw.quickbook.modelo.ClienteDB;
import uva.inf.ssw.quickbook.modelo.Empresa;
import uva.inf.ssw.quickbook.modelo.EmpresaDB;
import uva.inf.ssw.quickbook.modelo.UsuarioDB;

@WebServlet(name = "InicioSesionServlet", urlPatterns = {"/inicioSesion"})
public class InicioSesionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String encoding = request.getCharacterEncoding();
        if (encoding == null) {
            request.setCharacterEncoding("UTF-8");
        }
        // get parameters from the request
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url;

        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //Validar si las credenciales para iniciar sesion son correctas
        if (!UsuarioDB.validate(username, password)) {
            out.println("<script>alert('Nombre de usuario o contraseña incorrectos'); </script>");
            url = "index.jsp";
        } else {
            boolean tipoUsuario = UsuarioDB.selectTipoUsuarioPorId(username);
            if (tipoUsuario) {
                Cliente cliente = ClienteDB.selectClientePorId(username);
                session.setAttribute("cliente", cliente);
                url = "pagina_perfil_cliente.jsp";
            } else {
                Empresa empresa = EmpresaDB.selectEmpresaPorId(username);
                session.setAttribute("empresa", empresa);
                url = "pagina_perfil_empresa.jsp";
            }
        }

        RequestDispatcher rs = request.getRequestDispatcher(url);
        rs.include(request, response);
    }

}
