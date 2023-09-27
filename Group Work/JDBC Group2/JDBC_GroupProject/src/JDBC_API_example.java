
public class JDBC_API_example {

	public static void main(String[] args) {
		
		//Northwinds2020TSQLV7DatabaseFactory
		//WideWorldImportersDatabaseFactory
		//PrestigeCarsDatabaseFactory
		//AdventureWorksDW2017DatabaseFactory
		//AdventureWorks2017DatabaseFactory
		//BIClassDatabaseFactory
		
		DatabaseFactory database = new BIClassDatabaseFactory();
		Connector connector = database.connectToDatabase();
		QuerySelector querySelector = database.executeQuery(connector,
				
				"USE [QueensClassScheduleCurrentSemester]\r\n"
				+ "EXEC [Process].[usp_ShowWorkFlowSteps]");
		
	}
	
	
}
