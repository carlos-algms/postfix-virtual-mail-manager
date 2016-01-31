<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib tagdir="/WEB-INF/tags/templates/" prefix="template" %>

<template:admin>
  <div class="container-fluid">
    <form:form role="form" method="post" action="/domains/edit/${domain.getId()}" modelAttribute="Domain" >
      <fieldset class="panel panel-default">

        <header class="panel-heading">
          <i class="fa fa-globe"></i>
          Domínio
        </header>

        <main class="form-horizontal wrapper">

          <c:if test="${! empty message}">
            <p class="wrapper bg-success">
                ${message}
            </p>
          </c:if>

          <div class="form-group">
            <label class="control-label col-sm-3 col-md-2">Nome:</label>

            <div class="col-sm-9 col-md-6">
              <input name="name" class="form-control" placeholder="Digite o domínio completo" value="${domain.getName()}" type="text" />
              <form:errors path="name" cssClass="error bg-danger" />
            </div>
          </div>


          <div class="form-group">
            <label class="control-label col-sm-3 col-md-2">Ativo:</label>
            <div class="col-md-3">
              <div class="radio">
                <label>
                  <input type="radio" name="active" id="domainActive1" value="1" ${ domain.isActive() ? "checked" : "" } />
                  Sim
                </label>
                <label>
                  <input type="radio" name="active" id="domainActive2" value="0" ${ ! domain.isActive() ? "checked" : "" } />
                  Não
                </label>
              </div>
              <form:errors path="active" cssClass="error bg-danger" />
            </div>
          </div>
        </main>

        <footer class="panel-footer container-fluid form-horizontal">
          <div class="form-group">
            <label class="col-sm-3 col-md-2"></label>
            <div class="col-sm-5">
              <a href="/domains" class="btn btn-sm btn-warning">
                <i class="fa fa-arrow-left"></i>
                voltar
              </a>

              <button type="submit" class="btn btn-sm btn-success">
                <i class="fa fa-save"></i>
                Gravar
              </button>
            </div>
          </div>
        </footer>

      </fieldset>
    </form:form>

  </div>
</template:admin>

