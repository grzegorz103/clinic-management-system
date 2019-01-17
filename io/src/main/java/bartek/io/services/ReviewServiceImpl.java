package bartek.io.services;

import bartek.io.models.Review;
import bartek.io.repositories.ReviewRepository;
import bartek.io.repositories.VisitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service ("opinionService")
public class ReviewServiceImpl implements ReviewService
{
        @Autowired
        private ReviewRepository reviewRepository;

        @Autowired
        private VisitRepository visitRepository;

        @Override
        public void addReview ( Review review )
        {
                review.setDate( new Date() );
                if ( visitRepository.existsByUser( review.getPatient() ) )
                        reviewRepository.save( review );
        }

        @Override
        public List<Review> getAll ()
        {
                return reviewRepository.findAll();
        }
}
