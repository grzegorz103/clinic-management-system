package bartek.io.controllers;

import bartek.io.models.Review;
import bartek.io.models.User;
import bartek.io.services.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping ("/review")
public class ReviewController
{
        @Autowired
        private ReviewService reviewService;

        @GetMapping ("/form")
        @Secured ("ROLE_USER")
        public String reviewForm ( Model model )
        {
                model.addAttribute( "review", new Review() );
                return "reviewForm";
        }

        @PostMapping ("/form")
        @Secured ("ROLE_USER")
        public String reviewAdd ( Model model,
                                  @RequestParam ("user") User user,
                                  @RequestParam ("personel") User personel,
                                  @ModelAttribute ("review") Review review )
        {
                review.setPatient( user );
                review.setPersonel( personel );
                reviewService.addReview( review );
                return "redirect:/";
        }

        @GetMapping ("/all")
        @Secured ("ROLE_BOSS")
        public String getAllReviews ( Model model )
        {
                model.addAttribute( "list", reviewService.getAll() );
                return "reviewPage";
        }
}
