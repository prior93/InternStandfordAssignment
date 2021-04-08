
//  ContentView.swift
//  Memorize
//EmojiMemoryGameView
//  Created by parashar.r.adhikary on 02/04/2021.
//


import  SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        NavigationView{
            VStack {
                Grid(viewModel.cards) { card in
                    CardView(card: card,
                             gradient: Gradient(colors: [self.viewModel.theme.color, self.viewModel.theme.accentColor]))
                        .onTapGesture {
                            self.viewModel.choose(card: card)
                    }
                    .padding(5)

                }
                .foregroundColor(viewModel.theme.color)
                .padding()
                Text("Score: \(viewModel.score)")
            }
            .navigationBarTitle(viewModel.theme.name)
            .navigationBarItems(trailing: Button("New Game"){
                self.viewModel.newGame() })
        }

        .navigationViewStyle(StackNavigationViewStyle())
    }
}



struct CardView: View {
    var card: MemoryGame<String>.Card
    let gradient: Gradient

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }

  @ViewBuilder
   private  func body(for size: CGSize) -> some View {
    if card.isFaceUp || !card.isMatched{
        ZStack {
            Pie(startAngel: Angle.degrees(0-90), endAngle: Angle.degrees(110-90),clockWise: true)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))

                    .animation(card.isMatched ? Animation.linear(duration:1).repeatForever(autoreverses: false):.default)
            }

       .cardify(isFaceUp: card.isFaceUp)

        }
}

    // MARK: - Drawing Constants

    private func fontSize(for size: CGSize)-> CGFloat {
        min(size.width, size.height ) * 0.7
    }
}








struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
       let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
