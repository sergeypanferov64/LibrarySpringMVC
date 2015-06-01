package ru.spanferov.libraryspringmvc.controllers;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.spanferov.library.domain.User;
import ru.spanferov.library.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = {"/users"}, method = RequestMethod.GET)
    public ModelAndView showUsers(ModelAndView model) {
        model.addObject("userList", userService.list());
        model.setViewName("users");
        return model;
    }

    @RequestMapping(value = {"/newUser"}, method = RequestMethod.GET)
    public ModelAndView createUser(ModelAndView model) {
        model.addObject("user", new User());
        model.addObject("roles", userService.getUserRoles());
        model.setViewName("userForm");
        return model;
    }

    @RequestMapping(value = {"/newUser"}, method = RequestMethod.POST)
    public ModelAndView addUserFromForm(@Valid User user, BindingResult bindingResult, ModelAndView model) {

        if (bindingResult.hasErrors()) {
            model.setViewName("userForm");
            model.addObject("roles", userService.getUserRoles());
            return model;
        }

        if (user.getId() == null) {
            userService.saveNewUser(user);
        } else {
            userService.updateUser(user);
        }

        return new ModelAndView("redirect:/users");
    }

    @RequestMapping(value = {"/user"}, method = RequestMethod.GET, params = "operation")
    public ModelAndView editBookForm(@RequestParam(value = "userId", required = true) int id, @RequestParam(value = "operation", required = true) String operation, ModelAndView model, RedirectAttributes redirectAttrs) {

        if (operation.equals("show")) {
            return createShowUserModel(model, id);
        } else if (operation.equals("edit")) {
            return createEditUserModel(id, model);
        } else if (operation.equals("delete")) {
            return createDeleteUserModel(id, model);
        } else {
            model.setViewName("redirect:/users");
            return model;
        }

    }

    private ModelAndView createDeleteUserModel(int id, ModelAndView model) {
        userService.deleteUserById(id);
        model.setViewName("redirect:/users");
        return model;
    }

    private ModelAndView createEditUserModel(int id, ModelAndView model) {
        User user = userService.getUserById(id);
        user.setPassword("");
        model.addObject("user", user);
        model.addObject("roles", userService.getUserRoles());
        model.setViewName("userForm");
        return model;
    }

    private ModelAndView createShowUserModel(ModelAndView model, int id) {
        model.addObject("user", userService.getUserById(id));
        model.setViewName("user");
        return model;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

}
