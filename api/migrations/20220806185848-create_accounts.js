"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "accounts", {
      email: {
        type: Sequelize.STRING,
        allowNull: false
      },
      first_name: Sequelize.STRING,
      last_name: Sequelize.STRING
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("accounts");
  }
};
