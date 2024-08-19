@RunWith(SpringRunner.class)
@DataJpaTest
public class BookRepositoryIntegrationTest {
    @Autowired
    private BookRepository bookRepository;

    @Test
    public void testFindAll() {
        List<Book> books = bookRepository.findAll();
        assertEquals(2, books.size());
    }
}