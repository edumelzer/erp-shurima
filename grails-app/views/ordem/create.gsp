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
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                          Opções <span class="caret"></span>
                        </a>
                    <ul class="dropdown-menu">
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Adicionar Produto</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Remover Produto</a></li>
                    </ul>
                  </li>
                  <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
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
                        <g:textField class="form-control" type="text" id="inputDataSaida" name="dataSaida" placeholder="Data Saída"/>
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
                    Listinha dos produtos adicionados, e opção pro cara poder adicionar mais. u.u
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


  <script type="text/javascript">

      $(function () {

          $("#inputDataRetorno").inputmask("dd/mm/yyyy", {"placeholder": "__/__/____"});

          $("#inputDataSaida").inputmask("dd/mm/yyyy", {"placeholder": "__/__/____"});

      });

  </script>

</body>

</html>
