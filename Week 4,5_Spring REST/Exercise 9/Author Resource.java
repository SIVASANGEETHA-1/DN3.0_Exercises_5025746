import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.Link;

public class Author {
    private Long id;
    private String name;
    private List<Book> books;

    // getters and setters

    public EntityModel<Author> toModel() {
        EntityModel<Author> model = EntityModel.of(this);
        model.add(Link.of("/authors/" + id).withSelfRel());
        model.add(Link.of("/authors/" + id + "/books").withRel("books"));
        return model;
    }
}