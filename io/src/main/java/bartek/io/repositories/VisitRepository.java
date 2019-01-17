package bartek.io.repositories;

import bartek.io.models.Transaction;
import bartek.io.models.User;
import bartek.io.models.Visit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface VisitRepository extends JpaRepository<Visit, Long>
{
        List<Visit> findAllByUser ( User user );

        List<Visit> findAllByPersonel ( User user );

        @Query ("select v from Visit v where " +
                "(" +
                ":phrase is null OR :phrase = '' OR " +
                "lower(v.user.name) = :phrase OR " +
                "lower(v.user.surname) = :phrase)")
        Page<Visit> findAllBySearch ( @Param ("phrase") String phrase, Pageable pageable );

        boolean existsByUser ( User user );
}
