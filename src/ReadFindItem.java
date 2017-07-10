import java.util.ArrayList;

public class ReadFindItem {

	private ArrayList<Integer> seqnolist = new ArrayList<Integer>();
	private ArrayList<String> itemnamelist = new ArrayList<String>();
	private ArrayList<String> findplacelist = new ArrayList<String>();
	private ArrayList<String> storagelist = new ArrayList<String>();
	private ArrayList<String> lostnamelist = new ArrayList<String>();
	private ArrayList<String> finddatelist = new ArrayList<String>();
	private ArrayList<String> findimglist = new ArrayList<String>();
	private ArrayList<String> findnamelist = new ArrayList<String>();
	private ArrayList<String> phonelist = new ArrayList<String>();
	private boolean lastpage = false;
	private boolean startpage = false;


	public ReadFindItem() {
	}
	public void setseqno(int index, Integer seqno) {
		this.seqnolist.add(index, seqno);
	}
	public void setitemname(int index, String itemname) {
		this.itemnamelist.add(index, itemname);
	}
	public void setfindplace(int index, String findplace) {
		this.findplacelist.add(index, findplace);
	}
	public void setstorage(int index, String storage) {
		this.storagelist.add(index, storage);
	}
	public void setlostname(int index, String lostname) {
		this.lostnamelist.add(index, lostname);
	}
	public void setfinddate(int index, String finddate) {
		this.finddatelist.add(index, finddate);
	}
	public void setfindimg(int index, String findimg) {
		this.findimglist.add(index, findimg);
	}
	public void setfindname(int index, String findname) {
		this.findnamelist.add(index, findname);
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
	public String[] getfindplace() {
		return findplacelist.toArray(new String[findplacelist.size()]);
	}
	public String[] getstorage() {
		return storagelist.toArray(new String[storagelist.size()]);
	}
	public String[] getlostname() {
		return lostnamelist.toArray(new String[lostnamelist.size()]);
	}
	public String[] getfinddate() {
		return finddatelist.toArray(new String[finddatelist.size()]);
	}
	public String[] getfindimg() {
		return findimglist.toArray(new String[findimglist.size()]);
	}
	public String[] getfindname() {
		return findnamelist.toArray(new String[findnamelist.size()]);
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