//
//  NormalSudoku.swift
//  SudokuSolver
//
//  Created by Chen Hui on 4/1/21.
//  Copyright © 2021 H. All rights reserved.
//

import Foundation

class NormalSudoku: Sudoku {
    var assignedVariables: [Cell: Int] = [:]
    var domain: [Cell: Set<Int>] = [:]
    var neighbours: [Cell: [Cell]] = [:]

    init(input: String) {
        self.readInput(input: input)
        self.generate_neighbours()
        self.preprocess()
    }

    private func readInput(input: String) {
        let row = input.split(separator: "\n")
        for iIndex in 0...8 {
            let col = row[iIndex].split(separator: " ")
            for jIndex in 0...8 {
                let newCell = Cell(row: iIndex, col: jIndex)
                if Int(col[jIndex]) == 0 {
                    self.domain[newCell] = Set([1, 2, 3, 4, 5, 6, 7, 8, 9])
                } else {
                    self.assignedVariables[newCell] = Int(col[jIndex])
                }
            }
        }
    }

    private func generate_neighbours() {
        for rIndex in 0...8 {
            for cIndex in 0...8 {
                self.neighbours[Cell(row: rIndex, col: cIndex)] = []
            }
        }
        for rIndex in 0...8 {
            for cIndex in 0...8 {
                for xIndex in 0...8 where xIndex != rIndex {
                    self.neighbours[Cell(row: rIndex, col: cIndex)]!.append(Cell(row: xIndex, col: cIndex))
                }
                for yIndex in 0...8 where yIndex != cIndex {
                    self.neighbours[Cell(row: rIndex, col: cIndex)]!.append(Cell(row: rIndex, col: yIndex))
                }
                let xStart = (rIndex / 3) * 3
                let yStart = (cIndex / 3) * 3
                for xIndex in xStart...(xStart + 2) {
                    for yIndex in yStart...(yStart + 2) {
                        if xIndex != rIndex || yIndex != cIndex {
                            self.neighbours[Cell(row: rIndex, col: cIndex)]!.append(Cell(row: xIndex, col: yIndex))
                        }
                    }
                }
            }
        }
    }

    private func preprocess() {
        for (cell, var set) in self.domain {
            let neighbourList = self.neighbours[cell]
            for neighbourCell in neighbourList! where self.assignedVariables[neighbourCell] != nil {
                let val = self.assignedVariables[neighbourCell]!
                set.remove(val)
            }
            self.domain[cell] = set
        }
    }

    func select_unassigned_variable_and_domain() -> (Cell, Set<Int>) {
        var minVar = Cell(row: 0, col: 0)
        var minLen = 10
        for (cell, _) in self.domain {
            let currLen = self.domain[cell]!.count
            if minLen > currLen {
                minLen = currLen
                minVar = cell
            }
        }
        return (minVar, self.domain[minVar]!)
    }

    func least_constraining_values(cell: Cell, domain: Set<Int>) -> [(value: Int, count: Int)] {
        var orderedDomain:[(value: Int, count: Int)] = []
        for value in domain {
            // Count collisions for each value, collision occurs when that value appears in neighbour's domain
            var count = 0
            for neighbour in self.neighbours[cell]! {
                if self.domain[neighbour] != nil && self.domain[neighbour]!.contains(value) {
                    count += 1
                }
            }
            orderedDomain.append((value, count))
        }
        orderedDomain = orderedDomain.sorted(by: take_min_count)
        return orderedDomain
    }

    private func take_min_count(first: (Int, Int), second: (Int, Int)) -> Bool {
        let (_, count1) = first
        let (_, count2) = second
        return count1 < count2
    }

    func set(cell: Cell, to value: Int?) -> Set<Int> {
        self.assignedVariables[cell] = value!
        let removedDomain = self.domain[cell]
        self.domain.removeValue(forKey: cell)
        return removedDomain!
    }

    func reset_assignment(cell: Cell, value: Int, removedDomain: Set<Int>) {
        self.assignedVariables.removeValue(forKey: cell)
        self.domain[cell] = removedDomain
    }

    func inference(cell: Cell, value: Int) -> (Bool, [(Cell, Int)]) {
        var removedValuesFromDomain: [(Cell, Int)] = [] // A list to keep track of discarded values in domain
        for neighbour in self.neighbours[cell]! where self.domain[neighbour] != nil {
            if self.domain[neighbour]!.contains(value) {
                self.domain[neighbour]!.remove(value)
                removedValuesFromDomain.append((neighbour, value))
                if self.domain[neighbour]!.isEmpty {
                    return (false, removedValuesFromDomain)
                }
            }
        }
        return (true, removedValuesFromDomain)
    }

    func reset_domain(domainUpdates: [(Cell, Int)]) {
        for (cell, value) in domainUpdates {
            self.domain[cell]!.insert(value)
        }
    }

    func is_consistent_with_value(cell: Cell, value: Int) -> Bool {
        for neighbour in self.neighbours[cell]! where self.assignedVariables[cell] != nil {
            let neighbourValue = self.assignedVariables[neighbour]
            if value == neighbourValue {
                return false
            }
        }
        return true
    }

    var isSolved: Bool {
        self.assignedVariables.count == 81
    }

    func gridify() -> String {
        var grid = ""
        for iIndex in 0...8 {
            for jIndex in 0...8 {
                let val = self.assignedVariables[Cell(row: iIndex, col: jIndex)]
                if val != nil {
                    grid += String(val!)
                } else {
                    grid += "0"
                }
                if jIndex != 8 {
                    grid += " "
                }
            }
            if iIndex != 8 {
                grid += "\n"
            }
        }
        return grid
    }

    func retrieveCells() -> [(Cell, Int)] {
        Array(assignedVariables)
    }

    private func printNeighbours() {
        for (cell, neighbours) in self.neighbours {
            print("Cell row and col: ", cell.row, cell.col)
            for neighbour in neighbours {
                print(neighbour.row, neighbour.col, terminator: ", ")
            }
            print()
        }
    }
}
