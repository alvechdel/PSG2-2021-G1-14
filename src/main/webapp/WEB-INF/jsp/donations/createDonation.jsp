<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<petclinic:layout pageName="donations">
		<h2>Nueva Donaci&oacuten</h2>
		<form:form modelAttribute="donation" class="form-horizontal" id="form-donation">		
			<div class="form-group has-feedback">	
            	<petclinic:inputField label="Mensaje"  name="message"/>
        				<label class="col-sm-2 control-label" style="padding-right:25px;" for="amount">Cantidad</label>
        				<div class="col-sm-10">
        					<input type="number" name="amount" value="${donation.amount}" step=".01" min="0" style="margin-left:-10px;" >
							<input type="hidden" name="causeId" value="${donation.cause.id}"/>
           		</div>		
            </div>
           <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button class="btn btn-default" type="submit">Crear donaci&oacuten</button>
                    <spring:url value="/causes" var="causeUrl">
                    </spring:url>
                    <a class="btn btn-default" href="${fn:escapeXml(causeUrl)}">Atr&aacutes</a>
                </div>
           </div>
        </form:form>



</petclinic:layout>