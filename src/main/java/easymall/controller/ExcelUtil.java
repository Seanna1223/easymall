package easymall.controller;//qaz

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelUtil {
	private HSSFWorkbook wb = null;
	private HSSFSheet sheet = null;

	@SuppressWarnings("deprecation")
	public void setColumWidth(HSSFSheet sheet, int[] params) {
		int length = params.length;
		int width = 0;
		for (int i = 0; i < length; i++) {
			width = params[i] + width;
			sheet.setColumnWidth((short) i, (short) params[i]);
		}
	}

	@SuppressWarnings("deprecation")
	public void createNormalHead(String headString, int colSum) {
		HSSFRow row = sheet.createRow(0);
		row.setHeight((short) 800);
		HSSFCell cell = row.createCell((short) 0);
		cell.setCellValue(new HSSFRichTextString(headString));
		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		cellStyle.setWrapText(true);

		HSSFFont font = wb.createFont();// 设置单元格字体
		font.setFontName("宋体");
		font.setFontHeight((short) 400);
		cellStyle.setFont(font);
		cell.setCellStyle(cellStyle);

	}

	@SuppressWarnings("deprecation")
	public void createColumHeader(String[] columHeader, int rownum) {
		HSSFRow row2 = sheet.createRow(rownum);
		row2.setHeight((short) 600);
		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setWrapText(true);// 指定单元格自动换行
		HSSFFont font = wb.createFont();// 单元格字体
		font.setFontName("宋体");
		font.setFontHeight((short) 300);
		cellStyle.setFont(font);

		HSSFCell cell3 = null;
		for (int i = 0; i < columHeader.length; i++) {
			cell3 = row2.createCell((short) i);
			cell3.setCellStyle(cellStyle);
			cell3.setCellValue(new HSSFRichTextString(columHeader[i]));
		}
	}

	@SuppressWarnings("deprecation")
	public void cteateCell(HSSFWorkbook wb, HSSFRow row, int col, short align, String val) {
		HSSFCell cell = row.createCell((short) col);
		cell.setCellValue(new HSSFRichTextString(val));
		HSSFCellStyle cellstyle = wb.createCellStyle();
		HSSFFont font = wb.createFont();
		font.setFontName("宋体");
		font.setFontHeight((short) 300);
		cellstyle.setFont(font);
		cell.setCellStyle(cellstyle);
	}

	public ExcelUtil(HSSFWorkbook wb, HSSFSheet sheet) {
		this.wb = wb;
		this.sheet = sheet;
	}
}