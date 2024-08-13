//
//  FoodDetailsView.swift
//  SwiftUIPlayground
//
//  Created by Moamen Hassaballah on 13/08/2024.
//

import SwiftUI

struct FoodDetailsView: View {
    
    var foodItem: FoodItem
    
    var namespace: Namespace.ID
    @Binding var showDetailsView: Bool
    
    
    var body: some View {
        ZStack {
            
            //Background Color
            Color(red: 247 / 255, green: 223 / 255, blue: 75 / 255)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            //Top Bar
            
            VStack(spacing: 30){
                
                HStack{
                    //Back Btn
                    Image(systemName: "chevron.left")
                        .padding(10)
                        .frame(width: 40, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                        )
                        .onTapGesture {
                            withAnimation{
                                showDetailsView.toggle()
                            }
                            
                        }
                        
                    
                    Spacer()
                    
                    Text("Details")
                        .font(.title2.weight(.semibold))
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .resizable()
                        .frame(width: 30, height: 7)
                        .rotationEffect(.degrees(90))
                    
                    
                }
                .padding()
                
                //Title and description
                VStack(spacing: 20){
                    HStack{
                        VStack(alignment: .leading){
                            Text(foodItem.title)
                                .font(.title.bold())
                                .matchedGeometryEffect(id: "title \(foodItem.hashValue)", in: namespace)
                                
                            
                            Text(foodItem.description)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                                .matchedGeometryEffect(id: "description \(foodItem.hashValue)", in: namespace)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "heart.fill")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top)
                    
                    
                    //Food Image
                    Image(foodItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 20)
                        .matchedGeometryEffect(id: "image \(foodItem.hashValue)", in: namespace)
                    
                    
                    //Bottom Tabs
                    HStack(spacing: 20, content: {
                        Spacer()
                        
                        Text("Small")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(.white.opacity(0.5))
                            )
                        
                        Text("Medium")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(.black)
                            )
                            .foregroundStyle(.white)
                        
                        Text("Large")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(.white.opacity(0.5))
                            )
                        
                        Spacer()
                        
                    })
                    
                    
                    //Bottom Payment Bar
                    
                    HStack(){
                        HStack (alignment: .top, spacing: 16){
                            VStack(alignment: .leading, spacing: 5){
                                Text("Now")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                
                                Text(foodItem.price)
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .matchedGeometryEffect(id: "price \(foodItem.hashValue)", in: namespace)
                                
                                Text("50% Dsnt")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                            }
                            
                            
                            
                            VStack(alignment: .leading, spacing: 5){
                                Text("Before")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                
                                Text(foodItem.price)
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        Spacer()
                        
                        Text("Buy")
                            .font(.title2.weight(.semibold))
                            .padding(.horizontal, 30)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 40.0)
                                    .fill(
                                        Color(red: 247 / 255, green: 223 / 255, blue: 75 / 255)
                                    )
                            }
                            .matchedGeometryEffect(id: "buy \(foodItem.hashValue)", in: namespace)
                        
                    }
                    .padding(16)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, maxHeight: 120)
                    .background {
                        UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                            .fill(.black)
                            .ignoresSafeArea()
                            .ignoresSafeArea()
                    }
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                        .fill(.white)
                        .ignoresSafeArea()
                }
                
                
                
            }
        }
    }
}

struct FoodDetailsView_Preview : PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View{
        FoodDetailsView(foodItem: FoodItem(title: "Test Food", description: "Test Food Description", price: "$10.0", image: ImageResource.sausagePizza), namespace: namespace, showDetailsView: .constant(false))
    }
}
