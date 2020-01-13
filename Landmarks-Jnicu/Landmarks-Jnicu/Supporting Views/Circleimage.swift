//
//  Circleimage.swift
//  Landmarks-Jnicu
//
//  Created by Jani Niculescu on 10/01/2020.
//

import SwiftUI

struct Circleimage: View {
    var image: Image
    
    var body: some View {
        image
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct Circleimage_Previews: PreviewProvider {
    static var previews: some View {
        Circleimage(image: Image("turtlerock"))
    }
}
