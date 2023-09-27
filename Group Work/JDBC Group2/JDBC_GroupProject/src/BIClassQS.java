/**
 * 	BIClasss QS Selects a query to execute from AdventureWorks2017 database.
 *  @author Almon
 */
public class BIClassQS extends QuerySelector {
	/**
	 * constructor for BIClassQS that calls QuerySelector's constructor
	 * @param con A Connector type for already established connection
	 * @param query A String type for querying a database
	 */
	public BIClassQS(Connector con, String query) {
		super(con, query);
	}


}
