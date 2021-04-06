
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


let themes: [Theme] = [ Theme(name: "Animals", emojis: ["🐶","🐭","🐼","🐻","🐨","🐯"], color: .red,accentColor: .orange)
                        ,
                        Theme(name: "Countries", emojis: ["🇧🇷","🇨🇦","🇨🇮","🇱🇻","🇳🇵","🏴󠁧󠁢󠁳󠁣󠁴󠁿"], color: .blue,accentColor: .purple),
                        Theme(name: "Fruits", emojis: ["🍎","🍊","🍌","🍇","🍓","🥭"], color: .red,accentColor: .pink),
                        Theme(name: "Vegetables", emojis: ["🌶","🌽","🧅","🧄","🥕","🥔"], color: .pink,accentColor: .yellow),
                        Theme(name: "Faces", emojis: ["😁","🤣","😇","🥰","😍","😗"],color: .yellow,accentColor: .gray),
                        Theme(name: "Birds", emojis: ["🦆","🦅","🦇","🦜","🦩","🐓"], color: .green,accentColor: .blue)
]

