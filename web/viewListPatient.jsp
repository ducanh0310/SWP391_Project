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

       
    </head>

    <body>
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
                    <!-- User menu (mobile) -->
                    <div class="navbar-user d-lg-none">
                        <!-- Dropdown -->
                        <div class="dropdown">
                            <!-- Toggle -->
                            <a href="#" id="sidebarAvatar" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="avatar-parent-child">
                                    <img alt="Image Placeholder" src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar- rounded-circle">
                                    <span class="avatar-child avatar-badge bg-success"></span>
                                </div>
                            </a>
                            <!-- Menu -->
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="sidebarAvatar">
                                <a href="#" class="dropdown-item">Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="#" class="dropdown-item">Billing</a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">Logout</a>
                            </div>
                        </div>
                    </div>
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
                                <a class="nav-link" href="#">
                                    <i class="bi bi-bar-chart"></i> Patient
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-chat"></i> Messages
                                    <span class="badge bg-soft-primary text-primary rounded-pill d-inline-flex align-items-center ms-auto">6</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-bookmarks"></i> Collections
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
                                <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                                    <!-- Title -->
                                    <h1 class="h2 mb-0 ls-tight">Application</h1>
                                </div>
                                <!-- Actions -->
                                <div class="col-sm-6 col-12 text-sm-end">
                                    <div class="mx-n1">
                                        <a href="#" class="btn d-inline-flex btn-sm btn-neutral border-base mx-1">
                                            <span class=" pe-2">
                                                <i class="bi bi-pencil"></i>
                                            </span>
                                            <span>Edit</span>
                                        </a>
                                        <a href="#" class="btn d-inline-flex btn-sm btn-primary mx-1">
                                            <span class=" pe-2">
                                                <i class="bi bi-plus"></i>
                                            </span>
                                            <span>Create</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Nav -->
                            <ul class="nav nav-tabs mt-4 overflow-x border-0">
                                <li class="nav-item ">
                                    <a href="#" class="nav-link active">All files</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link font-regular">Shared</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link font-regular">File requests</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </header>
                <!-- Main -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">                   
                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">Applications</h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-nowrap">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Company</th>
                                            <th scope="col">Offer</th>
                                            <th scope="col">Meeting</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Robert Fox
                                                </a>
                                            </td>
                                            <td>
                                                Feb 15, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-1.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Dribbble
                                                </a>
                                            </td>
                                            <td>
                                                $3.500
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-success"></i>Scheduled
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1610271340738-726e199f0258?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Darlene Robertson
                                                </a>
                                            </td>
                                            <td>
                                                Apr 15, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-2.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Netguru
                                                </a>
                                            </td>
                                            <td>
                                                $2.750
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-warning"></i>Postponed
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1610878722345-79c5eaf6a48c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Theresa Webb
                                                </a>
                                            </td>
                                            <td>
                                                Mar 20, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-3.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Figma
                                                </a>
                                            </td>
                                            <td>
                                                $4.200
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-success"></i>Scheduled
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1612422656768-d5e4ec31fac0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Kristin Watson
                                                </a>
                                            </td>
                                            <td>
                                                Feb 15, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-4.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Mailchimp
                                                </a>
                                            </td>
                                            <td>
                                                $3.500
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-dark"></i>Not discussed
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1608976328267-e673d3ec06ce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Cody Fisher
                                                </a>
                                            </td>
                                            <td>
                                                Apr 10, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-5.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Webpixels
                                                </a>
                                            </td>
                                            <td>
                                                $1.500
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-danger"></i>Canceled
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Robert Fox
                                                </a>
                                            </td>
                                            <td>
                                                Feb 15, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-1.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Dribbble
                                                </a>
                                            </td>
                                            <td>
                                                $3.500
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-success"></i>Scheduled
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1610271340738-726e199f0258?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Darlene Robertson
                                                </a>
                                            </td>
                                            <td>
                                                Apr 15, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-2.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Netguru
                                                </a>
                                            </td>
                                            <td>
                                                $2.750
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-warning"></i>Postponed
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1610878722345-79c5eaf6a48c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Theresa Webb
                                                </a>
                                            </td>
                                            <td>
                                                Mar 20, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-3.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Figma
                                                </a>
                                            </td>
                                            <td>
                                                $4.200
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-success"></i>Scheduled
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1612422656768-d5e4ec31fac0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Kristin Watson
                                                </a>
                                            </td>
                                            <td>
                                                Feb 15, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-4.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Mailchimp
                                                </a>
                                            </td>
                                            <td>
                                                $3.500
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-dark"></i>Not discussed
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="..." src="https://images.unsplash.com/photo-1608976328267-e673d3ec06ce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar-sm rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Cody Fisher
                                                </a>
                                            </td>
                                            <td>
                                                Apr 10, 2021
                                            </td>
                                            <td>
                                                <img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-5.png" class="avatar avatar-xs rounded-circle me-2">
                                                <a class="text-heading font-semibold" href="#">
                                                    Webpixels
                                                </a>
                                            </td>
                                            <td>
                                                $1.500
                                            </td>
                                            <td>
                                                <span class="badge badge-lg badge-dot">
                                                    <i class="bg-danger"></i>Canceled
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-neutral">View</a>
                                                <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer border-0 py-5">
                                <span class="text-muted text-sm">Showing 10 items out of 250 results found</span>
                            </div>
                        </div>
                    </div>
                </main>
            </div>

        <!-- JS File -->
        <script type="text/javascript" src="js/script.js"></script>





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
        <script src="js/main.js"></script>
    </body>

</html>