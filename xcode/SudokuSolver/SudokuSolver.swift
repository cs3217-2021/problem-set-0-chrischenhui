//
//  SudokuSolver.swift
//  SudokuSolver
//
//  Created by Chen Hui on 4/1/21.
//  Copyright © 2021 H. All rights reserved.
//

import Foundation

class SudokuSolver {
    var sudoku: NormalSudoku

    init(sudoku: NormalSudoku) {
        self.sudoku = sudoku
    }

    func solve() {
        print("Solved? : ", backtrack(sudoku: sudoku))
    }

    func backtrack(sudoku: NormalSudoku) -> Bool {
        if sudoku.isSolved {
            return true
        } else {
            let (cell, domain) = sudoku.select_unassigned_variable_and_domain()
            let orderedDomain = sudoku.least_constraining_values(cell: cell, domain: domain)
            for (value, _) in orderedDomain {
                if sudoku.is_consistent_with_value(cell: cell, value: value) {
                    let removedDomain = sudoku.set(cell: cell, to: value)
                    let (inferSuccess, domainUpdates) = sudoku.inference(cell: cell, value: value)
                    if inferSuccess {
                        if backtrack(sudoku: sudoku) {
                            return true
                        }
                    }
                    sudoku.reset_domain(domainUpdates: domainUpdates)
                    sudoku.reset_assignment(cell: cell, value: value, removedDomain: removedDomain)
                }
            }
            return false
        }
    }
}
