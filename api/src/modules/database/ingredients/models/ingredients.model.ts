import { DatabaseEntities } from "../../common/models/database-entities.model";
import { AllowNull, BelongsTo, Column, ForeignKey, Table } from "sequelize-typescript";
import { DataTypes } from "sequelize";
import { TranslationObject } from "@recursyve/nestjs-rosetta-core";
import { TranslationColumn } from "@recursyve/nestjs-rosetta-sequelize";

@Table
export class Ingredients extends DatabaseEntities {
    @Column
    @ForeignKey(() => Ingredients)
    public variationOfIngredientId: number;

    @AllowNull(false)
    @Column(DataTypes.JSON)
    @TranslationColumn()
    public name: TranslationObject;

    @Column(DataTypes.JSON)
    @TranslationColumn()
    public description: TranslationObject;

    @Column
    public imagePath: string;

    @BelongsTo(() => Ingredients)
    public variationOfIngredient: Ingredients;
}
