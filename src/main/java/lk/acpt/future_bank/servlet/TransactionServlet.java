package lk.acpt.future_bank.servlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.acpt.future_bank.dto.TransactionDetails;
import lk.acpt.future_bank.service.TransactionService;
import lk.acpt.future_bank.service.impl.TransactionServiceImpl;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/transactions")
public class TransactionServlet extends HttpServlet {

    private final Gson gson = new Gson();
    private final TransactionService transactionService = new TransactionServiceImpl();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");

        try {
            TransactionDetails transaction =
                    gson.fromJson(req.getReader(), TransactionDetails.class);

            boolean success = transactionService.transferMoney(
                    transaction.getSendersAccountNumber(),
                    transaction.getReceiversAccountNumber(),
                    transaction.getAmount()
            );

            resp.getWriter().write(
                    gson.toJson(success
                            ? "Transaction successful"
                            : "Transaction failed")
            );

        } catch (SQLException | ClassNotFoundException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write(gson.toJson("Server error"));
        }
    }
}
