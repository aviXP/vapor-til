import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    // Register a new route at /api/acronyms that accepts a POST request and returns Future<Acronym>. It returns the acronym once it’s saved.
    router.post("api", "acronyms") { req -> Future<Acronym> in
        return try req.content.decode(Acronym.self)         // Decode the request’s JSON into an Acronym model using Codable...
        .flatMap(to: Acronym.self) { acronym in             // ...this returns a Future<Acronym> so it uses a flatMap(to:) to extract the acronym when the decoding is complete.
            return acronym.save(on: req)                    // Save the model using Fluent. This returns Future<Acronym> as it returns the model once it’s saved.
        }
    }

    // Example of configuring a controller
//    let todoController = TodoController()
//    router.get("todos", use: todoController.index)
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)
}
