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
import uva.inf.ssw.quickbook.modelo.Direccion;
import uva.inf.ssw.quickbook.modelo.UsuarioDB;

@WebServlet(name = "RegistroClienteServlet", urlPatterns = {"/registroCliente"})
public class RegistroClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String encoding = request.getCharacterEncoding();
        if (encoding == null) {
            request.setCharacterEncoding("UTF-8");
        }
        response.setContentType("text/html;charset=UTF-8");

        String nombre = request.getParameter("nombreC");
        String apellidos = request.getParameter("apellidosC");
        String idUsuario = request.getParameter("idUsuarioC");
        String email = request.getParameter("emailC");
        String telefono = request.getParameter("phoneC");
        String direccion = request.getParameter("direccionC");
        String password = request.getParameter("passwordC");

        Cliente cliente = new Cliente();

        cliente.setNombre(nombre);
        cliente.setApellidos(apellidos);
        cliente.setIdUsuario(idUsuario);
        cliente.setCorreo(email);
        cliente.setTelefono(telefono);
        cliente.setDireccion(new Direccion(direccion));
        cliente.setContraseña(password);

        String url;

        PrintWriter out = response.getWriter();
        if (UsuarioDB.existeUsuario(idUsuario)) {
            out.println("<script>alert('idUsuario no disponible'); </script>");
            url = "index.jsp";
        } else if (UsuarioDB.existeEmail(email)) {
            out.println("<script>alert('correo ya registrado'); </script>");
            url = "index.jsp";
        } else {
            ClienteDB.insert(cliente);
            url = "pagina_perfil_cliente.jsp";
            HttpSession session = request.getSession();
            session.setAttribute("cliente", cliente);
        }

        RequestDispatcher rs = request.getRequestDispatcher(url);
        rs.include(request, response);
    }
}
