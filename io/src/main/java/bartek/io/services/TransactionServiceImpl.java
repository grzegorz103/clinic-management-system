package bartek.io.services;

import bartek.io.models.Constants;
import bartek.io.models.Transaction;
import bartek.io.models.Visit;
import bartek.io.repositories.TransactionRepository;
import bartek.io.repositories.VisitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service ("transactionService")
public class TransactionServiceImpl implements TransactionService
{
        @Autowired
        private TransactionRepository transactionRepository;

        @Autowired
        private VisitRepository visitRepository;

        @Override
        public void pay ( Visit visit )
        {
                Transaction transaction = new Transaction();
                transaction.setStatus( Constants.PAID );
                transaction.setVisit( visit );
                transaction.setUser( visit.getUser() );
                transaction.setDate( new Date() );
                transactionRepository.save( transaction );

                visit.setStatus( Constants.PAID );
                visitRepository.save( visit );
        }

        @Override
        public List<Transaction> getTransactions ()
        {
                return transactionRepository.findAll();
        }

        @Override
        public long getSum ()
        {
                return transactionRepository.findAll()
                        .stream()
                        .mapToLong( e -> e.getVisit().getOperation().getPrice() )
                        .sum();
        }
}