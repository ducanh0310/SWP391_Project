/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Gia Huy
 */
public class ProcedureCodes {
    int procedure_id;
    String procedure_name;
    String price;

    public ProcedureCodes() {
    }

    public ProcedureCodes(int procedure_id, String procedure_name, String price) {
        this.procedure_id = procedure_id;
        this.procedure_name = procedure_name;
        this.price = price;
    }

    public int getProcedure_id() {
        return procedure_id;
    }

    public String getProcedure_name() {
        return procedure_name;
    }

    public String getPrice() {
        return price;
    }

    public void setProcedure_id(int procedure_id) {
        this.procedure_id = procedure_id;
    }

    public void setProcedure_name(String procedure_name) {
        this.procedure_name = procedure_name;
    }

    public void setPrice(String price) {
        this.price = price;
    }
    
    
}
