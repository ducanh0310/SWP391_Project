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
    String description;
    String type;

    public ProcedureCodes() {
    }

    public ProcedureCodes(int procedure_id, String procedure_name, String price, String description, String type) {
        this.procedure_id = procedure_id;
        this.procedure_name = procedure_name;
        this.price = price;
        this.description = description;
        this.type = type;
    }
    
    public ProcedureCodes(String procedure_name, String price) {
        this.procedure_name = procedure_name;
        this.price = price;
    }

    public ProcedureCodes(String procedure_name, String price, String description) {
        this.procedure_name = procedure_name;
        this.price = price;
        this.description = description;
    }
    
    

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    

}