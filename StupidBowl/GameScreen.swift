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
                ForEach(stupidQuestions.items.indices) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(stupidQuestions.items[item].question)
                                .font(.headline)
                            Spacer()
                            TextField("Answer", text: responseBinding(response: item))
                            
                            //                          Text(item.answer)
                        }
                        Spacer()
                        //                     Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: {
                    indices, newOffset in stupidQuestions.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                NavigationLink(destination: ResultsView(score: returnScore(), results: returnWrongAnswers())){
                       Capsule()
                        .background(Color.red)
                        
                    }
                
                
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
    func responseBinding(response: Int) -> Binding<String> {
        var responseBinding: Binding<String> {
            Binding {
                stupidQuestions.items[response].response
            }   set: {
                stupidQuestions.items[response].response = $0
            }
        }
        return responseBinding
    }
    func returnScore() -> (String) {
        var correctAnswers = 0
        for i in 0..<stupidQuestions.items.count {
            print(stupidQuestions.items[i].answer, stupidQuestions.items[i].response)
            if(stupidQuestions.items[i].answer == stupidQuestions.items[i].response){
                correctAnswers += 1
            }
        }
        return ("You got \(correctAnswers) out of \(stupidQuestions.items.count) questions correct.")
    }
    func returnWrongAnswers() -> [String] {
        var incorrectAnswers = [String]()
        for i in 0..<stupidQuestions.items.count {
            if(stupidQuestions.items[i].answer != stupidQuestions.items[i].response){
                incorrectAnswers.append("You answered \(stupidQuestions.items[i].response), the correct answer is \(stupidQuestions.items[i].answer)")
            }
        }
        return incorrectAnswers
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
