package bartek.io.repositories;

import bartek.io.models.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long>
{
        Role findRoleByUserType ( Role.UserTypes type );
}
