//
//  StupidQuestions.swift
//  StupidBowl
//
//  Created by Student on 4/26/22.
//

import Foundation

class StupidQuestions: ObservableObject {
    @Published var items = [StupidQuestion(question: "???", answer: "!!!"),
                            StupidQuestion(question: "????", answer: "!!!!"),
                            StupidQuestion(question: "?????", answer: "!!!!!")]
}
