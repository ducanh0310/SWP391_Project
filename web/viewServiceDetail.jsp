<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>DentCare - Dental Clinic</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

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

            .page-title{
                font-weight:500;
                font-size:26px;
                padding-left:20px;
            }
            body{

                background-color: #eee;
            }

            table th , table td{
                text-align: center;
            }

            table tr:nth-child(even){
                background-color: #e4e3e3
            }

            th {
                background: #333;
                color: #fff;
            }

            .pagination {
                margin: 0;
            }

            .pagination li:hover{
                cursor: pointer;
            }

            .header_wrap {
                padding:30px 0;
            }
            .num_rows {
                width: 20%;
                float:left;
            }
            .tb_search{
                width: 20%;
                float:right;
            }
            .pagination-container {
                width: 70%;
                float:left;
            }

            .rows_count {
                width: 20%;
                float:right;
                text-align:right;
                color: #999;
            }
            .table thead th {
                padding-top: 1rem;
                padding-bottom: 1rem;
                font-size: .675rem;
                font-weight: 500;
                text-transform: uppercase;
                letter-spacing: .025em;
                background-color: #6c757d;
                border-bottom-width: 1px;
                color: #e7eaf0;
                white-space: nowrap;
                vertical-align: middle;
            }
        </style>

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
                    <a href="index.jsp" class="navbar-brand p-0">
                        <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
                    </a>
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
                        <hr>
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

                <!-- Main -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <div class="card shadow border-0 mb-7">
                            <div class="container">
                                <div class="header_wrap">
                                    <div class="page-title">Service</div>

                                    <div class="container">
                                        <div class="header_wrap">
                                            <div class="num_rows">

                                                <div class="form-group"> 	<!--		Show Numbers Of Rows 		-->
                                                    <select class  ="form-control" name="state" id="maxRows">


                                                        <option value="10">10</option>
                                                        <option value="15">15</option>
                                                        <option value="20">20</option>
                                                        <option value="50">50</option>
                                                        <option value="70">70</option>
                                                        <option value="100">100</option>
                                                        <option value="5000">Show ALL Rows</option>
                                                    </select>

                                                </div>
                                            </div>
                                            <div class="tb_search">
                                                <input type="text" id="search_input_all" onkeyup="FilterkeyWord_all_table()" placeholder="Search.." class="form-control">
                                            </div>
                                        </div>
                                        <table class="table table-striped table-class" id= "table-id">


                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${servicesExist}" var="service">
                                                    <tr id="service${service.procedure_id}">
                                                        <td>${service.procedure_name}</td>
                                                        <td>${'$'}${service.price}</td>
                                                        <td class="text-end">
                                                            <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                                <i class="bi bi-pencil-square"></i>
                                                            </button>
                                                            <form action="deleteService" method="POST" style="display: inline-block;">
                                                                <input type="hidden" name="serviceID" value="${service.procedure_id}">
                                                                <button type="submit" class="btn btn-sm btn-square btn-neutral text-danger-hover" onclick="confirmDelete(${service.procedure_id})">
                                                                    <i class="bi bi-trash"></i>
                                                                </button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            <tbody>
                                        </table>

                                        <!--		Start Pagination -->
                                        <div class="pagination-container">
                                            <nav>
                                                <ul class="pagination"><li data-page="1" class="">								      
                                                        <span>1<span class="sr-only">(current)</span></span>	
                                                    </li><li data-page="2" class="active">			
                                                        <span>2<span class="sr-only">(current)</span></span>	
                                                    </li><li data-page="3">					
                                                        <span>3<span class="sr-only">(current)</span></span>	
                                                    </li><li data-page="4" class="">				
                                                        <span>4<span class="sr-only">(current)</span></span>	
                                                    </li><li data-page="5">					
                                                        <span>5<span class="sr-only">(current)</span></span>	
                                                    </li><li data-page="6">						
                                                        <span>6<span class="sr-only">(current)</span></span>		
                                                    </li><li data-page="7">						
                                                        <span>7<span class="sr-only">(current)</span></span>		
                                                    </li><li data-page="8">						
                                                        <span>8<span class="sr-only">(current)</span></span>		
                                                    </li><li data-page="9">						
                                                        <span>9<span class="sr-only">(current)</span></span>		
                                                    </li><li data-page="10">						
                                                        <span>10<span class="sr-only">(current)</span></span>		
                                                    </li></ul>
                                            </nav>

                                        </div>
                                        <div class="rows_count">Showing 11 to 20 of 91 entries</div>

                                    </div> <!-- 		End of Container -->




                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <!-- Back to
<script src="js/suggestions.js"></script>

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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script>
                        var mnu = document.getElementById("mnu");
                        var mstate = false;

                        function slideMenu() {
                            mstate = !mstate;
                            if (mstate) {
                                mnu.style.left = "0px";
                                mnu.style.boxShadow = "100px 0px 300px 0px rgba(0,0,0,0.3)";
                            } else {
                                mnu.style.left = "-250px";
                                mnu.style.boxShadow = "0px 0px 00px 0px rgba(0,0,0,0.0)";
                            }
                        }



                        getPagination('#table-id');
                        $('#maxRows').trigger('change');
                        function getPagination(table) {

                            $('#maxRows').on('change', function () {
                                $('.pagination').html('');						// reset pagination div
                                var trnum = 0;									// reset tr counter 
                                var maxRows = parseInt($(this).val());			// get Max Rows from select option

                                var totalRows = $(table + ' tbody tr').length;		// numbers of rows 
                                $(table + ' tr:gt(0)').each(function () {			// each TR in  table and not the header
                                    trnum++;									// Start Counter 
                                    if (trnum > maxRows) {						// if tr number gt maxRows

                                        $(this).hide();							// fade it out 
                                    }
                                    if (trnum <= maxRows) {
                                        $(this).show();
                                    }// else fade in Important in case if it ..
                                });											//  was fade out to fade it in 
                                if (totalRows > maxRows) {						// if tr total rows gt max rows option
                                    var pagenum = Math.ceil(totalRows / maxRows);	// ceil total(rows/maxrows) to get ..  
                                    //	numbers of pages 
                                    for (var i = 1; i <= pagenum; ) {			// for each page append pagination li 
                                        $('.pagination').append('<li data-page="' + i + '">\
                                                                      <span>' + i++ + '<span class="sr-only">(current)</span></span>\
                                                                    </li>').show();
                                    }											// end for i 


                                } 												// end if row count > max rows
                                $('.pagination li:first-child').addClass('active'); // add active class to the first li 


                                //SHOWING ROWS NUMBER OUT OF TOTAL DEFAULT
                                showig_rows_count(maxRows, 1, totalRows);
                                //SHOWING ROWS NUMBER OUT OF TOTAL DEFAULT

                                $('.pagination li').on('click', function (e) {		// on click each page
                                    e.preventDefault();
                                    var pageNum = $(this).attr('data-page');	// get it's number
                                    var trIndex = 0;							// reset tr counter
                                    $('.pagination li').removeClass('active');	// remove active class from all li 
                                    $(this).addClass('active');					// add active class to the clicked 


                                    //SHOWING ROWS NUMBER OUT OF TOTAL
                                    showig_rows_count(maxRows, pageNum, totalRows);
                                    //SHOWING ROWS NUMBER OUT OF TOTAL



                                    $(table + ' tr:gt(0)').each(function () {		// each tr in table not the header
                                        trIndex++;								// tr index counter 
                                        // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
                                        if (trIndex > (maxRows * pageNum) || trIndex <= ((maxRows * pageNum) - maxRows)) {
                                            $(this).hide();
                                        } else {
                                            $(this).show();
                                        } 				//else fade in 
                                    }); 										// end of for each tr in table
                                });										// end of on click pagination list
                            });
                            // end of on select change 

                            // END OF PAGINATION 

                        }




// SI SETTING
                        $(function () {
                            // Just to append id number for each row  
                            default_index();

                        });

//ROWS SHOWING FUNCTION
                        function showig_rows_count(maxRows, pageNum, totalRows) {
                            //Default rows showing
                            var end_index = maxRows * pageNum;
                            var start_index = ((maxRows * pageNum) - maxRows) + parseFloat(1);
                            var string = 'Showing ' + start_index + ' to ' + end_index + ' of ' + totalRows + ' entries';
                            $('.rows_count').html(string);
                        }

// CREATING INDEX
                        function default_index() {
                            $('table tr:eq(0)').prepend('<th> ID </th>')

                            var id = 0;

                            $('table tr:gt(0)').each(function () {
                                id++
                                $(this).prepend('<td>' + id + '</td>');
                            });
                        }

// All Table search script
                        function FilterkeyWord_all_table() {

// Count td if you want to search on all table instead of specific column

                            var count = $('.table').children('tbody').children('tr:first-child').children('td').length;

                            // Declare variables
                            var input, filter, table, tr, td, i;
                            input = document.getElementById("search_input_all");
                            var input_value = document.getElementById("search_input_all").value;
                            filter = input.value.toLowerCase();
                            if (input_value != '') {
                                table = document.getElementById("table-id");
                                tr = table.getElementsByTagName("tr");

                                // Loop through all table rows, and hide those who don't match the search query
                                for (i = 1; i < tr.length; i++) {

                                    var flag = 0;

                                    for (j = 0; j < count; j++) {
                                        td = tr[i].getElementsByTagName("td")[j];
                                        if (td) {

                                            var td_text = td.innerHTML;
                                            if (td.innerHTML.toLowerCase().indexOf(filter) > -1) {
                                                //var td_text = td.innerHTML;  
                                                //td.innerHTML = 'shaban';
                                                flag = 1;
                                            } else {
                                                //DO NOTHING
                                            }
                                        }
                                    }
                                    if (flag == 1) {
                                        tr[i].style.display = "";
                                    } else {
                                        tr[i].style.display = "none";
                                    }
                                }
                            } else {
                                //RESET TABLE
                                $('#maxRows').trigger('change');
                            }
                        }
                        function confirmDelete(serviceId) {
                            if (confirm("Are you sure you want to delete this service?")) {
                                // Proceed with the delete operation
                            } else {
                                // Cancel the delete operation
                                event.preventDefault();
                            }
                        }
        </script>
    </body>
</html>