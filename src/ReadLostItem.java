import java.util.ArrayList;

public class ReadLostItem {

	private ArrayList<Integer> seqnolist = new ArrayList<Integer>();
	private ArrayList<String> itemnamelist = new ArrayList<String>();
	private ArrayList<String> lostplacelist = new ArrayList<String>();
	private ArrayList<String> lostnamelist = new ArrayList<String>();
	private ArrayList<String> lostdatelist = new ArrayList<String>();
	private ArrayList<String> lostimglist = new ArrayList<String>();
	private ArrayList<String> phonelist = new ArrayList<String>();
	private boolean lastpage = false;
	private boolean startpage = false;


	public ReadLostItem() {
	}
	public void setseqno(int index, Integer seqno) {
		this.seqnolist.add(index, seqno);
	}
	public void setitemname(int index, String itemname) {
		this.itemnamelist.add(index, itemname);
	}
	public void setlostplace(int index, String lostplace) {
		this.lostplacelist.add(index, lostplace);
	}
	public void setlostname(int index, String lostname) {
		this.lostnamelist.add(index, lostname);
	}
	public void setlostdate(int index, String lostdate) {
		this.lostdatelist.add(index, lostdate);
	}
	public void setlostimg(int index, String lostimg) {
		this.lostimglist.add(index, lostimg);
	}
	public void setphone(int index, String phone) {
		this.phonelist.add(index, phone);
	}
	public void setlastpage(boolean lastpage) {
		this.lastpage = lastpage;
	}
	public void setstartpage(boolean startpage) {
		this.startpage = startpage;
	}

	
	public Integer[] getseqno() {
		return seqnolist.toArray(new Integer[seqnolist.size()]);
	}
	public String[] getitemname() {
		return itemnamelist.toArray(new String[itemnamelist.size()]);
	}
	public String[] getlostplace() {
		return lostplacelist.toArray(new String[lostplacelist.size()]);
	}
	public String[] getlostname() {
		return lostnamelist.toArray(new String[lostnamelist.size()]);
	}
	public String[] getlostdate() {
		return lostdatelist.toArray(new String[lostdatelist.size()]);
	}
	public String[] getlostimg() {
		return lostimglist.toArray(new String[lostimglist.size()]);
	}
	public String[] getphone() {
		return phonelist.toArray(new String[phonelist.size()]);
	}
	public boolean isstartpage() {
		return startpage;
	}
	public boolean islastpage() {
		return lastpage;
	}
	public int getlistsize() { // 게시글의 수를 리턴하는 메서드
		return seqnolist.size();
	}
}