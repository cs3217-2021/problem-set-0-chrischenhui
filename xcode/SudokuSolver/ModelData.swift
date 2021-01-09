//
//  ModelData.swift
//  SudokuSolver
//
//  Created by Chen Hui on 7/1/21.
//  Copyright © 2021 H. All rights reserved.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var sudokuSolver = load("input_1.txt")
    @Published var str = "hello"
}

func load(_ filename: String) -> SudokuSolver {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        let input = try String(contentsOf: file, encoding: .utf8)
        let sudoku = NormalSudoku(input: input)
        let sudokuSolver = SudokuSolver(sudoku: sudoku)
        return sudokuSolver
    } catch {
        fatalError("Couldn't parse \(filename) as \(SudokuSolver.self):\n\(error)")
    }
}
