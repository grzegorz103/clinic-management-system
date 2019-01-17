package bartek.io.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table (name = "operations")
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class Operation
{
        @Id
        @GeneratedValue (strategy = GenerationType.IDENTITY)
        private Long id;

        @Column (name = "name")
        private String name;

        @Column (name = "price")
        private Long price;
}
