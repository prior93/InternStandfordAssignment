
  // Theme.swift
  // Memorize

  // Created by parashar.r.adhikary on 04/04/2021.


import SwiftUI

    
    struct Theme {
        var name: String
        var emojis: [String]
        var color: Color
        var accentColor: Color
        var noOfPairs: Int?
    }


let themes: [Theme] = [ Theme(name: "Animals", emojis: ["đś","đ­","đź","đť","đ¨","đŻ"], color: .red,accentColor: .orange)
                        ,
                        Theme(name: "Countries", emojis: ["đŚđ˝","đ¨đŚ","đ¨đŽ","đąđť","đłđľ","đ´ó §ó ˘ó łó Łó ´ó ż"], color: .blue,accentColor: .purple),
                        Theme(name: "Fruits", emojis: ["đ","đ","đ","đ","đ","đĽ­"], color: .red,accentColor: .pink),
                        Theme(name: "Vegetables", emojis: ["đś","đ˝","đ§","đ§","đĽ","đĽ"], color: .pink,accentColor: .yellow),
                        Theme(name: "Faces", emojis: ["đ","đ¤Ł","đ","đĽ°","đ","đ"],color: .yellow,accentColor: .gray),
                        Theme(name: "Birds", emojis: ["đŚ","đŚ","đŚ","đŚ","đŚŠ","đ"], color: .green,accentColor: .blue)
]

