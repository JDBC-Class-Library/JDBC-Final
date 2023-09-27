

import java.awt.Color;
import java.awt.Font;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class JTable_Database {

Vector<String> colTitles = new Vector<String>(); 


public void addColTitles(String o) {
	colTitles.add(o); 
}

/**
 * @wbp.parser.entryPoint
 */
public void draw(ArrayList<ArrayList<String>> fullTable ) {
	
	
	JTable table = new JTable();
	DefaultTableModel model = new DefaultTableModel();
	JFrame frame = new JFrame("DatabaseResult"); 
	frame.getContentPane().setBackground(new Color(0,0,0));
	frame.getContentPane().setForeground(Color.WHITE);
	frame.setBounds(100,100,1037,664);
	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	frame.getContentPane().setLayout(null);
	frame.setLocationRelativeTo(null);

	frame.setVisible(true);
	model.setColumnIdentifiers(colTitles);
	table.setModel(model);
	table.setBackground(Color.white);
	table.setForeground(Color.BLACK);
	table.setSelectionBackground(Color.red);
	table.setGridColor(Color.black);
	table.setSelectionForeground(Color.white);
	table.setFont(new Font("Tahoma", Font.PLAIN, 14));
	table.setRowHeight(30);
	table.setAutoCreateRowSorter(true);
	
	JScrollPane pane = new JScrollPane(table);
	pane.setForeground(Color.RED);
	pane.setBackground(Color.white);
	pane.setBounds(10,10,997,594);
	
	frame.add(pane);
	

	Vector<Vector<String>> tempObjRow = new Vector<>();

	for(int i=0;i<fullTable.size();i++) {
		
		tempObjRow.add(new Vector<>());
		
		for(int j=0; j < fullTable.get(i).size(); j++) {

				tempObjRow.get(i).add(j,fullTable.get(i).get(j));
		
		}
	
		model.addRow(tempObjRow.get(i));
		
	}


	
	
	
}



	
	
}
