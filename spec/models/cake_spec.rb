require 'rails_helper'

RSpec.describe Cake, type: :model do
  let(:user) { User.create(
    email: 'test1@example.com',
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

  it 'should validate cake description' do
    cake = user.cakes.create(
      cakeName: 'Birthday Cake'
      cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
      cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
      cakeServings: 12,
      cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    )
    expect(cake.errors[:cakeDescription]).to include("can't be blank")
  end

  it 'should validate cake ingredients' do
    cake = user.cakes.create(
      cakeName: 'Birthday Cake'
      cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
      cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
      cakeServings: 12,
      cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    )
    expect(cake.errors[:cakeIngredients]).to include("can't be blank")
  end

  it 'should validate cake instructions' do
    cake = user.cakes.create(
      cakeName: 'Birthday Cake'
      cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
      cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
      cakeServings: 12,
      cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    )
    expect(cake.errors[:cakeInstructions]).to include("can't be blank")
  end

  it 'should validate cake servings' do
    cake = user.cakes.create(
      cakeName: 'Birthday Cake'
      cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
      cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
      cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
      cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    )
    expect(cake.errors[:cakeServings]).to include("can't be blank")
  end

  it 'should validate cake image' do
    cake = user.cakes.create(
      cakeName: 'Birthday Cake'
      cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
      cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
      cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
      cakeServings: 12
    )
    expect(cake.errors[:cakeImage]).to include("can't be blank")
  end
  
  it 'Has at least 5 characters for Description' do 
    cake = Cake.create(
      cakeName: 'Birthday Cake',
      cakeDescription: 'Yum',
      cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
      cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
      cakeServings: 12,
      cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    )
    expect(cake.errors[:cakeDescription]).to_not be_empty
  end

  it 'Has at least 5 characters for Ingredients' do 
    cake = Cake.create(
      cakeName: 'Birthday Cake',
      cakeDescription: 'Yummy vanilla cake with sprinkles',
      cakeIngredients:"350 g",
      cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
      cakeServings: 12,
      cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    )
    expect(cake.errors[:cakeIngredients]).to_not be_empty
  end

  it 'Has at least 5 characters for Instructions' do 
    cake = Cake.create(
      cakeName: 'Birthday Cake',
      cakeDescription: 'Yummy vanilla cake with sprinkles',
      cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
      cakeInstructions:"1. Preheat",
      cakeServings: 12,
      cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    )
    expect(cake.errors[:cakeInstructions]).to_not be_empty
  end

  it 'Has at least 1 character for servings' do 
    cake = Cake.create(
      cakeName: 'Birthday Cake',
      cakeDescription: 'Yummy vanilla cake with sprinkles',
      cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
      cakeInstructions:"1. Preheat the oven to 375°F.",
      cakeServings: ,
      cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    )
    expect(cake.errors[:cakeServings]).to_not be_empty
  end

  it 'Has at least 10 characters for image' do 
    cake = Cake.create(
      cakeName: 'Birthday Cake',
      cakeDescription: 'Yummy vanilla cake with sprinkles',
      cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
      cakeInstructions:"1. Preheat the oven to 375°F.",
      cakeServings: 12,
      cakeImage:"https:"
    )
    expect(cake.errors[:cakeImage]).to_not be_empty
  end



end
