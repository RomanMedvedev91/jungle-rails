require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

RSpec.feature "Visitor navigates to product", type: :feature, js: true do

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
     click_on "Details"
     expect(page).to have_css 'section.products-show'
     
     save_screenshot
   end
 
 end