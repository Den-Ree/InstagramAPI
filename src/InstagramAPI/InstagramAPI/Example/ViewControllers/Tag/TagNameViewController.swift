//
//  TagNameViewController.swift
//  InstagramAPI
//
//  Created by Admin on 05.06.17.
//  Copyright © 2017 ConceptOffice. All rights reserved.
//
/*
import UIKit

class TagNameViewController: UIViewController {
  
    var tagName : String?
    @IBOutlet fileprivate weak var mediaCountLabel: UILabel!
    @IBOutlet fileprivate weak var tagNameLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = Instagram.TagsEndpoint.Get.tag(name: tagName!)
        InstagramManager.shared.networkClient.send(request, completion: {
          (responce: InstagramObjectResponse<Instagram.Tag>?, error: Error?) in
            if error == nil{
              if let name = responce?.data?.name{
                  self.tagNameLabel.text?.append(" " + name)
              }
              if let mediaCount = responce?.data?.mediaCount{
                  self.mediaCountLabel.text?.append(" " + String(format: "%i", mediaCount))
              }
            }
        })
    }
}
*/
