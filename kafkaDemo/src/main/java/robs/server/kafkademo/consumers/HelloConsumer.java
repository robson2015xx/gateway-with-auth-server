package robs.server.kafkademo.consumers;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class HelloConsumer {
  @KafkaListener(topics = "order-topic", groupId = "group-1")
  public void receiveMessage(Object message) {
    // Process the received message
    System.out.println("recebido: " + message.getClass().getName());
  }
}