<!DOCTYPE html>
<html>

  <head>
    <meta content="maingrails" name="layout"/>
    <title>Shurima ERP</title>
    <script type="text/javascript" src="${resource(dir: 'plugin', file: 'datatables/dataTables.bootstrap.min.js')}" ></script>
  </head>

  <body>

    <div class="content-wrapper">

      <section class="content-header">
        <h1>
          Ordem de Serviço
          <small>Visualizando Ordem de Serviço</small>
        </h1>
        <ol class="breadcrumb">
          <li>
            <g:link uri="/">
              <i class="fa fa-dashboard"></i>
              Home</g:link>
          </li>
          <li>
            <g:link uri="/ordem/">Ordem</g:link>
          </li>
          <li class="active">Visualizar</li>
        </ol>

      </section>

      <section class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="box box-info">
              <div class="box-header with-border">
                <i class="fa fa-list-alt"></i>
                <h3 class="box-title">Ordem ${ordem.id}</h3>
              </div><!-- /.box-header -->
              <div class="box-body">
                <dl class="dl-horizontal">
                  <dt>Cliente</dt>
                  <dd>${ordem.cliente.nome}</dd>
                  <dt>Data Saída</dt>
                  <dd><g:formatDate format="dd/MM/yyyy" date="${ordem.dataSaida}"/></dd>
                  <dt>Data Retorno</dt>
                  <dd><g:formatDate format="dd/MM/yyyy" date="${ordem.dataRetorno}"/></dd>
                </dl>
                <h3>Items:</h3>
                <table class="table table-bordered">
                  <tr>
                    <th style="width: 10px">#</th>
                    <th>Produto</th>
                    <th>Quantidade</th>
                  </tr>

                  <g:each status="i" in="${ordem.items}" var="item">
                    <g:if test="${item.item}">
                      <tr>
                        <td>${i + 1}</td>
                        <td>${item.item}</td>
                        <td>${item.quantidadeItens}</td>
                      </tr>
                    </g:if>
                  </g:each>

                </table>

                <h3>Grupos:</h3>
                <table class="table table-bordered">
                  <tr>
                    <th style="width: 10px">#</th>
                    <th>Grupo</th>
                    <th>Quantidade</th>
                  </tr>

                  <g:each status="i" in="${ordem.items}" var="item">
                    <g:if test="${item.grupo}">
                      <tr>
                        <td>${i + 1}</td>
                        <td>${item.grupo}</td>
                        <td>${item.quantidadeItens}</td>
                      </tr>
                    </g:if>
                  </g:each>

                </table>

              </div>

            </div>
          </div>
        </div>
      </section>

    </div>

  </body>

</html>
