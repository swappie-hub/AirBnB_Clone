//
//  ProfileOptionRowView.swift
//  AIrBnB
//
//  Created by Swapnil Chatterjee on 23/08/24.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let imagename : String
    let title : String
    var body: some View {
        VStack{
            HStack{
                Image (systemName: imagename)
             
                Text(title).font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}

#Preview {
    ProfileOptionRowView(imagename: "gear", title: "Settings")
}
