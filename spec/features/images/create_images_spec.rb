require 'rails_helper'

RSpec.feature "Admins can add images to articles" do
  before do
    admin = create(:admin)

    visit "/admins/sign_in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
  end
  
  scenario "With valid attributes" do
    article = create(:article)

    image = File.new("/Users/Joelito/Desktop/Cursos/Rails Udemy/Blog-Udemy-Course/spec/images/rails.png")
    image_base_64 = "data:image/jpeg;base64," + Base64.encode64(image.read)

    visit "/"
    click_link article.name
    click_link "Add image"
    attach_file "Image", "/Users/Joelito/Desktop/Cursos/Rails Udemy/Blog-Udemy-Course/spec/images/rails.png"
    click_button "Save"

    expect(page).to have_xpath("//img[@src='" + image_base_64 + "']")
  end
end