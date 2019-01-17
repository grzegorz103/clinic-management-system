package bartek.io.controllers;

import bartek.io.models.Operation;
import bartek.io.models.PricePojo;
import bartek.io.services.OperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping ("/operation")
public class OperationController
{
        @Autowired
        private OperationService operationService;

        @GetMapping ("/prices")
        public String getPrices ( Model model )
        {
                model.addAttribute( "list", operationService.getOperationPrices() );
                model.addAttribute( "item", new PricePojo() );
                return "pricesPage";
        }

        @PostMapping ("/prices")
        @Secured ({"ROLE_PERSONEL", "ROLE_BOSS"})
        public String savePrices ( @ModelAttribute ("item") PricePojo price )
        {
                operationService.updatePrice( price );
                return "redirect:/operation/prices";
        }

        @GetMapping ("/form")
        @Secured ({"ROLE_PERSONEL", "ROLE_BOSS"})
        public String operationForm ( Model model )
        {
                model.addAttribute( "operation", new Operation() );
                return "operationPage";
        }

        @PostMapping ("/form")
        @Secured ({"ROLE_PERSONEL", "ROLE_BOSS"})
        public String saveOperation ( @ModelAttribute ("operation") Operation operation )
        {
                operationService.save( operation );
                return "redirect:/";
        }


}
