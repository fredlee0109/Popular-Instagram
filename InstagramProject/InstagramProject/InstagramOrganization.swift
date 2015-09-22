//
//  InstagramOrganization.swift
//  InstagramProject
//
//  Created by FLee on 9/21/15.
//  Copyright © 2015 Fred Lee. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class InstagramOrganization {
    
    struct User {
        let userID: String
        let username: String
        let fullName: String
        let avatarURL: String
        let bio: String
        let media: Int
        let follows: Int
        let followers: Int
    }
    
    struct UserRecentMedia {
        let photoURL: String
        let caption: String
        let likes: Int
        let timePosted: Int
    }
    
    struct Media {
        let avatarURL: String
        let username: String
        let user_id: String
        let mediaURL: String
        let likes: Int
        let caption: String
        let comments: [String]
    }
    
    func fetchUserData(id: String, callback: (User) -> Void) {
        // Fetch user details
        Alamofire.request(.GET, "https://api.instagram.com/v1/users/\(id)/?client_id=c953ffadb974463f9f6813fc4fc91673")
            .responseJSON { _, _, jsonObj in
                self.populateUserInfoWith(jsonObj.value!, callback: callback)
        }
    }
    
    func populateUserInfoWith(data: AnyObject?, callback: (User) -> Void) {
        let json = JSON(data!)["data"]
        callback(User(userID: json["id"].stringValue, username: json["username"].stringValue, fullName: json["full_name"].stringValue, avatarURL: json["profile_picture"].stringValue, bio: json["bio"].stringValue, media: json["counts"]["media"].intValue, follows: json["counts"]["follows"].intValue, followers: json["counts"]["followed_by"].intValue))
    }
    
    func fetchUserRecentData(id: String, callback: (UserRecentMedia) -> Void) {
        Alamofire.request(.GET, "https://api.instagram.com/v1/users/\(id)/media/recent/?client_id=c953ffadb974463f9f6813fc4fc91673")
            .responseJSON {_, _, result in
                self.populatePostInfoWith(result.value!, callback: callback)
        }
    }
    
    func populatePostInfoWith(data: AnyObject?, callback: (UserRecentMedia) -> Void) {
        let json = JSON(data!)["data"]
        callback(UserRecentMedia(photoURL: json["images"]["standard_resoultion"].stringValue, caption: json["caption"].stringValue, likes: json["likes"].intValue, timePosted: json["created_time"].intValue))
    }
    
    func fetchPopularMediaDetails(callback: ([Media]) -> Void) {
        Alamofire.request(.GET, "https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673")
            .responseJSON { _, _, jsonObj in
                self.populateMediaWith(jsonObj.value!, callback: callback)
        }
    }
    
    func populateMediaWith(data: AnyObject?, callback: ([Media]) -> Void) {
        let json = JSON(data!)
        var medias = [Media]()
        var Comments = [String]()
        
        for media in json["data"].arrayValue {
            for comment in media["comments"]["data"].arrayValue {
                Comments.append(comment.stringValue)
            }
            medias.append(Media(avatarURL: media["user"]["profile_picture"].stringValue, username: media["user"]["username"].stringValue,
                user_id: media["user"]["id"].stringValue, mediaURL: media["link"].stringValue, likes: media["likes"]["count"].intValue, caption: media["caption"].stringValue, comments: Comments))
        }
        
        callback(medias)
    }
}