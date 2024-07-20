<%-- 
    Document   : patient
    Created on : May 20, 2024, 8:55:58 PM
    Author     : Vu Minh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <!-- Libraries Stylesheet -->
        <link href="../../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../../lib/animate/animate.min.css" rel="stylesheet">
        <link href="../../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="../../lib/twentytwenty/twentytwenty.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../../css/style.css" rel="stylesheet">

        <style>
            body {
                /*background: rgb(99, 39, 120)*/
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

            .profile_button{
                margin: 5px;
                width: 85%;
            }

            .container-box {
                margin-bottom: 120px; /* Khoảng cách giữa các box dưới cùng */
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Điều chỉnh giá trị để thay đổi độ đậm nhạt của box shadow */
            }



            .certification-item {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ced4da;
                border-radius: 5px;
                background-color: #fff;
                width: 100%;
            }

            .certification-item a {
                flex-grow: 1;
                margin-right: 10px;
                color: #495057;
                text-decoration: none;
            }

            .certification-item button {
                background-color: #06A3DA;
                border: none;
                padding: 5px 10px;
                color: #fff;
                cursor: pointer;
                border-radius: 5px;
            }

            .certification-item button:hover {
                background-color: #06A3DA;
            }

            .link-as-input {
                display: inline-block;
                padding: .375rem .75rem;
                margin-bottom: 0;
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #495057;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #ced4da;
                border-radius: .25rem;
                transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            }

            .rounded-circle {
                border-radius: 50% !important;
                width: 150px; /* Đảm bảo rằng width và height có giá trị bằng nhau */
                height: 150px; /* Đảm bảo rằng width và height có giá trị bằng nhau */
                object-fit: cover; /* Đảm bảo hình ảnh được cắt gọn vừa với hình tròn */
            }

        </style>
    </head>
    <body>


        <!-- Topbar Start -->
        <div class="container-fluid bg-light ps-5 pe-0 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <small class="py-2"><i class="fa fa-map-marker-alt text-primary me-2"></i>${emInfo.branch.city}</small>
                    </div>
                </div>
                <div class="col-md-6 text-center text-lg-end">
                    <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                        <div class="me-3 pe-3 border-end py-2">
                            <c:if test="${emInfo.employeeType == 'r'}"> <p class="m-0"></i>Receptionist</p></c:if>
                            <c:if test="${emInfo.employeeType == 'd'}"> <p class="m-0"></i>Doctor</p></c:if>
                            <c:if test="${emInfo.employeeType == 'h'}"> <p class="m-0"></i>Nurse</p></c:if>
                            <c:if test="${emInfo.employeeType == 'b'}"> <p class="m-0"></i>Branch Manager</p></c:if>
                            <c:if test="${emInfo.employeeType == null}"> <p class="m-0"></i>Patient</p></c:if>
                            </div>
                            <div class="py-2">
                                <p class="m-0" ><a href="" style="color: #ffffff">${username}</a></p>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->
        <!-- Navbar End -->
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
                                <a class="nav-link" href="#">
                                    <i class="bi bi-clock"></i> Appointment
                                </a>
                            </li>
                        </ul>
                        <!-- Divider -->
                        <hr class="navbar-divider my-5 opacity-20">
                        <!-- Navigation -->

                        <!-- Push content down -->
                        <hr>
                        <!-- User (md) -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-person-square"></i> Account
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../../logout">
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
                            <div class="card-header">
                                <h5 class="mb-0">Welcome, ${username}</h5>
                            </div>
                            <div class="row justify-content-center " >
                                <div class="col-md-3 container-box">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <div class="profile-pic-wrapper" id="uploadImageButton">

                                            <img class="rounded-circle mt-5 profile-pic"  src="${image != null ? image : '../../img/profile/no_image_profile.png'}" id="profile-pic" name="profile-pic" alt="personal image">
                                            <i class="fa fa-camera camera-icon"></i>
                                        </div>

                                        <!-- Modal -->
                                        <div class="modal fade" id="uploadModal" tabindex="-1" aria-labelledby="uploadModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="uploadModalLabel">Upload Image Link</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form id="imageForm" action="../../uploadimage" method="POST">
                                                            <div class="mb-3">
                                                                <label for="imageUrl" class="form-label">Image URL</label>
                                                                <input type="text" class="form-control" id="imageUrl" name="imageUrl" required>
                                                                <input type="text" id="errorURL" readonly="" style="color: red">
                                                            </div>
                                                            <button type="submit" class="btn btn-primary">Submit</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <span class="font-weight-bold">${username}</span>
                                        <span class="text-black-50">${paInfo.email}</span>
                                        <br>
                                        <!--<a href="" class="btn btn-primary py-2 px-4 ms-3 profile_button">Medical appointment history</a>-->
                                        <a href="" class="btn btn-primary py-2 px-4 ms-3 profile_button">Change password</a>

                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-5 container-box">
                                    <form action="edit" method="POST">
                                        <div class="p-3 py-5">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h4 class="text-right">My account</h4>
                                            </div>
                                            <hr>
                                            <form action="edit" method="POST">
                                                <input type="hidden" id="id" name="id" value="${paInfo.patientId}">
                                                <div class="row mt-3">
                                                    <div class="col-md-6">
                                                        <label class="labels">Fullname</label>
                                                        <input type="text" id="fullname" name="fullname" class="form-control" placeholder="" value="${paInfo.name}" >
                                                        <c:if test="${not empty errorMsg.fullname}">
                                                            <span style="color:red">${errorMsg.fullname}</span>
                                                        </c:if>
                                                    </div>        
                                                    <div class="col-md-6">
                                                        <label class="labels">Phone Number</label>
                                                        <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="" value="${paInfo.phoneNumber}">
                                                        <c:if test="${not empty errorMsg.phoneNumber}">
                                                            <span style="color:red">${errorMsg.phoneNumber}</span>
                                                        </c:if>
                                                    </div>
                                                </div>

                                                <div class="row mt-3">
                                                    <div class="col-md-6">
                                                        <label class="labels">Email</label>
                                                        <input type="text" id="email" name="email" class="form-control" placeholder="" value="${paInfo.email}">
                                                        <c:if test="${not empty errorMsg.email}">
                                                            <span style="color:red">${errorMsg.email}</span>
                                                        </c:if>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="labels">Medicine code</label>
                                                        <input type="text" id="medicineCode" name="medicineCode" class="form-control" placeholder=" " value="${paInfo.patientSin}">
                                                        <c:if test="${not empty errorMsg.medicalCode}">
                                                            <span style="color:red">${errorMsg.medicalCode}</span>
                                                        </c:if>
                                                    </div>
                                                </div>

                                                <div class="row mt-3">
                                                    <div class="col-md-6">
                                                        <label class="labels" for="gender">Gender</label>
                                                        <select class="form-select" id="gender" name="gender">
                                                            <option value="M" <c:if test="${paInfo.gender == 'M'}">selected</c:if>>Male</option>
                                                            <option value="F" <c:if test="${paInfo.gender == 'F'}">selected</c:if>>Female</option>
                                                            <option value="X" <c:if test="${paInfo.gender == 'X'}">selected</c:if>>Other</option>
                                                            </select>
                                                        </div>                    

                                                        <div class="col-md-6">
                                                            <label class="labels" >Date of birth</label>
                                                            <input type="date" id="dob" name="dob" class="form-control" placeholder="" value="${paInfo.dob}">
                                                        <c:if test="${not empty errorMsg.dob}">
                                                            <span style="color:red">${errorMsg.dob}</span>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <br>
                                                <div>
                                                    <label class="labels">Address</label>
                                                    <input type="text" id="address" name="address" class="form-control" placeholder="" value="${paInfo.address}">
                                                    <c:if test="${not empty errorMsg.address}">
                                                        <span style="color:red">${errorMsg.address}</span>
                                                    </c:if>
                                                </div>

                                                <div class="mt-5 text-center"><button class="btn btn-primary py-2 px-4 ms-3" type="submit">Save Profile</button></div>
                                            </form>


                                        </div>
                                    </form>
                                </div>  




                            </div>            

                        </div>
                    </div>
                </main>
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

        <script>

            // Show modal when clicking the upload image button
            document.getElementById('uploadImageButton').addEventListener('click', function () {
                $('#uploadModal').modal('show');
            });

// Handle form submission with AJAX
            document.getElementById('imageForm').addEventListener('submit', function (event) {
                event.preventDefault(); // Prevent traditional form submission

                var element = $(this);

                $.ajax({
                    url: '../../uploadimage',
                    type: 'POST',
                    data: element.serializeArray(), // serializes the form data.
                    dataType: 'json',
                    success: function (response) {
                        if (response.success) {
                            $('#uploadModal').modal('hide'); // Hide modal
                            // alert('Image uploaded successfully');
                            document.getElementById('profile-pic').src = response.imageUrl; // Update image
                            document.getElementById('errorURL').value = ''; // Clear error message
                        } else {
                            //alert('Message: ' + response.message);
                            //$('#urlErrorModal').show();
                            document.getElementById('errorURL').value = response.message;

                        }
                    },
                    error: function (xhr, status, error) {
                        var responseText = xhr.responseText;
                        try {
                            var jsonResponse = JSON.parse(responseText);
                            alert('An error occurred: ' + jsonResponse.message);
                        } catch (e) {
                            alert('An error occurred: ' + responseText);

                        }
                    }
                });
            });





        </script>
    </body>
</html>