<!DOCTYPE html>
<html>

  <head>
    <meta content="maingrails" name="layout"/>
    <title>Shurima ERP</title>
  </head>

  <body>

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
              <div class="col-md-6">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="inputDescricao">Descrição</label>
                  <div class="col-sm-10">
                    <g:textField class="form-control" id="inputDescricao" name="descricao" placeholder="Descrição do grupo"/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="inputValor1">Valor 1</label>
                  <div class="col-sm-10">
                    <g:textField class="form-control" id="inputValor1" name="valor1" placeholder="Valor 1"/>
                  </div>
                </div>

              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="inputValor2">Valor 2</label>
                  <div class="col-sm-10">
                    <g:textField class="form-control" id="inputValor2" name="valor2" placeholder="Valor 2"/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="inputValor1">Valor 3</label>
                  <div class="col-sm-10">
                    <g:textField class="form-control" id="inputValor3" name="valor3" placeholder="Valor 3"/>
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
              </div>

              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
              <dynamic:block itemId="customerInfo" min="2" max="5"
                             limitReachedMsg="Sorry, you cannot specify more than 5 customers"
                             removeBtnLabel="Delete">
                <!-- the block of inputs we want to add and remove (firstName, lastName and isExpired) -->
              <g:textField name="firstName"/>
              <g:textField name="lastName"/>
              <g:checkBox name="isExpired"/>
              </dynamic:block>
              <g:submitButton name="submit" value="Submit"/>
            </div>
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

  </body>

</html>
