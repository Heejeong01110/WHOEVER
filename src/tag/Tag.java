package tag;

public class Tag {
	private int tag_id;
	private String tag_name;
	private int _bbs_id;
	
	public int get_bbs_id() {
		return _bbs_id;
	}
	public void set_bbs_id(int _bbs_id) {
		this._bbs_id = _bbs_id;
	}
	public int getTag_id() {
		return tag_id;
	}
	public void setTag_id(int tag_id) {
		this.tag_id = tag_id;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
}
