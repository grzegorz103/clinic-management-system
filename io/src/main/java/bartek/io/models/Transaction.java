package bartek.io.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table (name = "transactions")
@NoArgsConstructor
@Getter
@Setter
public class Transaction
{
        @Id
        @GeneratedValue (strategy = GenerationType.IDENTITY)
        private Long id;

        @ManyToOne (fetch = FetchType.EAGER)
        @JoinColumn (name = "user_id")
        private User user;

        @OneToOne (fetch = FetchType.EAGER)
        @JoinColumn (name = "visit_id")
        private Visit visit;

        @Column (name = "status")
        private String status;

        @Temporal (TemporalType.DATE)
        private Date date;
}
