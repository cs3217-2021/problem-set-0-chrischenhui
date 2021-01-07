//
//  NormalSudokuTests.swift
//  SudokuSolverTests
//
//  Created by Chen Hui on 6/1/21.
//  Copyright © 2021 H. All rights reserved.
//

import XCTest
@testable import SudokuSolver

class NormalSudokuTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testNormalSudoku1() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let normalSudoku1 = NormalSudoku(input: """
            8 0 0 0 0 0 0 0 0
            0 0 3 6 0 0 0 0 0
            0 7 0 0 9 0 2 0 0
            0 5 0 0 0 7 0 0 0
            0 0 0 0 4 5 7 0 0
            0 0 0 1 0 0 0 3 0
            0 0 1 0 0 0 0 6 8
            0 0 8 5 0 0 0 1 0
            0 9 0 0 0 0 4 0 0
        """)
        let solution1 = """
8 1 2 7 5 3 6 4 9
9 4 3 6 8 2 1 7 5
6 7 5 4 9 1 2 8 3
1 5 4 2 3 7 8 9 6
3 6 9 8 4 5 7 2 1
2 8 7 1 6 9 5 3 4
5 2 1 9 7 4 3 6 8
4 3 8 5 2 6 9 1 7
7 9 6 3 1 8 4 5 2
"""
        let solver1 = SudokuSolver(sudoku: normalSudoku1)
        solver1.solve()
        let ans1 = normalSudoku1.gridify()
        XCTAssertEqual(ans1, solution1)

    }

    func testNormalSudoku2() throws {
        let normalSudoku2 = NormalSudoku(input: """
            0 0 0 0 0 9 0 8 0
            0 0 2 0 0 4 5 3 0
            0 0 8 0 0 0 1 6 0
            6 0 0 1 0 0 3 0 0
            3 0 0 2 0 8 0 0 0
            0 0 0 0 0 7 9 5 0
            4 0 9 0 5 0 0 0 0
            0 0 0 3 0 6 0 0 0
            0 8 0 0 0 0 4 0 0
        """)
        let solution2 = """
7 5 3 6 1 9 2 8 4
1 6 2 7 8 4 5 3 9
9 4 8 5 2 3 1 6 7
6 7 4 1 9 5 3 2 8
3 9 5 2 6 8 7 4 1
8 2 1 4 3 7 9 5 6
4 3 9 8 5 1 6 7 2
2 1 7 3 4 6 8 9 5
5 8 6 9 7 2 4 1 3
"""
        let solver2 = SudokuSolver(sudoku: normalSudoku2)
        solver2.solve()
        let ans2 = normalSudoku2.gridify()
        XCTAssertEqual(ans2, solution2)
    }

    func testNormalSudoku3() throws {
        let normalSudoku3 = NormalSudoku(input: """
            7 0 0 1 5 2 3 0 0
            0 0 0 0 0 0 9 2 0
            0 0 0 3 0 0 0 0 0
            1 0 0 0 0 4 7 0 8
            0 0 0 0 0 0 0 6 0
            0 0 0 0 0 0 0 0 0
            0 0 9 0 0 0 5 0 6
            0 4 0 9 0 7 0 0 0
            8 0 0 0 0 6 0 1 0
        """)
        let solution3 = """
7 9 6 1 5 2 3 8 4
5 3 1 4 6 8 9 2 7
4 2 8 3 7 9 6 5 1
1 5 2 6 3 4 7 9 8
3 8 4 7 9 1 2 6 5
9 6 7 2 8 5 1 4 3
2 1 9 8 4 3 5 7 6
6 4 5 9 1 7 8 3 2
8 7 3 5 2 6 4 1 9
"""
        let solver3 = SudokuSolver(sudoku: normalSudoku3)
        solver3.solve()
        let ans3 = normalSudoku3.gridify()
        XCTAssertEqual(ans3, solution3)
    }

    func testNormalSudoku4() throws {
        let normalSudoku4 = NormalSudoku(input: """
            6 0 2 0 5 0 0 0 0
            0 0 0 0 0 3 0 4 0
            0 0 0 0 0 0 0 0 0
            4 3 0 0 0 8 0 0 0
            0 1 0 0 0 0 2 0 0
            0 0 0 0 0 0 7 0 0
            5 0 0 2 7 0 0 0 0
            0 0 0 0 0 0 0 8 1
            0 0 0 6 0 0 0 0 0
        """)
        let solution4 = """
6 8 2 1 5 4 3 7 9
9 5 1 7 6 3 8 4 2
3 7 4 8 9 2 1 6 5
4 3 7 5 2 8 9 1 6
8 1 6 9 3 7 2 5 4
2 9 5 4 1 6 7 3 8
5 6 8 2 7 1 4 9 3
7 2 9 3 4 5 6 8 1
1 4 3 6 8 9 5 2 7
"""
        let solver4 = SudokuSolver(sudoku: normalSudoku4)
        solver4.solve()
        let ans4 = normalSudoku4.gridify()
        XCTAssertEqual(ans4, solution4)
    }

    func testNormalSudokuPerformance1() throws {
        // This is an example of a performance test case.
        let sudoku = NormalSudoku(input: """
            8 0 0 0 0 0 0 0 0
            0 0 3 6 0 0 0 0 0
            0 7 0 0 9 0 2 0 0
            0 5 0 0 0 7 0 0 0
            0 0 0 0 4 5 7 0 0
            0 0 0 1 0 0 0 3 0
            0 0 1 0 0 0 0 6 8
            0 0 8 5 0 0 0 1 0
            0 9 0 0 0 0 4 0 0
        """)

        let solver = SudokuSolver(sudoku: sudoku)
        self.measure {
            // Put the code you want to measure the time of here.
            solver.solve()
        }
    }

    func testNormalSudokuPerformance2() throws {
        // This is an example of a performance test case.
        let sudoku = NormalSudoku(input: """
            0 0 0 0 0 9 0 8 0
            0 0 2 0 0 4 5 3 0
            0 0 8 0 0 0 1 6 0
            6 0 0 1 0 0 3 0 0
            3 0 0 2 0 8 0 0 0
            0 0 0 0 0 7 9 5 0
            4 0 9 0 5 0 0 0 0
            0 0 0 3 0 6 0 0 0
            0 8 0 0 0 0 4 0 0
        """)

        let solver = SudokuSolver(sudoku: sudoku)
        self.measure {
            // Put the code you want to measure the time of here.
            solver.solve()
        }
    }

    func testNormalSudokuPerformance3() throws {
        // This is an example of a performance test case.
        let sudoku = NormalSudoku(input: """
            7 0 0 1 5 2 3 0 0
            0 0 0 0 0 0 9 2 0
            0 0 0 3 0 0 0 0 0
            1 0 0 0 0 4 7 0 8
            0 0 0 0 0 0 0 6 0
            0 0 0 0 0 0 0 0 0
            0 0 9 0 0 0 5 0 6
            0 4 0 9 0 7 0 0 0
            8 0 0 0 0 6 0 1 0
        """)

        let solver = SudokuSolver(sudoku: sudoku)
        self.measure {
            // Put the code you want to measure the time of here.
            solver.solve()
        }
    }

    func testNormalSudokuPerformance4() throws {
        // This is an example of a performance test case.
        let sudoku = NormalSudoku(input: """
            6 0 2 0 5 0 0 0 0
            0 0 0 0 0 3 0 4 0
            0 0 0 0 0 0 0 0 0
            4 3 0 0 0 8 0 0 0
            0 1 0 0 0 0 2 0 0
            0 0 0 0 0 0 7 0 0
            5 0 0 2 7 0 0 0 0
            0 0 0 0 0 0 0 8 1
            0 0 0 6 0 0 0 0 0
        """)

        let solver = SudokuSolver(sudoku: sudoku)
        self.measure {
            // Put the code you want to measure the time of here.
            solver.solve()
        }
    }

}
