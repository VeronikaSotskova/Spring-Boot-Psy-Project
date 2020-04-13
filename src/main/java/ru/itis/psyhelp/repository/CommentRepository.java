package ru.itis.psyhelp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.itis.psyhelp.models.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
}
