//
//  ListingView.swift
//  AIrBnB
//
//  Created by Swapnil Chatterjee on 21/08/24.
//

import SwiftUI

struct ListingItemView: View {
    var images = ["listing-1", "listing-2", "listing-3", "listing-4", ]
    
    var body: some View {
        VStack (spacing : 8){
            // images
          ListingImageSwiper()
                .frame(height: 320)
                .clipShape(.rect(cornerRadius: 10))
            // listing details
            HStack (alignment : .top){
                
                // details
                VStack(alignment : .leading) {
                    Text("Miami , Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mil away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing : 4){
                        Text("$567").fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("night")
                            .foregroundStyle(.gray)
                          
                    }
                    
                }
                
                Spacer()
                HStack(spacing : 2) {
                    Image(systemName: "star.fill")
                     
                    Text("4.87")
                      
                }  .foregroundStyle(.black)
                
                // rating
            }
            
        }

    }
}

#Preview {
    ListingItemView()
}
