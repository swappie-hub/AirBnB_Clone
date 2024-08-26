//
//  ProfileView.swift
//  AIrBnB
//
//  Created by Swapnil Chatterjee on 23/08/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            // profile login view
            VStack (alignment : .leading,spacing: 32){
                VStack (alignment : .leading,spacing: 8){
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Log in to start planning your next trip")
                }
                
                Button {
                    
                }label:{
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 8))
                }
                HStack {
                    Text("Don't have an account")
                    Text("Sign up").fontWeight(.semibold)
                        .underline()
                    
                }.font(.caption)
                
            }
            VStack (spacing : 24) {
                ProfileOptionRowView(imagename: "gear", title: "Settings")
                ProfileOptionRowView(imagename: "gear", title: "Accessibility")
                ProfileOptionRowView(imagename: "questionmark.circle", title: "Visit the help center")
                
            }.padding(.vertical)
        }.padding()
    }
}

#Preview {
    ProfileView()
}
