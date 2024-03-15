//package interview.urbanobank.order.producers;
//
//import interview.urbanobank.order.dtos.OrderRequestDTO;
//import org.springframework.kafka.core.KafkaTemplate;
//import org.springframework.stereotype.Component;
//
//@Component
//public class OrderProducer {
//    private final KafkaTemplate<String, OrderRequestDTO> kafkaTemplate;
//
//    public OrderProducer(KafkaTemplate<String, OrderRequestDTO> kafkaTemplate) {
//        this.kafkaTemplate = kafkaTemplate;
//    }
//
//    public void sendMessage(OrderRequestDTO message) {
//        kafkaTemplate.send("order-topic", message);
//    }
//}
