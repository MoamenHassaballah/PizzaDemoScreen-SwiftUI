//
//  FoodItemView.swift
//  SwiftUIPlayground
//
//  Created by Moamen Hassaballah on 13/08/2024.
//

import SwiftUI

struct FoodItemView: View {
    
    var foodItem: FoodItem
    
    var namespace: Namespace.ID
    @Binding var showDetailsView: Bool
    
    var body: some View {
        
        VStack{
            
            //Title
            Text(foodItem.title)
                .font(.largeTitle.bold())
                .lineLimit(2)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
                .matchedGeometryEffect(id: "title \(foodItem.hashValue)", in: namespace)
            
            //Food Segment
            
            Text("Pizza Food")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Spacer()
            
            // Food image
            Image(foodItem.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 20)
                .matchedGeometryEffect(id: "image \(foodItem.hashValue)", in: namespace)
            
            Spacer()
            
            //Price
            Text(foodItem.price)
                .font(.title.bold())
                .matchedGeometryEffect(id: "price \(foodItem.hashValue)", in: namespace)
            
            //Description
            Text(foodItem.description)
                .font(.subheadline)
                .lineLimit(2)
                .truncationMode(.tail)
                .padding(.horizontal, 20)
                .matchedGeometryEffect(id: "description \(foodItem.hashValue)", in: namespace)
            
            Spacer()
            
            //Buy Btn
            Text("Buy")
                .font(.title2.weight(.semibold))
                .padding(.horizontal, 50)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 40.0)
                        .fill(
                            Color(red: 247 / 255, green: 223 / 255, blue: 75 / 255)
                        )
                }
                .matchedGeometryEffect(id: "buy \(foodItem.hashValue)", in: namespace)
            
        }
        .padding(40)
        
    }
}

struct FoodItemView_Preview : PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View{
        FoodItemView(foodItem: FoodItem(title: "Test Food", description: "Test Food Description", price: "$10.0", image: ImageResource.sausagePizza), namespace: namespace, showDetailsView: .constant(false))
    }
}
