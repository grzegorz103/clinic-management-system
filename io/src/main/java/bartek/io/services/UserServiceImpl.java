package bartek.io.services;

import bartek.io.models.Role;
import bartek.io.models.User;
import bartek.io.repositories.RoleRepository;
import bartek.io.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashSet;

@Service ("userService")
public class UserServiceImpl implements UserService
{
        @Autowired
        private UserRepository userRepository;

        @Autowired
        RoleRepository roleRepository;

        @Autowired
        private PasswordEncoder passwordEncoder;

        @Override
        public void save ( User user )
        {
                user.setRoles( new HashSet<>( Arrays.asList( roleRepository.findRoleByUserType( Role.UserTypes.ROLE_USER ) ) ) );
                user.setEnabled( true );
                user.setPassword( passwordEncoder.encode( user.getPassword() ) );
                userRepository.save( user );
        }

        @Override
        public UserDetails loadUserByUsername ( String s ) throws UsernameNotFoundException
        {
                bartek.io.models.User user = userRepository.findByUsername( s );
                if ( user == null )
                        throw new UsernameNotFoundException( s );

                return user;
        }
}
