//
//  Secret.swift
//  NetNinja
//
//  Created by apprenant64 on 06/05/2024.
//

import SwiftUI

enum Direction {
    case up, down, left, right
}

struct SnakeBodyPart: Identifiable {
    let id: Int
    var x: Int
    var y: Int
}

class SnakeGameModel: ObservableObject {
    @Published var snake: [SnakeBodyPart] = []
    @Published var food: (x: Int, y: Int)?
    var direction: Direction = .up
    
    init() {
        resetGame()
    }
    
    func resetGame() {
        // Initialisation du serpent au centre
        snake = [SnakeBodyPart(id: 0, x: 10, y: 10)]
        moveFood()
    }
    
    func moveFood() {
        let newX = Int.random(in: 0..<20)
        let newY = Int.random(in: 0..<20)
        food = (x: newX, y: newY)
    }
    
    func moveSnake() {
        // Calculer la nouvelle position de la tête
        guard var newHead = snake.first else { return }
        switch direction {
        case .left:
            newHead.x -= 1
        case .right:
            newHead.x += 1
        case .up:
            newHead.y -= 1
        case .down:
            newHead.y += 1
        }
        
        // Vérifier les collisions avec les murs
        guard newHead.x >= 0, newHead.x < 20, newHead.y >= 0, newHead.y < 20 else {
            // Collision avec un mur
            resetGame() // Recommence le jeu
            return
        }
        
        // Vérifier les collisions avec le serpent lui-même
        if snake.dropFirst().contains(where: { $0.x == newHead.x && $0.y == newHead.y }) {
            // Collision avec lui-même
            resetGame() // Recommence le jeu
            return
        }
        
        // Ajouter la nouvelle tête au début du serpent
        snake.insert(SnakeBodyPart(id: snake.count, x: newHead.x, y: newHead.y), at: 0)
        
        // Vérifier si le serpent a mangé de la nourriture
        if let food = food, food.x == newHead.x && food.y == newHead.y {
            moveFood() // Déplacer la nourriture à un nouvel endroit
        } else {
            // Supprimer la dernière partie du serpent si la nourriture n'a pas été mangée
            snake.removeLast()
        }
    }
    
    func changeDirection(to newDirection: Direction) {
        // Éviter de faire demi-tour directement
        switch (direction, newDirection) {
        case (.left, .right), (.right, .left), (.up, .down), (.down, .up):
            break
        default:
            direction = newDirection
        }
    }
}


struct Secret: View {
    @StateObject var viewModel = SnakeGameModel()

        var body: some View {
            VStack {
                ForEach(0..<20) { row in
                    HStack {
                        ForEach(0..<20) { column in
                            Rectangle()
                                .frame(width: 14, height: 14)
                                .foregroundColor(self.colorForCell(x: column, y: row))
                        }
                    }
                }
            }
            .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                .onEnded { value in
                    let horizontalAmount = value.translation.width as CGFloat
                    let verticalAmount = value.translation.height as CGFloat
                    if abs(horizontalAmount) > abs(verticalAmount) {
                        if horizontalAmount < 0 {
                            viewModel.changeDirection(to: .left)
                        } else {
                            viewModel.changeDirection(to: .right)
                        }
                    } else {
                        if verticalAmount < 0 {
                            viewModel.changeDirection(to: .up)
                        } else {
                            viewModel.changeDirection(to: .down)
                        }
                    }
                })
            .onAppear(perform: viewModel.resetGame)
            .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()) { _ in
                viewModel.moveSnake()
            }
        }
    
    private func colorForCell(x: Int, y: Int) -> Color {
        if let food = viewModel.food, food.x == x && food.y == y {
            return .red // Nourriture
        } else if viewModel.snake.contains(where: { $0.x == x && $0.y == y }) {
            return .green // Serpent
        }
        return .gray // Fond
    }
}

#Preview {
    Secret()
}

