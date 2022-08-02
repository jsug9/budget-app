require 'rails_helper'

RSpec.describe 'Group Show Page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Augusto',
      email: 'augusto@dev.com',
      password: '123456',
      password_confirmation: '123456'
    )
    @user.save!
    sign_in @user

    @group = Group.create(
      author_id: @user.id,
      name: 'Food',
      icon: '🍔'
    )

    (1..5).each do |id|
      @group.expenses.create(
        author_id: @user.id,
        name: "Expense #{id}",
        amount: 100
      )
    end

    visit group_path(@group)
  end

  it 'when click on the group name, should lead to the edit group page' do
    click_link 'Food'
    expect(current_path).to eq(edit_group_path(@group))
  end

  it 'should render the correct text' do
    expect(page).to have_content('Expense 1')
    expect(page).to have_content('Expense 2')
    expect(page).to have_content('Expense 3')
    expect(page).to have_content('Expense 4')
    expect(page).to have_content('Expense 5')
  end

  it 'when click on a expense, should lead to the correct page' do
    click_link 'Expense 1'
    expect(current_path).to eq(edit_group_expense_path(@group, Expense.first))
  end

  it 'should have a link to add a new expense' do
    expect(page).to have_link('New Expense')
  end

  it 'new expense link should lead to new expense page' do
    click_link('New Expense')
    expect(current_path).to eq(new_group_expense_path(@group))
  end
end
