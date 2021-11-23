//
//  NewItem.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 19/11/21.
//
import SwiftUI
import Combine

struct NewItem: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var namespace: Namespace.ID
    
    @State private var category = "Alta"
    @State private var dueDate = Date()
    @State private var toDoText = ""
    
    @Binding var newItemOpen: Bool
    
    let toDoTextLimit = 70
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                VStack {
                    Text("Priority")
                        .font(.body.smallCaps())
                        .foregroundColor(.secondary)
                        
                    Picker(selection: $category,
                           label:
                            Text("\(category)")
                            .font(.body.bold())
                            .padding()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                           //.frame(height: 50)
                            .background(
                                ZStack {
                        getCategoryColor(categoryChosen: category).opacity(0.7)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 2)
                        VStack {
                            // empty VStack for the blur
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 5))
                    },
                                alignment: .leading
                            )
                            .shadow(color: .black.opacity(0.1), radius: 20, x: 5, y: 10)
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                            .shadow(color: .white.opacity(1), radius: 5, x: -1, y: -1)
                    ) {
                        
                        ForEach(categories, id: \.self) {
                            Text($0.category)
                                .tag($0.category)
                            
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

DatePicker(selection: $dueDate, displayedComponents: .date) {
                        Text("Due date")
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .accentColor(Color.indigo)
                    .padding()
                    
                    ZStack(alignment: .leading) {
                        if toDoText.isEmpty {
                            VStack(alignment: .leading) {
                                Text("Enter your todo item")
                                    .font(Font.body)
                                    .foregroundColor(Color.gray)
                                Spacer()
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 4)
                            .zIndex(0)
                        }
                        TextEditor(text: $toDoText)
                        
                            .frame(height: 200, alignment: .leading)
                            .frame(maxWidth: .infinity)
                            .lineSpacing(5)
                            .onReceive(Just(toDoText)) { toDoText in
                                textChanged(upper: toDoTextLimit, text: &self.toDoText)
                            }
                            .zIndex(1)
                            .opacity(toDoText.isEmpty ? 0.25 : 1)
                        
                    }
                    .frame(height: 200, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 30)
                    
                    
                    
                    
                }
                .padding(.top, 100)
                .background(Color.white
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .onTapGesture {
                    UIApplication.shared.endEditing()
                })
            }
            
            
            VStack{
                HStack{
//                    Spacer()
                    Button(action: {
                        withAnimation {
                            newItemOpen = false
                        }
                    }) {
                        Text("Cancel")
//                            .padding(.trailing, 320.0)
//                            .resizable()
//                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(uiColor: .gray))
//                            .shadow(color: .indigo.opacity(0.3), radius: 10, x: 0, y: 10)
//                            .padding()
                    }.padding()
                    Spacer(minLength: 100.0).padding()
                    Spacer()
                    Button(role: .none, action: {
                        if (!(toDoText == "" || category == "")){
                            ViewContextMethods.addItem(context: viewContext, dueDate: dueDate, toDoText: toDoText, category: category)
                            withAnimation {
                                newItemOpen = false
                                }
                            }
                        }, label: {
                        HStack {
                            Text("Add")
                            
                        }
                        
                    })
                    //    .buttonStyle(BorderedButtonStyle)
                        .tint(.blue)
//                        .controlProminence(.increased)
                        .controlSize(.large)
                        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 5, y: 10)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 1, y: 1)
                        .shadow(color: Color.white.opacity(1), radius: 5, x: -1, y: -1)
                        .padding()
                }
              
                .matchedGeometryEffect(id: "button", in: namespace)
                
                Spacer()
            }
        }
        
        
    }

func textChanged(upper: Int, text: inout String) {
        if text.count > upper {
            text = String(text.prefix(upper))
        }
    }
    
    private func getCategoryColor(categoryChosen: String) -> Color {
        var category: [ItemCategory] {
            categories.filter {
                $0.category == categoryChosen
            }
        }
        return Color.gray
    }
    
}

struct NewItem_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        NewItem(namespace: namespace,
                newItemOpen: .constant(false)
        )
    }
}
