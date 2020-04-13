package ru.itis.psyhelp.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.LinkedList;
import java.util.List;

@Builder
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "acc_id")
    private Account author;

    @Column(name = "published_at")
    private LocalDateTime publishedAt;

    private String title;

    @Lob
    private String content;

    @OneToMany
    private List<Comment> comments = new LinkedList<>();
}
