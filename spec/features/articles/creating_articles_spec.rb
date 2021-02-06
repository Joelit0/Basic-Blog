require 'rails_helper'

RSpec.feature "Admins can create Articles" do
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
    
    visit "/"
    click_link "New Article"
  end

  scenario "With valids attributes" do
    fill_in "Name", with: "Reasons to learn Ruby on Rails"
    fill_in "Content", with: "It's a great programming language"
    attach_file "Main image", "/Users/Joelito/Desktop/Cursos/Rails Udemy/blog/spec/images/rails.png"

    click_button "Save"

    expect(page).to have_content "Reasons to learn Ruby on Rails"
    expect(page).to have_content "It's a great programming language"
  end

  scenario "With invalids attributes" do
    click_button "Save"

    expect(page).to have_content "Could not save. Name and content fields must be completed."
  end
end