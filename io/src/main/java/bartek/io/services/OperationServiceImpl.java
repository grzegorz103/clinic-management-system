package bartek.io.services;

import bartek.io.models.*;
import bartek.io.repositories.OperationRepository;
import bartek.io.repositories.VisitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service ("operationService")
public class OperationServiceImpl implements OperationService
{
        @Autowired
        private OperationRepository operationRepository;

        @Autowired
        private VisitRepository visitRepository;

        @Override
        public List<Operation> getOperationPrices ()
        {
                return operationRepository.findAll();
        }

        @Override
        public void updatePrice ( PricePojo price )
        {
                Operation operation = operationRepository.getOne( price.getId() );
                operation.setName( price.getName() );
                operation.setPrice( price.getPrice() );
                operationRepository.save( operation );
        }

        @Override
        public void save ( Operation operation )
        {
                operationRepository.save( operation );
        }
}
