//
//  InstagramUserService.swift
//  ConceptOffice
//
//  Created by Denis on 25.02.16.
//  Copyright © 2016 Den Ree. All rights reserved.
//

import UIKit

typealias InstagramUserBlock = (InstagramUser?, Error?)->()
typealias InstagramUsersBlock = ([InstagramUser]?, Error?)->()
typealias InstagramFollowersBlock = ([InstagramFollower]?, Error?)->()


class InstagramUserService: InstagramBaseService {
    
    //MARK: Public
    func fetchUser(userId: String?, completion: @escaping InstagramUserBlock) {
        sendUserRequest(userId: userId, completion: completion)
    }
    
    func fetchCurrentUserFollowers(_ completion: @escaping InstagramFollowersBlock) {
        sendFollowersRequest(completion)
    }
    
    func fetchUsers(searchText: String?, completion: @escaping InstagramUsersBlock) {
        guard let searchText = searchText else {
            completion(nil, nil)
            return
        }
        sendUsersRequest(searchText, completion: completion)
    }
}

private extension InstagramUserService {
    func sendUserRequest(userId: String?, completion: @escaping InstagramUserBlock) {
        //Create parameteres
        networkClient.sendRequest(path: networkClient.instagramUserInfoPath(userId), parameters: InstagramRequestParameters()) { (response: InstagramObjectResponse <InstagramUser>?, error) in
            
            InstagramManager.shared.checkAccessTokenExpirationInResponse(with: response?.meta)
            if let data: InstagramUser = response?.data {
                let user: InstagramUser? = data
                    completion(user, error)
            }
            else {
                
                completion(nil, error)
            }
        }
    }

    func sendFollowersRequest(_ completion:@escaping InstagramFollowersBlock) {
    
        networkClient.sendRequest(path: networkClient.instagramFollowersPath(), parameters: InstagramRequestParameters()) { (response: InstagramArrayResponse <InstagramFollower>?, error) in
            let followers: [InstagramFollower]? = response?.data
            completion(followers, error)
        }
    }
   
    func sendUsersRequest(_ searchText: String, completion: @escaping InstagramUsersBlock) {
        var parameters = [InstagramRequestKey: AnyObject]()
        parameters["q"] = searchText as AnyObject?
        networkClient.sendRequest(path: networkClient.instagramSearchUsersPath(), parameters: parameters) { (response: InstagramArrayResponse<InstagramUser>?, error) in
            let users: [InstagramUser]? = response?.data
            completion(users, error)
        }
    }
}