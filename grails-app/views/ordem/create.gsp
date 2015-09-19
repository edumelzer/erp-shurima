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
        <form method="post" action="save" class="form-horizontal" id="grupo-form">
          <div class="box-body">


            <div class="col-md-12">
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#tab_1" data-toggle="tab">Informações Báscias</a></li>
                  <li><a href="#tab_2" data-toggle="tab">Produtos</a></li>
                  <li><a href="#tab_3" data-toggle="tab">Grupo de Produtos</a></li>
                  <li><a href="#tab_4" data-toggle="tab">Valor Total</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
                    <!--<div class="col-md-6">-->
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="inputDescricao">Cliente</label>
                      <div class="col-sm-10">
                        <select name="empresa" class="form-control" required id="empresa">
                          <option value="" var="Escolha uma Empresa">
                            <g:each in="${empresasList}" var="emp">
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

                  </div>
                  <div class="tab-pane" id="tab_2">

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                      Adicionar Produto
                    </button>

                    <div class="box-header">
                      <h3 class="box-title">Lista de Produtos </h3>
                    </div>
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
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">
                      Adicionar Grupos
                    </button>

                    <div class="box-header">
                      <h3 class="box-title">Lista de Grupos. </h3>
                    </div>

                    <div class="box-body">
                      <table id="grupos" class="table table-bordered table-striped">
                        <thead>
                          <tr>
                            <th>Id</th>
                            <th>Produto</th>
                            <th>Quantidade</th>
                            <th>Remover</th>
                          </tr>
                        </thead>
                        <tbody>
                          <g:each in="${grupos}" status="i" var="grupo">
                            <tr>
                              <td>
                                <g:link action="show" id="${grupo.id}">${grupo.encodeAsHTML()}</g:link>
                              </td>

                              <td>${fieldValue(bean: grupo, field: "grupo.nome")}</td>

                              <td>${fieldValue(bean: grupo, field: "quantidade")}</td>

                              <td>
                                <div class="btn btn-danger" id='btn-add-grupo'>
                                  Remover
                                </div>
                              </td>
                            </tr>
                          </g:each>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div class="tab-pane" id="tab_4">

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="TotalOrdem">Soma total</label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" type="text" id="TotalOrdem" name="TotalOrdem" placeholder="Soma total" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="Desconto">Desconto</label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" type="text" id="Desconto" name="Desconto" placeholder="Desconto" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="ValorTotal">Valor total</label>
                      <div class="col-sm-10">
                        <g:textField class="form-control" type="text" id="ValorTotal" name="ValorTotal" placeholder="Valor total  " />
                      </div>
                    </div>

                  </div>
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
  </form>
  </div>
  </section>
  </div>

  <div class="modal modal-success" id="modalResponse" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modaml-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="modalResponseTitle">TEXTO QUE VAI MUDAR</h4>
        </div>
        <div class="modal-body">
          <span id="modalResponseText">Outro texto que vai mudar.</span>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
        </div>
      </div>
    </div>
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

          <div class="form-group">
            <label for="inputValor">Valor</label>
            <select class="form-control" id="inputProdutoValor">
              <option intemId="valor1" value="${produtosList[0].valor1}">${produtosList[0].valor1}</option>
              <option intemId="valor2" value="${produtosList[0].valor2}">${produtosList[0].valor2}</option>
              <option intemId="valor3" value="${produtosList[0].valor3}">${produtosList[0].valor3}</option>
            </select>
          </div>

        </div>
      </div>
      <div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
          <button type="button" class="btn btn-primary" id="btn-save-produto">Adicionar</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal modal-primary" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modaml-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">Selecione o Grupo e a quantidade</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Grupo</label>

            <select class="form-control" id="inputGrupo">
              <g:each in="${gruposList}" var="group">
                <option value="${group.id}">${group.descricao}</option>
              </g:each>
            </select>

          </div>
          <div class="form-group">
            <label for="inputQuantidadeGrupo">Quantidade</label>
            <input type="text" class="form-control" id="inputQuantidadeGrupo" value="1" placeholder="Digite a quantidade">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
          <button type="button" class="btn btn-primary" id="btn-save-grupo">Adicionar</button>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="${resource(dir: 'plugin', file: 'tabletojson/jquery.tabletojson.min.js')}"></script>
  <script type="text/javascript">
    $("#grupo-form").submit(function(event) {

      console.log("Submit em ajax! Wuuuuuuu");
      event.preventDefault();
      var produtos = []
      var grupos = []
      var table = $('#items').tableToJSON();

      $('#items').find('tr').each(function(indexArray, indexObject) {
        var row = $(this),
          curRecord = table[indexArray - 1];
        console.log(curRecord)
        if (row.find('input[type="checkbox"]').is(':checked')) {
          if (curRecord) {
            curRecord.removed = true;
          }
        }

        if (curRecord) {
          produtos.push({
            id: curRecord.Id,
            qtd: curRecord.Quantidade,
            removed: !!curRecord.removed
          });
        }
      });
      $('#grupos').find('tr').each(function(indexArray, indexObject) {
        var row = $(this),
          curRecord = table[indexArray - 1];

        if (row.find('input[type="checkbox"]').is(':checked')) {
          if (curRecord) {
            curRecord.removed = true;
          }
        }

        if (curRecord) {
          grupos.push({
            id: curRecord.Id,
            qtd: curRecord.Quantidade,
            removed: !!curRecord.removed
          });
        }
      });

      var commitParams = {
        empresa: $('#empresa').val(),
        dataRetorno: $('#inputDataRetorno').val(),
        dataSaida: $('#inputDataSaida').val(),
        quantidadeDias: $('#inputQuantidadeDias').val(),
        motorista: $('#inputMotorista').val(),
        veiculo: $('#inputVeiculo').val(),
        placa: $('#inputPlaca').val(),
        observacao: $('#inputObservacao').val(),
        produtos: produtos,
        grupos: grupos
      }


      $.ajax({
        type: "POST",
        url: "save",
        data: JSON.stringify(commitParams),
        contentType: 'application/json'
      }).done(function(msg) {
        $("#modalResponseTitle").text(msg.success ? "Sucesso!" : "Falhou!");
        $("#modalResponseText").html(msg.message);
        $('#modalResponse').modal('show');
      });

      return false;
    });

    //$("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});


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
      var g = $('#grupos').DataTable({
        bFilter: false,
        bPaginate: false,
        bInfo: false,
        oLanguage: {
          sZeroRecords: "Sem registros a serem exibidos"
        }
      });

      $("#btn-save-grupo").click(function() {
        var inputGrupo = $("#inputGrupo"),
          inputQuantidadeGrupo = $("#inputQuantidadeGrupo");

        if (isNaN(inputQuantidadeGrupo.val())) {
          alert("Quantidade não é um número válido!");
        } else {
          g.row.add([
            $("#inputGrupo").val(),
            $("#inputGrupo").find(":selected").text(),
            $("#inputQuantidadeGrupo").val(),
            '<input type="checkbox"> Marcar para Remover</input>'
          ]).draw();

          $("#myModal2").modal('hide');
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

      $("#inputProduto").change(function() {
        var produto = $(this),
          valor = produto.val(),
          valores = $("#inputProdutoValor");

        valores.empty();

        < g: each in = "${produtosList}"
        var = "prod" >
        if (valor == $ {
            prod.id
          }) {
          valores.append('<option itemId="valor1" value="${prod.valor1}">${prod.valor1}</option>');
          valores.append('<option itemId="valor2" value="${prod.valor2}">${prod.valor2}</option>');
          valores.append('<option itemId="valor3" value="${prod.valor3}">${prod.valor3}</option>');
        } < /g:each>

      });

    });
  </script>

</body>

</html>
