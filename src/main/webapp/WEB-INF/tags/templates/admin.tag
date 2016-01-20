<%@tag pageEncoding="UTF-8"%>
<%@attribute name="extraScripts" fragment="true"%>
<%@attribute name="extraStyles" fragment="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>Email manager</title>
  <%-- TODO create a way to update the page title --%>

  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- bootstrap -->
  <link rel="stylesheet" href="<c:url value='/assets/styles/main.css' />" />
  <link rel="stylesheet" href="<c:url value='/assets/styles/admin-template.css' />" />

  <!-- style -->
   <jsp:invoke fragment="extraStyles"/>
</head>

<body>

<div class="app-wrapper">

  <header class="app-header navbar" role="menu">
    <div class="navbar-header bg-dark">
      <button class="pull-right visible-xs dk" ui-toggle-class="show" target=".navbar-collapse">
        <i class="glyphicon glyphicon-cog"></i>
      </button>
      <button class="pull-right visible-xs" ui-toggle-class="off-screen" target=".app-aside" ui-scroll="app">
        <i class="glyphicon glyphicon-align-justify"></i>
      </button>

      <a href="/" class="navbar-brand">
        <i class="fa fa-btc"></i>
        <span class="hidden-folded m-l-xs">Email Admin</span>
      </a>
    </div>

    <!-- navbar collapse -->
    <div class="collapse pos-rlt navbar-collapse box-shadow bg-white-only">
      <!-- buttons -->
      <div class="nav navbar-nav hidden-xs">
        <a href="#" class="btn no-shadow navbar-btn" ui-toggle-class="app-aside-folded" target=".app">
          <i class="fa fa-dedent fa-fw text"></i>
          <i class="fa fa-indent fa-fw text-active"></i>
        </a>
        <a href="#" class="btn no-shadow navbar-btn" ui-toggle-class="show" target="#aside-user">
          <i class="icon-user fa-fw"></i>
        </a>
      </div>
      <!-- / buttons -->

    </div>
    <!-- / navbar collapse -->
  </header>

  <aside class="app-sidebar hidden-xs bg-dark">
    <ul class="nav nav-sidebar">

      <li class="header">Gerenciar e-mails</li>
      <li><a href="/emails/buscar">Buscar e-mails</a></li>
      <li><a href="">Novo e-mail</a></li>

      <li class="separator"></li>

      <li class="header">Gerenciar Grupos</li>
      <li><a href="">Buscar Grupos</a></li>
      <li><a href="">Novo Grupo</a></li>

      <li class="separator"></li>

      <li class="header">Gerenciar Apelidos</li>
      <li><a href="">Buscar Apelidos</a></li>

    </ul>
  </aside>

  <main class="app-content">
    <jsp:doBody />
  </main>

</div>



  <div class="hidden">
    <script src="<c:url value='/assets/js/plugins.min.js'/>"></script>
    <script src="<c:url value='/assets/js/scripts.min.js'/>"></script>
    <jsp:invoke fragment="extraScripts"/>
  </div>

</body>
</html>
