package com.codingdojo.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.savetravels.models.Expense;
import com.codingdojo.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	
	@Autowired
	private ExpenseRepository expenseRepo;
	
	public Expense getOne(Long id) {
		Optional<Expense> optExpense = expenseRepo.findById(id);
		
		if(optExpense.isPresent()) {
			return optExpense.get();
		}
		else {
			return null;
		}
	}

	public Expense createExpense(Expense expense) {
		// TODO Auto-generated method stub
		return expenseRepo.save(expense);
	}
	
	public List<Expense> getAll(){
		
		return expenseRepo.findAll();
	}

	public Expense updateExpense(Expense expense) {
		return expenseRepo.save(expense);
		
	}

	public void deleteById(Long id) {
		expenseRepo.deleteById(id);
		
	}
}
