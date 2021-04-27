<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


<petclinic:layout pageName="causes">
    <h2>Causas</h2>
    <spring:url value="/causes" var="causeUrl">
    	</spring:url>
	<a class="btn btn-default" href="${fn:escapeXml(causeUrl)}">Activas</a>
    
    <table id="causeTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">Nombre</th>
            <th style="width: 120px">Financiaci&oacute;n recaudada</th>
            <th style="width: 120px">Objetivo</th>
            <th style="width: 120px">Acciones</th>    
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${causes}" var="cause">
            <tr>
                <td>
                    <c:out value="${cause.name}"/>
                </td>
                <td>
                    <c:set var="total" value="${0}"/>
                    <c:forEach items="${cause.donations}" var="donation">
                        <c:set var="total" value="${total + donation.amount}"/> 
                    </c:forEach>
                    <c:out value="${total}"/>

                </td>
                <td>
                    <c:out value="${cause.budget}"/>
                </td>
                
				<td>
				<spring:url value="/causes/{causeId}" var="detailsCause">
                        <spring:param name="causeId" value="${cause.id}"/>
                    </spring:url>
                    <a class="btn btn-default"  href="${fn:escapeXml(detailsCause)}">Detalles</a>
                    <p>&nbsp;</p>
                    <spring:url value="/causes/{causeId}/newDonation" var="donationUrl">
                        <spring:param name="causeId" value="${cause.id}"/>
                    </spring:url>
                    <a class="btn btn-default"  href="${fn:escapeXml(donationUrl)}">Donar para esta causa</a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
    <spring:url value="/causes/new" var="newCause">
    	</spring:url>
	<a class="btn btn-default" href="${fn:escapeXml(newCause)}">Nueva Causa</a>
</petclinic:layout>