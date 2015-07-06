<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
  <br/>
<h1> Te fode ae. </h1>
<g:jasperReport
          jasper="Contas_a_pagar"
          format="PDF"
          name="Contas a Pagar"> <br/>
    Data Inicial: <input type="text" name="data_inicial" dateFormat="%d/%m/%Y" years="1900,2099" />
    Data Final: <input type="text" name="data_final" dateFormat="%d/%m/%Y" years="1900,2099" />
</g:jasperReport>
</body>
</html>
