<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>
<!doctype html>
<html>
    <head>
        <title>Say Hello</title>
    </head>

    <a href="test">Test Controller</a>
    <body>
        <h1>Hey, Welcome</h1>
        <h2>${customMessage}</h2>

        <form action="customMessage" method="post">
            <button type="submit" class="btn btn-primary btn-lg signupbtn">Get Custom Message</button>
        </form>
    </body>

</html>