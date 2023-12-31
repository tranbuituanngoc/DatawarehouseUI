package model;

public class Provinces {
    private int id;
    private String name;
    private String link;
    private String area;

    public Provinces() {
    }

    public Provinces(int id, String name, String link, String area) {
        this.id = id;
        this.name = name;
        this.link = link;
        this.area = area;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
}
