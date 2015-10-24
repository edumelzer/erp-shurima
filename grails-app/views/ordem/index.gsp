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
                Ordens de Serviço
                <small>Gerenciar</small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <g:link uri="/">
                        <i class="fa fa-dashboard"></i>
                        Home</g:link>
                </li>
                <li class="active">Ordens</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="clearfix">
                <div class="pull-right">
                    <g:link action="create">
                         <button class="btn btn-primary">Criar Ordem</button>
                    </g:link>
                </div>
            </div><br/>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Ordens Cadastradas</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="list" class="table table-striped table-bordered table-hover">
                                <thead sort-header ng-model="ctrl.sort" on-sort="ctrl.reload()">
                                    <th sortable-column title="Id" property="id">Código</th>
                                    <th sortable-column title="Descrição" property="descricao">Cliente</th>
                                    <th sortable-column title="Data Saída" property="valor1">Data Saída</th>
                                    <th sortable-column title="Data Retorno" property="valor2">Data Retorno</th>
                                    <th>Editar</th>
                                </thead>
                                <tbody>
                                    <ol>
                                        <g:each in="${ordens}" var="p">
                                            <tr class="animate-repeat">
                                                <td><a href="show/${p.id}">${p.id}</a></td>
                                                <td>${p.cliente.nome}</td>
                                                <td><g:formatDate format="dd/MM/yyyy" date="${p.dataSaida}"/></td>
                                                <td><g:formatDate format="dd/MM/yyyy" date="${p.dataRetorno}"/></td>
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
