import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BookMetrics {
    private final Counter booksSoldCounter;

    @Autowired
    public BookMetrics(MeterRegistry meterRegistry) {
        booksSoldCounter = meterRegistry.counter("books.sold");
    }

    public void incrementBooksSold() {
        booksSoldCounter.increment();
    }
}