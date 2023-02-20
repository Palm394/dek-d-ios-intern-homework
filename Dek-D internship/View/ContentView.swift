//
//  ContentView.swift
//  Dek-D internship
//
//  Created by Palm on 16/2/2566 BE.
//

import SwiftUI

struct item_detail:Hashable {
    var title: String
    var desc: String
}

struct ContentView: View {
    @State private var showAlert = false
    @State private var new_title: String = ""
    @State private var new_desc: String = ""
        
    @State var items_data =
    [item_detail(title: "Hello", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean congue faucibus lobortis. Cras sollicitudin accumsan laoreet. Praesent fringilla, lorem a pretium consectetur, purus tellus dignissim mauris, non lacinia velit ligula sed enim. Integer sed dolor vel mi suscipit condimentum vitae aliquam elit. Nullam lectus lacus, tincidunt eu pretium et, semper quis tortor. Aliquam ac dignissim lacus. Praesent id ex nisl. Nulla et ipsum augue. Nullam nec porta urna, non tincidunt velit. Vivamus posuere est eget gravida fermentum. Etiam venenatis elementum lectus, id feugiat orci placerat ut. Suspendisse egestas interdum risus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed aliquam erat nec justo consectetur laoreet. Quisque facilisis tempor varius. Sed maximus lacinia quam at porta. Proin eleifend purus et consectetur feugiat."),
     item_detail(title: "Dek-d", desc: "This is just a post"),
     item_detail(title: "ซุปกิมจิที่ไหนอร่อย", desc: "มาติดตามดูกันเลย~~~")
    ]
    
    func reset_input(){
        new_title = ""
        new_desc = ""
    }
    
    var body: some View {
        NavigationView() {
            List($items_data,id:\.self,editActions: .delete) { $item in
                PostListRow(title: item.title, desc: item.desc)
            }
            .toolbar{
                Button(action: {
                    showAlert = true
                }, label: {
                    Image(systemName: "plus")
                        .bold()
                })
            }
            .alert("New item",isPresented: $showAlert,actions: {
                TextField("Title", text: $new_title)
                TextField("Description", text: $new_desc, axis: .vertical)
                
                Button("Cancel", role: .cancel ,action: {})
                Button("Add", action: {
                    items_data.insert(item_detail(title: new_title, desc: new_desc),at: items_data.count)
                    reset_input()
                })
            })
            .navigationBarTitle("Dek-d")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 14 Pro Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
