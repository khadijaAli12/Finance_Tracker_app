class Transaction < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :account

  validates :amount, presence: true
  validates :date, presence: true
  validates :category_id, presence: true
  validates :transaction_type, presence: true

  validate :expense_cannot_exceed_balance

  private

  def expense_cannot_exceed_balance
    return unless transaction_type == "expense" && account.present?

    income_total = account.transactions.where(transaction_type: "income").sum(:amount)
    expense_total = account.transactions.where(transaction_type: "expense").sum(:amount)
    current_balance = income_total - expense_total

    if amount.present? && amount > current_balance
      errors.add(:amount, "exceeds your current balance of ₹#{current_balance}. Cannot save this expense.")
    end
  end
end
