module.exports = {
    createDatabaseEntity: (queryInterface, Sequelize, tableName, attributes) => {
        return queryInterface.createTable(tableName, {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false
            },
            ...attributes,
            created_at: Sequelize.DATE,
            updated_at: Sequelize.DATE,
            deleted_at: Sequelize.DATE
        });
    },
    foreignKey: (Sequelize, referenceModel, allowNull = false) => {
        return {
            type: Sequelize.INTEGER,
            allowNull,
            references: {
                key: "id",
                model: referenceModel
            },
            onUpdate: "cascade",
            onDelete: "cascade"
        };
    },
    addAllColumns: (queryInterface, table, columns) => {
        return Promise.all(Object.keys(columns).map((key) => queryInterface.addColumn(table, key, columns[key])));
    },
    removeAllColumns: (queryInterface, table, columns) => {
        return Promise.all(columns.map((column) => queryInterface.removeColumn(table, column)));
    }
};