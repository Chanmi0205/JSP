package model1.board;

public class ReplyDTO {

	private String r_num;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private String name; // member의 name을 가져올 데이터(Board에는 존재x)
	
	public String getR_num() {
		return r_num;
	}
	
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	
	public String getr_Content() {
		return content;
	}
	
	public void setr_Content(String content) {
		this.content = content;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public java.sql.Date getPostdate() {
		return postdate;
	}
	
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "ReplyDTO [r_num=" + r_num + ", content=" + content + ", id=" + id + ", postdate=" + postdate + ", name="
				+ name + "]";
	}
	

}
