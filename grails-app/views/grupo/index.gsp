<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="maingrails" />
    <title>Shurima ERP</title>

</head>

<body>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Grupos de Produtos
                <small>Gerenciar</small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <g:link uri="/">
                        <i class="fa fa-dashboard"></i>
                        Home</g:link>
                </li>
                <li class="active">Grupos</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="clearfix">
                <div class="pull-right">
                    <g:link action="create">
                         <button class="btn btn-primary">Criar Grupo</button>
                    </g:link>
                </div>
            </div><br/>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Grupos cadastrados</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="list" class="table table-striped table-bordered table-hover">
                                <thead sort-header ng-model="ctrl.sort" on-sort="ctrl.reload()">
                                    <th sortable-column title="Id" property="id">Código</th>
                                    <th sortable-column title="Descrição" property="descricao">Descrição</th>
                                    <th sortable-column title="Valor 1" property="valor1">Valor 1</th>
                                    <th sortable-column title="Valor 2" property="valor2">Valor 2</th>
                                    <th sortable-column title="Valor 3" property="valor3">Valor 3</th>
                                    <th>Editar</th>
                                </thead>
                                <tbody>
                                    <ol>
                                        <g:each in="${grupos}" var="p">
                                            <tr class="animate-repeat">
                                                <td><a href="#/show/${p.id}">${p.id}</a></td>
                                                <td>${p.descricao}</td>
                                                <td>${p.valor1}</td>
                                                <td>${p.valor2}</td>
                                                <td>${p.valor3}</td>
                                                <td>
                                                    <button type="submit" class="btn btn-primary">Editar</button>
                                                </td>
                                            </tr>
                                        </g:each>
                                    </ol>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</body>


</html>
