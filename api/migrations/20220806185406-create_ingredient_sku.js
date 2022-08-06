"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "ingredient_skus", {
      ingredient_id: migrationUtils.foreignKey(Sequelize, "ingredients"),
      sku_code: {
        type: Sequelize.STRING,
        allowNull: false
      },
      sku_metadata: {
        type: Sequelize.JSON
      }
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("ingredient_skus");
  }
};
