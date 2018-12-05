using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.OleDb;
using System.Web;
using System.Data;

// Class that handles the modification of the database by pushing data to the MS Access database.
public class DataBase
{
    private OleDbConnection connection = new OleDbConnection();
    private OleDbCommand command = new OleDbCommand();

    // Connects to the database.
    public void ConnectToDB() {
        connection.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\inetpub\wwwroot\Thorondor_0061072712\Database\Maxwells.accdb;";
        connection.Open();
    }

    // Closes the connection to the datbase.
    public void CloseDB() {
        connection.Close();
    }

    // Counts the number of rows currently present in the database table, using input parameters.
    public int RowCount(string column, string table) {
        int count = 0;
        command.Connection = connection;
        command.CommandText = "SELECT count(" + column + ") FROM " + table;
        count = (int)command.ExecuteScalar();
        return count;
    }

    // Calculates the maximum integer value of the specified column.
    public int ColumnMaxValue(string column, string table) {
        int count = 0;
        command.Connection = connection;
        command.CommandText = "SELECT MAX(" + column + ") FROM " + table;
        count = (int)command.ExecuteScalar();
        return count;
    }

    // Creates a new blank row in the database table.
    public void CreateRow(string table, int colID) {
        command.Connection = connection;
        command.CommandText = "INSERT INTO " + table + "(ColumnID) values ('" + colID + "')";
        command.ExecuteNonQuery();
    }

    // Creates a new blank row in the linked Order database table.
    public void CreateOrderRow(string table, string column, int colID) {
        command.Connection = connection;
        command.CommandText = "INSERT INTO " + table + "(" + column + ") values ('" + colID + "')";
        command.ExecuteNonQuery();
    }

    // Creates a new blank row in the linked OrderDetails database table.
    public void CreateOrderDetailsRow(string table, string column1, string column2, string column3, string column4, int colID, string colID2, int colID3, int colID4) {
        command.Connection = connection;
        command.CommandText = "INSERT INTO " + table + "(" + column1 + "," + column2 + "," + column3 + "," + column4 + ") values (" + colID +  ", '" + colID2 + "' ," + colID3 + "," + colID4 + ")";
        command.ExecuteNonQuery();
    }

    // Inserts/Updates string data to the database.
    public void InsertStringData(string table, string rowId, int rowCount, string column, string value) {
        command.Connection = connection;
        command.CommandText = "UPDATE " + table + " SET " + column + "= '" + value + "' WHERE " + rowId + "=" + rowCount;
        command.ExecuteNonQuery();
    }

    // Inserts/Updates int data to the database
    public void InsertIntData(string table, string rowId, int rowCount, string column, int value) {
        command.Connection = connection;
        command.CommandText = "UPDATE " + table + " SET " + column + "=" + value + " WHERE " + rowId + "=" + rowCount;
        command.ExecuteNonQuery();
    }

    // Inserts/Updates double data to the database
    public void InsertDoubleData(string table, string rowId, int rowCount, string column, double value) {
        command.Connection = connection;
        command.CommandText = "UPDATE " + table + " SET " + column + "=" + value + " WHERE " + rowId + "=" + rowCount;
        command.ExecuteNonQuery();
    }

    // Inserts/Updates datetime data to the database
    public void InsertDatetimeData(string table, string rowId, int rowCount, string column, DateTime value) {
        command.Connection = connection;
        command.CommandText = "UPDATE " + table + " SET " + column + "=" + value + " WHERE " + rowId + "=" + rowCount;
        command.ExecuteNonQuery();
    }
}