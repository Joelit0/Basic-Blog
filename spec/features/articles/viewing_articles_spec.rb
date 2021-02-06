require 'rails_helper'

RSpec.feature "Everyone can see articles" do
  scenario "Articles are listed" do
    article_1 = Article.create(
      name: "Reasons to learn Ruby on Rails",
      content: "It's a great programming language"
    )
    
    article_2 = Article.create(
      name: "How to install Ruby on Rails",
      content: "Installation tutorial"
    )

    visit "/"

    expect(page).to have_content article_1.name
    expect(page).to have_content article_2.name
  end
end