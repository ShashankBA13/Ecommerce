<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <!-- Add Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <!-- Your user list table will be displayed here -->
        <h1 style="text-align:center;">User List</h1><br>
        <table class="table" style="text-align:center;">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <!-- Add more columns as needed -->
                </tr>
            </thead>
            <tbody>
                <!-- User data will be displayed here dynamically -->
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <!-- Add more columns as needed -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Add Bootstrap JS and Popper.js CDN (required for Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
