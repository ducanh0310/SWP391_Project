<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link href="view/payment/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="view/payment/assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="view/payment/assets/jquery-1.11.3.min.js"></script>
    </head>

    <body>

         <div class="container">
           <div class="header clearfix">

                <h3 class="text-muted">VNPAY</h3>
            </div>
            <h3>Create a new order</h3>
            <div class="table-responsive">
                <form action="vnpayajax" id="frmCreateOrder" method="post">  
                    <input type="hidden" name="bookingId" value="<%= request.getParameter("id") %>" />
                    <div class="form-group">
                        <label for="amount">Amount</label>
                        <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" name="amount" type="text" value="1250000" readonly="" />
                    </div>
                     <h4>Choose a payment method</h4>
                    <div class="form-group">
                        <h5>Option 1: Switch to VNPAY Portal and select a payment method</h5>
                       <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                       <label for="bankCode">VNPAYQR payment gateway</label><br>
                       
                       <h5>Option 2: Split the method at the site of the connecting unit</h5>
                       <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                       <label for="bankCode">Pay with the application that supports VNPAYQR</label><br>
                       
                       <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                       <label for="bankCode">Payment via ATM card/Local Account</label><br>
                       
                       <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                       <label for="bankCode">International card payments</label><br>
                       
                    </div>
                    <div class="form-group">
                        <h5>Select the language of the payment interface:</h5>
                        <input type="radio" id="language" Checked="True" name="language" value="en">
                         <label for="language">English</label><br>
                         <input type="radio" id="language"  name="language" value="vn">
                         <label for="language">Vietnamese</label><br>
                         
                         
                    </div>
                    <button type="submit" class="btn btn-default" href>Pay</button>
                </form>
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>
          
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>