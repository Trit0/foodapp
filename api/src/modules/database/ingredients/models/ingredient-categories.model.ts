import { DatabaseEntities } from "../../common/models/database-entities.model";
import { Column, Table } from "sequelize-typescript";
import { DataTypes } from "sequelize";
import { TranslationObject } from "@recursyve/nestjs-rosetta-core";
import { TranslationColumn } from "@recursyve/nestjs-rosetta-sequelize";

@Table
export class IngredientCategories extends DatabaseEntities {
    @Column(DataTypes.JSON)
    @TranslationColumn()
    public name: TranslationObject;

    @Column(DataTypes.JSON)
    @TranslationColumn()
    public description: TranslationObject;
}
