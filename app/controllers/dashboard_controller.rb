class DashboardController < ApplicationController
  before_action :authenticate_account!

  def index
    # Get the current account's transactions
    @transactions = current_account.transactions

    # Total income, expense, and balance
    totals = calculate_income_expense
    @total_income = totals[:income]
    @total_expense = totals[:expense]
    raw_balance = @total_income - @total_expense

    # Ensure balance is not negative
    @balance = raw_balance.negative? ? 0 : raw_balance

    # Trigger alert if balance is zero
    if @balance.zero?
      flash.now[:alert] = "Your balance is zero. Please review your expenses."
    end

    # Separate data for line chart (income and expense by day)
    @income_data = @transactions.where(transaction_type: "income")
                                .group_by_day(:date).sum(:amount)
    puts "Income Data: #{@income_data.inspect}"

    @expense_data = @transactions.where(transaction_type: "expense")
                                 .group_by_day(:date).sum(:amount)
    puts "Expense Data: #{@expense_data.inspect}"

    # Donut chart: Expenses grouped by category
    @category_expenses = calculate_expenses_by_category
    puts "Category Expenses: #{@category_expenses.inspect}"
  end

  private

  def calculate_income_expense
    total_income = current_account.transactions.where(transaction_type: "income").sum(:amount)
    total_expense = current_account.transactions.where(transaction_type: "expense").sum(:amount)
    { income: total_income, expense: total_expense }
  end

  def calculate_expenses_by_category
    current_account.transactions
                   .joins(:category)
                   .where(transaction_type: "expense", categories: { category_type: "Expense" })
                   .group("categories.name")
                   .sum(:amount)
  end
end
