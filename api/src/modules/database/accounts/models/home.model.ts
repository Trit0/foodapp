import { DatabaseEntities } from "../../common/models/database-entities.model";
import { AllowNull, BelongsTo, Column, ForeignKey, Table } from "sequelize-typescript";
import { Accounts } from "./accounts.model";
import { DataTypes } from "sequelize";
import { TranslationObject } from "@recursyve/nestjs-rosetta-core";
import { TranslationColumn } from "@recursyve/nestjs-rosetta-sequelize";

@Table
export class Homes extends DatabaseEntities {
    @Column
    @ForeignKey(() => Accounts)
    public ownerAccountId: number;

    @AllowNull(false)
    @Column(DataTypes.JSON)
    @TranslationColumn()
    // TODO should be a string
    public name: TranslationObject;

    @BelongsTo(() => Accounts)
    public ownerAccount: Accounts;
}
