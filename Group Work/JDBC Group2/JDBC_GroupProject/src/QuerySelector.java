import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * 	QuerySelector Selects a query to execute.
 *  @author Almon
 */
public abstract class QuerySelector {
	
	/**
	 * Constructor that uses already established connection to query a database
	 * @param  con  Connector for connecting to a database
	 * @param  query  Query to be executed
	 * @return A AdventureWorks2017Connector type 
	 */
	public JTable_Database jt = new JTable_Database();
	public ArrayList<ArrayList<String>> fullTable = new ArrayList<ArrayList<String>>();
	
	
	protected QuerySelector(Connector con, String query) {
		try (Statement stmt = con.getConnection().createStatement();) {

	        boolean results = stmt.execute(query);
	        int rsCount = 0;
	        do {
	            if (results) {

	            	ResultSet rs = stmt.getResultSet();
	            	ResultSetMetaData rsmd = rs.getMetaData();
	            	getColumn(rsmd);
	            
	                while (rs.next()) {
	                	fullTable.add(new ArrayList<>());
	        			for (int i = 1; i <= rsmd.getColumnCount(); i++){;
	        				fullTable.get(rsCount).add(rs.getString(i));
	        				System.out.print(rs.getString(i) + "\t\t");
	        			}
	        			
	        			System.out.println();
	        			rsCount++;
	                }
	            }
	            results = stmt.getMoreResults();
	        } while (results);
	        jt.draw(fullTable);
	    }
	    // Handle any errors that may have occurred.
	    catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	}
	
	/**
	 * Private function that retrieves the columns selected from the query
	 * @param	rsmd  An object that can be used to get information about the types and properties of the columns in a ResultSet object.
	 * @throws SQLException
	 * @return void
	 */
	public void getColumn(ResultSetMetaData rsmd) throws SQLException{
		// Getting the list of COLUMN Names
		
		
		for ( int i=1; i <= rsmd.getColumnCount(); i++){
			jt.addColTitles(rsmd.getColumnName(i));
			System.out.print(rsmd.getColumnName(i) + "\t\t|");
		}
		System.out.println("");
	}
}
