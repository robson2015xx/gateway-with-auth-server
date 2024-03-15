package robs.server.order.services;

import robs.server.order.dtos.OrderRequestDTO;
import robs.server.order.dtos.OrderStatusDTO;
//import interview.urbanobank.order.producers.OrderProducer;
//import jakarta.persistence.criteria.Order;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

//    final OrderProducer orderProducer;
//
//    public OrderService(OrderProducer orderProducer) {
//        this.orderProducer = orderProducer;
//    }

    public OrderStatusDTO makeNewOrder(OrderRequestDTO orderRequestDTO) {
//        orderProducer.sendMessage(orderRequestDTO);
        return new OrderStatusDTO(1);
    }
}
