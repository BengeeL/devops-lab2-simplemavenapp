<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:formatDate value="<%=new java.util.Date()%>" pattern="HH" var="hour" />

<html>
<body>
<c:choose>
    <c:when test="${hour >= 12 && hour < 17}">
        Good afternoon, YOUR_NAME, Welcome to COMP367
    </c:when>
    <c:otherwise>
        Good morning, YOUR_NAME, Welcome to COMP367
    </c:otherwise>
</c:choose>
</body>
</html>