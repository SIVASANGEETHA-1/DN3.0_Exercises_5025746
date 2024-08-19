import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.Link;

public class Book {
    private Long id;
    private String title;
    private Author author;
    private Publisher publisher;

    // getters and setters

    public EntityModel<Book> toModel() {
        EntityModel<Book> model = EntityModel.of(this);
        model.add(Link.of("/books/" + id).withSelfRel());
        model.add(Link.of("/authors/" + author.getId()).withRel("author"));
        model.add(Link.of("/publishers/" + publisher.getId()).withRel("publisher"));
        return model;
    }
}