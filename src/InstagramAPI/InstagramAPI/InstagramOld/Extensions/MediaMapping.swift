//
//  MediaMapping.swift
//  InstagramAPI
//
//  Created by Admin on 04.08.17.
//  Copyright © 2017 ConceptOffice. All rights reserved.
//

import Foundation
import ObjectMapper

public struct InstagramMedia: InstagramObject{
  
      public enum MediaType: String {
        case image = "image"
        case video = "video"
      }
  
     fileprivate(set) var user: InstagramUser?
     fileprivate(set) var userHasLiked: Bool?
     fileprivate(set) var createdDate: Date?
     fileprivate(set) var link: URL?
     fileprivate(set) var caption: InstagramComment?
     fileprivate(set) var tagsCount: Int = 0
     fileprivate(set) var likesCount: Int = 0
     fileprivate(set) var commentsCount: Int = 0
     fileprivate(set) var location: InstagramLocation?
     fileprivate(set) var type: String?
     fileprivate(set) var image: InstagramImage?
     fileprivate(set) var video: InstagramVideo?
     fileprivate(set) var tags: [String]?
     fileprivate(set) var objectId: String?
  
     var isVideo: Bool {
       return type == MediaType.video.rawValue
     }
  
}

extension InstagramMedia{
  
  
  public init?(map: Map) {}
  
  mutating public func mapping(map: Map){
    objectId <- map[Instagram.Keys.Object.id]
    user <- map[Instagram.Keys.Object.user]
    userHasLiked <- map[Instagram.Keys.Media.userHasLiked]
    createdDate <- (map[Instagram.Keys.Object.createdTime], InstagramDateTransform())
    link <- (map[Instagram.Keys.Media.link], URLTransform())
    caption <- map[Instagram.Keys.Media.caption]
    tagsCount <- map[Instagram.Keys.Media.tags + String.dotString + Instagram.Keys.Media.count]
    likesCount <- map[Instagram.Keys.Media.likes + String.dotString + Instagram.Keys.Media.count]
    commentsCount <- map[Instagram.Keys.Media.comments + String.dotString + Instagram.Keys.Media.count]
    image <- (map[Instagram.Keys.Media.images], InstagramImageTransform())
    video <- (map[Instagram.Keys.Media.videos], InstagramVideoTransform())
    type <- map[Instagram.Keys.Media.type]
    tags <- map[Instagram.Keys.Media.tags]
  }
}
