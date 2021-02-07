require 'rails_helper'

RSpec.feature "Everyone can see articles" do
  before do
    @article_1 = create(:article)
    
    @article_2 = create(:article,
      name: "How to install Ruby on Rails",
      content: "Installation tutorial"
    )
  end

  scenario "Articles are listed" do
    visit "/"

    expect(page).to have_content @article_1.name
    expect(page).to have_content @article_2.name
  end
end