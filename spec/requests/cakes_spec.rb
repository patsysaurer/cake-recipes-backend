require 'rails_helper'

RSpec.describe "Cakes", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets a list of cakes' do
      cake = user.cakes.create(
        cakeName: "Birthday Cake",
        cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
        cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
        cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
        cakeServings: 12,
        cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
      )
      get '/cakes'

      cake = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cake.first['cakeName']).to eq('Birthday Cake')
      expect(cake.first['cakeDescription']).to eq("Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!")
      expect(cake.first['cakeIngredients']).to eq("350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk")
      expect(cake.first['cakeInstructions']).to eq("1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.")
      expect(cake.first['cakeServings']).to eq(12)
      expect(cake.first['cakeImage']).to eq('https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg')
    end
  end

  describe "POST /create" do 
    it "creates a cake" do
      cake_params = {
        cake: {
          cakeName: 'Birthday Cake',
          cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
          cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
          cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
          cakeServings: 12,
          cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg",
          user_id: user.id
        }
      }

      post '/cakes', params: cake_params

      cake = Cake.first
      expect(response).to have_http_status(200)
      expect(cake.cakeName).to eq('Birthday Cake')
      expect(cake.cakeDescription).to eq ("Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!")
      expect(cake.cakeIngredients).to eq ("350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk")
      expect(cake.cakeInstructions).to eq("1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.")
      expect(cake.cakeServings).to eq(12)
      expect(cake.cakeImage).to eq("https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg")
      expect(cake.user_id).to eq(user.id)
    end

    it "cannot create a cake without a name" do 
      cake_params = {
        cake: {
          cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
          cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
          cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
          cakeServings: 12,
          cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg",
          user_id: user.id
        }
    }

    post '/cakes', params: cake_params
    cake = JSON.parse(response.body)
    expect(response).to have_http_status(422)
    expect(cake['cakeName']).to include "can't be blank"
end

    it "cannot create a cake without a description" do 
      cake_params = {
        cake: {
          cakeName: "Birthday Cake",
          cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
          cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
          cakeServings: 12,
          cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg",
          user_id: user.id
        }
    }

    post '/cakes', params: cake_params
    cake = JSON.parse(response.body)
    expect(response).to have_http_status(422)
    expect(cake['cakeDescription']).to include "can't be blank"
  end

    it "cannot create a cake without ingredients" do 
      cake_params = {
        cake: {
          cakeName: "Birthday Cake",
          cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
          cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
          cakeServings: 12,
          cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg",
          user_id: user.id
        }
    }

    post '/cakes', params: cake_params
    cake = JSON.parse(response.body)
    expect(response).to have_http_status(422)
    expect(cake['cakeIngredients']).to include "can't be blank"
  end

    it "cannot create a cake without instructions" do 
      cake_params = {
        cake: {
          cakeName: "Birthday Cake",
          cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
          cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
          cakeServings: 12,
          cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg",
          user_id: user.id
        }
      }

      post '/cakes', params: cake_params
      cake = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(cake['cakeInstructions']).to include "can't be blank"
    end

      it "cannot create a cake without cake servings" do 
        cake_params = {
          cake: {
            cakeName: "Birthday Cake",
            cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
            cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
            cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
            cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg",
            user_id: user.id
          }
        }

        post '/cakes', params: cake_params
        cake = JSON.parse(response.body)
        expect(response).to have_http_status(422)
        expect(cake['cakeServings']).to include "can't be blank"
      end

      it "cannot create a cake without a cake image" do 
        cake_params = {
          cake: {
            cakeName: "Birthday Cake",
            cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
            cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
            cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
            cakeServings: 12,
            user_id: user.id
          }
        }

        post '/cakes', params: cake_params
        cake = JSON.parse(response.body)
        expect(response).to have_http_status(422)
        expect(cake['cakeImage']).to include "can't be blank"
      end
  end 
end 