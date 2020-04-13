package ru.itis.psyhelp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.psyhelp.exceptions.MsgNotFoundException;
import ru.itis.psyhelp.models.Account;
import ru.itis.psyhelp.models.Comment;
import ru.itis.psyhelp.models.Message;
import ru.itis.psyhelp.repository.CommentRepository;
import ru.itis.psyhelp.repository.MessageRepository;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private CommentRepository commentRepository;

    public void createMessage(Account author, Message message) {
        Message message1 = Message.builder()
                .author(author)
                .title(message.getTitle())
                .publishedAt(LocalDateTime.now())
                .content(message.getContent())
                .build();
        messageRepository.save(message1);
    }

    public List<Message> findAll() {
        return messageRepository.findAll();
    }

    public Message findById(Long id) {
        return messageRepository.findById(id).orElseThrow(RuntimeException::new);
    }

    public void deleteMessage(Message message) {
        messageRepository.delete(message);
    }

    @Transactional
    public List<Message> findMessageByUser(Account account) {
        return messageRepository.findByAuthor(account);
    }

    public Comment createComment(String content, Account author, Long msgId) throws MsgNotFoundException {
        Optional<Message> msg = messageRepository.findById(msgId);

        Comment comment = Comment.builder()
                .author(author)
                .content(content)
                .publishedAt(LocalDateTime.now())
                .message(msg.orElseThrow(MsgNotFoundException::new))
                .build();
        commentRepository.save(comment);

        msg.get().getComments().add(comment);
        messageRepository.save(msg.get());

        return comment;
    }
}
