import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.Link;

public class Publisher {
    private Long id;
    private String name;
    private List<Book> books;

    // getters and setters

    public EntityModel<Publisher> toModel() {
        EntityModel<Publisher> model = EntityModel.of(this);
        model.add(Link.of("/publishers/" + id).withSelfRel());
        model.add(Link.of("/publishers/" + id + "/books").withRel("books"));
        return model;
    }
}