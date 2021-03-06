require 'rails_helper'

describe 'From the profile page' do
  # before :each do
  #   Profile.create(:)
  # end

  it 'allows you to create topics' do
    visit root_path
    expect(page).to have_content 'Find A Speaker'
    click_on 'Become A Speaker'
    expect(page).to have_content 'Create A New Profile'
    fill_in 'profile_name', with: 'Julia Stiles'
    fill_in 'user_email', with: 'julia@example.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    fill_in 'profile_location', with: 'Boston'
    fill_in 'profile_title', with: 'Actor'
    select 'Arts and Crafts', from: 'profile_industry'
    fill_in 'profile_company', with: 'Sony'
    fill_in 'profile_twitter', with: 'https://twitter.com/missjuliastiles'
    fill_in 'profile_linkedin', with: 'http://linkedin.com/in/juliastiles'
    fill_in 'profile_website', with: 'http://juliastiles.com'
    fill_in 'profile_blog_url', with: 'http://juliastiles.wordpress.com'
    fill_in 'profile_summary', with: 'Star of many movies'
    fill_in 'profile_video', with: 'https://www.youtube.com/watch?v=AsY1QgcCT-s'
    fill_in 'profile_origin_story', with: 'Bacon ipsum dolor amet pork loin leberkas shank tri-tip, filet mignon picanha boudin meatloaf shankle.'
    fill_in 'profile_passion', with: 'Doing acting and stuff'
    attach_file 'profile_picture', 'spec/fixtures/cat1.jpg'
    click_on 'Submit Profile'

    expect(page).to have_xpath('//img[contains(@src, "cat1.jpg")]')
    expect(page).to have_content('Hi Julia Stiles')
  end
end
