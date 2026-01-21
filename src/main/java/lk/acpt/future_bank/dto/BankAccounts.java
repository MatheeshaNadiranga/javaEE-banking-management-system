package lk.acpt.future_bank.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BankAccounts {
    String name;
    int age;
    String idNumber;
    int accountNumber;
    double balance;
    String address;
}
