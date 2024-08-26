//
//  ListingImageSwiper.swift
//  AIrBnB
//
//  Created by Swapnil Chatterjee on 21/08/24.
//

import SwiftUI

struct ListingImageSwiper: View {
    var images = ["listing-4","listing-1", "listing-2", "listing-3",  ]
    var body: some View {
        TabView{
            
            ForEach (images, id: \.self){
                image in Image(image).resizable().scaledToFill()
            }
        }
          
            .tabViewStyle(.page)
        
    }
}

#Preview {
    ListingImageSwiper()
}
