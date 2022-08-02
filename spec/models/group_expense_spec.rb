require 'rails_helper'

RSpec.describe GroupExpense, type: :model do
  before :each do
    @user = User.create(
      name: 'Augusto',
      email: 'augusto@dev.com',
      password: '123456',
      password_confirmation: '123456'
    )
    @group = Group.create(
      author_id: @user.id,
      name: 'Food',
      icon: '🍔'
    )
    @expense = Expense.create(
      author_id: @user.id,
      name: 'Burger',
      amount: 100
    )
    @group_expense = GroupExpense.create(
      group_id: @group.id,
      expense_id: @expense.id
    )
  end

  describe 'GroupExpense Model Properties' do
    it 'should have a group' do
      @group_expense.group_id = nil
      expect(@group_expense).to_not be_valid
    end

    it 'should have an expense' do
      @group_expense.expense_id = nil
      expect(@group_expense).to_not be_valid
    end
  end
end
