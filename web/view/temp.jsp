<%-- 
    Document   : temp
    Created on : Jul 10, 2024, 4:41:05 PM
    Author     : Vu Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <div class="col-lg-6 py-5">
    <div class="appointment-form h-100 d-flex flex-column justify-content-center text-center p-5 wow zoomIn" data-wow-delay="0.6s">
        <h1 class="text-white mb-4">Search Slot</h1>
        <form id="search-form" action="patient/bookAppointment" method="POST" onsubmit="return validateForm()">

            <div class="date mb-3" id="dateBook" name="dateBook" data-target-input="nearest">
                <input type="date" name="date" id="appointmentDate" class="form-control bg-light border-0 datetimepicker-input" placeholder="Appointment Date" style="height: 40px;">
            </div>

            <!-- Dropdown button -->
            <div class="dropdown mb-3">
                <button class="btn btn-light dropdown-toggle w-100" type="button" id="serviceDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    ---Select A Service---
                </button>
                <ul class="dropdown-menu w-100 p-3" aria-labelledby="serviceDropdown" style="display: none;">
                    <c:forEach items="${requestScope.arrService}" var="service">
                        <c:if test="${service.type == 'a'}">
                            <li class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="service-${service.id}" name="service" value="${service.id}">
                                <label class="form-check-label" for="service-${service.id}">
                                    ${service.name} (${service.price}$)
                                </label>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>

            <!-- Hidden input field for selected services -->
            <input type="hidden" id="selectedServices" name="selectedServices" value="">

            <div>
                <button class="btn btn-dark w-100 py-3" type="submit" id="search-slot-button">Search Slot</button>
            </div>
        </form>
    </div>
</div>

<script>
    document.getElementById('serviceDropdown').addEventListener('click', function() {
        var dropdownMenu = this.nextElementSibling;
        if (dropdownMenu.style.display === 'none' || dropdownMenu.style.display === '') {
            dropdownMenu.style.display = 'block';
        } else {
            dropdownMenu.style.display = 'none';
        }
    });

    document.getElementById('search-form').addEventListener('submit', function(event) {
        var selectedServices = [];
        var checkboxes = document.querySelectorAll('input[name="service"]:checked');

        checkboxes.forEach(function(checkbox) {
            selectedServices.push(checkbox.value);
        });

        document.getElementById('selectedServices').value = selectedServices.join(',');
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function(event) {
        var dropdown = document.getElementById('serviceDropdown');
        var dropdownMenu = dropdown.nextElementSibling;
        if (!dropdown.contains(event.target)) {
            dropdownMenu.style.display = 'none';
        }
    });
</script>
    </body>
</html>
