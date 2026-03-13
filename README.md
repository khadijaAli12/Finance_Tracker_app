# Personal Finance Tracker

A Ruby on Rails-based web application to help users manage their personal finances by tracking incomes, expenses, and budgets. The system includes user authentication, transaction categorization, and a responsive UI using Rails views and Tailwind CSS.
# Built with Ruby on Rails — HTML% is ERB templates
---

## Project Overview

The goal of this application is to help users:

- ✅ Track income and expenses  
- ✅ Categorize their financial transactions  
- ✅ Set budgets and monitor financial goals  
- ✅ Visualize data through a dashboard

---

## Built With

- Ruby on Rails (v7+)  
- PostgreSQL  
- bootstrap (via Rails)  
- Devise for user authentication  

---
## Overview of complete project
![image](https://github.com/user-attachments/assets/4d1f79f2-2ba9-4291-9acb-cb1a429c56f4)
![image](https://github.com/user-attachments/assets/99dee6dc-1fa9-4c42-9535-7e54f64c81b6)
![image](https://github.com/user-attachments/assets/30c67eab-03c7-42b5-a25d-87b581fe2c86)
![image](https://github.com/user-attachments/assets/17ee25cb-50ca-43d4-970c-a864fe22f9a4)
![image](https://github.com/user-attachments/assets/ca7d451c-0b9b-4c83-9d69-6125139a0c80)
![image](https://github.com/user-attachments/assets/c1b38c85-6908-4f8a-ae7d-901d9d7024f1)
![image](https://github.com/user-attachments/assets/957e07e6-9681-4a7a-9b6a-c7cc0e216e67)
![image](https://github.com/user-attachments/assets/b6be5a2a-efd2-4c51-b73e-b5d183d38933)
![image](https://github.com/user-attachments/assets/a798f130-be8a-46dc-bfa9-4c4b75b1c19f)
![image](https://github.com/user-attachments/assets/1b93e778-03f6-40f7-9e7b-8c31648fc66e)
![image](https://github.com/user-attachments/assets/c865b0eb-c51f-4bf8-81de-318f112b96ca)
![image](https://github.com/user-attachments/assets/2f134e3a-b08e-4dfb-8252-487ca6af9974)



## Completed Features

### ✅ User Authentication

- Devise is configured and integrated  
- User registration, login, logout, and password management fully functional

### ✅ Models and Migrations

- Models: User, Category, Transaction, Expense, Income, Budget  
- All migrations completed and functioning  
- Proper associations (`belongs_to`, `has_many`) set up  

### ✅ Controllers & Basic CRUD

- `TransactionsController`: full CRUD (`index`, `show`, `new`, `edit`, `create`, `update`, `destroy`)  
- Validations for `amount`, `date`, and `category` presence  
- Similar setup for `CategoriesController`, `IncomesController`, and `ExpensesController`  
- Functional forms for categories and transactions  

### ✅ Basic Views

- Views for transactions: `index`, form, and `show` pages  
- Partial navigation structure implemented  
- Flash messages for create, update, and destroy actions  

### ✅ Routing

- All standard RESTful routes implemented  
- Root path set to `welcome#index` or `dashboard#index` based on state  

### ✅ Budget Tracking Module

- Scaffolded `BudgetsController`  
- Users can set monthly/weekly budgets per category  

### ✅ Dashboard View

- Includes:  
  - Monthly income vs expenses  
  - Top spending categories  
  - Budget usage  
  - Graphs (e.g., via Chartkick)  

### ✅ Error Messages & Form Validation UI

- Clear error messages in views  
- Backend validations + improved frontend form UX  

### ✅ User-based Data Filtering

- Data scoped per user  
- Users only see their own transactions, incomes, and expenses  

### ✅ Visual Improvements

- Tailwind CSS integration for responsive design  
- Icons, spacing, and mobile-friendly layout  

---

## Getting Started

Follow these instructions to run the app locally:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/finance_tracker.git
   cd finance_tracker

2. Install dependencies:

bundle install


3. Set up the database:

bin/rails db:drop db:create db:migrate


4. Start the server:

bin/rails server


5. Visit the app:

http://localhost:3000




---

Notes

If you face permission issues with bin/rails, run:

chmod +x bin/rails

If db:migrate fails due to existing tables, use:

bin/rails db:drop



---

License  


This project is open source and available under the MIT License.
