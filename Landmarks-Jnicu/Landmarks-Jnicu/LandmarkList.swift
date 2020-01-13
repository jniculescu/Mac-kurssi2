//
//  LandmarkList.swift
//  Landmarks-Jnicu
//
//  Created by Jani Niculescu on 13/01/2020.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        NavigationView
        {
        List(landmarkData)
        {
            landmark in
            NavigationLink(destination: LandmarkDetail(landmark: landmark))
        {
            LandmarkRow(landmark: landmark)
        }
    }
    .navigationBarTitle(Text("Landmarks"))
}
}
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self){ deviceName in
        LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}