package lk.acpt.future_bank.service;



import java.sql.SQLException;

public interface TransactionService {


    public boolean transferMoney(String fromAccount, String toAccount, double amount)
            throws SQLException, ClassNotFoundException;
}
