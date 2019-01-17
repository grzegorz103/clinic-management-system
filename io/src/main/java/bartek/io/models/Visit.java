package bartek.io.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Future;
import java.util.Date;

@Entity
@Table (name = "visits")
@Getter
@Setter
@NoArgsConstructor
public class Visit
{
        @Id
        @GeneratedValue (strategy = GenerationType.IDENTITY)
        private Long id;

        @ManyToOne (fetch = FetchType.EAGER)
        @JoinColumn (name = "operation_id")
        private Operation operation;

        @ManyToOne (fetch = FetchType.EAGER)
        @JoinColumn (name = "user_id")
        private User user;

        @Column (name = "hour")
        private Long hour;

        @Column (name = "status")
        private String status;

        @ManyToOne (fetch = FetchType.EAGER)
        @JoinColumn (name = "personel_id")
        private User personel;

        @Temporal (TemporalType.DATE)
        @Column (name = "visit_date")
        private Date date;
}
