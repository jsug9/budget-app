class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_expense, dependent: :destroy
  has_many :expenses, through: :group_expense
end
