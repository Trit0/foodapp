"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "ingredients", {
      duplicate_of: migrationUtils.foreignKey(Sequelize, "ingredients", true),
      name: {
        type: Sequelize.JSON,
        allowNull: false
      },
      description: {
        type: Sequelize.JSON
      },
      average_price: {
        type: Sequelize.FLOAT
      },
      average_lifespan: {
        type: Sequelize.INTEGER
      }
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("ingredients");
  }
};
