import UIKit

// A dummy label
let myLabel = UILabel()

// The JSON for https://api.github.com/users/dominicholmes
/*
 {
   "login": "DominicHolmes",
   "id": 12633255,
   "node_id": "MDQ6VXNlcjEyNjMzMjU1",
   "avatar_url": "https://avatars1.githubusercontent.com/u/12633255?v=4",
   "gravatar_id": "",
   "url": "https://api.github.com/users/DominicHolmes",
   "html_url": "https://github.com/DominicHolmes",
   "followers_url": "https://api.github.com/users/DominicHolmes/followers",
   "following_url": "https://api.github.com/users/DominicHolmes/following{/other_user}",
   "gists_url": "https://api.github.com/users/DominicHolmes/gists{/gist_id}",
   "starred_url": "https://api.github.com/users/DominicHolmes/starred{/owner}{/repo}",
   "subscriptions_url": "https://api.github.com/users/DominicHolmes/subscriptions",
   "organizations_url": "https://api.github.com/users/DominicHolmes/orgs",
   "repos_url": "https://api.github.com/users/DominicHolmes/repos",
   "events_url": "https://api.github.com/users/DominicHolmes/events{/privacy}",
   "received_events_url": "https://api.github.com/users/DominicHolmes/received_events",
   "type": "User",
   "site_admin": false,
   "name": "dominic",
   "company": "@pennlabs ",
   "blog": "dominic.land",
   "location": "philly",
   "email": null,
   "hireable": true,
   "bio": "iOS lead @pennlabs",
   "public_repos": 27,
   "public_gists": 0,
   "followers": 30,
   "following": 41,
   "created_at": "2015-05-27T21:17:26Z",
   "updated_at": "2020-03-18T01:56:02Z"
 }
*/

// Codable representation of the JSON (only the fields we care about)
struct GithubProfile: Codable {
    let name: String
    let bio: String
    let imageUrl: URL
    let createdAt: Date
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        
        // Custom names for these 2 properties
        case imageUrl = "avatar_url"
        case createdAt = "created_at"
        
        // Default names for all the rest
        case name, bio, followers, following
    }
}


// Construct a URL by assigning its parts to a URLComponents value
var components = URLComponents()
components.scheme = "https"
components.host = "api.github.com"
components.path = "/users/dominicholmes"

// This will give us the constructed URL as an optional (URL?)
let url = components.url

guard let url = url else {
    fatalError("url is invalid")
}

// Define the request
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    if error == nil, let data = data {
        let customDecoder = JSONDecoder()
        // Change the expected date format
        customDecoder.dateDecodingStrategy = .iso8601
        if let profile = try? customDecoder.decode(GithubProfile.self, from: data) {
            DispatchQueue.main.async {
                myLabel.text = profile.bio
                // ... other updates ...
            }
        }
    }
}

// Perform the request
task.resume()
