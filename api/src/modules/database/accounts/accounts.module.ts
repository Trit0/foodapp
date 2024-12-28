import { Module } from "@nestjs/common";
import { SequelizeModule } from "@nestjs/sequelize";
import { Accounts } from "./models/accounts.model";
import { Homes } from "./models/home.model";
import { HomesAccounts } from "./models/homes-accounts.model";

@Module({
    imports: [SequelizeModule.forFeature([Accounts, Homes, HomesAccounts])]
})
export class AccountsModule {}
