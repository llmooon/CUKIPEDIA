
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
public class BoardInfo {
   
   private ArrayList<Integer> gr = new ArrayList<Integer> ();
   private ArrayList<Integer> seq = new ArrayList<Integer> ();
   private ArrayList<Integer> level = new ArrayList<Integer> ();
   private ArrayList<String> con = new ArrayList<String> ();
   private ArrayList<String> ans= new ArrayList<String>();
   int seqsize;
   int lsize;
   
   public BoardInfo() {};
   
   public void setgr (int index) {
      this.gr.add(index);
   }
   public void setcon (String pro) {
      this.con.add(pro);
   }
   public void setans (String ans) {
      this.con.add(ans);
   }
   public void setseq (int index) {
      this.seq.add(index);
   }
   public void setlevel (int index) {
      this.level.add(index);
   }
   
   public Integer[] getgr() {
      return gr.toArray(new Integer[gr.size()]);
   }
   public Integer[] getseq() {
      return seq.toArray(new Integer[seq.size()]);
   }
   public Integer[] getlevel() {
      return level.toArray(new Integer[level.size()]);
   }
   public String[] getans() {
      return ans.toArray(new String[ans.size()]);
   }
   public String[] getcon() {
      return con.toArray(new String[con.size()]);
   }
   public void setssize(int n){
      this.seqsize++;;
   }
   public int getssize(){
      return this.seqsize;
   }
   public void setlsize(int n){
      this.lsize=n+1;
   }
   public int getlsize(){
      return this.lsize;
   }
   public int getsize() {
      return con.size();
   }
}