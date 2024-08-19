import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookController {
    @GetMapping("/books/{id}")
    public Book getBook(@PathVariable Long id) {
        // Return a Book object
    }
}