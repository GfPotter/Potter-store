/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Acers
 */
public class Cart {

    private int user_id;
   private CartDetail cart;

    public Cart() {
    }

    public Cart(int user_id, CartDetail cart) {
        this.user_id = user_id;
        this.cart = cart;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public CartDetail getCart() {
        return cart;
    }

    public void setCart(CartDetail cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "Cart{" + "user_id=" + user_id + ", cart=" + cart + '}';
    }

   

}
