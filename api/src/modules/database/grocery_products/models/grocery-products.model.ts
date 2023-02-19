import { DatabaseEntities } from "../../common/models/database-entities.model";
import { AllowNull, BelongsTo, Column, ForeignKey, Table } from "sequelize-typescript";
import { Ingredients } from "../../ingredients/models/ingredients.model";
import { DataTypes } from "sequelize";
import { TranslationColumn } from "@recursyve/nestjs-rosetta-sequelize";
import { TranslationObject } from "@recursyve/nestjs-rosetta-core";

@Table
export class GroceryProducts extends DatabaseEntities {
    @Column
    @ForeignKey(() => Ingredients)
    public ingredientId: number;

    @Column
    @ForeignKey(() => GroceryProducts)
    public duplicateOfGroceryProductId: number;

    @AllowNull(false)
    @Column(DataTypes.JSON)
    @TranslationColumn()
    public name: TranslationObject;

    @Column(DataTypes.JSON)
    @TranslationColumn()
    public description: TranslationObject;

    @Column
    public skuCode: string;

    @Column(DataTypes.DOUBLE)
    public averagePrice: number;

    @Column
    public averageLifespanDays: number;

    @Column
    public imagePath: string;

    @Column(DataTypes.JSON)
    public productMetadata: object;

    @BelongsTo(() => Ingredients)
    public ingredient: Ingredients;

    @BelongsTo(() => GroceryProducts)
    public duplicateOfGroceryProduct: GroceryProducts;
}
