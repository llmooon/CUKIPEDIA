
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
public class searchInfo {
   private ArrayList<String> subject = new ArrayList<String> ();
   private ArrayList<String> pro = new ArrayList<String> ();
   private ArrayList<Integer> gro = new ArrayList<Integer> ();
   
   public searchInfo() {};
   
   public void setsubject (int index, String subject) {
      this.subject.add(index,subject);
   }
   public void setpro (int index, String pro) {
      this.pro.add(index,pro);
   }
   public void setgro (int index,int gro) {
      this.gro.add(index,gro);
   }
   public String[] getsubject() {
      return subject.toArray(new String[subject.size()]);
   }
   public String[] getpro() {
      return pro.toArray(new String[pro.size()]);
   }
   public Integer[] getgro() {
      return gro.toArray(new Integer[gro.size()]);
   }
   public int getsize() {
      return subject.size();
   }
}