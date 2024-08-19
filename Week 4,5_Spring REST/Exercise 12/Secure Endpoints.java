import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookController {
    @GetMapping("/books")
    @Secured("ROLE_USER")
    public List<Book> getBooks() {
        // Return a list of books
    }
}