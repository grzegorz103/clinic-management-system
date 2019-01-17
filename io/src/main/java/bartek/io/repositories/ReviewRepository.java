package bartek.io.repositories;

import bartek.io.models.Review;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewRepository extends JpaRepository<Review, Long>
{
}
