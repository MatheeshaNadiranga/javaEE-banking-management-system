package lk.acpt.future_bank.service;

import lk.acpt.future_bank.dto.BankAccounts;

import java.util.List;

public interface AccountsService {
    boolean createAccount(BankAccounts account);
    boolean deleteAccount(int accountNumber);
    boolean updateAccount(BankAccounts account);
    BankAccounts searchAccount(int accountNumber);
    List<BankAccounts> getAccounts();
}
