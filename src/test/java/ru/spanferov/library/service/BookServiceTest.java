package ru.spanferov.library.service;

import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import ru.spanferov.library.dao.BookDAO;
import ru.spanferov.library.dao.UserDAO;
import ru.spanferov.library.domain.User;

public class BookServiceTest {

    @Test
    public void testGetBookAvaliableCodeForUser_2() {

        // mock objects creation
        UserDAO mockedUserDAO = mock(UserDAO.class);
        User mockUser = new User();
        mockUser.setId(777);

        BookDAO mockedBookDAO = mock(BookDAO.class);

        int testBookId = 100;
        String testEmail = "email@test.ru";

        // configure mock DAO
        when(mockedUserDAO.getUserByEmail(testEmail)).thenReturn(mockUser);
        when(mockedBookDAO.getCountOfLockedBookInstancesOfThisBookForUser(testBookId, mockUser.getId())).thenReturn((long) 1);

        // creation of tested service
        BookService bookService = new BookService();
        bookService.setUserDAO(mockedUserDAO);
        bookService.setBookDAO(mockedBookDAO);

        // check avaliableCode for test bookId and email
        assertEquals(bookService.getBookAvaliableCodeForUser(testBookId, testEmail), 2);

    }

    @Test
    public void testGetBookAvaliableCodeForUser_3() {

        // mock objects creation
        UserDAO mockedUserDAO = mock(UserDAO.class);
        User mockUser = new User();
        mockUser.setId(777);

        BookDAO mockedBookDAO = mock(BookDAO.class);

        int testBookId = 100;
        String testEmail = "email@test.ru";

        // configure mock DAO
        when(mockedUserDAO.getUserByEmail(testEmail)).thenReturn(mockUser);
        when(mockedBookDAO.getCountOfLockedBookInstancesOfThisBookForUser(testBookId, mockUser.getId())).thenReturn((long) 0);
        when(mockedBookDAO.getCountOfCollectedBookInstancesOfThisBookForUser(testBookId, mockUser.getId())).thenReturn((long) 1);

        // creation of tested service
        BookService bookService = new BookService();
        bookService.setUserDAO(mockedUserDAO);
        bookService.setBookDAO(mockedBookDAO);

        // check avaliableCode for test bookId and email
        assertEquals(bookService.getBookAvaliableCodeForUser(testBookId, testEmail), 3);

    }

    @Test
    public void testGetBookAvaliableCodeForUser_4() {

        // mock objects creation
        UserDAO mockedUserDAO = mock(UserDAO.class);
        User mockUser = new User();
        mockUser.setId(777);

        BookDAO mockedBookDAO = mock(BookDAO.class);

        int testBookId = 100;
        String testEmail = "email@test.ru";

        // configure mock DAO
        when(mockedUserDAO.getUserByEmail(testEmail)).thenReturn(mockUser);
        when(mockedBookDAO.getCountOfLockedBookInstancesOfThisBookForUser(testBookId, mockUser.getId())).thenReturn((long) 0);
        when(mockedBookDAO.getCountOfCollectedBookInstancesOfThisBookForUser(testBookId, mockUser.getId())).thenReturn((long) 0);
        when(mockedBookDAO.getNumberOfFreeBookInstances(testBookId)).thenReturn(0);

        // creation of tested service
        BookService bookService = new BookService();
        bookService.setUserDAO(mockedUserDAO);
        bookService.setBookDAO(mockedBookDAO);

        // check avaliableCode for test bookId and email
        assertEquals(bookService.getBookAvaliableCodeForUser(testBookId, testEmail), 4);

    }

    @Test
    public void testGetBookAvaliableCodeForUser_0() {

        // mock objects creation
        UserDAO mockedUserDAO = mock(UserDAO.class);
        User mockUser = new User();
        mockUser.setId(777);

        BookDAO mockedBookDAO = mock(BookDAO.class);

        int testBookId = 100;
        String testEmail = "email@test.ru";

        // configure mock DAO
        when(mockedUserDAO.getUserByEmail(testEmail)).thenReturn(mockUser);
        when(mockedBookDAO.getCountOfLockedBookInstancesOfThisBookForUser(testBookId, mockUser.getId())).thenReturn((long) 0);
        when(mockedBookDAO.getCountOfCollectedBookInstancesOfThisBookForUser(testBookId, mockUser.getId())).thenReturn((long) 0);
        when(mockedBookDAO.getNumberOfFreeBookInstances(testBookId)).thenReturn(1);

        // creation of tested service
        BookService bookService = new BookService();
        bookService.setUserDAO(mockedUserDAO);
        bookService.setBookDAO(mockedBookDAO);

        // check avaliableCode for test bookId and email
        assertEquals(bookService.getBookAvaliableCodeForUser(testBookId, testEmail), 0);

    }

}
