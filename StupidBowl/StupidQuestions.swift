//
//  StupidQuestions.swift
//  StupidBowl
//
//  Created by Student on 4/26/22.
//

import Foundation

class StupidQuestions: ObservableObject {
    @Published var items = [StupidQuestion(question: "This is the address of the cell in upper lefthand corner of an Excel spreadsheet. What is this cell that shares its name with a popular steak sauce?", answer: "A-1"),
                            StupidQuestion(question: "This semi-conducting element constitutes the main building block for computer microprocessors. Identify this element that gives its name to an area in California known for its developments in technology.", answer: "Silicon"),
                            StupidQuestion(question: "This punctuation mark is located on the same key with the forward slash mark on a standard computer keyboard. What is this punctuation mark that is put at the end of an interrogative sentence?", answer: "Question Mark")]
}
