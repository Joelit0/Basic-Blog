require 'rails_helper'

RSpec.feature "Admins can delete articles" do
  before do
    admin = Admin.create(
      email: "admin@example.com",
      name: "Super Admin",
      password: "password123",
      password_confirmation: "password123"
    )

    visit "/admins/sign_in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
  end
  
  scenario "It is eliminated" do
    article_1 = Article.create(
      name: "Reasons to learn Ruby on Rails",
      content: "It's a great programming language"
    )

    visit "/"

    click_link article_1.name
    click_link "Delete"

    expect(page).to have_no_content "Reasons to learn Ruby on Rails"
  end
end