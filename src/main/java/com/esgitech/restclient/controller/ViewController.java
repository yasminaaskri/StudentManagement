package com.esgitech.restclient.controller;

import com.esgitech.restclient.entity.Student;
import com.esgitech.restclient.repository.StudentRep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/view") // Base path for all controller methods
public class ViewController {

    @Autowired
    private StudentRep studentRepository;

    @GetMapping("/") // Now resolves to /view/
    public String index(Model model) {
        model.addAttribute("students", studentRepository.findAll());
        return "index";
    }

    @GetMapping("/create") // Now resolves to /view/create
    public String create() {
        return "create"; // Ensure create.jsp exists in /WEB-INF/views/
    }

    @GetMapping("/edit") // Now resolves to /view/edit
    public String edit(@RequestParam Long id, Model model) {
        try {
            Student student = studentRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Student not found"));
            model.addAttribute("student", student);
            return "edit";
        } catch (Exception e) {
            return "redirect:/view/";
        }
    }
}