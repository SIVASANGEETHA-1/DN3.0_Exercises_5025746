import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookController {
    @Autowired
    private BookMetrics bookMetrics;

    @PostMapping("/books/{id}/buy")
    public String buyBook(@PathVariable Long id) {
        // Simulate buying a book
        bookMetrics.incrementBooksSold();
        return "Book bought successfully!";
    }
}