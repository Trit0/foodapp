import { DatabaseEntities } from "../../common/models/database-entities.model";
import { AllowNull, BelongsTo, Column, ForeignKey, Table } from "sequelize-typescript";
import { Accounts } from "./accounts.model";
import { Translation } from "../../../translations/models/translation.model";
import { DataTypes } from "sequelize";

@Table
export class Homes extends DatabaseEntities {
    @Column
    @ForeignKey(() => Accounts)
    public ownerAccountId: number;

    @AllowNull(false)
    @Column(DataTypes.JSON)
    public name: Translation;

    @BelongsTo(() => Accounts)
    public ownerAccount: Accounts;
}
