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
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

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
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">

        <!-- CSS File -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <!-- comment -->
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
                            <c:if test="${emInfo.employeeType == ''}"> <p class="m-0"></i>Patient</p></c:if>
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
                        <ul class="navbar-nav">
                               <li class="nav-item">
                                    <a class="nav-link" href="appointment/viewAppointmentHistory">
                                        <i class="bi bi-clock"></i> Appointment
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="PatientController">
                                        <i class="bi bi-list-task"></i> Patient
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ViewEmployeeList">
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
                            <div class="card-header">
                                <h5 class="mb-0">Welcome, doctor</h5>
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
                                                            <div class="mb-3" style="">
                                                                <label for="imageUrl" class="form-label">Image URL</label>
                                                                <input type="text" class="form-control" id="imageUrl" name="imageUrl" required>
                                                            </div>
                                                            <button type="submit" class="btn btn-primary">Submit</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <span class="font-weight-bold">${username}</span>
                                        <span class="text-black-50">${emInfo.email}</span>
                                        <br>
                                        <a href="" class="btn btn-primary py-2 px-4 ms-3 profile_button">Employee account</a>
                                        <!--<a href="" class="btn btn-primary py-2 px-4 ms-3 profile_button">Medical appointment history</a>-->
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-5 container-box">
                                    <form action="UpdateEmployee" method="POST">
                                        <div class="p-3 py-5">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h4 class="text-right">Employee account</h4>
                                            </div>
                                            <hr>
                                            <div class="row mt-3">
                                                <input type="hidden" name="id" id="id" value="${emInfo.id}">
                                                <div class="col-md-6">
                                                    <label class="labels">Fullname</label>
                                                    <input type="text" id="fullname" name="fullname" class="form-control" placeholder="" value="${emInfo.name}" >
                                                    <c:if test="${not empty errorMsg.fullname}">
                                                        <span style="color:red">${errorMsg.fullname}</span>
                                                    </c:if>
                                                </div>        
                                                <div class="col-md-6">
                                                    <label class="labels">Phone Number</label>
                                                    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="" value="${emInfo.phoneNumber}">
                                                    <c:if test="${not empty errorMsg.phoneNumber}">
                                                        <span style="color:red">${errorMsg.phoneNumber}</span>
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <label class="labels">Email</label>
                                                    <input type="text" id="email" name="email" class="form-control" placeholder="" value="${emInfo.email}">
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="labels">Medicine code</label>
                                                    <input type="text" id="medicineCode" name="medicineCode" class="form-control" placeholder=" " value="${emInfo.employeeSin}">
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
                                                        <label class="labels">Date of birth</label>
                                                        <input type="date" id="dob" name="dob" class="form-control" placeholder="" value="${emInfo.dob}">
                                                    <c:if test="${not empty errorMsg.dob}">
                                                        <span style="color:red">${errorMsg.dob}</span>
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <label class="labels">Role</label>
                                                    <input type="text"  class="form-control" placeholder=""
                                                           <c:if test="${emInfo.employeeType == 'r'}">value="Receptionist"</c:if>
                                                           <c:if test="${emInfo.employeeType == 'd'}">value="Doctor"</c:if>
                                                           <c:if test="${emInfo.employeeType == 'h'}">value="Nurse"</c:if>
                                                           <c:if test="${emInfo.employeeType == 'b'}">value="Branch Manage"</c:if>
                                                               >
                                                           <input type="hidden" id="role" name="role" value="${emInfo.employeeType}">
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="labels">Salary / year</label>
                                                    <input type="text" id="salary" name="salary" class="form-control" placeholder="" value="${emInfo.annualSalary}" >
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <label class="labels">Address</label>
                                                    <input type="text" id="address" name="address" class="form-control" placeholder="" value="${emInfo.address}" >
                                                    <c:if test="${not empty errorMsg.address}">
                                                        <span style="color:red">${errorMsg.address}</span>
                                                    </c:if>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="labels">Working Branch</label>
                                                    <input type="hidden" id="branchid" name="branchid" class="form-control" placeholder="" value="${emInfo.branchId}">
                                                    <input type="text" id="branch" name="branch" class="form-control" placeholder="" value="${emInfo.branch.city}">
                                                </div>
                                            </div>

                                            <br>
                                            <label class="labels">Certification</label>
                                            <div id="certificateContainer">
                                                <c:forEach items="${requestScope.arrayCerti}" var="cer">
                                                    <div class="row mt-3">
                                                        <input type="hidden" name="idCer"value="${cer.id}">
                                                        <div class="col-md-6">

                                                            <label class="labels">Name</label>
                                                            <input type="text" id="imageName" name="imageName" class="form-control" placeholder="" value="${cer.name}" >
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="labels">URL</label>

                                                            <input type="text" id="imageLink" name="imageLink" class="form-control" placeholder="" value="${cer.url}">
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <c:if test="${not empty errorMsg.link}">
                                                    <span style="color:red">${errorMsg.link}</span>
                                                </c:if>
                                            </div>
                                            <br>
                                            <button type="button" class="btn btn-secondary" onclick="addCertificateForm()">Add Certificate</button>

                                            <!-- Button to add new certification fields -->
                                            <!--                        <button id="addCertButton" class="btn btn-secondary mt-3">Add Certification</button>-->
                                            <input type="hidden" name="eId" id="eId" value="<%=request.getParameter("eId")%>">
                                            <div class="mt-5 text-center"><button class="btn btn-primary py-2 px-4 ms-3" type="submit">Save Profile</button></div>

                                        </div>
                                    </form>
                                </div>  




                            </div>            
                        </div>
                    </div>
                </main>
            </div>
        </div>


        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>

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
                                                function addCertificateForm() {
                                                    const certificateContainer = document.getElementById('certificateContainer');
                                                    const newCertificateForm = `
                <div class="row mt-3 certificate-row">
                    <input type="hidden" name="idCer" value="">
                    <div class="col-md-5">
                        <label class="labels">Name</label>
                        <input type="text" id="imageName" name="imageName" class="form-control" placeholder="" value="">
                    </div>
                    <div class="col-md-5">
                        <label class="labels">URL</label>
                        <input type="text" id="imageLink" name="imageLink" class="form-control" placeholder="" value="">
                    </div>
        <div class="col-md-2">
                    <label class="labels">&nbsp;</label>
                    <button type="button" class="btn btn-danger form-control" onclick="deleteCertificateRow(this)">Delete</button>
                </div>
                </div>`;
                                                    certificateContainer.insertAdjacentHTML('beforeend', newCertificateForm);
                                                }
                                                function deleteCertificateRow(button) {
                                                    const row = button.closest('.certificate-row');
                                                    if (row) {
                                                        row.remove();
                                                    }
                                                }
        </script>

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
                            //alert('Image uploaded successfully');
                            document.getElementById('profile-pic').src = response.imageUrl; // Update image
                        } else {
                            //alert('Message: ' + response.message);
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