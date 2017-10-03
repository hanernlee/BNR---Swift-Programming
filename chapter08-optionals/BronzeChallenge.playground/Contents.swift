//: Playground - noun: a place where people can play

import UIKit

var errorCodeString : String?
errorCodeString = "404"
if errorCodeString != nil {
    let theError = errorCodeString!
    print(theError)
}

// Optional Binding
// if let temporaryConstant = anOptional {
//    do something
// } else {
//    There was no value in anOptional i.e nil
// }


if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
    print(theError)
//    if let errorCodeInteger = Int(theError) {
        print("\(theError): \(errorCodeInteger)")
//    }
}

// Implicit Optionals
var errorsCodeString: String! = nil
let yetAnotherErrorCodeString = errorsCodeString

// Optional Chaining
var errorCode: String?
errorCode = "404"
var errorDescription: String?
if let theErrors = errorCode, let errorsCodeInteger = Int(theErrors), errorsCodeInteger == 404 {
    errorDescription = "\(errorsCodeInteger + 200): resource was not found!"
}

var upCaseErrorDescription = errorDescription?.uppercased()
errorDescription
upCaseErrorDescription?.append("PLEASE TRY AGAIN.")
upCaseErrorDescription

// Nil coalescing Operator

errorDescription = nil
let descriptions: String?
if let errorDescription = errorDescription {
    descriptions = errorDescription
} else {
    descriptions = "No Error"
}

//Using nil coalescing
let description = errorDescription ?? "No Error"


// Bronze Challenge
//Int  as number of kids can be 0
//String? as name of pet can be nil

// Silver Challenge
// var testing: String?
// var hey = testing!
// Error fatal error: unexpectedly found nil while unwrapping an Optional value
// By using ! we are expecting a value here when unwrapping the Optional but as the value returned is nil, it causes the error















