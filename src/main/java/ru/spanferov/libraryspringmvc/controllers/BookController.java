package ru.spanferov.libraryspringmvc.controllers;

import java.beans.PropertyEditorSupport;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.spanferov.library.service.BookService;
import ru.spanferov.library.util.BookSearchCriteria;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.spanferov.library.domain.Author;
import ru.spanferov.library.domain.Book;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    public BookService getBookService() {
        return bookService;
    }

    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = {"/books"}, method = RequestMethod.GET)
    public ModelAndView showBooks(@ModelAttribute("bookSearchCriteria") BookSearchCriteria bsc, ModelAndView model) {
        model.addObject("bookSearchCriteria", bsc);
        model.addObject("bookList", getBookService().list(bsc));
        model.setViewName("books");
        return model;
    }

    @RequestMapping(value = {"/book"}, method = RequestMethod.GET, params = "operation")
    public ModelAndView editBookForm(@RequestParam(value = "bookId", required = true) int id, @RequestParam(value = "operation", required = true) String operation, ModelAndView model, RedirectAttributes redirectAttrs) {

        if (operation.equals("show")) {
            model.addObject("book", getBookService().getBookById(id));
            String email = SecurityContextHolder.getContext().getAuthentication().getName();
            model.addObject("avaliableCode", getBookService().getBookAvaliableCodeForUser(id, email));
            model.addObject("NumberOfAllBookInstances", getBookService().getNumberOfAllBookInstances(id));
            model.addObject("NumberOfFreeBookInstances", getBookService().getNumberOfFreeBookInstances(id));
            model.addObject("NumberOfLockedBookInstances", getBookService().getNumberOfLockedBookInstances(id));
            model.setViewName("book");
            return model;
        } else if (operation.equals("edit")) {
            model.addObject("book", bookService.getBookById(id));
            model.addObject("author", new Author());
            model.addObject("authorsList", bookService.getAuthorsList());
            model.setViewName("bookForm");
            return model;
        } else if (operation.equals("delete")) {
            bookService.deleteBookById(id);
            model.setViewName("redirect:/books");
            return model;
        } else if (operation.equals("newInstance")) {
            bookService.createNewBookInstanve(id);
            redirectAttrs.addAttribute("bookId", id);
            redirectAttrs.addAttribute("operation", "show");
            model.setViewName("redirect:/book");
            return model;
        } else if (operation.equals("lock")) {
            String email = SecurityContextHolder.getContext().getAuthentication().getName();
            bookService.lockBock(id, email);
            redirectAttrs.addAttribute("bookId", id);
            redirectAttrs.addAttribute("operation", "show");
            model.setViewName("redirect:/book");
            return model;
        } else {
            model.setViewName("redirect:/books");
            return model;
        }

    }

    @RequestMapping(value = {"/newBook"}, method = RequestMethod.GET)
    public ModelAndView createBook(ModelAndView model) {
        model.addObject("book", new Book());
        model.addObject("author", new Author());
        model.addObject("authorsList", bookService.getAuthorsList());
        model.setViewName("bookForm");
        return model;
    }

    @RequestMapping(value = {"/newBook"}, method = RequestMethod.POST)
    public ModelAndView addBookFromForm(@Valid Book book, BindingResult bindingResult, ModelAndView model) {

        if (bindingResult.hasErrors()) {
            model.setViewName("bookForm");
            model.addObject("author", new Author());
            model.addObject("authorsList", bookService.getAuthorsList());
            return model;
        }

        if (book.getId() == null) {
            bookService.saveBook(book);
        } else {
            bookService.updateBook(book);
        }

        return new ModelAndView("redirect:/book?bookId=" + book.getId() + "&operation=show");
    }

    @RequestMapping(value = {"/newAuthor"}, method = RequestMethod.POST)
    public ModelAndView addAuthorFromForm(@Valid Author author, BindingResult bindingResult, ModelAndView model) {

        if (bindingResult.hasErrors()) {
            model.setViewName("bookForm");
            model.addObject("book", new Book());
            model.addObject("authorsList", bookService.getAuthorsList());
            return model;
        }

        bookService.saveAuthor(author);
        model.setViewName("redirect:/newBook");
        return model;
    }

    class AuthorEditor extends PropertyEditorSupport {

        @Override
        public void setAsText(String text) {
            Integer id = Integer.parseInt(text);
            Author author = bookService.getAuthorById(id);
            setValue(author);
        }

    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Author.class, new AuthorEditor());
    }

}
