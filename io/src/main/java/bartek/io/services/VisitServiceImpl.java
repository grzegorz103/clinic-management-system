package bartek.io.services;

import bartek.io.models.Constants;
import bartek.io.models.Role;
import bartek.io.models.User;
import bartek.io.models.Visit;
import bartek.io.repositories.RoleRepository;
import bartek.io.repositories.UserRepository;
import bartek.io.repositories.VisitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service ("visitService")
public class VisitServiceImpl implements VisitService
{
        @Autowired
        VisitRepository visitRepository;

        @Autowired
        UserRepository userRepository;

        @Autowired
        RoleRepository roleRepository;

        @Override
        public void saveVisit ( Visit visit )
        {
                User user = ( User ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                visit.setUser( user );
                visit.setDate( new Date() );
                visit.setStatus( Constants.NOT_DONE );
                visitRepository.save( visit );
        }

        @Override
        public List<Visit> getUserVisits ()
        {
                User user = ( User ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                return visitRepository.findAllByUser( user );
        }

        @Override
        public List<Visit> getVisitsByPersonel ()
        {
                User user = ( User ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                return visitRepository.findAllByPersonel( user );
        }

        @Override
        public void changeStatus ( Visit visit )
        {
                visit.setStatus( visit.getStatus().equals( Constants.NOT_DONE ) ?
                        Constants.DONE : Constants.NOT_DONE );
                visitRepository.save( visit );
        }

        @Override
        public Set<User> getPersonel ()
        {
                return roleRepository
                        .findRoleByUserType( Role.UserTypes.ROLE_PERSONEL )
                        .getUsers();
        }

        @Override
        public Page<Visit> getAllVisits ( String phrase, Pageable pageable )
        {
                return visitRepository.findAllBySearch( phrase, pageable );
        }

}
