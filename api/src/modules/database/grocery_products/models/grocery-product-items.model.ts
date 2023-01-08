import { DatabaseEntities } from "../../common/models/database-entities.model";
import { BelongsTo, Column, ForeignKey, Table } from "sequelize-typescript";
import { DataTypes } from "sequelize";
import { Grocers } from "./grocers.model";
import { GroceryProducts } from "./grocery-products.model";

@Table
export class GroceryProductItems extends DatabaseEntities {
    @Column
    @ForeignKey(() => GroceryProducts)
    public groceryProductId: number;

    @Column
    @ForeignKey(() => Grocers)
    public grocerId: number;

    @Column(DataTypes.DOUBLE)
    public price: number;

    @BelongsTo(() => GroceryProducts)
    public groceryProduct: GroceryProducts;

    @BelongsTo(() => Grocers)
    public grocer: Grocers;
}
