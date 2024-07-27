/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import model.ExaminationResult;

/**
 *
 * @author trung
 */
public interface IExaminationResultDAO {
    public String addExaminationResult(int id, int patientId, String patientName, String service, int price, String doctor,
            Date bookingDate, String startTime, String endTime, int room, String status, String payRevervationStatus, String examinationStatus, String description) throws SQLException;
    public ExaminationResult FindExaminationResultByID(int appID) throws SQLException;
    public ExaminationResult checkExaminationResultExist(int appID) throws SQLException;
    public ArrayList<ExaminationResult> getAllExaminationResult() throws SQLException;
    public boolean UpdateExaminationResult(int id, int price, String doctor, int room, String status, String description) throws SQLException;
    public boolean submitExamination(int id) throws SQLException ;
    public ArrayList<ExaminationResult> SearchERByKey(String searchKey) throws SQLException;
    public ArrayList<ExaminationResult> getAllExaminationrResultForPatient(int patientID) throws SQLException;
    
}