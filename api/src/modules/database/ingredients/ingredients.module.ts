import { Module } from "@nestjs/common";
import { SequelizeModule } from "@nestjs/sequelize";
import { Ingredients } from "./models/ingredients.model";
import { IngredientCategories } from "./models/ingredient-categories.model";
import { IngredientsIngredientCategories } from "./models/ingredients-ingredient-categories.model";

@Module({
    imports: [
        SequelizeModule.forFeature([Ingredients, IngredientCategories, IngredientsIngredientCategories])
    ]
})
export class IngredientsModule {}
