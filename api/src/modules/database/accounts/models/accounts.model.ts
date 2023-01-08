import { DatabaseEntities } from "../../common/models/database-entities.model";
import { AllowNull, Column, Table } from "sequelize-typescript";
import { Languages } from "../../../translations/languages.enum";

@Table
export class Accounts extends DatabaseEntities {
  @AllowNull(false)
  @Column
  public email: string;

  @Column
  public firstName: string;

  @Column
  public lastName: string;

  @Column
  public password: string;

  @Column
  public language: Languages;
}
