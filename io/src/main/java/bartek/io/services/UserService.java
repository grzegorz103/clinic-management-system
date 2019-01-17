package bartek.io.services;

import bartek.io.models.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService
{
        void save(User user);
}
