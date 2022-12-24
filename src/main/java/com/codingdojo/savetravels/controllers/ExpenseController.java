package com.codingdojo.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.savetravels.models.Expense;
import com.codingdojo.savetravels.services.ExpenseService;

@Controller
@RequestMapping("/expenses")
public class ExpenseController {
	
	@Autowired
	private ExpenseService expenseserv;
	
	@GetMapping("")
	public String newExpense(Model model ) {
		
		Expense expense = new Expense();
		model.addAttribute("expense", expense);
		
		List<Expense> allExpenses = expenseserv.getAll();
		model.addAttribute("allExpenses", allExpenses);
		
		return "newExpense.jsp";
	}
	
	@PostMapping("/create")
    public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
        if (result.hasErrors()) {
            return "newExpense.jsp";
        } else {
            expenseserv.createExpense(expense);
            return "redirect:/expenses";
        }
    }
	
	@GetMapping("/edit/{id}")
	public String editForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("expense", expenseserv.getOne(id));
		
		return "edit.jsp";
	}
	
	@PutMapping("/edit/{id}")
    public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, @PathVariable("id") Long id) {
		
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            expenseserv.updateExpense(expense);
            return "redirect:/expenses";
        }
    }
	
	@GetMapping("/{id}")
	public String viewExpense(@PathVariable("id") Long id, Model model) {
		model.addAttribute("expense", expenseserv.getOne(id));
		
		return "viewOne.jsp";
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") Long id) {
		expenseserv.deleteById(id);
		
		
		return "redirect:/expenses";
	}
	
}
