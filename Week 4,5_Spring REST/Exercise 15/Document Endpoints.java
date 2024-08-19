import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "Book API")
@RestController
public class BookController {
    @ApiOperation(value = "Get all books", notes = "Returns a list of all books")
    @GetMapping("/books")
    public List<Book> getBooks() {
        // implementation
    }

    @ApiOperation(value = "Get a book by ID", notes = "Returns a book by ID")
    @GetMapping("/books/{id}")
    public Book getBookById(@PathVariable Long id) {
        // implementation
    }
}