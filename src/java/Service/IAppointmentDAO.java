/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Service;

import java.util.ArrayList;
import model.AppointmentDTO;

/**
 *
 * @author trung
 */
public interface IAppointmentDAO {
    public ArrayList<AppointmentDTO> getAppointment();
}