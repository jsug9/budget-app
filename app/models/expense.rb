class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_expense, dependent: :destroy
  has_many :groups, through: :group_expense
end
