//
//  OverviewController.swift
//  JYStore
//
//  Created by mac on 12/4/15.
//  Copyright © 2015 JY. All rights reserved.
//

import Cocoa

class OverviewController: NSViewController {

  @IBOutlet weak var titleLabel: NSTextField!
  @IBOutlet weak var priceLabel: NSTextField!
  @IBOutlet weak var descriptionLabel: NSTextField!
  @IBOutlet weak var productImageView: NSImageView!
  
  // show the value of the price, formatted as currently
  let numberformatter = NSNumberFormatter()
  
  // hold currently selected product. Every time the calue change, 'didSet' will executed, and with updateUI()
  var selectedProduct: Product? {
    didSet {
      updateUI()
    }
  }
  
  
  private func updateUI() {
    // Checks to see if the view is loaded. viewLoaded is a property of NSViewController, and it's true if the view is loaded into memory. if the view is loaded, it's safe to access all view-related properties, like the labels.
    if viewLoaded {
      // Unwarps selectedProduct to see if there is a product. After that, the labels and iamge are updated to show the appropraiate value.
      if let product = selectedProduct {
        productImageView.image = product.image
        titleLabel.stringValue = product.title
        priceLabel.stringValue = numberformatter.stringFromNumber(product.price)!
        descriptionLabel.stringValue = product.descriptionText
      }
    }
    
  }
  
  /*
  
    viewControler life cycle
  
    viewDidLoad() : is called once the view full load and can be used to do one-time initializations  like register for notifications, or API calls that inly need to be done once
    viewWillAppear() : is called every time the view is about to appear on screen. It is a good time to update your UI or to refresh your data model.
    viewDidAppear() : is called after the view appears on screen. Here you can start some fancy animations.
  
  
  
  Lifetime
  
  updateViewConstraints() :  每次布局改变的时候调用
  viewWillLayout()        :  在 layout() 方法调用之前调用
  viewDidLayout()         :  在 laout()  方法调用之后调用
  
  
  Terminnation
  
  viewWillDisappear()  :  Here you can stop your fancy animations your started in viewDidAppear().
  viewDidDisappear()   :  Here you can discard everything you no longer need. For example, you could invalidate a timer you used to update your model on a periodic time base.
  */
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    numberformatter.numberStyle = .CurrencyStyle
  }
  
  override func viewWillAppear() {
    updateUI()
  }
}












