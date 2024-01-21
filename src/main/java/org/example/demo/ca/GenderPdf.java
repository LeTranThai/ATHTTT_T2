package org.example.demo.ca;

import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfDocumentInfo;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.VerticalAlignment;
import org.example.demo.model.Order;
import org.example.demo.model.OrderItem;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class GenderPdf {


    public static InputStream generatePDF(Order orders, String hash) {
        DeviceRgb deviceRgb = new DeviceRgb(63, 169, 219);
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            PdfWriter pdfWriter = new PdfWriter(outputStream);
            PdfDocument pdfDocument = new PdfDocument(pdfWriter);
            Document document = new Document(pdfDocument);
            pdfDocument.setDefaultPageSize(PageSize.A4);
            PdfDocumentInfo documentInfo = pdfDocument.getDocumentInfo();
            documentInfo.setMoreInfo("hash", hash);
            float col = 280f;
            float[] columnWidth = {col, col};
            Table table = new Table(columnWidth);

            table.setBackgroundColor(deviceRgb).setFontColor(ColorConstants.WHITE);

            table.addCell(new Cell().add(new Paragraph("INVOICE")).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE).setMarginTop(30f).setMarginBottom(30f).setFontSize(30f).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("SHOP\nNong Lam University\n0123456789")).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE).setMarginTop(30f).setMarginBottom(30f).setFontSize(10f).setBorder(Border.NO_BORDER));

            float[] colWidth = {80, 250, 100, 130};
            Table customerInfoTable = new Table(colWidth);
            customerInfoTable.addCell(new Cell(0, 4).add(new Paragraph("Customer Information").setBold()).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell(6, 10).add(new Paragraph("Invoice Information").setBold()).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph("name:")).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph(orders.getAccount().getUsername())).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph("invoice No:")).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph(String.valueOf(orders.getId()))).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph("phone:")).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph(orders.getOrderPhone())).setBorder(Border.NO_BORDER));
            float[] itemInfoColWidth = {80, 80, 80, 80, 80, 80, 80};
            Table itemInfoTable = new Table(itemInfoColWidth);
            //header
            itemInfoTable.addCell(new Cell().add(new Paragraph("name").setBold()).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
            itemInfoTable.addCell(new Cell().add(new Paragraph("color").setBold()).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
            itemInfoTable.addCell(new Cell().add(new Paragraph("amount").setBold()).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
            itemInfoTable.addCell(new Cell().add(new Paragraph("price ").setBold()).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
            itemInfoTable.addCell(new Cell().add(new Paragraph("size ").setBold()).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));

            //items
            for (OrderItem entry : orders.getItems()) {
                itemInfoTable.addCell(new Cell().add(new Paragraph(entry.getProduct().getName())).setTextAlignment(TextAlignment.LEFT).setVerticalAlignment(VerticalAlignment.MIDDLE));
                itemInfoTable.addCell(new Cell().add(new Paragraph(entry.getColor().getName())).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
                itemInfoTable.addCell(new Cell().add(new Paragraph(entry.getAmount() + "")).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));

                itemInfoTable.addCell(new Cell().add(new Paragraph(entry.getPrice() + "")).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));

                itemInfoTable.addCell(new Cell().add(new Paragraph(entry.getSize() + "")).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));

            }
            itemInfoTable.addCell(new Cell().add(new Paragraph("")).setBackgroundColor(deviceRgb).setBorder(Border.NO_BORDER));

            itemInfoTable.addCell(new Cell().add(new Paragraph("")).setBackgroundColor(deviceRgb).setBorder(Border.NO_BORDER));

            document.add(table);
            document.add(new Paragraph("\n"));
            document.add(customerInfoTable);
            document.add(new Paragraph("\n"));
            document.add(itemInfoTable);
            document.close();
            return new ByteArrayInputStream(outputStream.toByteArray());


        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


}
