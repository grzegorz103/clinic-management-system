package bartek.io.controllers;

import bartek.io.models.Visit;
import bartek.io.repositories.VisitRepository;
import bartek.io.services.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping ("/transaction")
@SessionAttributes ("search")
public class TransactionController
{
        @Autowired
        private TransactionService transactionService;

        @Autowired
        private VisitRepository visitRepository;

        @ModelAttribute ("search")
        public SearchFilter getSearchFilter ()
        {
                return new SearchFilter();
        }

        @GetMapping ("/pay/{id}")
        @Secured ("ROLE_USER")
        public String payVisit ( @PathVariable ("id") Visit visit )
        {
                transactionService.pay( visit );
                return "redirect:/visit/my";
        }


        @RequestMapping ("/summary")
        @Secured ("ROLE_BOSS")
        public String summary ( Model model,
                                Pageable pageable,
                                @ModelAttribute ("search") SearchFilter searchFilter )
        {
                model.addAttribute( "list", transactionService.getTransactions() );
                model.addAttribute( "history", visitRepository.findAllBySearch( searchFilter.getPhrase(), pageable ) );
                model.addAttribute( "sum", transactionService.getSum() );
                return "transactionPage";
        }

        @GetMapping ("/clear")
        @Secured ("ROLE_BOSS")
        public String clear ( @ModelAttribute ("search") SearchFilter searchFilter )
        {
                searchFilter.setPhrase( "" );
                return "redirect:/transaction/summary";
        }
}
