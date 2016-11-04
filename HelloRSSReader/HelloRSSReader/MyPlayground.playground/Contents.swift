//: Playground - noun: a place where people can play

import Alamofire
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let imageData = UIImagePNGRepresentation(#imageLiteral(resourceName: "AWVjqMA.gif"))

Alamofire.upload(
    multipartFormData: { multipartFormData in
        multipartFormData.append(imageData!, withName: "name")
    },
    to: "https://httpbin.org/post",
    encodingCompletion: { encodingResult in
        switch encodingResult {
        case .success(let upload, _, _):
            upload.responseJSON { response in
                print(response)
            }
        case .failure(let encodingError):
            print(encodingError)
        }
    }
)
