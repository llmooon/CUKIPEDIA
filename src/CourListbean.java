
import java.util.*;
import java.io.*;

public class CourListbean {
	private ArrayList<String> subject = new ArrayList<String>();
	private ArrayList<String> pro = new ArrayList<String>();
	private ArrayList<Integer> num = new ArrayList<Integer>();
	private ArrayList<Integer> up = new ArrayList<Integer>();
	private ArrayList<Integer> down = new ArrayList<Integer>();
	private ArrayList<Integer> seqno = new ArrayList<Integer>();
	private boolean lastpage = false;
	private boolean startpage = false;
	private int n;

	public void setlastpage(boolean lastpage) {
		this.lastpage = lastpage;
	}

	public void setstartpage(boolean startpage) {
		this.startpage = startpage;
	}

	public CourListbean() {

	}

	public void setN(int n) {
		this.n = n;
	}

	public int getN() {
		return n;
	}

	public void setSubject(int index, String subject) {
		this.subject.add(index, subject);
	}

	public void setPro(int index, String pro) {
		this.pro.add(index, pro);
	}

	public void setNum(int index, int num) {
		this.num.add(index, num);
	}

	public void setUp(int index, int up) {
		this.up.add(index, up);
	}

	public void setDown(int index, int down) {
		this.down.add(index, down);
	}

	public void setSeqno(int index, int seqno) {
		this.seqno.add(index, seqno);
	}

	public String[] getSubject() {
		return subject.toArray(new String[subject.size()]);
	}

	public String[] getPro() {
		return pro.toArray(new String[pro.size()]);
	}

	public Integer[] getNum() {
		return num.toArray(new Integer[num.size()]);
	}

	public Integer[] getUp() {
		return up.toArray(new Integer[up.size()]);
	}

	public Integer[] getDown() {
		return down.toArray(new Integer[down.size()]);
	}

	public Integer[] getSeqno() {
		return seqno.toArray(new Integer[seqno.size()]);
	}

	public int getSize() {
		return seqno.size();
	}
	public boolean isstartpage() {
		return startpage;
	}
	public boolean islastpage() {
		return lastpage;
	}
}
