//
//  SwiftUIView.swift
//  StupidBowl
//
//  Created by Student on 4/22/22.
//

import SwiftUI

struct GameScreen: View {
    @ObservedObject var stupidQuestions = StupidQuestions()
    
    var body: some View {
        VStack {
            List {
                Text("Answer these stupid quizbowl questions").font(.title)
                ForEach(stupidQuestions.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.question)
                                .font(.headline)
                            Spacer()
                            TextField("Answer", text: responseBinding(response: item.response))
                            //                          Text(item.answer)
                        }
                        Spacer()
                        //                     Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: {
                    indices, newOffset in stupidQuestions.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                //              .onDelete(perform: { indexSet in stupidQuestions.items.remove(atOffsets: indexSet)
                //             })
            }
            //         .sheet(isPresented: $showingAddItemView, content: {
            //             AddItemView(toDoList: toDoList)
            //         })
            .navigationBarTitle("Stupid Bowl")
            //         .navigationBarItems(leading: EditButton(),
            //                            trailing: Button(action: {
            //                                                showingAddItemView = true}) {
            //                                Image(systemName: "plus")
            //                           })
            Text("All questions are owned by Questions Galore")
        }
    }
    func responseBinding(response: String) -> Binding<String> {
        var string = response
        var responseBinding: Binding<String> {
            Binding {
                string
            }   set: {
                string = $0
            }
        }
        return responseBinding
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}

struct StupidQuestion: Identifiable {
    var id = UUID()
    var question = String()
    var answer = String()
    var response = String()
}
