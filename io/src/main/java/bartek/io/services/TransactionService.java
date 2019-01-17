package bartek.io.services;

import bartek.io.models.Transaction;
import bartek.io.models.Visit;

import java.util.List;

public interface TransactionService
{
        void pay ( Visit visit );

        List<Transaction> getTransactions();

        long getSum();
}
