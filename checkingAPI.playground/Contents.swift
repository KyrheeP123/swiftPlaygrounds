import UIKit

//if #available(platform name version, ..., *) {
//    statements to execute if the APIs are available
//} else {
//    fallback statements to execute if the APIs are unavailable
//}


if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}


enum APIAvailability: Error{
    case APIUnavailable
}
guard #available(iOS 10, macOS 10.12, *) else {
    throw APIAvailability.APIUnavailable
    // Fall back to earlier iOS and macOS APIs
}
// Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
