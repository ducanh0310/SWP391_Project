/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Vu Minh Quan
 */
public class Payment {
    private int id;
    private BookingAppointmentHistory bAH;
    private String amount;
    private String payment_type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BookingAppointmentHistory getbAH() {
        return bAH;
    }

    public void setbAH(BookingAppointmentHistory bAH) {
        this.bAH = bAH;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getPayment_type() {
        return payment_type;
    }

    public void setPayment_type(String payment_type) {
        this.payment_type = payment_type;
    }
    
    
    
    
}