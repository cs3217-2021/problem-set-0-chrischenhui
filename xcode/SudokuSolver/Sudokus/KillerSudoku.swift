//
//  KillerSudoku.swift
//  SudokuSolver
//
//  Created by Chen Hui on 8/1/21.
//  Copyright © 2021 H. All rights reserved.
//

import Foundation

let cheatSheet: [Int: [Int: String]] = [
    2: [3: "12",
        4: "13",
        5: "14 23",
        6: "15 24",
        7: "16 25 34",
        8: "17 26 35",
        9: "18 27 36 45",
        10: "19 28 37 46",
        11: "29 38 47 56",
        12: "39 48 57",
        13: "49 58 67",
        14: "59 68",
        15: "69 78",
        16: "79",
        17: "89"],

    3: [6: "123",
        7: "124",
        8: "125 134",
        9: "126 135 234",
        10: "127 136 145 235",
        11: "128 137 146 236 245",
        12: "129 138 147 156 237 246 345",
        13: "139 148 157 238 247 256 346",
        14: "149 158 167 239 248 257 347 356",
        15: "159 168 249 258 267 348 357 456",
        16: "169 178 259 268 349 358 367 457",
        17: "179 269 278 359 368 458 467",
        18: "189 279 369 378 459 468 567",
        19: "289 379 469 478 568",
        20: "389 479 569 578",
        21: "489 579 678",
        22: "589 679",
        23: "689",
        24: "789"],

    4: [10: "1234",
        11: "1235",
        12: "1236 1245",
        13: "1237 1246 1345",
        14: "1238 1247 1256 1346 2345",
        15: "1239 1248 1257 1347 1356 2346",
        16: "1249 1258 1267 1348 1357 1456 2347 2356",
        17: "1259 1268 1349 1358 1367 1457 2348 2357 2456",
        18: "1269 1278 1359 1368 1458 1467 2349 2358 2367 2457 3456",
        19: "1279 1369 1378 1459 1468 1567 2359 2368 2458 2467 3457",
        20: "1289 1379 1469 1478 1568 2369 2378 2459 2468 2567 3458 3467",
        21: "1389 1479 1569 1578 2379 2469 2478 2568 3459 3468 3567",
        22: "1489 1579 1678 2389 2479 2569 2578 3469 3478 3568 4567",
        23: "1589 1679 2489 2579 2678 3479 3569 3578 4568",
        24: "1689 2589 2679 3489 3579 3678 4569 4578",
        25: "1789 2689 3589 3679 4579 4678",
        26: "2789 3689 4589 4679 5678",
        27: "3789 4689 5679",
        28: "4789 5689",
        29: "5789",
        30: "6789"],

    5: [15: "12345",
        16: "12346",
        17: "12347 12356",
        18: "12348 12357 12456",
        19: "12349 12358 12367 12457 13456",
        20: "12359 12368 12458 12467 13457 23456",
        21: "12369 12378 12459 12468 12567 13458 13467 23457",
        22: "12379 12469 12478 12568 13459 13468 13567 23458 23467",
        23: "12389 12479 12569 12578 13469 13478 13568 14567 23459 23468 23567",
        24: "12489 12579 12678 13479 13569 13578 14568 23469 23478 23568 24567",
        25: "12589 12679 13489 13579 13678 14569 14578 23479 23569 23578 24568 34567",
        26: "12689 13589 13679 14579 14678 23489 23579 23678 24569 24578 34568",
        27: "12789 13689 14589 14679 15678 23589 23679 24579 24678 34569 34578",
        28: "13789 14689 15679 23689 24589 24679 25678 34579 34678",
        29: "14789 15689 23789 24689 25679 34589 34679 35678",
        30: "15789 24789 25689 34689 35679 45678",
        31: "16789 25789 34789 35689 45679",
        32: "26789 35789 45689",
        33: "36789 45789",
        34: "46789",
        35: "56789"],

    6: [21: "123456",
        22: "123457",
        23: "123458 123467",
        24: "123459 123468 123567",
        25: "123469 123478 123568 124567",
        26: "123479 123569 123578 124568 134567",
        27: "123489 123579 123678 124569 124578 134568 234567",
        28: "123589 123679 124579 124678 134569 134578 234568",
        29: "123689 124589 124679 125678 134579 134678 234569 234578",
        30: "123789 124689 125679 134589 134679 135678 234579 234678",
        31: "124789 125689 134689 135679 145678 234589 234679 235678",
        32: "125789 134789 135689 145679 234689 235679 245678",
        33: "126789 135789 145689 234789 235689 245679 345678",
        34: "136789 145789 235789 245689 345679",
        35: "146789 236789 245789 345689",
        36: "156789 246789 345789",
        37: "256789 346789",
        38: "356789",
        39: "456789"],

    7: [28: "1234567",
        29: "1234568",
        30: "1234569 1234578",
        31: "1234579 1234678",
        32: "1234589 1234679 1235678",
        33: "1234689 1235679 1245678",
        34: "1234789 1235689 1245679 1345678",
        35: "1235789 1245689 1345679 2345678",
        36: "1236789 1245789 1345689 2345679",
        37: "1246789 1345789 2345689",
        38: "1256789 1346789 2345789",
        39: "1356789 2346789",
        40: "1456789 2356789",
        41: "2456789",
        42: "3456789"],

    8: [36: "12345678",
        37: "12345679",
        38: "12345689",
        39: "12345789",
        40: "12346789",
        41: "12356789",
        42: "12456789",
        43: "13456789",
        44: "23456789"],

    9: [45: "123456789"]
]

class KillerSudoku: Sudoku {
    var assignedVariables: [Cell: Int] = [:]
    var domain: [Cell: Set<Int>] = [:]
    var neighbours: [Cell: [Cell]] = [:]
    var cages: [Cage] = []
    var cellToCageID: [Cell: Int] = [:]

    init(input: String, cageValues: String) {
        self.readInput(input: input, cageValues: cageValues)
        self.generate_neighbours()
        self.preprocess()
    }

    private func readInput(input: String, cageValues: String) {
        let row = input.split(separator: "\n")
        let valueArray = cageValues.split(separator: " ")

        for iIndex in 0...8 {
            let col = row[iIndex].split(separator: " ")
            for jIndex in 0...8 {
                let cageID = Int(col[jIndex])!
                let newCell = Cell(row: iIndex, col: jIndex)
                let len = cages.count
                if len > cageID {
                    cages[cageID].cells.append(newCell)
                } else {
                    let val = Int(valueArray[cageID])!
                    let newCage = Cage(cageID: cageID, cells: [newCell], val: val, combi: [])
                    cages.append(newCage)

                }
                self.cellToCageID[newCell] = cageID
                self.domain[newCell] = Set()
            }
        }

    }

    private func printCages() {
        for cage in cages {
            print("Cage id and val: ", cage.cageID, cage.val)
            print("Cell")
            for cell in cage.cells {
                print(cell.row, cell.col)

            }
            print("Combi:", cage.combi)
            print()
        }
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
        for cage in self.cages {
            let cells = cage.cells
            let strArray = cheatSheet[cells.count]![cage.val]!.split(separator: " ")
            for string in strArray {
                self.cages[cage.cageID].combi.append(String(string))
                for character in string {
                    for cell in cells {
                        self.domain[cell]!.insert(Int(String(character))!)
                    }
                }
            }
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

        var currentCombi = ""
        let cage = self.cages[self.cellToCageID[cell]!]
        for neighbour in cage.cells where self.assignedVariables[neighbour] != nil {
            let val = self.assignedVariables[neighbour]!
            currentCombi += String(val)
        }

        var acceptableCombi: Set<Character> = Set()
        for string in cage.combi {
            var flag = true
            for combiCharacter in currentCombi {
                if !string.contains(Character(String(combiCharacter))) {
                    flag = false
                }
            }
            if flag {
                for character in string {
                    acceptableCombi.insert(character)
                }
            }
        }

        for neighbour in cage.cells {
            if cell != neighbour && self.domain[neighbour] != nil {
                if self.domain[neighbour]!.contains(value) {
                    self.domain[neighbour]!.remove(value)
                    removedValuesFromDomain.append((neighbour, value))
                    if self.domain[neighbour]!.isEmpty {
                        return (false, removedValuesFromDomain)
                    }
                }
                for value in self.domain[neighbour]! {
                    print("Values inside: ", value)
                    if !acceptableCombi.contains(Character(String(value))) {
                        self.domain[neighbour]!.remove(value)
                        print("Removed value: ", value, neighbour)
                        removedValuesFromDomain.append((neighbour, value))
                        if self.domain[neighbour]!.isEmpty {
                            return (false, removedValuesFromDomain)
                        }
                    }
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
}
