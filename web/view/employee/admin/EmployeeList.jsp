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
        </style>

    </head>

    <body>
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
                                <a class="nav-link" href="">
                                    <i class="bi bi-people"></i></i> Employee
                                </a>
                            </li>
                        </ul>
                        </ul>
                        <!-- Divider -->
                        <hr class="navbar-divider my-5 opacity-20">
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
                                <a class="nav-link" href="#">
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
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Welcome, admin</h5>
                                <a href="AddEmployee" class="btn btn-primary btn-sm">Add New Employee</a>
                            </div>


                            <form method="get" action="SearchEmployeeServlet"
                                  class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for..."
                                           aria-label="Search" aria-describedby="basic-addon2" name="searchKey">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>

                            <div id="employeeTable" class="table-responsive">
                                <table class="table table-hover table-nowrap">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Employee ID</th>
                                            <th scope="col">Employee Name</th>
                                            <th scope="col">Employee Sin</th>
                                            <th scope="col">Employee Type</th>
                                            <th scope="col">Phone Number</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody  id="employeeTableBody">
                                        <c:forEach items="${EmployeeList}" var="emp">
                                            <c:if test="${emp.employeeType != 'I'}">
                                                <tr>
                                                    <td>${emp.id}</td>
                                                    <td>${emp.name}</td>
                                                    <td>${emp.employeeSin}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${emp.employeeType == 'r'}">Receptionist
                                                            </c:when>
                                                            <c:when test="${emp.employeeType == 'd'}">Doctor
                                                            </c:when>
                                                            <c:when test="${emp.employeeType == 'h'}">Nurse</c:when>
                                                            <c:when test="${emp.employeeType == 'b'}">Admin</c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>${emp.phoneNumber}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${emp.gender == 'M'}">Male</c:when>
                                                            <c:when test="${emp.gender == 'F'}">Female</c:when>
                                                            <c:otherwise>Other</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="text-end">
                                                        <form action="DeleteEmployee?employeeId=${emp.id}"
                                                              method="POST">
                                                            <a href="ViewEmployeeDetailsServlet?employeeId=${emp.id}"
                                                               class="btn btn-sm btn-neutral">View</a>
                                                            <button type="submit"
                                                                    class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                                <i class="bi bi-trash"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:if>
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
                const rowsPerPage = 10;
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

    </body>

</html>