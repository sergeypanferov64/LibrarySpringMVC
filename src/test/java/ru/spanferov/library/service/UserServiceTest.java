package ru.spanferov.library.service;

import org.junit.Test;
import static org.junit.Assert.*;
import ru.spanferov.library.dao.UserDAO;
import ru.spanferov.library.domain.User;

import static org.mockito.Mockito.*;

public class UserServiceTest {

    @Test
    public void testGetUserById() {

        // mock objects creation
        UserDAO mockedUserDAO = mock(UserDAO.class);
        User testUser = new User();
        testUser.setLastName("testLastName");

        // configure mock userDAO
        when(mockedUserDAO.getUserById(1)).thenReturn(testUser);

        // creation of tested service
        UserService userService = new UserService();
        userService.setUserDAO(mockedUserDAO);

        // check lastName of mock User object
        assertEquals(userService.getUserById(1).getLastName(), "testLastName");
    }

}
