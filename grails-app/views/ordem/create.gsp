<!DOCTYPE html>
<html>

<head>
  <meta content="maingrails" name="layout" />
  <title>Shurima ERP</title>
</head>

<body>

  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Ordem de Serviço

      </h1>
      <ol class="breadcrumb">
        <li>
          <g:link uri="/">
            <i class="fa fa-dashboard"></i> Home
          </g:link>
        </li>
        <li>
          <g:link uri="/ordem/">Ordens</g:link>
        </li>
        <li class="active">Cadastrar</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Horizontal Form -->
      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">Formulário de Cadastro</h3>
        </div>
        <g:form action="save" class="form-horizontal">
          <div class="box-body">


            <div class="col-md-12">
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#tab_1" data-toggle="tab">Informações Báscias</a></li>
                  <li><a href="#tab_2" data-toggle="tab">Produtos</a></li>
                  <li><a href="#tab_3" data-toggle="tab">Grupo de Produtos</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
                    <!--<div class="col-md-6">-->
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="inputDescricao">Cliente</label>
                      <div class="col-sm-10">
                        <select name="empresa" class="form-control" required>
                          <option value="" var="Escolha uma Empresa">
                            <g:each in="${empresas}" var="emp">
                              <option value="${emp.id}">${emp.nome}</option>
                            </g:each>
                        </select>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="inputDataSaida">Data Saída</label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" type="text" id="inputDataSaida" name="dataSaida" placeholder="Data Saída" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="inputDataRetorno">Data Retorno</label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" type="text" id="inputDataRetorno" name="dataRetorno" placeholder="Data Retorno" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="inputQuantidadeDias"> Dias</label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" id="inputQuantidadeDias" name="quantidadeDias" placeholder="Dias" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="inputMotorista"> Motorista</label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" type="text" id="inputMotorista" name="motorista" placeholder="Nome do Motorista" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="inputVeiculo">Veículos </label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" type="text" id="inputVeiculo" name="veiculo" placeholder="Veículo utilizado para transporte da carga" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="inputPlaca">Placa do Veículo</label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" type="text" id="inputPlaca" name="placa" placeholder="Placa do Veículo" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="inputObservacao">Observação</label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" type="text" id="inputObservacao" name="observacao" placeholder="Placa do Veículo" />
                      </div>
                    </div>

                    <!--</div>-->

                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2">

                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                      Adicionar Produto
                    </button>

                    <div class="box-header">
                      <h3 class="box-title">Lista de Produtos associados ao grupo</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                      <table id="items" class="table table-bordered table-striped">
                        <thead>
                          <tr>
                            <th>Id</th>
                            <th>Produto</th>
                            <th>Quantidade</th>
                            <th>Remover</th>
                          </tr>
                        </thead>
                        <tbody>
                          <g:each in="${items}" status="i" var="item">
                            <tr>
                              <td>
                                <g:link action="show" id="${item.id}">${item.encodeAsHTML()}</g:link>
                              </td>

                              <td>${fieldValue(bean: item, field: "item.nome")}</td>

                              <td>${fieldValue(bean: item, field: "quantidade")}</td>

                              <td>
                                <div class="btn btn-danger" id='btn-add-produto'>
                                  Remover
                                </div>
                              </td>
                            </tr>
                          </g:each>
                        </tbody>
                      </table>
                    </div>
                  </div>

                  <div class="tab-pane" id="tab_3">
                  </div>
                </div>
              </div>
            </div>
          </div>

      </div>
      <div class="box-footer">
        <button class="btn btn-default" type="submit">Cancelar</button>
        <button class="btn btn-info pull-right" type="submit">Salvar</button>
      </div>
      </g:form>
  </div>
  </section>
  </div>

  <div class="modal modal-primary" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modaml-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">Selecione o Produto e a quantidade</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Produto</label>

            <select class="form-control" id="inputProduto">
              <g:each in="${produtosList}" var="prod">
                <option value="${prod.id}">${prod.nome}</option>
              </g:each>
            </select>

          </div>
          <div class="form-group">
            <label for="inputQuantidade">Quantidade</label>
            <input type="text" class="form-control" id="inputQuantidade" value="1" placeholder="Digite a quantidade">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
          <button type="button" class="btn btn-primary" id="btn-save-produto">Adicionar</button>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    $(function() {

      $("#inputDataRetorno").inputmask("dd/mm/yyyy", {
        "placeholder": "__/__/____"
      });

      $("#inputDataSaida").inputmask("dd/mm/yyyy", {
        "placeholder": "__/__/____"
      });

      var t = $('#items').DataTable({
        bFilter: false,
        bPaginate: false,
        bInfo: false,
        oLanguage: {
          sZeroRecords: "Sem registros a serem exibidos"
        }
      });

      $("#btn-save-produto").click(function() {
        var inputProduto = $("#inputProduto"),
          inputQuantidade = $("#inputQuantidade");

        if (isNaN(inputQuantidade.val())) {
          alert("Quantidade não é um número válido!");
        } else {
          t.row.add([
            $("#inputProduto").val(),
            $("#inputProduto").find(":selected").text(),
            $("#inputQuantidade").val(),
            '<input type="checkbox"> Marcar para Remover</input>'
          ]).draw();

          $("#myModal").modal('hide');
        }

      });

    });
  </script>

</body>

</html>
