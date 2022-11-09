/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Acers
 */
public class Product {

    private int id;
    private String img;
    private String name;
    private String des;
    private String detail;
    private String moreinf;
    private int price;
    private boolean gender;
    private String img2;
    private String img3;

    public Product() {
    }

    public Product(String img, String name, int price) {
        this.img = img;
        this.name = name;
        this.price = price;
    }

    public Product(String img, String name, String des, String detail, String moreinf, int price, String gender, String img2, String img3) {
        this.img = img;
        this.name = name;
        this.des = des;
        this.detail = detail;
        this.moreinf = moreinf;
        this.price = price;
        this.gender = gender.equalsIgnoreCase("Men");
        this.img2 = img2;
        this.img3 = img3;
    }

    public Product(String img, String name, String des, String detail, String moreinf, int price, boolean gender, String img2, String img3) {
        this.img = img;
        this.name = name;
        this.des = des;
        this.detail = detail;
        this.moreinf = moreinf;
        this.price = price;
        this.gender = gender;
        this.img2 = img2;
        this.img3 = img3;
    }

    public Product(int id, String img, String name, String des, String detail, String moreinf, int price, String gender, String img2, String img3) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.des = des;
        this.detail = detail;
        this.moreinf = moreinf;
        this.price = price;
        this.gender = gender.equalsIgnoreCase("Men");
        this.img2 = img2;
        this.img3 = img3;
    }

    public Product(int id, String img, String name, String des, String detail, String moreinf, int price, boolean gender, String img2, String img3) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.des = des;
        this.detail = detail;
        this.moreinf = moreinf;
        this.price = price;
        this.gender = gender;
        this.img2 = img2;
        this.img3 = img3;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getMoreinf() {
        return moreinf;
    }

    public void setMoreinf(String moreinf) {
        this.moreinf = moreinf;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender.equalsIgnoreCase("Men");
    }

    public String getGender() {
        return gender ? "Men" : "Women";
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", img=" + img + ", name=" + name + ", des=" + des + ", detail=" + detail + ", moreinf=" + moreinf + ", price=" + price + ", gender=" + gender + ", img2=" + img2 + ", img3=" + img3 + '}';
    }

}
