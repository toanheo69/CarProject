package control;

import dao.DAO;
import entity.Customer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterControl", urlPatterns = {"/register"})
public class RegisterControl extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        int customerId = 1;
        for(Customer c : dao.getAllCustomer()){
            customerId++;
        }
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String driverLicenseNumber = request.getParameter("driverLicenseNumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Customer customer = new Customer(customerId, fullName, email, phone, driverLicenseNumber, username, password);
        dao.addCustomer(customer);
        response.sendRedirect("Login.jsp");
    }
}
