<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DentCare - Dental Clinic</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="../../img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="../../lib/twentytwenty/twentytwenty.css" rel="stylesheet" />
    <!-- BoxIcons v2.1.2 -->
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">

    <!-- Roboto Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">

    <style>
        
        .m-0 {
            margin-left: 30px !important;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #BA68C8
        }

        .profile-button {
            background: rgb(99, 39, 120);
            box-shadow: none;
            border: none
        }

        .profile-button:hover {
            background: #682773
        }

        .profile-button:focus {
            background: #682773;
            box-shadow: none
        }

        .profile-button:active {
            background: #682773;
            box-shadow: none
        }

        .back:hover {
            color: #682773;
            cursor: pointer
        }

        .labels {
            font-size: 11px
        }

        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8
        }

        .profile_button {
            margin: 5px;
            width: 85%;
        }

        .container-box {
            margin-bottom: 120px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .imageProfile {
            margin-bottom: 400px;
        }

        .container-box .p-3.py-5 {
            padding: 1rem;
        }
        
                     .rounded-circle {
            border-radius: 50% !important;
            width: 150px; /* ??m b?o r?ng width và height có giá tr? b?ng nhau */
            height: 150px; /* ??m b?o r?ng width và height có giá tr? b?ng nhau */
            object-fit: cover; /* ??m b?o hình ?nh ???c c?t g?n v?a v?i hình tròn */
        }
    </style>
</head>

<body>
    <!-- Dashboard -->
    <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
        <!-- Vertical Navbar -->
        <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
            <div class="container-fluid">
                <!-- Toggler -->
                <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Brand -->
                <a href="index.html" class="navbar-brand p-0">
                    <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="sidebarCollapse">
                    <!-- Navigation -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="admin.jsp">
                                <i class="bi bi-house"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="viewListPatient.jsp">
                                <i class="bi bi-list-task"></i> Patient
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-clipboard-check"></i> Treatment
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-clock"></i> Appointment
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-exclamation-square-fill"></i> Report
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-lock-fill"></i> Change Password
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-people"></i> Users
                            </a>
                        </li>
                    </ul>
                    <!-- Divider -->
                    <hr class="navbar-divider my-5 opacity-20">
                    <!-- Navigation -->
                    <!-- Push content down -->
                    <hr style="border: 1px solid black">
                    <!-- User (md) -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-person-square"></i> Account
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout">
                                <i class="bi bi-box-arrow-left"></i> Logout
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="confirmpass">
                                <i class="bi bi-box-arrow-left"></i> Change password
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Main content -->
        <div class="h-screen flex-grow-1 overflow-y-lg-auto">
            <header class="border-bottom ">
                <div class="row gx-0">
                    <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <small class="py-2"><i class="fa fa-map-marker-alt text-primary me-2"></i>${emInfo.branch.city}</small>
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-lg-end">
                        <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                            <div class="me-3 pe-3 border-end py-2">
                                <c:if test="${emInfo.employeeType=='r'}">
                                    <p class="m-0">Receptionist</p>
                                </c:if>
                                <c:if test="${emInfo.employeeType=='d'}">
                                    <p class="m-0">Doctor</p>
                                </c:if>
                                <c:if test="${emInfo.employeeType=='h'}">
                                    <p class="m-0">Nurse</p>
                                </c:if>
                                <c:if test="${emInfo.employeeType=='b'}">
                                    <p class="m-0">Branch Manager</p>
                                </c:if>
                            </div>
                            <div class="py-2">
                                <p class="m-0"><a href="" style="color: #ffffff">${username}</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Profile -->
            <div class="row justify-content-center" style="background-color: white;">
                <div style="margin-top: 50px;"></div>
                <div class="col-md-3 container-box imageProfile">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <img class="rounded-circle mt-5 profile-pic"  src="${image != null ? image : '../../img/profile/no_image_profile.png'}" id="profile-pic" name="profile-pic" alt="personal image">

                        <br>
                        <span class="font-weight-bold">${username}</span>
                        <span class="text-black-50">${emInfo.email}</span>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5 container-box">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">My account</h4>
                        </div>
                        <hr>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label class="labels">Fullname</label>
                                <input type="text" id="fullname" name="fullname" class="form-control" placeholder="" value="${emInfo.name}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Phone Number</label>
                                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="" value="${emInfo.phoneNumber}" readonly>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label class="labels">Email</label>
                                <input type="text" id="email" name="email" class="form-control" placeholder="" value="${emInfo.email}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Medicine code</label>
                                <input type="text" id="medicineCode" name="medicineCode" class="form-control" placeholder=" " value="${emInfo.employeeSin}" readonly>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label class="labels" for="gender">Gender</label>
                                <input type="text" id="gender" name="gender" class="form-control" readonly placeholder="" 
                                       <c:if test="${emInfo.gender == 'M'}"> value="Male" </c:if>
                                       <c:if test="${emInfo.gender == 'F'}"> value="Female" </c:if>
                                       <c:if test="${emInfo.gender == 'O'}"> value="Other" </c:if>
                                       >
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Date of birth</label>
                                <input type="text" id="dob" name="dob" class="form-control" placeholder="" value="${emInfo.dob}" readonly>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label class="labels">Role</label>
                                <input type="text" id="role" name="role" class="form-control" placeholder="" readonly
                                       <c:if test="${emInfo.employeeType == 'r'}">value="Receptionist"</c:if>
                                       <c:if test="${emInfo.employeeType == 'd'}">value="Doctor"</c:if>
                                       <c:if test="${emInfo.employeeType == 'h'}">value="Nurse"</c:if>
                                       <c:if test="${emInfo.employeeType == 'b'}">value="Branch Manager"</c:if>
                                       >
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Salary / year</label>
                                <input type="text" id="salary" name="salary" class="form-control" placeholder="" value="${emInfo.annualSalary}" readonly>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label class="labels">Address</label>
                                <input type="text" id="address" name="address" class="form-control" placeholder="" value="${emInfo.address}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Working Branch</label>
                                <input type="text" id="branch" name="branch" class="form-control" placeholder="" value="${emInfo.branch.city}" readonly>
                            </div>
                        </div>

                        <div class="mt-5 text-center">
                            <a href="edit" class="btn btn-primary py-2 px-4 ms-3">Edit Profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../../lib/wow/wow.min.js"></script>
        <script src="../../lib/easing/easing.min.js"></script>
        <script src="../../lib/waypoints/waypoints.min.js"></script>
        <script src="../../lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="../../lib/tempusdominus/js/moment.min.js"></script>
        <script src="../../lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="../../lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="../../lib/twentytwenty/jquery.event.move.js"></script>
        <script src="../../lib/twentytwenty/jquery.twentytwenty.js"></script>

        <!-- Template Javascript -->
        <script src="../../js/main.js"></script>
    </body>
</html>
