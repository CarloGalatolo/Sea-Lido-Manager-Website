<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="it.lidobalneare.db.DBConnect"%>
<%@ page import="it.lidobalneare.bean.Dish" %>
<%@ page import="it.lidobalneare.bean.OrderQuantity" %>
<jsp:useBean id="connecteduser" class="it.lidobalneare.bean.User" scope="session" />

<% 
try{
	if(!connecteduser.isCook()){
		response.sendRedirect("./errorpage.html");
		return;
	}
} catch (NullPointerException e){
	response.sendRedirect("login.html");
	return;
}
%>

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />

    <title>LidoBalneare</title>    
    
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/qrcode.min.js"></script>

    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Akronim" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Anonymous+Pro" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" />
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/menu-collapse-ultimate.css" />
    <link rel="stylesheet" href="assets/css/styles.css" />
</head>

<body>
	<%@include file="navRestaurant.html"%>
    <script>
    	document.getElementById("res_orders").classList.add("active");
    </script>
    
    <div id="qrcodescreen" class="alertscreen" style="display : none">
    	<span class="logindescription"> Table number: </span>
		<input id="tablein" class="lidoblockstyle" type="number" placeholder="Table number" />
		<button type="button" onclick='tableQr()'></button>
		<div class="qrcodecontainer" onclick="javascript:$('#qrcodescreen').fadeOut(500)">
			<div id="qrcode"></div>
		</div>
	</div>
	
    <div class="topDivBkg">
    	<span id="orders" style="padding-top: 80px;">Orders</span>
    	<button id="show_order_btn" class="btn btn-primary btn-lg" type="button" onclick='$("#qrcodescreen").fadeIn(500)'>Tables QR-code</button>
    </div>
    
    <div class="menuContainerDivKitchen">
    <%
    ArrayList<Integer> tables = new ArrayList<Integer>();
    
    try {
    	tables = DBConnect.getTables();
    } catch (Exception e) {
    	e.printStackTrace();
    }
    
    for (int i = 0; i < tables.size(); i++) { %>
        <div id='table<%= tables.get(i) %>' class="kitchenOrder">
        	<a class="btn kitchenOrderButton" data-toggle="collapse" aria-expanded="false" aria-controls="collapse-1" href="#collapse-1" role="button">Table <%= tables.get(i) %></a>   
            <div class="collapse" id="collapse-1">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="tableHeader" style="width: 70%;">Dish</th>
                                        <th>Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                            <%	ArrayList<OrderQuantity> o = new ArrayList<OrderQuantity>();
                                
                                try {
                                	o = DBConnect.getOrderQuantitiesByTable(tables.get(i));
                                } catch (Exception e) {
                                	e.printStackTrace();
                                }
                                
                                for (int j = 0; j < o.size(); j++) { %>
                                    <tr>
                                        <td><%= o.get(i).getDish() %></td>
                                        <td><%= o.get(i).getQuantity() %></td>
                                    </tr>
                            <%	} %>
                                </tbody>
                            </table>
                        </div>
                        
                    	<button class="btn completeOrderKitchenButton" type="button" onclick='$("table<%= tables.get(i) %>").html("")'>Complete order</button>
                    </div>
                </div>
            </div>
        </div>
	<%	} %>
	</div>

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/orders.js"></script>
</body>

</html>