"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "ingredients_ingredient_categories", {
      ingredient_id: migrationUtils.foreignKey(Sequelize, "ingredients"),
      ingredient_category_id: migrationUtils.foreignKey(Sequelize, "ingredient_categories"),
      is_primary: {
        type: Sequelize.BOOLEAN,
        defaultValue: false
      }
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("ingredients_ingredient_categories");
  }
};
