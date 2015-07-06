package com.shurima
import java.io.*
import java.sql.Connection
import java.sql.DriverManager
import java.util.HashMap
import java.util.Map
/*import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;*/

class RelatorioController  {

    def index = {

    }

    def contasPagar = {

    }
    /*
    def printContasPagar() {
      String reportName = "./relatorios/Contas_a_pagar"

      println "VAI NESSA FILHA DA PUTA"

      // compiles jrxml
      //JasperCompileManager.compileReportToFile(reportName + ".jrxml");
      // fills compiled report with parameters and a connection
      // JasperPrint print = JasperFillManager.fillReport(reportName + ".jasper", parameters, connection);
      JasperPrint print = JasperFillManager.fillReport(reportName + ".jasper", null);
      ByteArrayOutputStream  pdfStream = new ByteArrayOutputStream();
      // exports report to pdf
      JRExporter exporter = new JRPdfExporter();
      exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
      // exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, new FileOutputStream(reportName + ".pdf")); // your output goes here
      exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, pdfStream); // your output goes here
      exporter.exportReport();
      render(file: pdfStream.toByteArray(), contentType: 'application/pdf')
    }
*/
}
