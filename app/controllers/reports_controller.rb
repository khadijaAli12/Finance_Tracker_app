class ReportsController < ApplicationController
  before_action :authenticate_account!

  def monthly_summary_data
    transactions = current_account.transactions.includes(:category)

    # Group by month manually
    monthly_summary = {}

    transactions.each do |transaction|
      month_key = transaction.date.beginning_of_month
      month_label = month_key.strftime("%B %Y")

      monthly_summary[month_key] ||= {
        month: month_label,
        total_income: 0.0,
        total_expense: 0.0
      }

      # Match your exact category types
      if transaction.category.category_type == "Income"
        monthly_summary[month_key][:total_income] += transaction.amount.to_f
      elsif transaction.category.category_type == "Expense"
        monthly_summary[month_key][:total_expense] += transaction.amount.to_f
      end
    end

    # Sort by month and limit to 6 recent months
    sorted_data = monthly_summary.sort_by { |month_key, _| month_key }.last(6).map { |_, data| data }

    render json: {
      monthly_data: sorted_data,
      chart_labels: sorted_data.map { |data| data[:month] },
      chart_income: sorted_data.map { |data| data[:total_income] },
      chart_expense: sorted_data.map { |data| data[:total_expense] }
    }
  end

  def index
  end
end
