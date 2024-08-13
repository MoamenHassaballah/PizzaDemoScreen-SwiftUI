//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Moamen Hassaballah on 13/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @Namespace var namespace
    @State var showProductDetails = false
    
    let foodList = [
        FoodItem(title: "Margherita Italian Cuisine Tomato", description: "Margherita Italian cuisine Tomato Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.", price: "$10.5", image: ImageResource.margheritaItalianCuisineTomato),
        
        FoodItem(title: "Pepperoni Pizza", description: "pepperoni pizza Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.", price: "$8.5", image: ImageResource.pepperoniPizza),
        
        FoodItem(title: "Pizza Margherita Sushi", description: "Pizza Margherita Sushi Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.", price: "$15.0", image: ImageResource.pizzaMargheritaSushi),
        
        FoodItem(title: "Pizza Margherita Vegetarian", description: "Pizza Margherita Vegetarian Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.", price: "$7.0", image: ImageResource.pizzaMargheritaSushi),
        
        FoodItem(title: "Sausage Pizza", description: "Sausage Pizza Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.", price: "$12.5", image: ImageResource.sausagePizza),
        
    ]
    
    @State var selectedFoodItem : FoodItem = FoodItem(title: "Test Food", description: "Test Food Description", price: "$10.0", image: ImageResource.sausagePizza)
    
    
    var body: some View {
        
        ZStack {
            
            //Background Color
            Color(red: 247 / 255, green: 223 / 255, blue: 75 / 255)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            
            VStack(spacing: 30){
                
                HStack{
                    Image(systemName: "line.horizontal.3")
                        .padding(10)
                        .frame(width: 40, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                        )
                        
                    
                    Spacer()
                    
                    Text("Fast Food")
                        .font(.title2.weight(.semibold))
                    
                    Spacer()
                    
                    Image(ImageResource.profilePic)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                }
                .padding()
                
                
                //Tabs
                
                HStack(spacing: 20, content: {
                    Spacer()
                    
                    Text("Pizza")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(.black)
                        )
                        .foregroundStyle(.white)
                    
                    Text("Pasta")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(.white.opacity(0.5))
                        )
                    
                    Text("Drinks")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(.white.opacity(0.5))
                        )
                    
                    Spacer()
                    
                })
                
                
                //Scroll View
                
                ScrollView(.horizontal) {
                    
                    
                    HStack{
                        
                        ForEach(foodList, id: \.self){item in
                            FoodItemView(foodItem: item, namespace: namespace, showDetailsView: $showProductDetails)
                                .background {
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .fill(.white)
                                }
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 16)
                                .scrollTransition { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1.0 : 0.0)
                                        .offset(y: phase.isIdentity ? 0.0 : 50)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        selectedFoodItem = item
                                        showProductDetails.toggle()
                                    }
                                    
                                }
                        }
                        
                    }
                    
                    
                }
                .scrollIndicators(.hidden)
                .contentMargins(16, for: .scrollContent)
                .scrollTargetBehavior(.paging)
                
            }
            
            
            
            
            // Show/Hide Details page
            
            if showProductDetails {
                FoodDetailsView(foodItem: selectedFoodItem, namespace: namespace, showDetailsView: $showProductDetails)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
