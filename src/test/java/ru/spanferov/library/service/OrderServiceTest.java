package ru.spanferov.library.service;

import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import ru.spanferov.library.dao.OrderDAO;
import ru.spanferov.library.domain.BookInstance;
import ru.spanferov.library.domain.Order;

public class OrderServiceTest {

    @Test
    public void testNextStatus_BOOK_ISSUED() {

        // mock objects creation
        OrderDAO mockedOrderDAO = mock(OrderDAO.class);

        Order mockOrder = new Order();
        mockOrder.setId(101);
        mockOrder.setStatus(Order.BOOK_LOCKED);

        // configure mock DAO
        when(mockedOrderDAO.getOrderById(101)).thenReturn(mockOrder);

        // creation of tested service
        OrderService orderService = new OrderService();
        orderService.setOrderDAO(mockedOrderDAO);

        // test:
        orderService.nextStatus(101);
        assertEquals((int) mockOrder.getStatus(), Order.BOOK_ISSUED);

    }

    @Test
    public void testNextStatus_BOOK_RETURNED() {

        // mock objects creation
        OrderDAO mockedOrderDAO = mock(OrderDAO.class);

        Order mockOrder = new Order();
        mockOrder.setId(102);
        mockOrder.setStatus(Order.BOOK_ISSUED);
        BookInstance mockBi = new BookInstance();
        mockBi.setLock(true);
        mockOrder.setBookInstance(mockBi);

        // configure mock DAO
        when(mockedOrderDAO.getOrderById(102)).thenReturn(mockOrder);

        // creation of tested service
        OrderService orderService = new OrderService();
        orderService.setOrderDAO(mockedOrderDAO);

        // test:
        orderService.nextStatus(102);
        assertEquals((int) mockOrder.getStatus(), Order.BOOK_RETURNED);
        assertEquals(mockOrder.getBookInstance().isLock(), false);

    }

}
