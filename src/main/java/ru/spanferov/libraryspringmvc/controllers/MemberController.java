package ru.spanferov.libraryspringmvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ru.spanferov.library.service.BookService;

@Controller
public class MemberController {

    @Autowired
    private BookService bookService;

    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = {"/member"}, method = RequestMethod.GET)
    public ModelAndView showMemberHome(ModelAndView model) {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        model.addObject("memberHomeBooks", bookService.getBooksTakenByMember(email));
        model.addObject("memberLockedBooks", bookService.getBooksLockedByMember(email));
        model.setViewName("member");
        return model;
    }

}
