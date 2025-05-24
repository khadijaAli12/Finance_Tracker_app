# Personal Finance Tracker

A Ruby on Rails-based web application to help users manage their personal finances by tracking incomes, expenses, and budgets. The system includes user authentication, transaction categorization, and a responsive UI using Rails views and Tailwind CSS.

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
- Tailwind CSS (via Rails)  
- Devise for user authentication  

---

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
