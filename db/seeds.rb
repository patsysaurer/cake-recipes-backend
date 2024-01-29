user1 = User.where(email: "test1@example.com").first_or_create(password:
"password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password:
"password", password_confirmation: "password")


user1_cakes = [
    {
        cakeName: "Honey Cake",
        cakeDescription: "Sweet honey cake buzzing with flavor and balanced with a honey cream cheese icing and honey glaze!",
        cakeIngredients:"170 g Honey, 8 g Vanilla, 4 Eggs, 300 g Buttermilk, 168 g Sugar, 226 g Butter, 400 g AP Flour, 7 g Baking Powder, 5 g Salt, 1 tsp Cinnamon, 1/4 tsp Nutmeg, 1/8 tsp Ginger, 1/8 tsp Cloves",
        cakeInstructions:"1. Preheat the oven to 350°F. 2. Line two 9” cake pans with parchment paper. 3. In a large bowl, sift together the dry ingredients. 4. In a bowl of a stand mixer fitted with a paddle attachment, cream together the butter and sugar. 5. Then add in the eggs, honey, and vanilla and combine. 6. Alternate the dry ingredients with the buttermilk until combined. 7. Pour the batter evenly into the prepared cake pans. 8. Bake for 30 minutes or until a cake pin comes out clean. 9. Cool on a wire rack for about 15 minutes before removing.",
        cakeServings: 12,
        cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706415571/honey-cake_hcmhqo.jpg"
    },
    {
        cakeName: "Birthday Cake",
        cakeDescription: "Vanilla cake filled and frosted with vanilla cream cheese icing and topped with sprinkles!",
        cakeIngredients:"350 g AP flour, 8 g Baking powder, 3.7 g Salt, 227 g Butter, softened, 417 g Sugar, 5 Eggs, 2 tsp Vanilla extract, 270 ml	Buttermilk",
        cakeInstructions:"1. Preheat the oven to 375°F. 2. Grease and line two 9” cake pans with parchment paper. 3. In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. 4. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 5. With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 6. Pour the batter into the prepared pans, making sure to scale each one evenly. 7. Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. 8. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. 9. Let the cakes cool completely before slicing and filling.",
        cakeServings: 12,
        cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706416608/bday-cake_u6ivhn.jpg"
    }
]

user2_cakes = [
    {
        cakeName: "Mommy's Carrot Cake",
        cakeDescription: "Loaded with spices and flavor, filled and topped with cream cheese frosting!",
        cakeIngredients:"
        402 g		Sugar
        272 g		Vegetable oil 
        4 		    Eggs
        454 g		Carrots, grated
        240 g		AP flour
        2 tsp		Baking soda
        1 ½ tsp	    Salt
        2 ½ tsp 	Cinnamon
        1 cup		Chopped Pecans *optional",
        cakeInstructions:"1.Line two 9” cake pans with parchment paper and spray the paper with nonstick pan spray and set aside. 2.In a large bowl, whisk together the sugar, oil and eggs until completely blended then fold in the grated carrots. 3.In a separate bowl, sift together the flour, baking soda, salt and cinnamon. 4.Fold the dry ingredients with the wet ingredients. 5	Divide the batter in the prepare pans and bake 45-50 minutes, firm center and peeling away form the sides. 6. Remove the cake and let stand in the pans on a cooling rack for 10 minutes. 7	Invert the layers on a sheet of wax paper, remove the pan and peel the parchment from the bottom of the cake and place the cake pan over the cake to cover and seal in the moisture. Cool for at least 2 hours.",
        cakeServings: 15,
        cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706545980/mommys-cake_lw8a4z.jpg"
    },
    {
        cakeName: "Chocolate Cake",
        cakeDescription: "Decadent chocolate cake, filled with chocolate italian buttercream.",
        cakeIngredients:"
        300 g		AP flour
        1 tsp		Baking soda
        ½ tsp 		Salt
        64 g		Cocoa powder
        113 g		Butter, softened
        177 g		Sugar
        1 tsp		Vanilla extract
        2 		    Eggs
        405 g		Buttermilk",
        cakeInstructions:"Preheat the oven to 375°F. Grease and line two 9” cake pans with parchment paper. 
        In a medium bowl, whisk together the flour, baking soda, salt and cocoa powder and pass them through a sifter and set aside. 
        In a stand mixer fitted with a paddle attachment, cream together the butter and sugar until fluffy. Scrape down the sides and beat in the eggs one at a time until incorporated, then add in vanilla. 
        With the mixer on the lowest speed, gradually add the dry ingredients alternating with the buttermilk and mix until smooth and creamy. 
        Pour the batter into the prepared pans, making sure to scale each one evenly. 
        Bake for 28-30 minutes or until the cake tester comes out clean. Allow the cakes to rest in the pans for 10 minutes. Run a knife around the edges to loosen the cake and invert it onto a cooling rack. Let the cakes cool completely before slicing and filling.",
        cakeServings: 10,
        cakeImage:"https://res.cloudinary.com/dl11m63ow/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1706546890/chocolate-cake_yf5t3o.jpg"
    }
]

user1_cakes.each do |cake| 
    user1.cakes.create(cake)
    p "created: #{cake}"
end

user2_cakes.each do |cake| 
    user2.cakes.create(cake)
    p "created: #{cake}"
end