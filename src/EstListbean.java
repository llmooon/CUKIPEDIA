

import java.io.*;
import java.util.*;

public class EstListbean {

	private ArrayList<String> est = new ArrayList();
	private int size;

	public void setEst(int index, String est) {
		this.est.add(index, est);
	}

	public String[] getEst() {
		return est.toArray(new String[est.size()]);
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
}
