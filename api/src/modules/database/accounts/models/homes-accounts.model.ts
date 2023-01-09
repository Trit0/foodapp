import { DatabaseEntities } from "../../common/models/database-entities.model";
import { BelongsTo, Column, Default, ForeignKey, Table } from "sequelize-typescript";
import { Accounts } from "./accounts.model";
import { Homes } from "./home.model";

@Table
export class HomesAccounts extends DatabaseEntities {
    @Column
    @ForeignKey(() => Accounts)
    public accountId: number;

    @Column
    @ForeignKey(() => Homes)
    public homeId: number;

    @Default(false)
    @Column
    public isAdmin: boolean;

    @BelongsTo(() => Accounts)
    public account: Accounts;

    @BelongsTo(() => Homes)
    public home: Homes;
}
