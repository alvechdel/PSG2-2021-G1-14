<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="owners">
    <jsp:attribute name="customScript">
        <script>
            $(function () {
                $("#startDate").datepicker({dateFormat: 'yy/mm/dd'});
                $("#endDate").datepicker({dateFormat: 'yy/mm/dd'});
            });
        </script>
    </jsp:attribute>
    <jsp:body>
       <h2><c:if test="${book['new']}">Nueva </c:if>Reserva</h2>

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
                <td><c:out value="${book.pet.name}"/></td>
                <td><petclinic:localDate date="${book.pet.birthDate}" pattern="yyyy/MM/dd"/></td>
                <td><c:out value="${book.pet.type.name}"/></td>
                <td><c:out value="${book.pet.owner.firstName} ${book.pet.owner.lastName}"/></td>
            </tr>
        </table> 

        <form:form modelAttribute="book" class="form-horizontal">
            <div class="form-group has-feedback">
                <petclinic:inputField label="Fecha de inicio" name="startDate"/>
                <petclinic:inputField label="Fecha fin" name="endDate"/>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="hidden" name="petId" value="${book.pet.id}"/>
                    <button class="btn btn-default" type="submit">A&ntildeadir reserva</button>
                </div>
            </div>
        </form:form>

        <br/>
        <b>Reservas anteriores</b>
        <table class="table table-striped">
            <tr>
                <th>Fecha de inicio</th>
                <th>Fecha fin</th>
            </tr>
            <c:forEach var="book" items="${book.pet.books}">
                <c:if test="${!book['new']}">
                    <tr>
                        <td><petclinic:localDate date="${book.startDate}" pattern="yyyy/MM/dd"/></td>
                        <td><petclinic:localDate date="${book.endDate}" pattern="yyyy/MM/dd"/></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </jsp:body>

</petclinic:layout>