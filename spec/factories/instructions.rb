FactoryBot.define do
  factory :instruction do
    recipe

    step { "Prepare Batter: Cream together the butter and sugar, then beat in the eggs one at a time and stir in the vanilla.
            Combine the flour, cocoa powder, baking soda, and salt, then mix into the wet ingredients.
            Prepare for Baking: Spoon globs of the dough onto a cookie sheet.
            Bake: Bake at 350 degrees for 8-10 minutes."
    }
  end
end
