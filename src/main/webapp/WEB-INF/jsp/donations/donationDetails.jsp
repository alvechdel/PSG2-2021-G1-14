<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<petclinic:layout pageName="donationDetails">
	<h2>Detalles de la donaci&oacuten</h2>
	<table id="donationTable" class="table table-striped">
		<tr>
			<th>Cliente</th>
			<td><c:out value="${donation.author}"></c:out></td>
		<tr>
			<th>Mensaje</th>
			<td><c:out value="${donation.message}"></c:out></td>
		</tr>
		<tr>
			<th>Cantidad</th>
			<td><c:out value="${donation.amount}"></c:out></td>
		</tr>
		<tr>
			<th>Fecha de donaci&oacuten</th>
			<td><c:out value="${donation.donationDate}"></c:out></td>
		</tr>
	</table>
	<spring:url value="/causes/{causeId}" var="back">
        <spring:param name="causeId" value="${donation.cause.id}"/>
    </spring:url>
    <a href="${fn:escapeXml(back)}" class="btn btn-default">Atr&aacutes</a>
</petclinic:layout>