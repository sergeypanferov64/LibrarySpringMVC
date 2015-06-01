package ru.spanferov.libraryspringmvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.spanferov.library.domain.Order;
import ru.spanferov.library.service.OrderService;
import ru.spanferov.library.util.OrderSearchCriteria;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping(value = {"/orders"}, method = RequestMethod.GET)
    public ModelAndView showOrders(ModelAndView model, OrderSearchCriteria osc) {
        model.addObject("orderSearchCriteria", osc);
        model.addObject("orderStatuses", Order.getStatusMap());
        model.addObject("orderList", orderService.list(osc));
        model.setViewName("orders");
        return model;
    }

    @RequestMapping(value = {"/order"}, method = RequestMethod.GET, params = "operation")
    public ModelAndView orderOperation(@RequestParam(value = "orderId", required = true) int id, @RequestParam(value = "operation", required = true) String operation, ModelAndView model, RedirectAttributes redirectAttrs) {

        if (operation.equals("show")) {
            return createShowOrderModel(model, id);
        } else if (operation.equals("nextStatus")) {
            return createNextStatusOrderModel(id, model);
        } else {
            model.setViewName("redirect:/contacts");
            return model;
        }

    }

    private ModelAndView createNextStatusOrderModel(int id, ModelAndView model) {
        orderService.nextStatus(id);
        model.addObject("orderId", id);
        model.addObject("operation", "show");
        model.setViewName("redirect:/order");
        return model;
    }

    private ModelAndView createShowOrderModel(ModelAndView model, int id) {
        model.addObject("order", orderService.getOrderById(id));
        model.setViewName("order");
        return model;
    }

}
