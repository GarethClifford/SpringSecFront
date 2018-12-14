<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head></head>
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
    <h1>Welcome!</h1>



<security:authorize access="hasRole('ROLE_USER')">
    Add CV
    <form action="/action_page.php">
        <input type="file" name="">
        <input type="submit">
    </form>

    </security:authorize>
    <security:authorize access="hasRole('ROLE_ADMIN')">
        View Users
        <br/>
        <a href="<c:url value="/admin/adminpage.html" />">Admin Page</a>
        <br/>
    </security:authorize>

</body>
</html>
