package robs.server.order.controllers;

import robs.server.order.dtos.OrderRequestDTO;
import robs.server.order.dtos.OrderStatusDTO;
import robs.server.order.services.OrderService;
import org.springframework.web.bind.annotation.*;

@RestController
public class OrderController {

    final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public OrderStatusDTO orderRequest(@RequestBody OrderRequestDTO orderRequestDTO) {

        return orderService.makeNewOrder(orderRequestDTO);
    }

    @GetMapping
    public String test() {

        return "OK";
    }
}
