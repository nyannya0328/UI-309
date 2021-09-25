//
//  Home.swift
//  UI-309 (iOS)
//
//  Created by nyannyan0328 on 2021/09/17.
//

import SwiftUI

struct Home: View {
    @State var currentIndex : Int = 0
    @State var post : [Post] = []
    @State var currentTab = "Slide Show"
    @Namespace var animation
    var body: some View {
        VStack(spacing:15){
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                Button {
                    
                } label: {
                    
                    Label {
                        
                        Text("Back")
                            .font(.title2)
                        
                    } icon: {
                        Image(systemName: "chevron.left")
                            .font(.title2.bold())
                    }
                    .foregroundColor(.primary)

                }
                
                Text("My Wished")
                    .font(.title.weight(.black))

                
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            
            HStack(spacing:0){
                
                
            TabButton()
                
            }
            .background(Color.black.opacity(0.04),in: RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal)
            
            SnapCarousel(spacing:50,index: $currentIndex, items: post) {post in
                
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    
                    Image(post.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(15)
                }
                
            }
            .padding(.vertical,40)
            
            HStack(spacing:10){
                
                
                ForEach(post.indices,id:\.self){index in
                    
                    
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1.5 : 1)//0 > not see
                        .animation(.spring(), value:currentIndex == index)
                }
                
                
            }
            .padding(.bottom,40)
            
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear {
            
            for index in 1...7{
                
                post.append(Post(imageURL:"p\(index)"))
                
            }
            
        }
    }
    @ViewBuilder
    
    func TabButton()->some View{
        
        
        ForEach(["Slide Show","List"],id:\.self){title in
            
            
            Button {
                withAnimation{
                    
                    
                  currentTab = title
                }
            } label: {
                
                
              
                    
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(currentTab == title ? .white : .gray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,8)
                        .background(
                        
                            ZStack{
                                
                                
                                if currentTab == title{
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.black)
                                        .matchedGeometryEffect(id: "TAB", in: animation)
                                    
                                }
                            }
                        
                        )
                    
            }
            
            
            
        }
        
        
       

        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


