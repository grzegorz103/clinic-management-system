package bartek.io.services;

import bartek.io.models.User;
import bartek.io.models.Visit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Set;

public interface VisitService
{
        void saveVisit ( Visit visit );

        List<Visit> getUserVisits ();

        List<Visit> getVisitsByPersonel ();

        void changeStatus ( Visit visit );

        Set<User> getPersonel ();

        Page<Visit> getAllVisits ( String phrase, Pageable pageable );
}
