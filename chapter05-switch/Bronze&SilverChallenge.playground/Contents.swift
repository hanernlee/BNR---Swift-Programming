//: Playground - noun: a place where people can play

import UIKit

var statusCode: Int = 200
var errorString: String = "The request failed with the error:"

switch statusCode {
case 100, 101:
    errorString += "Informational, \(statusCode)."
case 204:
    errorString += "Successful but no content, \(statusCode)."
case 300...307:
    errorString += "Redirection, \(statusCode)"
case 400...417:
    errorString += "Client Error, \(statusCode)."
case 500...505:
    errorString += "Server Error, \(statusCode)"
case let unknownCode where (unknownCode >= 200 && unknownCode < 300 || unknownCode > 505):
    errorString = "\(unknownCode) is not a known error code."
default:
    errorString = "Unexpected error code"
}

// Tuple
let error = (code: statusCode, error: errorString)
error.code
error.error

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

// _ is a wildcard that matches anything
switch errorCodes {
case(404, 404):
    print("No items found")
case(404, _):
    print ("First item not found")
case (_, 404):
    print ("Second item not found")
default:
    print("All items found")
}

// Switch vs If Else
let age = 25

switch age {
case 18...35:
    print("Cool demographic")
default:
    break
}

if case 18...35 = age, age >= 21 {
    print ("Cool demographic")
}

// Silver Challenge
// In cool demographic, of drinking age, not in their 30s
if case 18...35 = age, age >= 21, age < 30 {
    print ("Cool demographic")
}

// Bronze Challenge
let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant 2")
case let q3 where (point.x < 0) && point.y < 0:
    print("\(q3) is in quadrant 3")
case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 4")
case (_, 0):
    print("\(point) sits on the x-axis")
case(0, _):
    print("\(point) sits on the y-axis")
default:
    print("Case not covered")
}





