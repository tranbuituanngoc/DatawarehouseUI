package Controller;

import dao.ProvincesDimDAO;
import dao.WeatherMartDAO;
import model.Mart;
import model.Provinces;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet(name = "thoitiet", value = "/thoitiet")
public class WeatherController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String link = request.getParameter("province");

        Provinces p = ProvincesDimDAO.getProvinceFromLink(link);

        Map<String, ArrayList<Provinces>> areaMap = ProvincesDimDAO.getProvinceFromArea();
        request.setAttribute("areaMap", areaMap);

        ArrayList<Mart> mart = WeatherMartDAO.getDataWithProvince(p.getName());
        request.setAttribute("mart", mart);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
