require 'rails_helper'
require 'base64'

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
  end

  scenario "With valid attributes" do
    article_1 = Article.create(
      name: "Reasons to learn Ruby on Rails",
      content: "It's a great programming language"
    )

    image = File.new("/Users/Joelito/Desktop/Cursos/Rails Udemy/blog/spec/images/rails.png")
    image_base_64 = "data:image/jpeg;base64," + Base64.encode64(image.read)
    image_1= Image.create(image: image_base_64, article_id: article_1.id)

    edited_image = File.new("/Users/Joelito/Desktop/Cursos/Rails Udemy/blog/spec/images/rails_cover.jpg")
    edited_image_base_64 = "data:image/jpeg;base64," + Base64.encode64(edited_image.read)

    visit "/"
    
    click_link article_1.name
    click_link "Change image"
    attach_file "Image", "/Users/Joelito/Desktop/Cursos/Rails Udemy/blog/spec/images/rails_cover.jpg"

    click_button "Save"

    expect(page).to have_xpath("//img[@src='" + edited_image_base_64 + "']")
  end
end