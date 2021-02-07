require 'rails_helper'

RSpec.feature "Admins can delete articles" do
  before do
    admin = create(:admin)

    visit "/admins/sign_in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    @article = create(:article)
  end
  
  scenario "It is eliminated" do
    visit "/"

    click_link @article.name
    click_link "Delete"

    expect(page).to have_no_content "Reasons to learn Ruby on Rails"
  end
end