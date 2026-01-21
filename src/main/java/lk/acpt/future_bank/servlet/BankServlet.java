package lk.acpt.future_bank.servlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.acpt.future_bank.dto.BankAccounts;
import lk.acpt.future_bank.service.AccountsService;
import lk.acpt.future_bank.service.impl.AccountServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/accounts")
public class BankServlet extends HttpServlet {

    private final Gson gson = new Gson();
    private final AccountsService accountsService = new AccountServiceImpl();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");

        String account = req.getParameter("account");

        if (account == null || account.isEmpty()) {

            List<BankAccounts> allAccounts = accountsService.getAccounts();
            resp.getWriter().write(gson.toJson(allAccounts));
        } else {

            BankAccounts bankAccount =
                    accountsService.searchAccount(Integer.parseInt(account));
            resp.getWriter().write(gson.toJson(bankAccount));
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");

        BankAccounts account =
                gson.fromJson(req.getReader(), BankAccounts.class);

        boolean isSaved = accountsService.createAccount(account);

        resp.getWriter().write(
                gson.toJson(isSaved
                        ? "Account created successfully"
                        : "Account creation failed")
        );
    }


    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");

        BankAccounts account =
                gson.fromJson(req.getReader(), BankAccounts.class);

        boolean isUpdated = accountsService.updateAccount(account);

        resp.getWriter().write(
                gson.toJson(isUpdated
                        ? "Account updated successfully"
                        : "Account update failed")
        );
    }


    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");

        String account = req.getParameter("account");

        boolean isDeleted =
                accountsService.deleteAccount(Integer.parseInt(account));

        resp.getWriter().write(
                gson.toJson(isDeleted
                        ? "Account deleted successfully"
                        : "Account deletion failed")
        );
    }
}
