require 'rails_helper'

RSpec.feature "Admins can add images to articles" do
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
  
  scenario "With valid attributes" do
    article_1 = Article.create(
      name: "Reasons to learn Ruby on Rails",
      content: "It's a great programming language"
    )

    image = File.new("/Users/Joelito/Desktop/Cursos/Rails Udemy/blog/spec/images/rails.png")
    image_base_64 = "data:image/jpeg;base64," + Base64.encode64(image.read)

    visit "/"
    click_link article_1.name
    click_link "Add image"
    attach_file "Image", "/Users/Joelito/Desktop/Cursos/Rails Udemy/blog/spec/images/rails.png"
    click_button "Save"

    expect(page).to have_xpath("//img[@src='" + image_base_64 + "']")
  end
end