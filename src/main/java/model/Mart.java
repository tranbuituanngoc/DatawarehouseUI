package model;

import java.sql.Date;

public class Mart {
    private int id;
    private Date date;
    private String time;
    private Provinces province;
    private double low_temp;
    private double high_temp;
    private String status;
    private double humidity;
    private double wind_spd;
    private double uvIndex;
    private double visibility;
    private double pressure;

    public Mart() {
    }

    public Mart(Date date, String time, Provinces province, double low_temp, double high_temp, String status, double humidity, double wind_spd, double uvIndex, double visibility, double pressure) {
        this.date = date;
        this.time = time;
        this.province = province;
        this.low_temp = low_temp;
        this.high_temp = high_temp;
        this.status = status;
        this.humidity = humidity;
        this.wind_spd = wind_spd;
        this.uvIndex = uvIndex;
        this.visibility = visibility;
        this.pressure = pressure;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Provinces getProvince() {
        return province;
    }

    public void setProvince(Provinces province) {
        this.province = province;
    }

    public double getLow_temp() {
        return low_temp;
    }

    public void setLow_temp(double low_temp) {
        this.low_temp = low_temp;
    }

    public double getHigh_temp() {
        return high_temp;
    }

    public void setHigh_temp(double high_temp) {
        this.high_temp = high_temp;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getHumidity() {
        return humidity;
    }

    public void setHumidity(double humidity) {
        this.humidity = humidity;
    }

    public double getWind_spd() {
        return wind_spd;
    }

    public void setWind_spd(double wind_spd) {
        this.wind_spd = wind_spd;
    }

    public double getUvIndex() {
        return uvIndex;
    }

    public void setUvIndex(double uvIndex) {
        this.uvIndex = uvIndex;
    }

    public double getVisibility() {
        return visibility;
    }

    public void setVisibility(double visibility) {
        this.visibility = visibility;
    }

    public double getPressure() {
        return pressure;
    }

    public void setPressure(double pressure) {
        this.pressure = pressure;
    }

    @Override
    public String toString() {
        return "Mart{" +
                "id=" + id +
                ", date=" + date +
                ", time=" + time +
                ", province='" + province + '\'' +
                ", low_temp=" + low_temp +
                ", high_temp=" + high_temp +
                ", status='" + status + '\'' +
                ", humidity=" + humidity +
                ", wind_spd=" + wind_spd +
                ", uvIndex=" + uvIndex +
                ", visibility=" + visibility +
                ", pressure=" + pressure +
                '}';
    }
}
