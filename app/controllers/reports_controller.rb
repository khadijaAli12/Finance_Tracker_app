class ReportsController < ApplicationController
  before_action :authenticate_account!
 class ReportsController < ApplicationController
  before_action :authenticate_user! # if you're using Devise

  def index
    # Your existing index action for rendering the view
  end

  def monthly_summary_data
    # If you have separate Income and Expense models
    incomes = current_user.incomes
      .group("DATE_FORMAT(created_at, '%Y-%m')")
      .sum(:amount)

    expenses = current_user.expenses
      .group("DATE_FORMAT(created_at, '%Y-%m')")
      .sum(:amount)

    # Combine data
    all_months = (incomes.keys + expenses.keys).uniq
    summary = {}

    all_months.each do |month|
      summary[month] = {
        month: format_month(month),
        total_income: incomes[month] || 0,
        total_expense: expenses[month] || 0
      }
    end

    # Sort by month
    sorted_summary = summary.values.sort_by { |data| data[:month] }

    # Prepare chart data
    chart_labels = sorted_summary.map { |data| data[:month] }
    chart_income = sorted_summary.map { |data| data[:total_income] }
    chart_expense = sorted_summary.map { |data| data[:total_expense] }

    render json: {
      monthly_data: sorted_summary,
      chart_labels: chart_labels,
      chart_income: chart_income,
      chart_expense: chart_expense
    }
  end

private

  def format_month(month_string)
    # Convert '2024-01' to 'Jan 2024'
    Date.strptime(month_string, "%Y-%m").strftime("%b %Y")
  rescue
    month_string
  end
 end
end
