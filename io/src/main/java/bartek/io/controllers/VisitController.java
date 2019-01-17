package bartek.io.controllers;

import bartek.io.models.Visit;
import bartek.io.services.OperationService;
import bartek.io.services.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.DecimalFormat;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@RequestMapping ("/visit")
public class VisitController
{
        @Autowired
        private VisitService visitService;

        @Autowired
        private OperationService operationService;


        @GetMapping ("/form")
        @Secured ("ROLE_USER")
        public String getVisitForm ( Model model )
        {
                model.addAttribute( "visit", new Visit() );
                model.addAttribute( "list", operationService.getOperationPrices() );
                model.addAttribute( "personel", visitService.getPersonel() );
                model.addAttribute( "hours", IntStream.rangeClosed( 8, 15 ).boxed().collect( Collectors.toList() ) );
                return "visitPage";
        }

        @PostMapping ("/form")
        @Secured ("ROLE_USER")
        public String saveVisit ( @ModelAttribute ("visit") Visit visit )
        {
                visitService.saveVisit( visit );
                return "redirect:/";
        }

        @GetMapping ("/my")
        @Secured ("ROLE_USER")
        public String getVisits ( Model model )
        {
                model.addAttribute( "list", visitService.getUserVisits() );
                return "visitList";
        }


        @GetMapping ("/history")
        @Secured ("ROLE_PERSONEL")
        public String getHistory ( Model model )
        {
                model.addAttribute( "list", visitService.getVisitsByPersonel() );
                return "historyPage";
        }

        @GetMapping ("/status/{id}")
        @Secured ("ROLE_PERSONEL")
        public String changeStatus ( @PathVariable ("id") Visit visit )
        {
                visitService.changeStatus( visit );
                return "redirect:/visit/history";
        }

        @InitBinder
        public void initBinder ( WebDataBinder binder )
        {
                binder.addCustomFormatter( new DateFormatter( "yyyy-MM-dd" ) );
        }
}
