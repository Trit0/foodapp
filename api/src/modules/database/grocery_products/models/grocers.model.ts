import { DatabaseEntities } from "../../common/models/database-entities.model";
import { Column, Table } from "sequelize-typescript";

@Table
export class Grocers extends DatabaseEntities {
    @Column
    public name: string;

    @Column
    public website: string;
}
