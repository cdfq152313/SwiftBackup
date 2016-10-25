//
//  RSSParserDelegate.swift
//  HelloRSSReader
//
//  Created by denny on 10/25/16.
//  Copyright © 2016 denny. All rights reserved.
//

import Foundation

class RSSParserDelegate: NSObject, XMLParserDelegate{
    var currentItem: NewsItem?
    var currentElementValue: String?
    var resultArray = [NewsItem]()
    var timer = 0
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("=== did start \(elementName) ===")
        
        switch elementName{
        case "item":
            currentItem = NewsItem()
        case "title":
            currentElementValue = nil
        case "link":
            currentElementValue = nil
        case "pubDate":
            currentElementValue = nil
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("=== did end ===")
        
        switch elementName{
        case "item":
            if currentItem != nil{
                resultArray.append(currentItem!)
                currentItem = nil
            }
        case "title":
            timer += 1
            if timer > 2{
                currentItem?.title = currentElementValue
            }
        case "link":
            if timer > 2{
                currentItem?.link = currentElementValue
            }
        case "pubDate":
            if timer > 2{
                currentItem?.pubDate = currentElementValue
            }
        default:
            break
        }
        currentElementValue = nil
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if currentElementValue == nil{
            currentElementValue = string
        }
        else{
            currentElementValue = currentElementValue! + string
        }
    }
    
    func getResult()->[NewsItem]{
        return resultArray
    }
}
