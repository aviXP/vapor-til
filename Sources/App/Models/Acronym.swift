import Vapor
import FluentPostgreSQL

// It’s good practice to mark classes final, where possible, as it provides a performance benefit.
// Models must conform to 'Codable'
final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long:String) {
        self.short = short
        self.long = long
    }
}

//extension Acronym: Model {
//    // a named alias of an existing type
//    typealias Database = SQLiteDatabase
//    typealias ID = Int
//
//    public static var idKey: IDKey = \Acronym.id
//}

// Aboove code can be improved further with SQLiteModel:

extension Acronym: PostgreSQLModel {}
extension Acronym: Migration {}
// Vapor provides Content, a wrapper around Codable, which allows you to convert models and other data between various formats.
extension Acronym: Content {}

