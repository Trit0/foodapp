import { DatabaseEntities } from "../../common/models/database-entities.model";
import { BelongsTo, Column, Default, ForeignKey, Table } from "sequelize-typescript";
import { Homes } from "../../accounts/models/home.model";
import { GroceryProducts } from "../../grocery_products/models/grocery-products.model";

@Table
export class PantryItems extends DatabaseEntities {
    @Column
    @ForeignKey(() => GroceryProducts)
    public groceryProductId: number;

    @Column
    @ForeignKey(() => Homes)
    public homeId: number;

    @Column
    public itemCount: number;

    @Default(false)
    @Column
    public isLow: boolean;

    // @Column
    // public oldestEntry: Date;
    //
    // @Column
    // public newestEntry: Date;

    @BelongsTo(() => GroceryProducts)
    public groceryProduct: GroceryProducts;

    @BelongsTo(() => Homes)
    public home: Homes;
}
