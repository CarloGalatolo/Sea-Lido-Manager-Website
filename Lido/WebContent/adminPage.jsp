<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean id="user" class="it.lidobalneare.bean.User" />

<% 
	//it.lidobalneare.bean.User banana = (it.lidobalneare.bean.User) session.getAttribute("user");
	System.out.println("JSP:" + user.getEmail());
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    
    <title>LidoBalneare</title>
    
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Akronim">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Anonymous+Pro">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/menu-collapse-ultimate.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div class="alertscreen">
        <div class="alertwindow">
        	<span class="lidoalerttitle">Alert screen title!</span>
            <hr class="lidohr">
            <span class="logindescription">This is an accurate description of the error, or whatever you should know. 
            	Yeah, maybe something went wrong, so check your last steps and do each step with more attention</span>
            <div class="btn-group lidobtngroup" role="group">
            	<button class="btn btn-primary lidobtnofbtngroup" type="button">Yes</button>
            	<button class="btn btn-primary lidobtnofbtngroup" type="button">No</button>
            </div>
        </div>
    </div>
    
    <div class="divcontainer">
        <nav class="navbar navbar-light navbar-expand-md lidonavbar">
            <div class="container-fluid">
            	<a class="navbar-brand" href="#">Lido Logo</a>
            	<button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1">
	            	<span class="sr-only">Toggle navigation</span>
	            	<span class="navbar-toggler-icon"></span>
            	</button>
            	
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#" style="background-color: white;border-radius: 5px;">Administration panel</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">Lido layout editor</a></li>
                        <li class="nav-item" role="presentation"></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">Communications</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="contentscreen">
        	<span class="toptitle">Administration panel</span>
        	<span class="logindescription" style="background-color: rgb(220,220,220);">If you want to manage your lido, you are in the right place.</span>
            <div class="contentdivscreen">
                <div class="table-responsive table-borderless">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Age</th>
                                <th>Birthday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>name1.surname.@server.com</td>
                                <td>Andrea</td>
                                <td>Vaiuso</td>
                                <td>25</td>
                                <td>5/04/1995</td>
                            </tr>
                            <tr class="tablerowselected">
                                <td>name2.surname.@server.com</td>
                                <td>Carlo</td>
                                <td>Galatolo</td>
                                <td>24</td>
                                <td>13/04/1996</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <nav>
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">�</span></a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">�</span></a></li>
                    </ul>
                </nav>
            </div>
            <hr>
            <div class="buttoncontainer"><button class="btn btn-primary" type="button">See subscription informations</button><button class="btn btn-primary" type="button">Check prenotations</button></div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>