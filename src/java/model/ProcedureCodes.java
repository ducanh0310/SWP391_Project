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
    String type;
    String description;
    String procedure;
    String procedure2;
    String procedure3;
    String procedure4;
    String procedure5;

    public ProcedureCodes() {
    }

    public ProcedureCodes(int procedure_id, String procedure_name, String price, String type, String description, String procedure, String procedure2, String procedure3, String procedure4, String procedure5) {
        this.procedure_id = procedure_id;
        this.procedure_name = procedure_name;
        this.price = price;
        this.type = type;
        this.description = description;
        this.procedure = procedure;
        this.procedure2 = procedure2;
        this.procedure3 = procedure3;
        this.procedure4 = procedure4;
        this.procedure5 = procedure5;
    }

    public String getProcedure2() {
        return procedure2;
    }

    public String getProcedure3() {
        return procedure3;
    }

    public String getProcedure4() {
        return procedure4;
    }

    public String getProcedure5() {
        return procedure5;
    }

    public void setProcedure2(String procedure2) {
        this.procedure2 = procedure2;
    }

    public void setProcedure3(String procedure3) {
        this.procedure3 = procedure3;
    }

    public void setProcedure4(String procedure4) {
        this.procedure4 = procedure4;
    }

    public void setProcedure5(String procedure5) {
        this.procedure5 = procedure5;
    }

   

    public String getProcedure() {
        return procedure;
    }

    public void setProcedure(String procedure) {
        this.procedure = procedure;
    }
    
    

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
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

}
