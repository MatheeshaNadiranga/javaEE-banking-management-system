package lk.acpt.future_bank.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TransactionDetails {
    String sendersAccountNumber;
    String receiversAccountNumber;

    double amount;

}
