package dao;

import Database.JDBCUtil;
import model.Mart;
import model.Provinces;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class WeatherMartDAO {
    public static ArrayList<Mart> getDataWithProvince(String provinceName) {
        ArrayList<Mart> res = new ArrayList<>();
        try {
            Connection connection = JDBCUtil.getConnection();
            String sql = "SELECT * FROM weather_mart WHERE province=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, provinceName);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Date date = resultSet.getDate("date");
                Time time = resultSet.getTime("time");
                SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
                String formattedTime = dateFormat.format(time);
                String prov = resultSet.getString("province");
                Provinces provinces = ProvincesDimDAO.getProvinceFromName(prov);
                double low_temp = resultSet.getDouble("low_temp");
                double high_temp = resultSet.getDouble("high_temp");
                String status = resultSet.getString("status");
                double humidity = resultSet.getDouble("humidity");
                double wind_spd = resultSet.getDouble("wind_spd");
                double uvIndex = resultSet.getDouble("uvIndex");
                double visibility = resultSet.getDouble("visibility");
                double pressure = resultSet.getDouble("pressure");
                Mart mart = new Mart(date, formattedTime, provinces, low_temp, high_temp, status, humidity, wind_spd, uvIndex, visibility, pressure);
                res.add(mart);
            }
            JDBCUtil.disconection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return res;
    }

    public static void main(String[] args) {
        ArrayList<Mart> a = getDataWithProvince("TP Hồ Chí Minh");
        for (Mart m : a) {
            System.out.println(1);
            System.out.println(m.toString());
        }
    }
}
