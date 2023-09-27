
/**
 * 	AdventureWorks2017 database factory
 *  @author Almon
 */
public class BIClassDatabaseFactory implements DatabaseFactory{

	/**
	 * Connects an BIClass database to a server.
	 * @return A BIClassConnector type 
	 */
	@Override
	public Connector connectToDatabase() {
			return new BIClassDatabaseConnector();
	}


	/**
	 * Executes a query string
	 * @param con   The Connector to get the connection for this BIClass database.
	 * @param query The query to be executed.
	 * @return A BIClassQS type 
	 */
	@Override
	public QuerySelector executeQuery(Connector con, String query) {
		return new BIClassQS(con, query);
	}









}
