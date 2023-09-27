import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.*;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
//import com.mysql.cj.jdbc.result.ResultSetMetaData;
public class ProjectQueries {

	public static void main (String args[]) throws Exception {
		//System.out.println("Sanity check.");
		String user = "sa";
		String password = "123456a@";
		String url = "jdbc:sqlserver://localhost\\dbclass:1433;databaseName=QueensClassScheduleCurrentSemester;encrypt=false;";
		
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");		
		DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
		
    	Connection con = DriverManager.getConnection(url,user,password);
        System.out.println("Success");
        
        //Query for those comp sci students who would like to take a class that isn't in the science building.
//        String query1 = "SELECT A.CourseID,[CourseCode],[CourseName], [CourseDescription],E.FullName, B.RoomId, C.BuildingID, D.BuildingCode, D.BuildingName\r\n" + 
//        		"FROM [QueensClassScheduleCurrentSemester].[Enrollment].[Course] A\r\n" + 
//        		"JOIN [QueensClassScheduleCurrentSemester].[Enrollment].[Class] B ON A.CourseID = B.CourseId \r\n" + 
//        		"JOIN [QueensClassScheduleCurrentSemester].[Location].[Room] C ON B.RoomID = C.RoomID\r\n" + 
//        		"JOIN [QueensClassScheduleCurrentSemester].[Location].[Building] D ON C.BuildingID = D.BuildingID\r\n" + 
//        		"JOIN [QueensClassScheduleCurrentSemester].[HR].[Instructor] E ON B.InstructorID = E.InstructorID\r\n" + 
//        		"WHERE A.CourseName = 'CSCI' AND D.BuildingCode != 'SB'";
        
        //Query for those who are looking for classes only on Tuesday/Thursday or Monday/Wednesday
        String query1 = "SELECT [CourseCode],[CourseName], [CourseDescription],E.FullName, B.RoomId, D.BuildingName, C.RoomNumber, F.ClassDay\r\n" + 
        		"FROM [QueensClassScheduleCurrentSemester].[Enrollment].[Course] A\r\n" + 
        		"JOIN [QueensClassScheduleCurrentSemester].[Enrollment].[Class] B ON A.CourseID = B.CourseId \r\n" + 
        		"JOIN [QueensClassScheduleCurrentSemester].[Location].[Room] C ON B.RoomID = C.RoomID\r\n" + 
        		"JOIN [QueensClassScheduleCurrentSemester].[Location].[Building] D ON C.BuildingID = D.BuildingID\r\n" + 
        		"JOIN [QueensClassScheduleCurrentSemester].[HR].[Instructor] E ON B.InstructorID = E.InstructorID\r\n" + 
        		"JOIN [QueensClassScheduleCurrentSemester].[Schedule].[ClassDayTime] F ON B.ClassTimeID = F.ClassTimeID\r\n" + 
        		"WHERE A.CourseName = 'CSCI';";
        
        Statement st1 = con.createStatement();
        ResultSet rs1 = st1.executeQuery(query1);
        
        java.sql.ResultSetMetaData rsmd = rs1.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        int rowsNumber = 1628;
        String data[][] = new String[rowsNumber][columnsNumber+1];
        //System.out.println(rowsNumber);
        
        String[] columnNames = new String[columnsNumber+1];
        
        for (int i = 1; i <= columnsNumber; i++) {
        	columnNames[i] = rsmd.getColumnName(i);
        	//System.out.println(columnNames[i]);
        }
        
        for (int i = 1; i <= columnsNumber; i++) {
        	columnNames[i-1] = columnNames[i];
        	//System.out.println(columnNames[i]);
        }

        int row = 1;
        while (rs1.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
                //if (i > 1) System.out.print(",  ");
                String columnValue = rs1.getString(i);
                //System.out.print(columnValue);
                data[row][i-1] = columnValue;
            }
            
        	row++;
            //System.out.println("\n");
        }
        

        
        JFrame f = new JFrame();
        f.setTitle("Query 1");
       
        for (int i = 1; i < rowsNumber;i++) {
        	for (int j = 0; j < columnsNumber;j++) {
        		//System.out.print(data[i][j]);
        	}
        	//System.out.println(' ');
        }
        
        //String[] newColumnNames = new String[columnNames.length-1];
        
        JTable table = new JTable(data, columnNames);
        table.setBounds(30,40,200,300);
        
        JScrollPane sp = new JScrollPane(table);
        f.add(sp);
        f.setSize(500,200);
        f.setVisible(true);
        
        con.close();
		}
	}