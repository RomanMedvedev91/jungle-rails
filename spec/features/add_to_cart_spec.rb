require 'rails_helper'

RSpec.feature "Visitor add to cart", type: :feature, js: true do

  # SETUP
  before :each do
   @category = Category.create! name: 'Apparel'
 
     @category.products.create!(
       name:  Faker::Hipster.sentence(3),
       description: Faker::Hipster.paragraph(4),
       image: open_asset('apparel1.jpg'),
       quantity: 10,
       price: 64.99
     )
 end
 
   scenario "They see all products" do
     # ACT
     visit root_path
 
     # DEBUG / VERIFY
     # commented out b/c it's for debugging only
     click_on "Add"

     expect(page).to have_text 'My Cart (1)'
     
     save_screenshot
   end
 
 end