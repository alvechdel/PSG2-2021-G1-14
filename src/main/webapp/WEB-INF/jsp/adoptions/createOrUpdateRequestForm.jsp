<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<petclinic:layout pageName="adoptions">
    <jsp:attribute name="customScript">
        <script>
            $(function () {
                $("#date").datepicker({dateFormat: 'yy/mm/dd'});
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <h2>Nuevo Solicitud</h2>

        <b>Mascota</b>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Fecha de nacimiento</th>
                <th>Tipo</th>
                <th>Propietario</th>
            </tr>
            </thead>
            <tr>
                <td><c:out value="${request.pet.name}"/></td>
                <td><petclinic:localDate date="${request.pet.birthDate}" pattern="yyyy/MM/dd"/></td>
                <td><c:out value="${request.pet.type.name}"/></td>
                <td><c:out value="${request.pet.owner.firstName} ${visit.pet.owner.lastName}"/></td>
            </tr>
        </table>

        <form:form modelAttribute="request" class="form-horizontal">
            <div class="form-group has-feedback">
                <petclinic:inputField label="Comentario" name="comment"/>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="hidden" name="pet" value="${request.pet.id}"/>
                    <input type="hidden" name="owner" value="${request.owner.id}">
                    <button class="btn btn-default" type="submit">A&ntildeadir petici&oacuten</button>
                </div>
            </div>

        </form:form>
    </jsp:body>     
</petclinic:layout>