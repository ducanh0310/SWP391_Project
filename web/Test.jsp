<%-- 
    Document   : Test
    Created on : Jul 15, 2024, 5:31:32?AM
    Author     : Gia Huy
--%>  

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DentCare - Dental Clinic</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <link href="https://ajax.googleapis.com/ajax/libs/angular_material/0.11.2/angular-material.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,400italic" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-animate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-aria.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-messages.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angular_material/0.11.2/angular-material.min.js"></script>
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
        <style>
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
            /*LESS Vars*/
            @transition: .25s cubic-bezier(.25,.8,.25, 1);

            /*Styles for user profile panel*/
            .user {
                position: relative;
                transition: @transition;
            }
            .user-avatar {
                border-radius: 50%;
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }
            .user-avatar-edit {
                position: absolute;
                top: 50%;
                left: 50%;
                background-color: rgba(0,0,0,.54) !important;
                opacity: 0;
                transition: opacity @transition;
                md-icon {
                    color: rgba(255,255,255,.87);
                }
            }
            .user-avatar:hover {
                transition: @transition;
            }
            .user-avatar-edit:hover,
            .user-avatar:hover + .user-avatar-edit {
                opacity: 1;
            }
            .user-name {
                font-size: 24px;
            }
            .user-title {
                color: rgba(0,0,0,.38);
                font-weight: 500;
                margin-top: 0;
            }
            .user-input-container {
                box-sizing: border-box;
                width: 100%;
            }
            .user-name,
            .user-title {
                background-image: none !important;
                &.md-input[disabled] {
                    color: rgba(0,0,0,.87);
                }
            }
            @media (max-width: 599px) {
                .user {
                    padding-right: 0;
                    margin-bottom: 16px;
                }
                .user-avatar {
                    width: 120px;
                    height: 120px;
                    margin-right: 16px;
                }
                .user-avatar-edit {
                    top: 36px;
                    left: 30px;
                }
                .md-toolbar-tools > md-menu {
                    padding: 0;
                }
            }
            @media (max-width: 959px) and (min-width: 600px) {
                .user {
                    padding-right: 24px;
                }
                .user-avatar {
                    width: 200px;
                    height: 200px;
                    margin-bottom: 16px;
                }
                .user-avatar-edit {
                    top: 76px;
                    left: 70px;
                }
                .user-input-container {
                    padding-left: 8px;
                    width: 200px;
                }
            }
            @media (min-width: 960px) {
                .user {
                    padding-right: 24px;
                }
                .user-avatar {
                    width: 260px;
                    height: 260px;
                }
                .user-avatar-edit {
                    top: 106px;
                    left: 100px;
                }
                .user-input-container {
                    width: 250px;
                    text-overflow: ellipsis;
                    padding-left: 24px;
                }
            }

            // Scaffolding
            body {
                background: #f2f2f2;
                padding: 16px;
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
                    <a href="index.jsp" class="navbar-brand p-0">
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
                                <a class="nav-link" href="PatientController">
                                    <i class="bi bi-list-task"></i> Patient
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="serviceDetail">
                                    <i class="bi bi-person-lines-fill"></i> Service
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Test.jsp">
                                    <i class="bi bi-clipboard-check"></i> Profile
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
                                    <i class="bi bi-gear-fill"></i> Setting
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
                        <div class="mt-auto"></div>
                        <!-- User (md) -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">
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
                <!-- Header -->
                <header class="bg-surface-primary border-bottom pt-6">
                    <div class="container-fluid">
                        <div class="mb-npx">
                            <div class="row align-items-center">
                                <div ng-app="userProfile" ng-controller="Ctrl">
                                    <md-card>
                                        <md-toolbar>
                                            <div class="md-toolbar-tools">
                                                <h2>
                                                    <span>OVERVIEW</span>
                                                </h2>
                                                <span flex></span>
                                                <md-button class="md-icon-button" ng-if="viewMode" ng-click="switchMode()">
                                                    <md-tooltip>
                                                        Edit Profile
                                                    </md-tooltip>
                                                    <md-icon>mode_edit</md-icon>
                                                </md-button>
                                                <md-button class="md-icon-button" ng-if="!viewMode" ng-click="switchMode(); saveChanges()">
                                                    <md-tooltip>
                                                        Save Changes
                                                    </md-tooltip>
                                                    <md-icon>save</md-icon>
                                                </md-button>
                                                <md-menu>
                                                    <md-button class="md-icon-button" ng-click="$mdOpenMenu($event)">
                                                        <md-tooltip>
                                                            More Options
                                                        </md-tooltip>
                                                        <md-icon>more_vert</md-icon>
                                                    </md-button>
                                                    <md-menu-content>
                                                        <md-menu-item>
                                                            <md-button ng-click="deleteUser()">
                                                                <md-icon>delete</md-icon>
                                                                Delete User
                                                            </md-button>
                                                        </md-menu-item>
                                                        <md-menu-item>
                                                            <md-button ng-click="resetPassword()">
                                                                <md-icon>replay</md-icon>
                                                                Reset Password
                                                            </md-button>
                                                        </md-menu-item>
                                                    </md-menu-content>
                                                </md-menu>
                                            </div>
                                        </md-toolbar>
                                       <md-card-content layout-sm="column" layout-gt-sm="row">
    <div class="user" layout-sm layout-gt-sm="column">
        <img src="https://lh3.googleusercontent.com/-W2XryVdi-lA/U6tSAh3SsbI/AAAAAAAAFGY/ZHJiUEcR_Zs/w480-h480/avatar%2Bmaterial%2Bdesign.png" alt="user avatar" class="user-avatar" />
        <md-button class="md-icon-button user-avatar-edit" ng-click="browserAvatar()">
            <md-icon>photo_camera</md-icon>
        </md-button>
        <form name="userBasicInfoForm" layout="column" layout-align="start" layout-align-sm="center start" flex>
            <md-input-container class="user-input-container">
                <label>Full Name</label>
                <textarea name="fullName" required ng-minlength="2" ng-maxlength="50" ng-model="user.fullName" ng-disabled="viewMode" flex></textarea>
                <div ng-messages="userBasicInfoForm.fullName.$error">
                    <div ng-message="required">Name cannot be empty</div>
                    <div ng-message="minlength">Full name must be between 2 and 50 characters</div>
                    <div ng-message="maxlength">Full name must be between 2 and 50 characters</div>
                </div>
            </md-input-container>
            <md-input-container class="user-input-container">
                <label>Email</label>
                <input name="email" type="email" required ng-model="user.email" ng-disabled="viewMode"></input>
                <div ng-messages="userBasicInfoForm.email.$error">
                    <div ng-message="required">Email cannot be empty</div>
                    <div ng-message="email">Invalid email format</div>
                </div>
            </md-input-container>
        </form>
    </div>
    <form name="userDetailsForm" flex>
        <div layout="column" layout-gt-sm="row">
            <md-input-container flex>
                <label>Gender</label>
                <input required name="gender" ng-model="user.gender" ng-disabled="viewMode" ng-pattern="/^(Male|Female)$/"></input>
                <div ng-messages="userDetailsForm.gender.$error">
                    <div ng-message="required">Please select Male or Female</div>
                    <div ng-message="pattern">Please select Male or Female</div>
                </div>
            </md-input-container>
            <md-input-container flex>
                <label>Address</label>
                <textarea name="address" required ng-model="user.address" ng-disabled="viewMode"></textarea>
                <div ng-messages="userDetailsForm.address.$error">
                    <div ng-message="required">Address cannot be empty</div>
                </div>
            </md-input-container>
             <md-input-container flex>
                <label>Role</label>
                <textarea name="role" required ng-model="user.role" ng-disabled="viewMode"></textarea>
                <div ng-messages="userDetailsForm.role.$error">
                    <div ng-message="required">Role cannot be empty</div>
                </div>
            </md-input-container>
        </div>
        <div layout="column" layout-gt-sm="row">
            <md-input-container flex>
                <label>Phone Number</label>
                <input type="tel" name="phoneNumber" required ng-model="user.phoneNumber" ng-disabled="viewMode" ng-pattern="/^\d{10}$/"></input>
                <div ng-messages="userDetailsForm.phoneNumber.$error">
                    <div ng-message="required">Phone number cannot be empty</div>
                    <div ng-message="pattern">Phone number must be exactly 10 digits</div>
                </div>
            </md-input-container>
            <md-input-container flex>
                <label>Medicine Code</label>
                <input name="medicineCode" required ng-model="user.medicineCode" ng-disabled="viewMode"></input>
                <div ng-messages="userDetailsForm.medicineCode.$error">
                    <div ng-message="required">Medicine code cannot be empty</div>
                </div>
            </md-input-container>
        </div>
        <div layout="column" layout-gt-sm="row">
            <md-input-container flex>
                <label>Date Of Birth</label>
                <input type="date" name="dateOfBirth" required ng-model="user.dateOfBirth" ng-disabled="viewMode" ng-change="validateDateOfBirth()"></input>
                <div ng-messages="userDetailsForm.dateOfBirth.$error">
                    <div ng-message="required">Date of birth cannot be empty</div>
                    <div ng-message="invalidDate">Your date of birth must be in the past and you must be at least 18 years old</div>
                </div>
            </md-input-container>
            <md-input-container flex>
                <label>Salary</label>
                <input name="salary" required ng-model="user.salary" ng-disabled="viewMode" ng-pattern="/^\d+$/"></input>
                <div ng-messages="userDetailsForm.salary.$error">
                    <div ng-message="required">Salary cannot be empty</div>
                    <div ng-message="pattern">Salary must be a number without special characters</div>
                </div>
            </md-input-container>
        </div>
        <md-input-container>
            <label>Working Branch</label>
            <input name="workingBranch" required ng-model="user.workingBranch" ng-disabled="viewMode"></input>
            <div ng-messages="userDetailsForm.workingBranch.$error">
                <div ng-message="required">Working branch cannot be empty</div>
            </div>
        </md-input-container>
    </form>
</md-card-content>


                                    </md-card>
                                </div>
                            </div>
                        </div>
                    </div>                       
            </div>
        </main>
    </div>
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
    <script >
            angular.module('userProfile', ['ngMaterial', 'ngMessages'])
    .controller('Ctrl', function ($scope) {
        $scope.viewMode = true;

        // Switch between view mode and edit mode
        $scope.switchMode = function () {
            $scope.viewMode = !$scope.viewMode;
        };

        // Save the changes
        $scope.saveChanges = function () {
            // Validate and save the changes
            if (!$scope.user.fullName || !$scope.user.email || !$scope.user.gender || !$scope.user.address || !$scope.user.phoneNumber || !$scope.user.medicineCode || !$scope.user.dateOfBirth|| !$scope.user.role || !$scope.user.salary || !$scope.user.workingBranch) {
                alert('Please fill out all required fields.');
                return;
            }
            
            // Save logic here
            alert('Changes saved successfully!');
            $scope.viewMode = true;
        };

        // Validate date of birth
        $scope.validateDateOfBirth = function () {
            const today = new Date();
            const birthDate = new Date($scope.user.dateOfBirth);
            const age = today.getFullYear() - birthDate.getFullYear();
            const m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }
            $scope.userDetailsForm.dateOfBirth.$setValidity('invalidDate', age >= 18);
        };

        // Sample user data
        $scope.user = {
            fullName: 'Adam Luxor',
            email: 'adam.luxor@companyname.com',
            gender: 'Male',
            address: '123 Main St, Atlanta, GA',
            role:'Doctor',
            phoneNumber: '4045551212',
            medicineCode: 'MED123',
            dateOfBirth: '1990-05-15',
            salary: '80000',
            workingBranch: 'Product',
            mobilePhone: '4045556789',
            otherEmail: 'adaml@someothercompany.com'
        };
    });

    </script>
</body>

</html>