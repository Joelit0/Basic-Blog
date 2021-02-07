require 'rails_helper'
require 'base64'

RSpec.feature "Admins can be delete images" do
  before do
    admin = create(:admin)

    visit "/admins/sign_in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
  end
  
  scenario "Images are deleted successfully" do
    article = create(:article)

    image = File.new("/Users/Joelito/Desktop/Cursos/Rails Udemy/Blog-Udemy-Course/spec/images/rails.png")
    image_base_64 = "data:image/jpeg;base64," + Base64.encode64(image.read)
    image_1 = Image.create(image: image_base_64, article_id: article.id)

    visit "/"
    click_link article.name
    click_link "Delete image"

    expect(page).to have_no_xpath("//img[@src='" + image_base_64 + "']")
  end
end