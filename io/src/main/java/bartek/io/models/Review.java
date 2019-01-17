package bartek.io.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table (name = "reviews")
@Getter
@Setter
@NoArgsConstructor
public class Review
{
        @Id
        @GeneratedValue (strategy = GenerationType.IDENTITY)
        private Long id;

        @ManyToOne (fetch = FetchType.EAGER)
        @JoinColumn (name = "personel_id")
        private User personel;

        @ManyToOne (fetch = FetchType.EAGER)
        @JoinColumn (name = "patient_id")
        private User patient;

        @Column (name = "rating")
        private Long rating;

        @Column (name = "text")
        private String text;

        @Temporal (TemporalType.DATE)
        @Column (name = "review_date")
        private Date date;


}
