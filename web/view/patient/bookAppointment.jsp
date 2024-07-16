<%-- 
    Document   : chooseServices
    Created on : Jun 12, 2024, 11:42:55 AM
    Author     : Vu Minh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DentCare - Dental Clinic Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="../img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../lib/animate/animate.min.css" rel="stylesheet">
        <link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="../lib/twentytwenty/twentytwenty.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../css/style.css" rel="stylesheet">
        <style>
            .hidden {
                display: none;
            }
            .table-container {
                /*                max-height: 200px;  Adjust as needed */
                overflow-y: auto;
            }
            .table {
                width: 100%;
                margin-bottom: 1rem;
                color: #fff;
            }
            .table th,
            .table td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            .table th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
            }
            .table tbody + tbody {
                border-top: 2px solid #dee2e6;
            }
            .table .table {
                background-color: #212529;
            }

            .wrapper{
                max-width: 450px;
                margin: 20px auto;
            }

            .wrapper .search-input{
                background: #fff;
                width: 100%;
                border-radius: 5px;
                position: relative;
                box-shadow: 0px 1px 5px 3px rgba(0,0,0,0.12);
            }

            .search-input input{
                height: 55px;
                width: 100%;
                outline: none;
                border: none;
                border-radius: 5px;
                padding: 0 60px 0 20px;
                font-size: 18px;
                box-shadow: 0px 1px 5px rgba(0,0,0,0.1);
            }

            .search-input.active input{
                border-radius: 5px 5px 0 0;
            }

            .search-input .autocom-box{
                padding: 0;
                opacity: 0;
                pointer-events: none;
                max-height: 280px;
                overflow-y: auto;
            }

            .search-input.active .autocom-box{
                padding: 10px 8px;
                opacity: 1;
                pointer-events: auto;
            }

            .autocom-box li{
                list-style: none;
                padding: 8px 12px;
                display: none;
                width: 100%;
                cursor: default;
                border-radius: 3px;
            }

            .search-input.active .autocom-box li{
                display: block;
            }
            .autocom-box li:hover{
                background: #efefef;
            }

            .search-input .icon{
                position: absolute;
                right: 0px;
                top: 0px;
                height: 55px;
                width: 55px;
                text-align: center;
                line-height: 55px;
                font-size: 20px;
                color: black;
                cursor: pointer;
            }

            .search-input {
                position: relative;
                display: inline-block;
            }

            .search-input input {
                height: 40px;
                width: 300px; /* Điều chỉnh độ rộng phù hợp với giao diện của bạn */
                padding: 0 40px 0 15px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 5px;
                outline: none;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .search-input .autocom-box {
                position: absolute;
                top: 45px; /* Điều chỉnh khoảng cách của hộp tìm kiếm autocomplete */
                left: 0;
                width: 100%;
                background: #fff;
                border: 1px solid #ccc;
                border-top: none;
                max-height: 200px;
                overflow-y: auto;
                z-index: 1000;
                display: none;
            }

            .search-input .icon {
                position: absolute;
                top: 0;
                right: 0;
                height: 40px;
                width: 40px;
                text-align: center;
                line-height: 40px;
                cursor: pointer;
                color: #aaa;
            }

            .service-list {
                display: none;
            }
        </style>
    </head>

    <body>



        <!-- Hero Start -->
        <div class="container-fluid bg-primary py-5 hero-header mb-5">
            <div class="row py-3">
                <div class="col-12 text-center">
                    <h1 class="display-3 text-white animated zoomIn">Appointment</h1>
                    <a href="" class="h4 text-white">Home</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h4 text-white">Appointment</a>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Appointment Start -->
        <div class="container-fluid bg-primary bg-appointment mb-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 90px;">
            <div class="container-fluid bg-primary bg-appointment mb-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 90px;">
                <div class="container">
                    <div class="row gx-5">
                        <!-- Initial content start-->
                        <div id="initial-content" class="col-lg-6 py-5">
                            <div class="py-5">
                                <h1 class="display-5 text-white mb-4">What are the benefits of booking medical appointment by online.</h1>
                                <p class="text-white mb-0">No time wasted queuing to get the examination code.</p>
                                <p class="text-white mb-0">No time wasted queuing to pay the fee before the examination</p>
                                <p class="text-white mb-0">No time wasted queuing to wait for the examination.</p>
                            </div>
                        </div>
                        <!-- Initial content end-->

                        <!-- Search slot start -->
                        <div class="col-lg-6 py-5 text-start">
                            <div class="appointment-form h-100 d-flex flex-column justify-content-center text-center p-5 wow zoomIn text-start" data-wow-delay="0.6s">
                                <h1 class="text-white mb-4 text-start">Search Slot</h1>
                                <form id="search-form" action="bookAppointment" method="POST" onsubmit="return validateForm()">
                                    <div class="date mb-3 text-start" id="dateBook" name="dateBook" data-target-input="nearest">
                                        <input type="date" name="date" id="appointmentDate" class="form-control bg-light border-0 datetimepicker-input" placeholder="Appointment Date" style="height: 40px;">
                                    </div>
                                    <div class="mb-3 text-start">
                                        <button type="button" class="btn btn-secondary" onclick="toggleServiceList()"><b style="color: black">Select Services</b></button>
                                        <ul class="list-group mt-3 service-list" id="service-list">
                                            <c:forEach items="${requestScope.arrService}" var="service">
                                                <c:if test="${service.type == 'a'}">
                                                    <li class="list-group-item">
                                                        <label>
                                                            <input type="checkbox" id="service" name="service" value="${service.id}"> <b style="color: white">${service.name} (${service.price}$)</b>
                                                        </label>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <!-- Hidden input field for service name -->
                                    <!--<input type="hidden" id="serviceName" name="serviceName" value="">-->
                                    <br>
                                    <div>
                                        <button class="btn btn-dark w-100 py-3" type="submit" id="search-slot-button">Search Slot</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                        <!-- Search slot end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Appointment End -->

        <!-- Replacement content start-->
        <div id="replacement-content" class=" wow zoomIn hidden" data-wow-delay="0.1s">

            <div class="bg-primary d-flex flex-column p-5">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1 class="text-white mb-0">Slot</h1>
                    <div class="search-input">
                        <input type="text" placeholder="Type to search.." onkeyup="searchServices(event)">
                        <div class="autocom-box">
                            <!-- Các mục sẽ được chèn từ JavaScript -->
                        </div>
                        <div class="icon"><i class="fas fa-search"></i></div>
                    </div>
                </div>
                <p style="color:white">***If you book 2 different services, you should not choose the same time slot for the 2 services.***</p>
                <div class="table-container">
                    <table class="table text-white">
                        <thead>
                            <tr>
                                <th><h4>Select</h4></th>
                                <th><h4>Service</h4></th>
                                <th><h4>Room</h4></th>
                                <th><h4>Doctor</h4></th>
                                <th><h4>Time</h4></th>

                            </tr>
                        </thead>
                        <tbody id="slotPlace">

                        </tbody>
                    </table>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-primary" onclick="submitSelectedSlots()">Book Appointment</button>
                </div>
                <!--<a class="btn btn-light" href="">Appointment</a>-->
            </div>
        </div>
        <!-- Replacement content end-->

        <!--Confirmation Modal Start-->                
        <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmModalLabel">Confirm Appointments</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="slotDetailsContainer">
                            <!--Slot details will be dynamically inserted here--> 
                        </div>
                        <form id="confirm-form" action="confirmSlot" method="POST">
                            <!--Hidden inputs to submit selected slots' data--> 
                            <div id="hiddenInputsContainer"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <input type="submit" class="btn btn-primary" value="Confirm">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="confirmModal-noneSlot" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmModalLabel">Notification</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="slotDetailsContainer1">
                            Please select at least one slot.
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>                               
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Confirmation Modal End -->

        <!-- Announce that now has not slot start -->
        <div class="modal fade" id="confirmEmptyModal" tabindex="-1" aria-labelledby="confirmEditModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmEmptyModalLabel">Confirm Edit</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        - You need to fill in all the information.<br>
                        - If you have filled in all the information, you need to book other day. Because
                        all of slot have been booked or today's working hours have ended!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>

                    </div>
                </div>
            </div>
        </div>
        <!-- Announce that now has not slot end -->

        <div style="margin-top: 160px;"></div>
        <!-- Footer Start -->

        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>



        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../lib/wow/wow.min.js"></script>
        <script src="../lib/easing/easing.min.js"></script>
        <script src="../lib/waypoints/waypoints.min.js"></script>
        <script src="../lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="../lib/tempusdominus/js/moment.min.js"></script>
        <script src="../lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="../lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="../lib/twentytwenty/jquery.event.move.js"></script>
        <script src="../lib/twentytwenty/jquery.twentytwenty.js"></script>

        <!-- Template Javascript -->
        <script src="../js/main.js"></script>
        <script>

                        function toggleServiceList() {
                            var serviceList = document.getElementById('service-list');
                            if (serviceList.style.display === 'none' || serviceList.style.display === '') {
                                serviceList.style.display = 'block';
                            } else {
                                serviceList.style.display = 'none';
                            }
                        }

                        function showModal() {
                            var myModal = new bootstrap.Modal(document.getElementById('confirmEmptyModal'));
                            myModal.show();
                        }
                        function validateForm() {
                            var appointmentDate = document.getElementById('appointmentDate').value;

                            var services = document.querySelectorAll('input[name="service"]:checked');
                            var isServiceSelected = services.length > 0;

                            if (!isServiceSelected || appointmentDate === "") {
                                showModal();
                                return false;
                            }

                            return true;
                        }

                        function searchServices(event) {
                            var keyword = event.target.value.toLowerCase();
                            var rows = document.querySelectorAll("#slotPlace tr");

                            rows.forEach(function (row) {
                                var text = row.textContent.toLowerCase();
                                var displayStyle = text.includes(keyword) ? "table-row" : "none";
                                row.style.display = displayStyle;
                            });
                        }

                        //Validate time
                        // Lấy phần tử input
                        const appointmentDateInput = document.getElementById('appointmentDate');

                        // Lấy ngày hiện tại
                        const today = new Date();

                        // Định dạng ngày thành chuỗi yyyy-mm-dd
                        const formattedToday = today.toISOString().split('T')[0];

                        // Đặt thuộc tính min cho input
                        appointmentDateInput.setAttribute('min', formattedToday);

                        function updateServiceName() {
                            var serviceDropdown = document.getElementById("service");
                            var selectedOption = serviceDropdown.options[serviceDropdown.selectedIndex];
                            var serviceName = selectedOption.text;
                            document.getElementById("serviceName").value = serviceName;
                        }

                        document.getElementById('search-form').addEventListener('submit', function (event) {
                            event.preventDefault(); // Ngăn chặn việc gửi form truyền thống
                            //updateServiceName();
                            var element = $(this);

                            $.ajax({
                                url: 'bookAppointment',
                                type: 'POST',
                                data: element.serializeArray(), // Serializes the form data.
                                dataType: 'json',
                                success: function (response) {
                                    // Log the response for debugging
                                    console.log(response);

                                    if (response.success) {
                                        // Hide initial content and show replacement content
                                        //document.getElementById('initial-content').style.display = 'none';
                                        var replacementContent = document.getElementById('replacement-content');
                                        replacementContent.style.display = 'block';

                                        // Clear previous slot data
                                        $('#slotPlace').empty();

                                        // Populate the slot table
                                        response.slots.forEach(function (showSlot) {
                                            // Log showSlot for debugging
                                            console.log('Slot:', showSlot);

                                            // Create a new row element
                                            var row = document.createElement('tr');

                                            //Create and append the checkbox
                                            var checkboxCell = document.createElement('td');
                                            var checkbox = document.createElement('input');
                                            checkbox.type = 'checkbox';
                                            checkbox.name = 'selectedSlots';
                                            checkbox.value = JSON.stringify(showSlot); // Convert slot object to JSON string
                                            checkboxCell.appendChild(checkbox);
                                            row.appendChild(checkboxCell);

                                            //Create and append the service 
                                            var serviceCell = document.createElement('td');
                                            serviceCell.textContent = showSlot.serviceName;
                                            row.appendChild(serviceCell);

                                            // Create and append the room cell
                                            var roomCell = document.createElement('td');
                                            roomCell.textContent = showSlot.room;
                                            row.appendChild(roomCell);

                                            // Create and append the doctor cell
                                            var doctorCell = document.createElement('td');
                                            doctorCell.textContent = showSlot.doctor;
                                            row.appendChild(doctorCell);

                                            // Create and append the time cell
                                            var timeCell = document.createElement('td');
                                            timeCell.textContent = showSlot.startedTime + ' - ' + showSlot.endTime;
                                            row.appendChild(timeCell);

                                            // Create and append the id of slot cell
                                            var idSlotCell = document.createElement('td');
                                            idSlotCell.textContent = showSlot.idSlot;
                                            idSlotCell.style.display = 'none'; // Make the cell hidden
                                            row.appendChild(idSlotCell);

                                            // Create and append the id of doctor cell
                                            var idDoctorCell = document.createElement('td');
                                            idDoctorCell.textContent = showSlot.idDoctor;
                                            idDoctorCell.style.display = 'none'; // Make the cell hidden
                                            row.appendChild(idDoctorCell);

                                            // Create and append the id of room cell
                                            var idRoomCell = document.createElement('td');
                                            idRoomCell.textContent = showSlot.idRoom;
                                            idRoomCell.style.display = 'none'; // Make the cell hidden
                                            row.appendChild(idRoomCell);

                                            // Create and append the date cell
                                            var dateCell = document.createElement('td');
                                            dateCell.textContent = showSlot.date;
                                            dateCell.style.display = 'none'; // Make the cell hidden
                                            row.appendChild(dateCell);

                                            // Create and append the id of service cell
                                            var idServiceCell = document.createElement('td');
                                            idServiceCell.textContent = showSlot.idService;
                                            idServiceCell.style.display = 'none'; // Make the cell hidden
                                            row.appendChild(idServiceCell);

                                            // Create and append the id of service cell
                                            var nameServiceCell = document.createElement('td');
                                            nameServiceCell.textContent = showSlot.serviceName;
                                            nameServiceCell.style.display = 'none'; // Make the cell hidden
                                            row.appendChild(nameServiceCell);

                                            // Append the row to the table
                                            document.getElementById('slotPlace').appendChild(row);
                                        });
                                    } else {
                                        // Function to show the modal
                                        function showModal() {
                                            var myModal = new bootstrap.Modal(document.getElementById('confirmEmptyModal'));
                                            myModal.show();
                                        }

                                        // Example: Call this function when needed
                                        showModal();
                                    }
                                },
                                error: function (xhr, status, error) {
                                    console.error('Error:', error);
                                }
                            });
                        });
                        function submitSelectedSlots() {
                            var selectedSlots = [];
                            document.querySelectorAll('input[name="selectedSlots"]:checked').forEach(function (checkbox) {
                                selectedSlots.push(JSON.parse(checkbox.value)); // Parse JSON string back to object
                            });

                            if (selectedSlots.length > 0) {
                                // Get the container for displaying slot details and hidden inputs
                                var slotDetailsContainer = document.getElementById('slotDetailsContainer');
                                var hiddenInputsContainer = document.getElementById('hiddenInputsContainer');

                                // Clear previous contents
                                slotDetailsContainer.innerHTML = '';
                                hiddenInputsContainer.innerHTML = '';

                                selectedSlots.forEach(function (slot, index) {
                                    // Create and append appointment container
                                    var appointmentDiv = document.createElement('div');

                                    // Create and append appointment heading
                                    var heading = document.createElement('h5');
                                    heading.textContent = 'Appointment ' + (index + 1);
                                    appointmentDiv.appendChild(heading);

                                    // Create and append service detail
                                    var serviceDetail = document.createElement('p');
                                    serviceDetail.textContent = 'Service: ' + slot.serviceName;
                                    appointmentDiv.appendChild(serviceDetail);

                                    // Create and append room detail
                                    var roomDetail = document.createElement('p');
                                    roomDetail.textContent = 'Room: ' + slot.room;
                                    appointmentDiv.appendChild(roomDetail);

                                    // Create and append doctor detail
                                    var doctorDetail = document.createElement('p');
                                    doctorDetail.textContent = 'Doctor: ' + slot.doctor;
                                    appointmentDiv.appendChild(doctorDetail);

                                    // Create and append date detail
                                    var dateDetail = document.createElement('p');
                                    dateDetail.textContent = 'Date: ' + slot.date;
                                    appointmentDiv.appendChild(dateDetail);

                                    // Create and append time detail
                                    var timeDetail = document.createElement('p');
                                    timeDetail.textContent = 'Time: ' + slot.startedTime + ' - ' + slot.endTime;
                                    appointmentDiv.appendChild(timeDetail);

                                    // Append a horizontal line for separation
                                    var hr = document.createElement('hr');
                                    appointmentDiv.appendChild(hr);

                                    // Append the appointment details to the container
                                    slotDetailsContainer.appendChild(appointmentDiv);

                                    // Create and append hidden inputs for each slot
                                    var slotIdInput = document.createElement('input');
                                    slotIdInput.type = 'hidden';
                                    slotIdInput.name = 'slots[' + index + '][slotId]';
                                    slotIdInput.value = slot.idSlot;
                                    hiddenInputsContainer.appendChild(slotIdInput);

                                    var doctorIdInput = document.createElement('input');
                                    doctorIdInput.type = 'hidden';
                                    doctorIdInput.name = 'slots[' + index + '][doctorId]';
                                    doctorIdInput.value = slot.idDoctor;
                                    hiddenInputsContainer.appendChild(doctorIdInput);

                                    var roomIdInput = document.createElement('input');
                                    roomIdInput.type = 'hidden';
                                    roomIdInput.name = 'slots[' + index + '][roomId]';
                                    roomIdInput.value = slot.idRoom;
                                    hiddenInputsContainer.appendChild(roomIdInput);

                                    var dateInput = document.createElement('input');
                                    dateInput.type = 'hidden';
                                    dateInput.name = 'slots[' + index + '][date]';
                                    dateInput.value = slot.date;
                                    hiddenInputsContainer.appendChild(dateInput);

                                    var serviceIdInput = document.createElement('input');
                                    serviceIdInput.type = 'hidden';
                                    serviceIdInput.name = 'slots[' + index + '][serviceId]';
                                    serviceIdInput.value = slot.idService;
                                    hiddenInputsContainer.appendChild(serviceIdInput);
                                });

                                // Show modal
                                var confirmModal = new bootstrap.Modal(document.getElementById('confirmModal'));
                                confirmModal.show();
                            } else {
                                var confirmModal = new bootstrap.Modal(document.getElementById('confirmModal-noneSlot'));
                                confirmModal.show();
                            }
                        }

        </script>
    </body>

</html>
