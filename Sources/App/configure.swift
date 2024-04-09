import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor
import TelegramVaporBot

// configures your application
public func configure(_ app: Application) async throws {
    let tgApi: String = "6918213915:AAEL9QqWRiA8RCdA3ALiAuVDqGCfPERF6VM"
    TGBot.log.logLevel = app.logger.logLevel
    let bot: TGBot = .init(app: app, botId: tgApi)
    await TGBOT.setConnection(try await TGLongPollingConnection(bot: bot))
    await DefaultBotHandlers.addHandlers(app: app, connection: TGBOT.connection)
    try await TGBOT.connection.start()

    // register routes
    try routes(app)
}
