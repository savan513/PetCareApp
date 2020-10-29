<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Take Date</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
	.well-block {
    background-color: #fff;
    border: 1px solid #e9e6e8;
    padding: 40px;
}

.well-title {
    margin-bottom: 40px;
}
</style>
</head>
<body>
<%
response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
if(session.getAttribute("UserId")==null)
{
    response.sendRedirect("index.jsp");
}
String D_Name=request.getParameter("DName");
String H_Name=request.getParameter("HName");
request.setAttribute("D_Name", D_Name);
String Did= request.getParameter("Did");
request.setAttribute("D_Id", Did);


Cookie c[]=request.getCookies();
String  Hid=null;
for(int i=1;i<c.length;i++)
{
	Cookie co=c[i];
	Hid= co.getValue();
	
}
request.setAttribute("H_Name", H_Name);

request.setAttribute("H_Id", Hid);
%>

 <div class="container">
            <div class="row" style="margin-top:10px;">
                <div class="col-md-6">
                    <div class="well-block" style="background-color:cyan;">
                        <div class="well-title">
                            <h2>Book an Appointment</h2>
                        </div>
                        <form method="POST" action="Appointment">
                            <!-- Form start -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="name">Name</label>
                                        <input id="name" name="name" type="text" placeholder="Name" class="form-control input-md">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="name">Pet Type</label>
                                        <input id="name" name="Pt" type="text" placeholder="Name" class="form-control input-md">
                                    </div>
                                </div>
                                <input type="hidden" value="${D_Id }" name="Did">
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Email</label>
                                        <input id="email" name="email" type="email" placeholder="E-Mail" class="form-control input-md">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Mobile No</label>
                                        <input id="Mb" name="Mb" type="text" placeholder="Mobile No" class="form-control input-md">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="name">Hospital Name</label>
                                        <input id="name" name="Hname" type="text" value="${H_Name}" placeholder="Hospital Name" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Doctor Name</label>
                                        <input id="email" name="Dname" type="text" value="${D_Name}" placeholder="Doctor Name" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="date">Preferred Date</label>
                                        <input name="date" type="text" id="dateinput" placeholder="Preferred Date" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="time">Preferred Time</label>
                                        <select id="time" name="time" class="form-control">
                                            <option value="8:00 to 9:00">8:00 to 9:00</option>
                                            <option value="9:00 to 10:00">9:00 to 10:00</option>
                                            <option value="10:00 to 1:00">10:00 to 1:00</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label" for="appointmentfor">Appointment For</label>
                                        <select id="appointmentfor" name="appointmentfor" class="form-control">
                                            <option value="Check Up">Check Up</option>
                                            <option value="Operation">Operation</option>
                                            <option value="Other">Other</option>
                                           
                                        </select>
                                    </div>
                                </div>
                                <!-- Button -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input  type="submit" class="btn btn-primary" value="Make An Appointment">
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- form end -->
                    </div>
                </div>
                
            </div>
        </div>
        
<script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" > 
    </script> 
<link href= 
'https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'
          rel='stylesheet'> 
      
    <script src= 
"https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" > 
    </script> 
<script>
$( "#dateinput" ).datepicker({ 
	 dateFormat: 'dd-mm-yy'
}); 
</script>
</body>
</html>