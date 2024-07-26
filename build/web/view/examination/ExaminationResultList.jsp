<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageSize" value="9" />
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DentCare - Dental Clinic</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="lib/twentytwenty/twentytwenty.css" rel="stylesheet" />
        <!-- BoxIcons v2.1.2 -->
        <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">

        <!-- Roboto Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap"
            rel="stylesheet">

        <!-- CSS File -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">



        <!-- Favicon -->

        <link href="../../../img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="../../../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../../../lib/animate/animate.min.css" rel="stylesheet">
        <link href="../../../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="../../../lib/twentytwenty/twentytwenty.css" rel="stylesheet" />
        <!-- BoxIcons v2.1.2 -->
        <link href="../../../https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">

        <!-- Roboto Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap"
            rel="stylesheet">

        <!-- CSS File -->
        <link rel="stylesheet" href="../../../css/style.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../../../css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../../../css/style.css" rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .text-primary {
                --x-text-opacity: 1;
                color: #06a3da !important;
            }

            .m-0 {
                margin-left: 30px !important;
            }

            body {
                background: #f7f7ff;
                margin-top: 0px;
            }
              /* Position notification at top right */
            #deleteSuccessNotification {
                display: none;
            }

            #editSuccessNotification {
                display: none;
            }

            #bookSuccessNotification {
                display: none;
            }



            /* Style for the progress bar */
            .progress-bar {
                transition: width 5s linear;
            }

            /* Position notification at top right */
            #notificationContainer {
                display: none; /* Hide by default */
            }

            /* Style for the progress bar */

            #editSuccessNotification #deleteSuccessNotification #bookSuccessNotification{
                display: none;
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 1060;
            }

            .status-verify {
                color: blue;
            }
            .status-done {
                color: green;
            }
            .status-cancel {
                color: red;
            }
            .status-not-started {
                color: black;
            }

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }


            ::selection{
                color: #fff;
                background: #ff654a;
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


            /* DataTable Customization */



            .text-primary {
                --x-text-opacity: 1;
                color: #06a3da !important;
            }
            .m-0 {
                margin-left: 30px !important;
            }
            body{
                background: #f7f7ff;
                margin-top:0px;
            }
            table th , table td{
                text-align: center;
            }
            th {
                background: #333;
                color: #fff;
            }
            .header_wrap {
                padding:30px 0;
            }



            .dataTables_filter input[type="search"] {
                border: 2px solid #000;
                font-weight: bold;
                border-radius: 10px;
                padding: 5px 5px;
                height: 35px;
            }
            /*            .mb-0{
                            font-weight:500;
                            font-size:26px;
                            padding-left:20px;
                        }*/
            /* DataTable Customization */
            .dataTables_wrapper .dataTables_paginate {
                display: flex;
                justify-content: center; /* Center align pagination */
                margin-top: 20px; /* Adjust as needed */
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button {
                padding: 5px 10px;
                margin: 0 2px;
                border-radius: 3px;
                background-color: #06a3da;
                color: white !important;
                cursor: pointer;
                border: none; /* Remove border */
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button.current,
            .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
                background-color: #005f7f;
                border: 1px solid #005f7f;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button:active {
                background-color: #004156;
                border: 1px solid #004156;
            }



            .dataTables_wrapper .dataTables_length{
                margin-left: 20px;
                margin-bottom: 20px;
            }
            .dataTables_wrapper .dataTables_filter{
                margin-right: 20px;
                margin-bottom: 20px;
            }
            .dataTables_wrapper .dataTables_info {
                margin-top: 20px;
                margin-left: 20px;
            }

            .dataTables_wrapper .dataTables_length,
            .dataTables_wrapper .dataTables_filter
            {
                float: right; /* D?ch sang trái */
                margin-right: 20px;
            }

        </style>

    </head>

    <body>

        <div class="modal fade" id="confirmSubmitModal" tabindex="-1" aria-labelledby="confirmSubmitModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmSubmitModalLabel">Submit Examination Result</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to submit this examination result?<br>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" id="confirmSubmitButton">Submit</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg"
                 id="navbarVertical">
                <div class="container-fluid">
                    <!-- Toggler -->
                    <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse"
                            data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Brand -->
                    <a href="index.jsp" class="navbar-brand p-0">
                        <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Collapse -->
                    <div class="collapse navbar-collapse" id="sidebarCollapse">
                        <!-- Navigation -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="PatientController">
                                    <i class="bi bi-list-task"></i> Patient
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="appointment/viewAppointmentHistory">
                                    <i class="bi bi-people"></i></i> Appointment History
                                </a>
                            </li>
                        </ul>
                        </ul>
                        <!-- Divider -->
                        <!--                        <hr class="navbar-divider my-5 opacity-20">-->
                        <!-- Navigation -->

                        <!-- Push content down -->
                        <hr>
                        <!-- User (md) -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="employee/profile/view">
                                    <i class="bi bi-person-square"></i> Account
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">
                                    <i class="bi bi-box-arrow-left"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Main content -->
            <div class="h-screen flex-grow-1 overflow-y-lg-auto">

                <!-- Main -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <div class="card shadow border-0 mb-7">
                            <form method="get" action="SearchExaminationResult"
                                  class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for..."
                                           aria-label="Search" value="${searchKey}" aria-describedby="basic-addon2" name="searchKey">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <div style="text-align: center; font-size: 30px;">

                                <label style="font-weight: bold">List Examination Result</label>
                            </div>
                            <div id="employeeTable" class="table-responsive">
                                <label style="color: red">${error}</label>
                                <label style="color: green">${mess}</label>

                                <table class="table table-hover table-nowrap">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">No</th>
                                            <th scope="col">Patient</th>
                                            <th scope="col">Doctor</th>
                                            <th scope="col">Service</th>
                                            <th scope="col">Booking Date</th>
                                            <!--                                            <th scope="col">Examination Status</th>-->
                                            <th scope="col">
                                                <select style="width: 160px; margin-bottom: -10px; margin-top: -10px" id="statusFilter" class="form-control" aria-label="Filter by status">
                                                    <option value="">Examination Status</option>
                                                    <option value="active">Active</option>
                                                    <option value="inactive">Inactive</option>
                                                </select>
                                            </th>
                                            <th scope="col">Description</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <!--Display employee information-->
                                    <tbody  id="employeeTableBody">
                                        <c:forEach items="${examList}" var="exam" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>    
                                                <td>${exam.patientName}</td>
                                                <td>${exam.doctor}</td>
                                                <td>${exam.service}</td>
                                                <td>${exam.bookingDate}</td>
<!--                                                <td>${exam.examinationStatus}</td>-->
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${exam.examinationStatus == 'active'}">
                                                            <span style="color: green;">${exam.examinationStatus}</span>
                                                        </c:when>
                                                        <c:when test="${exam.examinationStatus == 'inactive'}">
                                                            <span style="color: red;">${exam.examinationStatus}</span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>

                                                <td>${exam.description}</td>


                                                <td class="text-end">
                                                    <button >
                                                        <a href="ViewExaminationResult?AppID=${exam.id}"
                                                           class="btn btn-sm btn-neutral">View</a>
                                                    </button>
                                                    <c:if test="${exam.examinationStatus == 'inactive'}">
                                                        <button type="button" class="btn btn-sm btn-neutral submit-button" 
                                                                data-bs-toggle="modal" data-bs-target="#confirmSubmitModal" 
                                                                data-id="${exam.id}">
                                                            Submit
                                                        </button>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                                <!-- Pagination -->
                                <nav>
                                    <ul class="pagination justify-content-center" id="pagination">
                                        <li class="page-item" id="prevPage"><a class="page-link"
                                                                               href="javascript:void(0)">Previous</a></li>
                                        <li class="page-item" id="nextPage"><a class="page-link"
                                                                               href="javascript:void(0)">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </main>
            </div>



            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="lib/wow/wow.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/waypoints/waypoints.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="lib/tempusdominus/js/moment.min.js"></script>
            <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
            <script src="lib/twentytwenty/jquery.event.move.js"></script>
            <script src="lib/twentytwenty/jquery.twentytwenty.js"></script>

            <!-- Template Javascript -->
            <script src="js/main.js"></script>

            <!-- JS libraries -->
            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <script src="../../../lib/wow/wow.min.js"></script>
            <script src="../../../libeasing/easing.min.js"></script>
            <script src="../../../libwaypoints/waypoints.min.js"></script>
            <script src="../../../libowlcarousel/owl.carousel.min.js"></script>
            <script src="../../../libtempusdominus/js/moment.min.js"></script>
            <script src="../../../libtempusdominus/js/moment-timezone.min.js"></script>
            <script src="../../../libtempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
            <script src="../../../libtwentytwenty/jquery.event.move.js"></script>
            <script src="../../../libtwentytwenty/jquery.twentytwenty.js"></script>

            <script src="../../../js/main.js"></script>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const statusFilter = document.getElementById('statusFilter');
                    const table = document.getElementById('employeeTableBody');
                    const rows = table.getElementsByTagName('tr');

                    statusFilter.addEventListener('change', function () {
                        const selectedStatus = statusFilter.value;
                        filterTable(selectedStatus);
                    });

                    function filterTable(status) {
                        for (let row of rows) {
                            const statusCell = row.cells[4]; // Assuming the status is in the 5th column (index 4)
                            const statusText = statusCell.textContent.trim().toLowerCase();

                            if (status === '' || statusText === status.toLowerCase()) {
                                row.style.display = '';
                            } else {
                                row.style.display = 'none';
                            }
                        }
                    }
                });
            </script>

            <script>
                const rowsPerPage = 8;
                let currentPage = 1;
                const table = document.getElementById("employeeTableBody");
                const rows = table.getElementsByTagName("tr");
                const totalRows = rows.length;
                const totalPages = Math.ceil(totalRows / rowsPerPage);

                function displayRows(page) {
                    const start = (page - 1) * rowsPerPage;
                    const end = start + rowsPerPage;

                    for (let i = 0; i < totalRows; i++) {
                        rows[i].style.display = (i >= start && i < end) ? "" : "none";
                    }
                }

                function updatePagination() {
                    const pagination = document.getElementById("pagination");
                    const prevPage = document.getElementById("prevPage");
                    const nextPage = document.getElementById("nextPage");

                    // Clear existing page numbers
                    while (pagination.children.length > 2) {
                        pagination.removeChild(pagination.children[1]);
                    }

                    // Add page numbers
                    for (let i = 1; i <= totalPages; i++) {
                        const li = document.createElement("li");
                        li.className = "page-item" + (i === currentPage ? " active" : "");
                        const a = document.createElement("a");
                        a.className = "page-link";
                        a.href = "javascript:void(0)";
                        a.textContent = i;
                        a.addEventListener("click", function () {
                            currentPage = i;
                            displayRows(currentPage);
                            updatePagination();
                        });
                        li.appendChild(a);
                        pagination.insertBefore(li, nextPage);
                    }

                    // Disable previous/next buttons if on first/last page
                    prevPage.classList.toggle("disabled", currentPage === 1);
                    nextPage.classList.toggle("disabled", currentPage === totalPages);
                }

                document.getElementById("prevPage").addEventListener("click", function () {
                    if (currentPage > 1) {
                        currentPage--;
                        displayRows(currentPage);
                        updatePagination();
                    }
                });

                document.getElementById("nextPage").addEventListener("click", function () {
                    if (currentPage < totalPages) {
                        currentPage++;
                        displayRows(currentPage);
                        updatePagination();
                    }
                });

                // Initialize the table
                displayRows(currentPage);
                updatePagination();
            </script>

            <script>
                $(document).ready(function () {
                    let examId;

                    $('.submit-button').click(function (event) {
                        event.preventDefault(); // Prevent the default button behavior
                        examId = $(this).data('id');

                        // Log the ID for debugging
                        console.log("Exam ID: " + examId);

                        // Set up the submit button inside the modal
                        if (examId) {
                            $('#confirmSubmitButton').off('click').on('click', function () {
                                window.location.href = 'SubmitExaminationResult?AppID=' + examId;
                            });
                        }
                    });
                });

            </script>

    </body>

</html>