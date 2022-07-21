package easymall.controller.admin;//qaz

import java.io.FileOutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import easymall.controller.BaseController;
import easymall.controller.ExcelUtil;
import easymall.po.Products;
import easymall.service.ProductsService;

@Controller
@RequestMapping("/admin")
public class AdminPrintController extends BaseController {

	@Autowired
	private ProductsService productsService;

	@RequestMapping("/exportExcel")
	public String exportExcel() {

		try {
			List<Products> list = productsService.toprods();

			HSSFWorkbook workbook = new HSSFWorkbook(); // �½�һ��������
			HSSFSheet sheet = workbook.createSheet("���۰�");// ����һ��������
			ExcelUtil excel = new ExcelUtil(workbook, sheet);
			excel.createNormalHead("���۰�", 6);
			sheet.createFreezePane(7, 2, 7, 20);

			String[] params = { "��Ʒ��", "��Ʒ��", "�۸�", "����", "״̬", "�����", "��������" };
			int[] paramsWidth = { 4500, 4500, 4500, 4500, 4500, 4500, 4500 };

			excel.setColumWidth(sheet, paramsWidth);
			excel.createColumHeader(params, 1);
			for (int i = 0; i < list.size(); i++) {
				HSSFRow row = sheet.createRow(i + 2);
				row.setHeight((short) 500);

				Products pro = list.get(i);
				excel.cteateCell(workbook, row, 0, (short) 2, pro.getId().toString());
				excel.cteateCell(workbook, row, 1, (short) 2, pro.getName().toString());
				excel.cteateCell(workbook, row, 2, (short) 2, pro.getPrice().toString());
				excel.cteateCell(workbook, row, 3, (short) 2, pro.getCategory().toString());
				if (pro.getStatus() == 1)
					excel.cteateCell(workbook, row, 4, (short) 2, "�ϼ�");
				else
					excel.cteateCell(workbook, row, 4, (short) 2, "�¼�");
				excel.cteateCell(workbook, row, 5, (short) 2, pro.getPnum().toString());
				excel.cteateCell(workbook, row, 6, (short) 2, pro.getSoldnum().toString());
			}

			FileOutputStream fOut = new FileOutputStream("d:/���۰�.xls");
			workbook.write(fOut);
			fOut.flush();
			fOut.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/after_print";
	}
}
