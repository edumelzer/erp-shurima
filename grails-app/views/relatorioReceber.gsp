<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
  <br/>
<h1> Relatório de contas a receber. </h1>
<g:jasperReport
          jasper="Contas_a_receber"
          format="PDF"
          name="Contas a receber"> <br/>
    Data Inicial: <g:datePicker name="data_inicial" value="${new Date()}"precision="day" years="${1930..2018}"/>
    Data Final: <g:datePicker name="data_final" value="${new Date()}"precision="day" years="${1930..2018}"/>
</g:jasperReport>
</body>
</html>
