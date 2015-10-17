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
          Grupo de Produto
          <small>Visualizando grupo de produtos</small>
        </h1>
        <ol class="breadcrumb">
          <li>
            <g:link uri="/">
              <i class="fa fa-dashboard"></i>
              Home</g:link>
          </li>
          <li>
            <g:link uri="/grupo/">Grupos</g:link>
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
                <h3 class="box-title">Grupo ${grupo.id}</h3>
              </div><!-- /.box-header -->
              <div class="box-body">
                <dl class="dl-horizontal">
                  <dt>Descrição</dt>
                  <dd>${grupo.descricao}</dd>
                  <dt>Valor 1</dt>
                  <dd>R$ ${grupo.valor1}</dd>
                  <dt>Valor 2</dt>
                  <dd>R$ ${grupo.valor2}</dd>
                  <dt>Valor 3</dt>
                  <dd>R$ ${grupo.valor3}</dd>
                </dl>

                <table class="table table-bordered">
                  <tr>
                    <th style="width: 10px">#</th>
                    <th>Produto</th>
                    <th>Quantidade</th>
                  </tr>

                  <g:each status="i" in="${grupo.items}" var="item">
                    <tr>
                      <td>${i}</td>
                      <td>${item.item}</td>
                      <td>${item.quantidade}</td>
                    </tr>
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
