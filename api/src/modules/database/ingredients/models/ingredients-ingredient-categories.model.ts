import { DatabaseEntities } from "../../common/models/database-entities.model";
import { BelongsTo, Column, Default, ForeignKey, Table } from "sequelize-typescript";
import { Ingredients } from "./ingredients.model";
import { IngredientCategories } from "./ingredient-categories.model";

@Table
export class IngredientsIngredientCategories extends DatabaseEntities {
    @Column
    @ForeignKey(() => Ingredients)
    public ingredientId: number;

    @Column
    @ForeignKey(() => IngredientCategories)
    public ingredientCategoryId: number;

    @Default(false)
    @Column
    public isPrimary: boolean;

    @BelongsTo(() => Ingredients)
    public ingredient: Ingredients;

    @BelongsTo(() => IngredientCategories)
    public ingredientCategory: IngredientCategories;
}
