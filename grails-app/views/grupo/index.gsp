<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="maingrails" />
	<title>Welcome to Grails</title>
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
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">Tables</a></li>
				<li class="active">Data tables</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">

			<ol>
				<g:each in="${grupos}" var="p">
					<li>${p}</li>
				</g:each>
			</ol>

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
									<th sortable-column title="Id" property="id"></th>
									<th sortable-column title="Data Vencimento" property="data"></th>
									<th sortable-column title="Valor" property="valor"></th>
									<th sortable-column title="Empresa" property="empresa"></th>
									<th sortable-column title="Nº. Título" property="numeroTitulo"></th>
									<th sortable-column title="observação" property="observacao"></th>
									<th>&nbsp;</th>
								</thead>
								<tbody>
									<ol>
										<g:each in="${transacoes}" var="p">
											<tr class="animate-repeat">
												<td><a href="#/show/${p.id}">${p.id}</a></td>
												<td>${p.data}</td>
												<td>${p.valor}</td>
												<td>${p.empresa}</td>
												<td>${p.tipo}</td>
												<td>${p.numeroTitulo}</td>
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
