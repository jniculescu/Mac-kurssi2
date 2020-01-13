//
//  ContentView.swift
//  Landmarks-Jnicu
//
//  Created by Jani Niculescu on 10/01/2020.
//

import SwiftUI

struct ContentView: View{
    var landmark: Landmark
    
    var body: some View {
        
        VStack
            {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            Circleimage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
        VStack(alignment: .leading)
        {
        Text("Turtle Rock")
            .font(.title)
            
            HStack
            {
            Text("Joshua Tree National Park")
                .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
      }
    .padding()
        
    Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(landmark: landmarkData[0])
    }
}

