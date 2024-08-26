//
//  ListingDetailView.swift
//  AIrBnB
//
//  Created by Swapnil Chatterjee on 21/08/24.
//

import SwiftUI
import MapKit
struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            ZStack (alignment : .topLeading) {
                
                ListingImageSwiper().frame(height: 320)
                Button {
                    dismiss()
                }label :{
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white
                                )
                                .frame(width: 32,height: 32)
                            
                        }
                }.padding([.top, .leading],40)
                
            }
            VStack (alignment :.leading,spacing : 8){
            Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                VStack (alignment : .leading){
                    HStack(spacing : 2) {
                        Image(systemName: "star.fill")
                         
                        Text("4.87")
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                        
                          
                    }
                    Text("Miami Florida")
                
                }.foregroundStyle(.black)
                    .font(.caption)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                
        }
            .padding(.horizontal,16)
        Divider()
            
            //Host infoView
            HStack {
                VStack (alignment : .leading, spacing: 4){
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    HStack {
                        Text("4 guest -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300,alignment: .leading)
             
                
            
                Spacer()
                Image (.listing1)
                    .resizable()
                    .frame(width: 54,height: 54)
                    .scaledToFit()
                    .clipShape(.circle)
                
                    

            }.padding()
       
            Divider()
            
            // listing features
            
            VStack(alignment : .leading,spacing: 16){
                ForEach (0 ..< 2){
                    feature in
                    HStack (spacing : 12){
                        Image(systemName: "medal")
                        VStack (alignment : .leading) {
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhost are experienced highly rated host who are commited for providing great stars for the guest")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    
                        
                    }
                }
               
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            Divider()
            // bedrooms view
            VStack  (alignment : .leading, spacing: 16){
                Text("Where you'll sleep").font(.headline)
                ScrollView (.horizontal, showsIndicators: false){
                    HStack (spacing : 16) {
                        ForEach (0 ..< 5){
                            bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 130,height: 100)
                            
                            .overlay(){
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 0.5)
                                .foregroundStyle(.gray)                            }
                        }
                    }
                }.scrollTargetBehavior(.paging)
                
            }.padding()
            
            
            Divider()
            // listing ammenities
            VStack (alignment:.leading,  spacing:16){
                Text("What this space offers").font(.headline)
                ForEach (0 ..< 5){
                    feature in
                    HStack {
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
                        Spacer()
                    }
                }
            }.padding()
            Divider()
            VStack (alignment : .leading,spacing :16){
                Text("Where you'll be").font(.headline)
                Map()
                    .frame(height: 200)
                    .clipShape(.rect(cornerRadius: 12))
            }.padding()
            
        }.toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom,80)
        .overlay(alignment:.bottom){
            VStack {
                Divider()
                    .padding(.bottom)
                HStack {
                    VStack (alignment : .leading){
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    Button{}
                label:{
                    Text("Reserve")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 140,height: 40)
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 8))
                    
                }
                }.padding(  .horizontal,32)
                    
                   
            }.background(.white)
        }
        
    }
}

#Preview {
    ListingDetailView()
}
