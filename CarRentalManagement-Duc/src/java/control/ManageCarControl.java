package control;

import dao.DAO;
import entity.Car;
import entity.Category;
import entity.Location;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ManageCarControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao= new DAO();
        response.setContentType("text/html;charset=UTF-8");
        List<Car> listCar = dao.getAllCar();
        request.setAttribute("listCar", listCar);
        List<Category> listCategory = dao.getAllCategory();
        request.setAttribute("listCategory", listCategory);
        List<Location> listlocation = dao.getAllLocation();
        request.setAttribute("listlocation", listlocation);
        request.getRequestDispatcher("ManageCar.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
