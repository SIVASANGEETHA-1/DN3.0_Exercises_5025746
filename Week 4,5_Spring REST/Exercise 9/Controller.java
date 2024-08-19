import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookController {
    @GetMapping("/books/{id}")
    public EntityModel<Book> getBook(@PathVariable Long id) {
        Book book = bookService.getBook(id);
        return book.toModel();
    }

    @GetMapping("/authors/{id}")
    public EntityModel<Author> getAuthor(@PathVariable Long id) {
        Author author = authorService.getAuthor(id);
        return author.toModel();
    }

    @GetMapping("/publishers/{id}")
    public EntityModel<Publisher> getPublisher(@PathVariable Long id) {
        Publisher publisher = publisherService.getPublisher(id);
        return publisher.toModel();
    }
}