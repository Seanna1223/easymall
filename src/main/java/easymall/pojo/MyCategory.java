package easymall.pojo;

import javax.validation.constraints.NotNull;

public class MyCategory {

	@NotNull(message="��Ʒ������Ʋ���Ϊ��")
	private String name;
	@NotNull(message="��Ʒ�����������Ϊ��")
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
