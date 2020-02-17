//
//  ContentView.swift
//  ToDoList
//
//  Created by Jani Niculescu on 17/02/2020.
//  Copyright © 2020 Jani Niculescu. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View
    {
     NavigationView
     {
        List
        {
            ForEach(menu)
            { section in
                Section(header: Text(section.name))
                {
                    ForEach(section.items)
                        { item in
                            Text(item.name)
                        }
                }
            }.navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
}