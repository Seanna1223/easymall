package easymall.po;

public class Category {
	private String name;
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
	@Override
	public String toString() {
		return "Category [name=" + name + ", description=" + description + "]";
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
