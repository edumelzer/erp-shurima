<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Shurima ERP"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body id="ng-app" ng-app="${pageProperty(name: 'body.ng-app') ?: 'grails'}">

  <!-- Conteudo que chegava do Grails XD
  <div class="container-fluid">

      <div class="row">
          <div class="col-md-12">

              <div class="animate-view" ng-view></div>
              <g:layoutBody/>
          </div>
      </div>
  </div>
  -->
<asset:script type="text/javascript">
    angular.module('grails.constants')
        .constant('rootUrl', '${request.contextPath}')
        .constant('pageSize', ${grailsApplication.config.angular.pageSize})
        .constant('dateFormat', '${grailsApplication.config.angular.dateFormat}');
</asset:script>

<asset:javascript src="application.js"/>
<asset:deferredScripts/>
<g:pageProperty name="page.scripts" default=""/>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link uri="/" class="navbar-brand">ERP Shurima</g:link>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> Perfil do Usuário</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Configurações</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Sair</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="https://github.com/edumelzer/erp-shurima"><i class="fa fa-github"></i> Github
                </a></li>
            </ul>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Pesquisar...">
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="transacao"><i class="fa fa-bar-chart-o fa-fw"></i> Transações <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="transacao">Contas a Pagar</a>
                            </li>
                            <li>
                                <a href="transacao">Contas a Receber</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="empresa"><i class="fa fa-edit fa-fw"></i> Cadastro de Empresas</a>
                    </li>
                    <li>
                        <a href="item"><i class="fa fa-edit fa-fw"></i> Cadastro de Produtos</a>
                    </li>
                    <li>
                        <a href="usuario"><i class="fa fa-wrench fa-fw"></i> Gerenciar Usuários</a>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <div id="page-wrapper">
      <div class="row">
          <div class="col-md-12">

              <div class="animate-view" ng-view></div>
              <g:layoutBody/>
          </div>
      </div>
      <!-- Conteudo que chegava do Grails XD
      <div class="container-fluid">

          <div class="row">
              <div class="col-md-12">

                  <div class="animate-view" ng-view></div>
                  <g:layoutBody/>
              </div>
          </div>
      </div>
      -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

</body>
</html>
