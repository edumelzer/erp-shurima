<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="pt_BR">
  <head>
    <meta charset="UTF-8">
    <title>ShurimaERP 2 | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">


    <!-- Bootstrap 3.3.4 -->
    <!--<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />-->
    <!-- Font Awesome Icons -->
    <!--<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />-->
    <!-- Ionicons -->
    <!--<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />-->

    <!-- Theme style -->
    <asset:stylesheet src="application2.css"/>
    <!--<link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />-->
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <!--<link href="dist/css/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />-->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->
  <!--<body class="skin-blue sidebar-mini">-->
  <body class="skin-blue sidebar-mini" id="ng-app" ng-app="${pageProperty(name: 'body.ng-app') ?: 'grails'}">

    <!-- Conteudo que chegava do Grails XD
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12">

                <div class="animate-view" ng-view></div>
                <grailsx:layoutBody/>
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

    <div class="wrapper">

      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="index.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>S</b>hr</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Shurima</b>ERP</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Habilitar navegação</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->

              <!-- Notifications Menu -->

              <!-- Tasks Menu -->

              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#/" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
                  <img src="${resource(dir: 'images', file: 'nasus.jpg')}" class="user-image" alt="User Image" />
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs">Nasus - O Curador das Areias</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- The user image in the menu -->
                  <li class="user-header">
                    <!--<img src="images/nasus.jpg" class="img-circle" alt="User Image" />-->
                    <img src="${resource(dir: 'images', file: 'nasus.jpg')}" class="img-circle" alt="User Image" />
                    <p>
                      Nasus - O Curador das Areias
                      <small>O ciclo da vida e da morte continua...</br>
                        Nós viveremos. Eles morrerão.
                      </small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <!--
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
                -->
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <!--<div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>-->
                    <div class="pull-right">

                      <sec:ifLoggedIn>
                      <g:link uri="/logout#/" class="btn btn-default btn-flat">Sair</g:link>
                      </sec:ifLoggedIn>

                      <sec:ifNotLoggedIn>
                      <g:link uri="/login#/" class="btn btn-default btn-flat">Login</g:link>
                      </sec:ifNotLoggedIn>
                      <!--<a href="#/" class="btn btn-default btn-flat">Sign out</a>-->

                    </div>

                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <!--
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
              -->
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- Sidebar user panel (optional) -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="${resource(dir: 'images', file: 'nasus.jpg')}" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>Nasus Curador das Areias</p>
              <!-- Status -->
              <sec:ifLoggedIn>
                <a href="#/"><i class="fa fa-circle text-success"></i> Logado</a>
              </sec:ifLoggedIn>

              <sec:ifNotLoggedIn>
                <a href="#/"><i class="fa fa-circle text-failure"></i> Deslogado</a>
              </sec:ifNotLoggedIn>
            </div>
          </div>

          <!-- search form (Optional) -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Procurar..." />
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header">MENU</li>
            <!-- Optionally, you can add icons to the links -->
            <!-- Dashboard -->
            <!-- <g:link uri="/index"><i class="fa fa-dashboard fa-fw"></i> Dashboard</g:link> -->
            <li class="active">
              <g:link uri="/index"><i class="fa fa-dashboard fa-fw">
              </i> <span>Dashboard</span>
              </g:link>
            </li>

            <li class="treeview">
              <a href="#">
                <i class="fa fa-calendar"></i>
                <span>Transações</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li>
                    <g:link uri="/transacao#/">Contas a Pagar</g:link>
                </li>
                <li>
                    <g:link uri="/entrada#/">Contas a Receber</g:link>
                </li>
              </ul>
            </li>

            <li>
              <g:link uri="/empresa#/"><i class="fa fa-edit"></i> Cadastro de Empresas</g:link>
            </li>

            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i>
                <span>Produtos</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li>
                    <g:link uri="/item#/">Cadastro de Produtos</g:link>
                </li>
                <li>
                    <g:link uri="/grupo/">Cadastrod e Grupos</g:link>
                </li>
              </ul>
            </li>

            <sec:ifAnyGranted roles="ROLE_ADMIN">

              <li>
                <g:link uri="/usuario#/"><i class="fa fa-edit"></i> Gerenciar Usuários</g:link>
              </li>

              <li class="treeview">
                <a href="#">
                  <i class="fa fa-calendar"></i>
                  <span>Relatórios</span>
                  <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li>
                      <g:link uri="/relatorioPagar#/">Contas a Pagar</g:link>
                  </li>
                  <li>
                      <g:link uri="/relatorioReceber#/">Contas a Receber</g:link>
                  </li>
                  <li>
                      <g:link uri="/relatorioEmpresa#/">Empresas</g:link>
                  </li>
                  <li>
                      <g:link uri="/relatorioFinanceiro#/">Financeiro</g:link>
                  </li>
                </ul>
              </li>

            </sec:ifAnyGranted>

          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">

        <!-- Your Page Content Here -->
        <section class="content">
        <div class="row" ng-view></div>
        <g:layoutBody/>
        </section>

      </div><!-- /.content-wrapper -->

      <!-- Main Footer -->
      <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
          Versão 2.0
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2015 <a href="#">Shurima</a>.</strong>
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Home tab content -->
          <div class="tab-pane active" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Atividade Recente</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript::;">
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Minha avó de cueca</h4>
                    <p>MIMIMI</p>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Barra de progresso</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript::;">
                  <h4 class="control-sidebar-subheading">
                    Template design
                    <span class="label label-danger pull-right">70%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->

          </div><!-- /.tab-pane -->
          <!-- Stats tab content -->
          <div class="tab-pane" id="control-sidebar-stats-tab">Setar conteúdo aqui</div><!-- /.tab-pane -->
          <!-- Settings tab content -->
          <div class="tab-pane" id="control-sidebar-settings-tab">
            <form method="post">
              <h3 class="control-sidebar-heading">Configurações Gerais</h3>
              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Painel de uso
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Informações gerais e pá
                </p>
              </div><!-- /.form-group -->
            </form>
          </div><!-- /.tab-pane -->
        </div>
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <!--<script src="plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>-->
    <!-- Bootstrap 3.3.2 JS -->
    <!--<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
    <!-- AdminLTE App -->
    <!--<script src="dist/js/app.min.js" type="text/javascript"></script>-->

    <!-- Optionally, you can add Slimscroll and FastClick plugins.
          Both of these plugins are recommended to enhance the
          user experience. Slimscroll is required when using the
          fixed layout. -->
  </body>
</html>
