package lk.acpt.future_bank.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountCreationDetails {
    int id;
    String date;
    String accountNumber;
    String name;
}
