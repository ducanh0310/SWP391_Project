package controller.employee;

import dal.DoctorDB;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PatientExamResult;
import model.Prescription;

@WebServlet(name = "AddPrescription", urlPatterns = {"/addPrescription"})
public class AddPrescription extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        try {
//            // Get the parameters from the request
//            String examIdStr = request.getParameter("exam_id");
//            String dosage = request.getParameter("dosage");
//            String duration = request.getParameter("duration");
//            String medication = request.getParameter("medication");
//            String notes = request.getParameter("notes");
//
//            // Check if any parameter is missing
//            if (examIdStr == null || dosage == null || duration == null || medication == null || notes == null) {
//                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters.");
//                return;
//            }
//
//            // Parse the exam_id
//            int examId;
//            try {
//                examId = Integer.parseInt(examIdStr);
//            } catch (NumberFormatException e) {
//                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid exam_id format.");
//                return;
//            }
//
//            // Create the Prescription object
//            Prescription prescription = new Prescription();
//
//            // Set the values in the Prescription object
//            PatientExamResult patientExamResult = new PatientExamResult();
//            patientExamResult.setExam_id(examId);  // Assuming there's a setter for exam_id
//            prescription.setPatientExamResult(patientExamResult);
//            prescription.setDosage(dosage);
//            prescription.setDuration(duration);
//            prescription.setMedication(medication);
//            prescription.setNotes(notes);
//
//            // Add the Prescription to the database
//            DoctorDB db = new DoctorDB();
//            if (db.addPrescription(prescription)) {
//                response.sendRedirect("addPrescription.jsp");
//            } else {
//                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add prescription.");
//            }
//        } catch (Exception e) {
//            // Handle exception, e.g., log the error and set the response status
//            e.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while adding the prescription.");
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(request.getParameter("eid"));
            DoctorDB db = new DoctorDB();
            PatientExamResult patientView = db.getPatientExamResult(patientId);

            request.setAttribute("patientView", patientView);
            request.getRequestDispatcher("addPrescription.jsp").forward(request, response);

        } catch (Exception e) {
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "AddPrescription Servlet";
    }
}
