package dao;

import Database.JDBCUtil;
import model.Provinces;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ProvincesDimDAO {
    public static Set<String> getArea() {
        Set<String> res = new HashSet<>();
        try {
            Connection connection = JDBCUtil.getConnection("projectdw");
            String sql = "SELECT area FROM provinces_dim";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String area = resultSet.getString(1);
                res.add(area);
            }
            JDBCUtil.disconection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return res;
    }

    public static Provinces getProvinceFromLink(String linkV) {
        Provinces p = null;
        try {
            Connection connection = JDBCUtil.getConnection("projectdw");
            String sql = "SELECT * FROM provinces_dim WHERE link=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, linkV);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String link = resultSet.getString("link");
                String area = resultSet.getString("area");

                p = new Provinces();
                p.setName(name);
                p.setLink(link);
                p.setArea(area);

                break;
            }
            JDBCUtil.disconection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return p;
    }
    public static Provinces getProvinceFromName(String nameV) {
        Provinces p = null;
        try {
            Connection connection = JDBCUtil.getConnection("projectdw");
            String sql = "SELECT * FROM provinces_dim WHERE name=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nameV);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String link = resultSet.getString("link");
                String area = resultSet.getString("area");

                p = new Provinces();
                p.setName(name);
                p.setLink(link);
                p.setArea(area);

                break;
            }
            JDBCUtil.disconection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return p;
    }
    public static Map<String, ArrayList<Provinces>> getProvinceFromArea() {
        Map<String, ArrayList<Provinces>> res = new HashMap<>();
        try {
            Connection connection = JDBCUtil.getConnection("projectdw");
            String sql = "SELECT name,link,area FROM provinces_dim WHERE area=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            Set<String> areas = getArea();
            for (String areaV : areas) {
                statement.setString(1, areaV);
                ResultSet resultSet = statement.executeQuery();
                ArrayList<Provinces> provincesChild = new ArrayList<>();
                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String link = resultSet.getString("link");
                    String area = resultSet.getString("area");

                    Provinces p = new Provinces();
                    p.setName(name);
                    p.setLink(link);
                    p.setArea(area);

                    provincesChild.add(p);
                }
                res.put(areaV, provincesChild);
            }
            JDBCUtil.disconection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return res;
    }

    public static void main(String[] args) {
//        Set<String> areaSet = getArea();
//        for (String s : areaSet) {
//            System.out.println(s);
//        }
        getProvinceFromArea();
    }
}
