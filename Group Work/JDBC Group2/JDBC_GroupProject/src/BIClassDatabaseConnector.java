
/**
 * Connector for BIClass database
 * @author Oliver
 */
public class BIClassDatabaseConnector extends Connector {
	/**
	 * Constructor that passes specific database name to Connector
	 */
	public BIClassDatabaseConnector() {
		super("BIClass;");	
	}
	
	/**
	 * Prints database name
	 * @return void
	 */
	@Override
	void printDatabaseName() {
		System.out.println("BIClass");
	}
}
