/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalTime;

/**
 *
 * @author Vu Minh Quan
 */
public class Slot {
    private int id;
    private LocalTime startedTime;
    private LocalTime endTime;
    private int idService;
    private Room room;
    private Employee doctor; 
    private StatusBook statusBook;
    private BookingAppointment bookingAppointment;

    public BookingAppointment getBookingAppointment() {
        return bookingAppointment;
    }

    public void setBookingAppointment(BookingAppointment bookingAppointment) {
        this.bookingAppointment = bookingAppointment;
    }



    public StatusBook getStatusBook() {
        return statusBook;
    }

    public void setStatusBook(StatusBook statusBook) {
        this.statusBook = statusBook;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Employee getDoctor() {
        return doctor;
    }

    public void setDoctor(Employee doctor) {
        this.doctor = doctor;
    }
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalTime getStartedTime() {
        return startedTime;
    }

    public void setStartedTime(LocalTime startedTime) {
        this.startedTime = startedTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public int getIdService() {
        return idService;
    }

    public void setIdService(int idService) {
        this.idService = idService;
    }
        
}
