package bartek.io.services;

import bartek.io.models.Review;

import java.util.List;

public interface ReviewService
{
        void addReview ( Review review );

        List<Review> getAll();
}
