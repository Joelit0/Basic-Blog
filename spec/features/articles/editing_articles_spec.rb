require 'rails_helper'

RSpec.feature "Admins can edit articles" do
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
    
    article_1 = Article.create(
      name: "Reasons to learn Ruby on Rails",
      content: "It's a great programming language"
    )

    visit "/"
    click_link article_1.name
    click_link "Edit"
  end
  
  scenario "With valid attributes" do
    fill_in "Name", with: "That's why you should learn Ruby on Rails"
    fill_in "Content", with: "Is the best programming language"
    click_button "Save"

    expect(page).to have_content "That's why you should learn Ruby on Rails"
    expect(page).to have_content "Is the best programming language"
  end

  scenario "With invalid attributes" do
    fill_in "Name", with: ""
    fill_in "Content", with: ""
    click_button "Save"

    expect(page).to have_content "Could not save. Name and content fields must be completed"
  end
end