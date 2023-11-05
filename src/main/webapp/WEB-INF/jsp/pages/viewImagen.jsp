<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>Images guardadas</h2>
<ul>
    <c:forEach var="img" items="${images}">
        <li>
            <img src="<%=request.getContextPath()%>/images/${img.name}" width="50" height="50" />
        </li>
    </c:forEach>
</ul>