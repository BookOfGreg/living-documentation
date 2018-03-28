require 'rails_helper'

RSpec.describe 'categories/edit', type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :name => 'MyString',
      :user => FactoryBot.create(:user)
    ))
  end

  it 'renders the edit category form' do
    render

    assert_select 'form[action=?][method=?]', category_path(@category), 'post' do

      assert_select 'input[name=?]', 'category[name]'

      assert_select 'input[name=?]', 'user[name]'
    end
  end
end
