require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Augusto',
      email: 'augusto@dev.com',
      password: '123456',
      password_confirmation: '123456'
    )
    sign_in @user
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
    GroupExpense.create(
      group_id: @group.id,
      expense_id: @expense.id
    )
  end

  describe 'GET /index' do
    before { get group_path(@group) }

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('show')
    end

    it 'should render the correct text' do
      expect(response.body).to include('Burger')
    end
  end
end
