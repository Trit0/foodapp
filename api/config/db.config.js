module.exports = {
    HOST: "localhost",
    USER: "root",
    PASSWORD: null,
    DB: "foodapp",
    dialect: "mysql",
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    },
    autoLoadModels: true,
    synchronize: false,
    define: {
        timestamps: true,
        paranoid: true,
        updatedAt: "updated_at",
        createdAt: "created_at",
        deletedAt: "deleted_at",
        underscoredAll: true,
        defaultScope: {
            attributes: {
                exclude: ["updated_at", "created_at", "deleted_at"]
            }
        }
    },
};