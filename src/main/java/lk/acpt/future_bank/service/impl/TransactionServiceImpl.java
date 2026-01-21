package lk.acpt.future_bank.service.impl;

import lk.acpt.future_bank.db.DBConnection;
import lk.acpt.future_bank.dto.BankAccounts;
import lk.acpt.future_bank.service.TransactionService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TransactionServiceImpl implements TransactionService {



    @Override
    public boolean transferMoney(String fromAccount, String toAccount, double amount)
            throws SQLException, ClassNotFoundException {

        Connection connection = DBConnection.getDbConnection().getConnection();
        connection.setAutoCommit(false);

        try {

            PreparedStatement checkBalance =
                    connection.prepareStatement(
                            "SELECT balance FROM accounts WHERE account_number = ?");

            checkBalance.setString(1, fromAccount);
            ResultSet rs = checkBalance.executeQuery();

            if (!rs.next() || rs.getDouble("balance") < amount) {
                connection.rollback();
                return false;
            }


            PreparedStatement withdraw =
                    connection.prepareStatement(
                            "UPDATE accounts SET balance = balance - ? WHERE account_number = ?");

            withdraw.setDouble(1, amount);
            withdraw.setString(2, fromAccount);


            PreparedStatement deposit =
                    connection.prepareStatement(
                            "UPDATE accounts SET balance = balance + ? WHERE account_number = ?");

            deposit.setDouble(1, amount);
            deposit.setString(2, toAccount);

            int w = withdraw.executeUpdate();
            int d = deposit.executeUpdate();

            if (w > 0 && d > 0) {


                PreparedStatement insertTransaction =
                        connection.prepareStatement(
                                "INSERT INTO transactions (from_account, to_account, amount) VALUES (?, ?, ?)");

                insertTransaction.setString(1, fromAccount);
                insertTransaction.setString(2, toAccount);
                insertTransaction.setDouble(3, amount);

                insertTransaction.executeUpdate();

                connection.commit();
                return true;
            } else {
                connection.rollback();
                return false;
            }

        } catch (SQLException e) {
            connection.rollback();
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }
}
