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
        <link href="../../img/favicon.ico" rel="icon">

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
            
            .profile-pic-wrapper {
            position: relative;
            display: inline-block;
        }

        .profile-pic {
            display: block;
        }

        .camera-icon {
            position: absolute;
            bottom: 0;
            right: 25px;
            background: #fff;
            border-radius: 50%;
            padding: 5px;
            cursor: pointer;
        }

        .hidden-input {
            display: none;
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
                        </div>
<!--                        <div class="me-3 pe-3 border-end py-2">
                            <p class="m-0"><i class="fa fa-phone-alt me-2"></i>+012 345 6789</p>
                        </div>-->
                        <div class="py-2">
                            <p class="m-0" ><a href="" style="color: #ffffff">${username}</a></p>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->
        
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm px-5 py-3 py-lg-0">
            <a href="index.html" class="navbar-brand p-0">
                <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                
                <div class="navbar-nav ms-auto py-0">
                    <div class="nav-item nav-link"></div>                     
                </div>
                <a href="" class="btn btn-primary py-2 px-4 ms-3">Logout</a>
                
            </div>
        </nav>
    <!-- Navbar End -->
    
    
    <div class="container-fluid bg-primary py-5 hero-header mb-5">
        <div class="row py-3">
            <div class="col-12 text-center">
                <h1 class="display-3 text-white animated zoomIn">Personal information</h1>
                
            </div>
        </div>
    </div>
    
    <!--profile-->
    
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
                <a href="" class="btn btn-primary py-2 px-4 ms-3 profile_button">My account</a>
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
                    <div class="row mt-3">
                        <input type="hidden" name="id" id="id" value="${emInfo.id}">
                        <div class="col-md-6">
                            <label class="labels">Fullname</label>
                            <input type="text" id="fullname" name="fullname" class="form-control" placeholder="" value="${emInfo.name}" >
                        </div>        
                        <div class="col-md-6">
                            <label class="labels">Phone Number</label>
                            <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="" value="${emInfo.phoneNumber}">
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label class="labels">Email</label>
                            <input type="text" id="email" name="email" class="form-control" placeholder="" value="${emInfo.email}" readonly="">
                        </div>
                        <div class="col-md-6">
                            <label class="labels">Medicine code</label>
                            <input type="text" id="medicineCode" name="medicineCode" class="form-control" placeholder=" " value="${emInfo.employeeSin}">
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
                            <input type="text" id="dob" name="dob" class="form-control" placeholder="" value="${emInfo.dob}">
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label class="labels">Role</label>
                            <input type="text"  class="form-control" placeholder=""  readonly=""
                               <c:if test="${emInfo.employeeType == 'r'}">value="Receptionist"</c:if>
                               <c:if test="${emInfo.employeeType == 'd'}">value="Doctor"</c:if>
                               <c:if test="${emInfo.employeeType == 'h'}">value="Nurse"</c:if>
                               <c:if test="${emInfo.employeeType == 'b'}">value="Branch Manage"</c:if>
                               >
                            <input type="hidden" id="role" name="role" value="${emInfo.employeeType}">
                        </div>
                        <div class="col-md-6">
                            <label class="labels">Salary / year</label>
                            <input type="text" id="salary" name="salary" class="form-control" placeholder="" value="${emInfo.annualSalary}" readonly="">
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label class="labels">Address</label>
                            <input type="text" id="address" name="address" class="form-control" placeholder="" value="${emInfo.address}" >
                        </div>
                        <div class="col-md-6">
                            <label class="labels">Working Branch</label>
                            <input type="hidden" id="branchid" name="branchid" class="form-control" placeholder="" value="${emInfo.branchId}">
                            <input type="text" id="branch" name="branch" class="form-control" placeholder="" value="${emInfo.branch.city}" readonly="">
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
                        </div>
                        <br>
                        <button type="button" class="btn btn-secondary" onclick="addCertificateForm()">Add Certificate</button>
                        
                        <!-- Button to add new certification fields -->
<!--                        <button id="addCertButton" class="btn btn-secondary mt-3">Add Certification</button>-->

                    <div class="mt-5 text-center"><button class="btn btn-primary py-2 px-4 ms-3" type="submit">Save Profile</button></div>

                   </div>
            </form>
        </div>    
        
    </div>


    
    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light py-5 wow fadeInUp" data-wow-delay="0.3s" style="margin-top: -75px;">
        <div class="container pt-5">
            <div class="row g-5 pt-4">
                <div class="col-lg-3 col-md-6">
                    <a href="index.html" class="navbar-brand p-0">
                        <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <p class="mb-2"><i class="bi bi-geo-alt text-primary me-2"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="bi bi-envelope-open text-primary me-2"></i>info@example.com</p>
                    <p class="mb-0"><i class="bi bi-telephone text-primary me-2"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Popular Links</h3>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                        <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Follow Us</h3>
                    <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="https://www.facebook.com/groups/490263423665224" target="_blank"><i class="fab fa-facebook-f fw-normal"></i></a>
                    <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                    <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href="#"><i class="fab fa-instagram fw-normal"></i></a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Payment</h3>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


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
        function addCertificateForm() {
            const certificateContainer = document.getElementById('certificateContainer');
            const newCertificateForm = `
                <div class="row mt-3">
                    <input type="hidden" name="idCer" value="">
                    <div class="col-md-6">
                        <label class="labels">Name</label>
                        <input type="text" id="imageName" name="imageName" class="form-control" placeholder="" value="">
                    </div>
                    <div class="col-md-6">
                        <label class="labels">URL</label>
                        <input type="text" id="imageLink" name="imageLink" class="form-control" placeholder="" value="">
                    </div>
                </div>`;
            certificateContainer.insertAdjacentHTML('beforeend', newCertificateForm);
        }
    </script>
    
        <script>
        
 // Show modal when clicking the upload image button
document.getElementById('uploadImageButton').addEventListener('click', function() {
    $('#uploadModal').modal('show');
});

// Handle form submission with AJAX
document.getElementById('imageForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent traditional form submission

    var element = $(this);

    $.ajax({
        url: '../../uploadimage',
        type: 'POST',
        data:element.serializeArray(),// serializes the form data.
        dataType:'json',
        success: function(response) {
            if (response.success) {
                $('#uploadModal').modal('hide'); // Hide modal
                alert('Image uploaded successfully');
                document.getElementById('profile-pic').src = response.imageUrl; // Update image
            } else {
                alert('Message: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
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
