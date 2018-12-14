<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
</head>
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #EA6F6F;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #8D1A67;
  color: white;
}
</style>
</head>
<body>

<div class="topnav">
  <a class="active" href="<c:url value="/homepage.html" />">Home</a>
  <a href="<c:url value="/admin/adminpage.html" />">Admin </a>
  <a href="<c:url value="/perform_logout" />">Logout</a>
</div>

<body>
    <h1>DOES THIS SHIT WORK</h1>

    This page is only visible to an admin

    <script>

    var HttpClient = function() {
    this.get = function(aUrl, aCallback) {
    var anHttpRequest = new XMLHttpRequest();
    anHttpRequest.onreadystatechange = function() {
    if (anHttpRequest.readyState == 4 && anHttpRequest.status == 200)
    aCallback(anHttpRequest.responseText);
    }
    anHttpRequest.open( "GET", aUrl, true );
    anHttpRequest.send( null );
    }
    }
    var theurl='http://localhost:8084/admin/get/1';
    var client = new HttpClient();
    client.get(theurl, function(response) {
    var response1 = JSON.parse(response);
    // alert(response);
    document.getElementById("username").innerHTML = response1.username.value;
    document.getElementById("password").innerHTML = response1.password.value;
    document.getElementById("firstName").innerHTML = response1.firstName.value;
    document.getElementById("lastName").innerHTML = response1.lastName.value;
    });

    </script>

    <script>
    register = function() {
         var xhr = new XMLHttpRequest();
         var url = "localhost:8084/admin/create/1";
         xhr.open("POST", url, true);
         xhr.setRequestHeader("Content-Type", "application/json");
         xhr.onreadystatechange = function () {
         if (xhr.readyState === 4 && xhr.status === 200) {
           console.log(xhr.responseText);
         }
         };
         var username = document.getElementById('username').value;
         var password = document.getElementById('password').value;
         var data = JSON.stringify({
           "usernameIN":username,
           "passwordIN":password,
           "enabled":true,
           "role":"ROLE_ADMIN"
         });
         xhr.send(data);
         document.getElementById('username').value="";
         document.getElementById('password').value="";
       }

       function() {
         document.getElementById('userTable').bootstrapTable({
           var data;
           axios.get('http://localhost:8081/users/getall').then((response)=> {
             data=response.data
           });
         })

       }
    </script>
    <form>
           <div className="radio">
             <label>
               <input id="isAdmin" type="radio" value="Admin" name="rank"/>
               Admin
             </label>
             <label>
               <input type="radio" value="Trainer" name="rank" checked={true}/>
               Trainer
             </label>
           </div><br/>
           <input id="usernameIN" placeholder="username"/>
           <input id="passwordIN" placeholder="password"/>
           <input id="firstnameIN" placeholder="firstName"/>
           <input id="lastnameIN" placeholder="lastName"/>
           <input id="emailIN" placeholder="email"/>
           <br/>
           <button onClick="register()" >Create</button>
    </form>

     <table className='bootstrap' id='userTable' data-height='460' >
       <thread>
         <tr>
           <th data-field='username'>Username</th>
           <th data-field='firstName'>First name</th>
           <th data-field='lastName'>Last name</th>
           <th data-field='email'>Email</th>
         </tr>
       </thread>
     </table>

    <br/>

</body>
</html>
