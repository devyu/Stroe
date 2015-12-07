//
//  DetailViewController.swift
//  JYStore
//
//  Created by mac on 12/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

  @IBOutlet weak var productImageView: NSImageView!
  @IBOutlet weak var titleLabel: NSTextField!
  @IBOutlet weak var descriptionLabel: NSTextField!
  @IBOutlet weak var audienceLabel: NSTextField!
  
  var selectedProduct: Product? {
    didSet {
      updateUI()
    }
  }
  
  override func viewWillAppear() {
    updateUI()
  }
  
  private func updateUI() {
    if viewLoaded {
      if let product = selectedProduct {
        productImageView.image = product.image
        titleLabel.stringValue = product.title
        descriptionLabel.stringValue = product.descriptionText
        audienceLabel.stringValue = product.audience
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
      // Do view setup here.
  }
    
}
