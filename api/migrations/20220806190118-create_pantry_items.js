"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "pantry_items", {
      ingredient_id: migrationUtils.foreignKey(Sequelize, "ingredients"),
      account_id: migrationUtils.foreignKey(Sequelize, "accounts"),
      item_count: {
        type: Sequelize.INTEGER,
        default: 0
      },
      oldest_entry: {
        type: Sequelize.DATE
      },
      newest_entry: {
        type: Sequelize.DATE
      }
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("pantry_items");
  }
};
