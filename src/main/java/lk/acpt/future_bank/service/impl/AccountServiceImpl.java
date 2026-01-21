package lk.acpt.future_bank.service.impl;

import lk.acpt.future_bank.db.DBConnection;
import lk.acpt.future_bank.dto.BankAccounts;
import lk.acpt.future_bank.service.AccountsService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountServiceImpl implements AccountsService {


    @Override
    public boolean createAccount(BankAccounts account) {
        try {
            Connection connection = DBConnection.getDbConnection().getConnection();
            PreparedStatement stm = connection.prepareStatement("INSERT INTO accounts(name,age,nic,account_number,balance,address) VALUES (?,?,?,?,?,?)");
            stm.setObject(1, account.getName());
            stm.setObject(2, account.getAge());
            stm.setObject(3, account.getIdNumber());
            stm.setObject(4, account.getAccountNumber());
            stm.setObject(5, account.getBalance());
            stm.setObject(6, account.getAddress());

            int i = stm.executeUpdate();

            if (i > 0) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteAccount(int accountNumber) {
        try {
            Connection connection = DBConnection.getDbConnection().getConnection();
            PreparedStatement stm = connection.prepareStatement("DELETE FROM accounts WHERE account_number = ?");
            stm.setObject(1, accountNumber);

            int i = stm.executeUpdate();
            if (i > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public boolean updateAccount(BankAccounts account) {
        try {
            Connection connection = DBConnection.getDbConnection().getConnection();
            PreparedStatement stm = connection.prepareStatement(
                    "UPDATE accounts SET name=?, age=?, nic=?, address=? WHERE account_number=?");

            stm.setObject(1, account.getName());
            stm.setObject(2, account.getAge());
            stm.setObject(3, account.getIdNumber());
            stm.setObject(4, account.getAddress());
            stm.setObject(5, account.getAccountNumber());

            int i = stm.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public BankAccounts searchAccount(int accountNumber) {
        try {
            Connection connection = DBConnection.getDbConnection().getConnection();
            PreparedStatement stm = connection.prepareStatement("SELECT * FROM accounts WHERE account_number = ?");
            stm.setObject(1, accountNumber);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new BankAccounts(
                        rs.getString("name"),
                        rs.getInt("age"),
                        rs.getString("nic"),
                        rs.getInt("account_number"),
                        rs.getDouble("balance"),
                        rs.getString("address")
                );
            }else{
                return null;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<BankAccounts> getAccounts() {
        List<BankAccounts> list = new ArrayList<>();
        try{
            Connection connection = DBConnection.getDbConnection().getConnection();
            PreparedStatement stm = connection.prepareStatement("SELECT * FROM accounts");

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BankAccounts accounts = new BankAccounts(
                        rs.getString("name"),
                        rs.getInt("age"),
                        rs.getString("nic"),
                        rs.getInt("account_number"),
                        rs.getDouble("balance"),
                        rs.getString("address")
                );
                list.add(accounts);

            }
            return list;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


    }
}
