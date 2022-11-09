/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Acers
 */
public class CheckOut {

    private int user_id;
    private int product_id;
    private String size;
    private int quantity;
    private String city;
    private String address;
    private String phone;

    public CheckOut() {
    }

    public CheckOut(int user_id, int product_id, String size, int quantity, String city, String address, String phone) {
        this.user_id = user_id;
        this.product_id = product_id;
        this.size = size;
        this.quantity = quantity;
        this.city = city;
        this.address = address;
        this.phone = phone;

    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "CheckOut{" + "user_id=" + user_id + ", product_id=" + product_id + ", size=" + size + ", quantity=" + quantity + ", city=" + city + ", address=" + address + ", phone=" + phone + '}';
    }

   
}
