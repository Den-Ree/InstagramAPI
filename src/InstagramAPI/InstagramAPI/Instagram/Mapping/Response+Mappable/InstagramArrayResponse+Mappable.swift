//
//  InstagramArrayResponse+Mappable.swift
//  ConceptOffice
//
//  Created by Den Ree on 06/08/2017.
//  Copyright © 2017 Den Ree. All rights reserved.
//

import ObjectMapper

extension InstagramArrayResponse {
  // MARK: - Mappable
  init?(map: Map) {}
  mutating func mapping(map: Map) {
    data <- map[Instagram.Keys.Response.data]
    meta <- map[Instagram.Keys.Response.meta]
    pagination <- map[Instagram.Keys.Response.pagination]
  }
}

// MARK: - InstagramPaginationInfo

extension InstagramPaginationInfo: Mappable {
  // MARK: - Mappable
  init?(map: Map) {
    self.init()
  }
  mutating func mapping(map: Map) {
    nextURL <- (map[Instagram.Keys.Pagination.nextURL], URLTransform())
    nextMaxId <- map[Instagram.Keys.Pagination.nextMaxId]
  }
}
