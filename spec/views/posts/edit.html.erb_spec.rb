require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => 'MyString',
      :content => 'MyText',
      :category_ids => [ 1, 2, 3]
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[content]"

      assert_select "select[name=?]", "post[category_ids]"
    end
  end
end
