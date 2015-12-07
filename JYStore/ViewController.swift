//
//  ViewController.swift
//  JYStore
//
//  Created by mac on 12/4/15.
//  Copyright © 2015 JY. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  @IBOutlet weak var productsButton: NSPopUpButton!
  
  private var overviewViewController: OverviewController!
  private var detailViewController: DetailViewController!
  
  
  private var products = [Product]()
  var selectProduct: Product!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    if let filePath = NSBundle.mainBundle().pathForResource("Products", ofType: "plist") {
      products = Product.productsList(filePath)

    }
    
    productsButton.removeAllItems()
    
    for product in products {
      productsButton.addItemWithTitle(product.title)
    }
    
    selectProduct = products[0]
    productsButton.selectItemAtIndex(0)
  }
  @IBAction func valueChanged(sender: NSPopUpButton) {

    if let bookTitle = sender.selectedItem?.title,
      let index = products.indexOf({$0.title == bookTitle}) {
        selectProduct = products[index]
        overviewViewController.selectedProduct = selectProduct
        detailViewController.selectedProduct = selectProduct
    }
  }
  
  override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
    // 1. get the refrence to the TabViewController
    let tableViewController = segue.destinationController as! NSTabViewController
    // 2. Iterates over all its child view controllers
      for controller in tableViewController.childViewControllers {
        // 3. Check if the current child view controller is an instance of OverviewController, and if it is, sets its selectedProduct property.
        if controller is OverviewController {
          overviewViewController = controller as! OverviewController
          overviewViewController.selectedProduct = selectProduct
        } else {
          
          detailViewController = controller as! DetailViewController
          detailViewController.selectedProduct = selectProduct
          
        }
      }
  }
  
  override var representedObject: AnyObject? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

