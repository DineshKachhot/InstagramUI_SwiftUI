//
//  ContentView.swift
//  Instagram
//
//  Created by Dinesh Kachhot on 01/05/20.
//  Copyright © 2020 Dinesh Kachhot. All rights reserved.
//

import SwiftUI
let instaVividCerise = Color(hex: "#DD2A7B")

struct Post: Identifiable {
    var id = UUID()
    var profileImage: String
    var username: String
    var postImage: String
    var content: String
    var likedBy: String
    var commentCount: String
    var comments: [String]
    var timeSinceNow: String
}

struct ContentView: View {
    var posts = [Post(profileImage: "kapil_shrma", username: "kapilshrma", postImage: "post_kapil", content: "kapilshrma: बहुत ही दुखद समाचार। कहते हैं समय सब घाव भर देता है।लेकिन इन दो दिनो में जो चोट दिल को पहुँची है। वक़्त को भी बहुत वक्त लगेगा। अलविदा Rishi जी 💔🙏", likedBy: "Liked by ashish and 14,60,542 others", commentCount: "View all 10,083 comments", comments: ["harbhajan3: 🙏", "guujanvm : 🙏"], timeSinceNow: "3 hours ago"),
        Post(profileImage: "hardik_profile", username: "hardikpandya93", postImage: "hardik_post", content: "hardikpandya93 Music is art 🎧 Thank you @boat.nirvana for this amazing artwork. Love it 😊", likedBy: "51,183 Likes", commentCount: "View all 406 comments", comments: ["_aakankshaa05_ Fabmouse😻", "07devil__ https://chat.whatsapp.com/HZBwARIGWJh1TcmhIngxZ2"], timeSinceNow: "4 hour ago")]
    
    
    var body: some View {
        NavigationView {
            List {
                StoryView()
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
                // Custom navigation title is not yet available
                .navigationBarTitle(Text("Instagram"), displayMode: .inline)
                .navigationBarItems(leading: Button(action: { print("Camera button pressed") }) { Image(systemName: "camera").font(Font.system(size: 24)).foregroundColor(.white) } , trailing: Button(action: { print("Message button pressed") }) { Image(systemName: "paperplane").font(Font.system(size: 24)).foregroundColor(.white) } )
        }
    }
}

struct PostView: View {
    var post: Post
    @State private var commentText: String = ""
    @State private var isliked = false
    @State private var isBookmarked = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(post.profileImage).resizable().frame(width: 40, height: 40).cornerRadius(.infinity)
                Text(post.username).fontWeight(.bold)
                Spacer()
                Button(action: { print("More action clicked") }) {Image(systemName: "ellipsis")}.buttonStyle(BorderlessButtonStyle()).foregroundColor(.white)
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            Image(post.postImage).resizable().aspectRatio(contentMode: .fit)
            HStack(spacing: 20) {
                Button(action: { print("Like clicked"); self.isliked = !self.isliked }) { !isliked ? Image(systemName: "heart") : Image(systemName: "suit.heart.fill") }.buttonStyle(BorderlessButtonStyle()).foregroundColor(!isliked ? .white : .red)
                Button(action: { print("Message clicked") }) { Image(systemName: "message") }.buttonStyle(BorderlessButtonStyle()).foregroundColor(.white)
                Button(action: { print("Send clicked") }) { Image(systemName: "paperplane") }.buttonStyle(BorderlessButtonStyle()).foregroundColor(.white)
                Spacer()
                Button(action: { print("Bookmark clicked"); self.isBookmarked = !self.isBookmarked }) { self.isBookmarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark") }.buttonStyle(BorderlessButtonStyle()).foregroundColor(.white)
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .font(Font.system(size: 24))
            
            Text(post.likedBy).padding()
            Text(post.content).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            Text(post.commentCount).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).foregroundColor(.gray)
            
            ForEach(post.comments, id: \.self) { comment in
                Text(comment).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).font(.system(size: 18, weight: .medium, design: .default))
            }
            
            HStack {
                Image("me").resizable().frame(width: 30, height: 30).cornerRadius(.infinity)
                TextField("Add a comment...", text: $commentText)
                Spacer()
                Button(action: { print("👌 action clicked") }) {Text("👌").foregroundColor(.gray)}.buttonStyle(BorderlessButtonStyle())
                Button(action: { print("🎉 action clicked") }) {Text("🎉").foregroundColor(.gray)}.buttonStyle(BorderlessButtonStyle())
                Button(action: { print("Add action clicked") }) {Image(systemName: "plus.circle").foregroundColor(.gray)}.buttonStyle(BorderlessButtonStyle())
                }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            Text(post.timeSinceNow).foregroundColor(.gray).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)).font(.footnote)
        }
        
    }
}

struct StoryView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 17) {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        Image("me").resizable().frame(width: 52, height: 52).cornerRadius(.infinity)
                        Image(systemName: "plus.circle.fill").foregroundColor(.blue).background(Color.black).font(.headline)
                    }
                    Text("Your story").font(.caption).foregroundColor(.gray)
                }
                
                StoryImage(imageName: "ashish", userName: "ashish_chav...")
                StoryImage(imageName: "fenny", userName: "estefanny_isa")
                StoryImage(imageName: "michelly", userName: "michelle_le...")
                StoryImage(imageName: "sandy", userName: "sandip_web...")
            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
    }
}

struct StoryImage: View {
    var imageName: String
    var userName: String
    var body: some View {
        VStack {
            Image(imageName).resizable().frame(width: 52, height: 52).cornerRadius(.infinity).padding(4).overlay(RoundedRectangle(cornerRadius: .infinity).stroke(instaVividCerise,  lineWidth: 2))
            Text(userName).font(.caption).frame(width: 60).lineLimit(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11").environment(\.colorScheme, .dark)
    }
}
