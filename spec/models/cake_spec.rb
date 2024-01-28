require 'rails_helper'

RSpec.describe Cake, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate cake name' do
    cake = user.cakes.create(
      cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
      cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
      cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
      cakeServings: 12,
      cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    )
    expect(cake.errors[:cakeName]).to include("can't be blank")
  end
end
