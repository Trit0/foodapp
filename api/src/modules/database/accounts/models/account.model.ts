import { DatabaseEntities } from "../../common/models/database-entities.model";
import { Column, Table } from "sequelize-typescript";

@Table
export class Accounts extends DatabaseEntities {
  @Column
  public email: string;

  @Column
  public firstName: string;

  @Column
  public lastName: string;
}
