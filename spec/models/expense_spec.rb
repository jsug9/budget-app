require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :each do
    @user = User.create(
      name: 'Augusto',
      email: 'augusto@dev.com',
      password: '123456',
      password_confirmation: '123456'
    )
    @expense = Expense.create(
      author_id: @user.id,
      name: 'Burger',
      amount: 100
    )
  end

  describe 'Expense Model Properties' do
    it 'should have an author' do
      @expense.author_id = nil
      expect(@expense).to_not be_valid
    end

    it 'name should be present' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'amount should be present' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end

    it 'amount should be greater than 0' do
      @expense.amount = 0
      expect(@expense).to_not be_valid
    end
  end
end
