package bartek.io.models;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table (name = "addresses")
@Data
@NoArgsConstructor
public class Address
{
        @Id
        @GeneratedValue (strategy = GenerationType.IDENTITY)
        private Long id;

        @Column (name = "city")
        private String city;

        @Column (name = "street")
        private String street;

        @Column (name = "house_number")
        private String house_number;

        @Column (name = "postcode")
        private String postcode;
}