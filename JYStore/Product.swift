//
//  Product.swift
//  JYStore
//
//  Created by mac on 12/4/15.
//  Copyright © 2015 JY. All rights reserved.
//

import AppKit


struct Product {
  let title: String
  let audience: String
  let descriptionText: String
  let price: NSNumber
  var image: NSImage? {
    get {
      let i = NSImage(named: imageName)
      
      return i
    }
  }
  
  private let imageName: String
  
  static func productsList(fileName: String) -> [Product] {
    var products = [Product]()
    
    if let productList = NSArray(contentsOfFile: fileName) as? [NSDictionary] {
      for dict in productList {
        let product = Product(dictionary: dict)
        products.append(product)
      }
    }
    
    return products
  }
  
  init(dictionary: NSDictionary) {
    title = dictionary.objectForKey("Name") as! String
    audience = dictionary.objectForKey("Audience") as! String
    descriptionText = dictionary.objectForKey("Description") as! String
    price = dictionary.objectForKey("Price") as! NSNumber
    imageName = dictionary.objectForKey("Imagename") as! String
  }
}

