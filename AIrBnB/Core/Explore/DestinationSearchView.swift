//
//  DestinationSearchView.swift
//  AIrBnB
//
//  Created by Swapnil Chatterjee on 22/08/24.
//

import SwiftUI

enum DestinationSearchOption{
    case location
    case dates
    case guests
}
struct DestinationSearchView: View {
    @Binding var show : Bool
    @State private var destination = ""
    @State private var numGuest = 0
    @State private var fromDate = Date()
    @State private var toDate = Date()
    
    @State private var selectedOption : DestinationSearchOption = .location
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy){
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    Spacer()
                    if !destination.isEmpty {
                        Button{
                            destination =  "";
                        }label: {
                            Text("Clear")
                                .foregroundStyle(.black)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                   
                    
            }
            }.padding()
            VStack(alignment : .leading){
                if selectedOption == .location {
                    Text("Where to").font(.title2).fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass").imageScale(.small)
                        TextField ("Search destination",text: $destination )
                            .font(.subheadline)
                        
                    }.frame(height: 44)
                        .padding(.horizontal)
                        .overlay(){
                            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color(.systemGray4))
                        }
                }
                else{
                    CollapsedPickerView(title: "Where", description: "Add destinagtion")
                }
              
                
            }   .modifier(CollapsedDestinationViewModifier())
                .frame(height: selectedOption == .location ? 120 : 64)
            
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOption = .location
                    }
                   
                    
                }
            //date selection
            
            VStack (alignment : .leading){
                if selectedOption == .dates {
                    Text("When's your trip").font(.title2)
                        .fontWeight(.semibold)
                    VStack{
                        DatePicker("From",selection: $fromDate, displayedComponents: .date
                        )
                        Divider()
                        DatePicker("To",selection: $toDate, displayedComponents: .date
                        )
                    }.foregroundStyle(.gray)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                  
                }else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }      .modifier(CollapsedDestinationViewModifier())
               .frame(height: selectedOption == .dates ? 180 : 64)
       
             
             

          
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOption = .dates
                    }
                    
                }
            // num guest view
            VStack  (alignment :.leading){
                if selectedOption == .guests {
                    Text("Who's coming")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuest) Adults")
                    } onIncrement : {
                        numGuest+=1;
                        
                    }onDecrement: {
                        guard numGuest > 0 else {
                            return
                        }
                        numGuest -= 1;
                    }
                    
                
                  
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }   .modifier(CollapsedDestinationViewModifier())
                .frame(height: selectedOption == .guests ? 120 : 64)
             

          
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOption = .guests
                    }
                    
                }
            
        }
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(true))
}
 
struct CollapsedDestinationViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
          
             .background(.white)
             .clipShape(RoundedRectangle(cornerRadius: 12)).padding().shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CollapsedPickerView: View {
    let title : String
    let description : String
    var body: some View {
        VStack {
            HStack {
                Text(title).foregroundStyle(.gray)
                Spacer()
                Text(description)
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }
        }

    }
}
