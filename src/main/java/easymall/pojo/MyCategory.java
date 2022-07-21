package easymall.pojo;

import javax.validation.constraints.NotNull;

public class MyCategory {

	@NotNull(message="商品类别名称不能为空")
	private String name;
	@NotNull(message="商品类别描述不能为空")
	private String description;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
