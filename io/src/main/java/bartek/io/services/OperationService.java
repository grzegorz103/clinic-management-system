package bartek.io.services;

import bartek.io.models.Operation;
import bartek.io.models.PricePojo;
import bartek.io.models.Visit;

import java.util.List;

public interface OperationService
{
        List<Operation> getOperationPrices ();

        void updatePrice ( PricePojo price );

        void save ( Operation operation );
}
