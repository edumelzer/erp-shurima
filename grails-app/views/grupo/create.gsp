<!DOCTYPE html>
<html>

  <head>
    <meta content="maingrails" name="layout"/>
    <title>Shurima ERP</title>

    <script type="text/javascript">
        function addProduto() {
            console.log("ADIONA ISSO AE OU TA DIFICIL?");
        }
    </script>

  </head>

  <body>

      <!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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
              <button type="button" class="btn btn-primary" data-dismiss="modal" id="btn-save-produto">Adicionar</button>
            </div>
          </div>
        </div>
      </div>

    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Grupo de Produto
          <small>Cadastrar novo grupo de produtos</small>
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
<!-- /.box-header -->
<!-- form start -->

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
                          <li role="presentation"><a role="menuitem" tabindex="-1" >Adicionar Produto</a></li>
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Remover Produto</a></li>
                        </ul>
                      </li>
                      <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_1">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputDescricao">Descrição</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control"
                                        value="${grupin?.descricao}"
                                        name="descricao"
                                        placeholder="Descrição do grupo"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputValor1">Valor 1</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control"
                                        value="${grupin?.valor1}"
                                        name="valor1"
                                        placeholder="Valor 1"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputValor2">Valor 2</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control"
                                        value="${grupin?.valor2}"
                                        name="valor2"
                                        placeholder="Valor 2"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputValor1">Valor 3</label>
                                <div class="col-sm-10">
                                    <g:textField class="form-control"
                                        value="${grupin?.valor3}"
                                        name="valor3"
                                        placeholder="Valor 3"/>
                                </div>
                            </div>

                            <div class="form-group">
                              <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox">
                                    Grupo Ativo
                                  </label>
                                </div>
                              </div>
                            </div>

                        </div><!-- /.tab-pane -->
                        <div class="tab-pane" id="tab_2">

                          <!-- Button trigger modal -->
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                            Adicionar Produto
                          </button>

                          <div class="box-header">
                              <h3 class="box-title">Lista de Produtos associados ao grupo</h3>
                          </div><!-- /.box-header -->
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
                                          <td><g:link action="show" id="${item.id}">${item.encodeAsHTML()}</g:link></td>

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
                          </div><!-- /.box-body -->


                      </div><!-- /.tab-pane -->
                    </div><!-- /.tab-content -->
                  </div><!-- nav-tabs-custom -->
              </div>

            </div>
<!-- /.box-body -->

            <div class="box-footer">
              <button class="btn btn-default" type="submit">Cancelar</button>
              <button class="btn btn-info pull-right" type="submit">Salvar</button>
            </div>
<!-- /.box-footer -->
          </g:form>
        </div>
<!-- /.box -->

      </section>
<!-- /.content -->
    </div>
<!-- /.content-wrapper -->

    <script type="text/javascript">

        $(function () {

            $("#btn-add-produto").click(function(){
                console.log("Esse choro aqui é livre!")
            });

            $("#btn-save-produto").click(function() {
                console.log("Não vai subir ninguém!");
                console.log($("#inputProduto").val());
                console.log($("#inputQuantidade").val());
                console.log($("#inputProduto").find(":selected").text());
            });

            $('#myModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var recipient = button.data('whatever'); // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                //var modal = $(this)
                //modal.find('.modal-title').text('New message to ' + recipient)
                //modal.find('.modal-body input').val(recipient)
            });

            //$("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        });

    </script>
  </body>

</html>
