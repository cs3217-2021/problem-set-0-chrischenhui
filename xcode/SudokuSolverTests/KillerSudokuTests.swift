//
//  KillerSudokuTests.swift
//  SudokuSolverTests
//
//  Created by Chen Hui on 6/1/21.
//  Copyright © 2021 H. All rights reserved.
//

import XCTest
@testable import SudokuSolver

class KillerSudokuTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testKillerSudoku1() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let killerSudoku1 = KillerSudoku(input: """
            00 00 01 02 03 03 04 04 05
            06 00 01 02 02 07 08 08 05
            06 09 10 10 11 07 12 12 13
            09 09 11 11 11 14 15 15 13
            16 16 16 14 14 14 15 15 15
            17 16 16 14 18 18 18 19 19
            17 20 20 21 18 22 22 19 23
            24 25 25 21 26 26 27 28 23
            24 29 29 30 30 26 27 28 28
            """, cageValues: "11 16 12 14 14 9 9 6 7 18 5 25 8 9 31 23 22 9 12 24 7 10 9 10 7 13 14 16 9 17 9")

        let solution1 = """
            4 2 7 3 8 6 5 9 1
            6 5 9 2 7 1 3 4 8
            3 8 1 4 9 5 6 2 7
            9 1 5 7 4 3 8 6 2
            7 4 2 8 6 9 1 5 3
            8 6 3 5 1 2 4 7 9
            1 3 4 9 5 7 2 8 6
            5 7 6 1 2 8 9 3 4
            2 9 8 6 3 4 7 1 5
            """
        let solver1 = SudokuSolver(sudoku: killerSudoku1)
        solver1.solve()
        let ans1 = killerSudoku1.gridify()
        XCTAssertEqual(ans1, solution1)
    }

    func testKillerSudoku2() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let killerSudoku2 = KillerSudoku(input: """
            00 01 01 02 03 04 04 05 05
            00 06 01 02 03 03 04 04 07
            08 06 09 09 10 03 11 12 07
            08 06 09 09 10 11 11 12 13
            08 08 14 14 10 13 13 13 13
            08 15 16 16 10 17 17 18 13
            08 15 16 16 10 19 17 18 20
            21 15 22 23 19 19 24 24 20
            21 22 22 23 19 24 24 25 25
            """, cageValues: "13 19 13 19 10 14 7 9 27 16 30 18 13 34 12 16 23 11 6 18 9 10 18 6 24 10")

        let solution2 = """
            5 9 3 7 1 2 4 8 6
            8 4 7 6 5 9 1 3 2
            1 2 6 3 8 4 5 9 7
            3 1 2 5 9 6 7 4 8
            9 5 4 8 2 7 3 6 1
            7 6 8 1 4 3 2 5 9
            2 3 5 9 7 8 6 1 4
            6 7 9 4 3 1 8 2 5
            4 8 1 2 6 5 9 7 3
            """
        let solver2 = SudokuSolver(sudoku: killerSudoku2)
        solver2.solve()
        let ans2 = killerSudoku2.gridify()
        XCTAssertEqual(ans2, solution2)
    }

    func testKillerSudoku3() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let killerSudoku3 = KillerSudoku(input: """
            00 00 00 01 01 02 02 03 03
            04 00 00 05 05 06 07 07 03
            04 00 08 08 08 06 09 07 10
            04 11 12 12 13 13 09 10 10
            04 11 14 14 13 09 09 15 16
            17 17 14 13 13 18 18 15 16
            17 19 14 20 21 21 21 22 16
            23 19 19 20 24 24 22 22 16
            23 23 25 25 26 26 22 22 22
            """, cageValues: "23 14 6 14 23 10 9 17 16 11 18 17 10 24 12 17 17 18 12 19 11 15 31 12 14 5 10")

        let solution3 = """
            3 1 8 5 9 2 4 7 6
            7 2 5 4 6 8 9 3 1
            9 4 6 7 3 1 2 5 8
            5 8 7 3 2 9 1 6 4
            2 9 1 6 4 5 3 8 7
            4 6 3 8 1 7 5 9 2
            8 7 2 9 5 4 6 1 3
            1 3 9 2 8 6 7 4 5
            6 5 4 1 7 3 8 2 9
            """
        let solver3 = SudokuSolver(sudoku: killerSudoku3)
        solver3.solve()
        let ans3 = killerSudoku3.gridify()
        XCTAssertEqual(ans3, solution3)
    }

    func testKillerSudokuPerformance1() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let killerSudoku1 = KillerSudoku(input: """
                00 00 01 02 03 03 04 04 05
                06 00 01 02 02 07 08 08 05
                06 09 10 10 11 07 12 12 13
                09 09 11 11 11 14 15 15 13
                16 16 16 14 14 14 15 15 15
                17 16 16 14 18 18 18 19 19
                17 20 20 21 18 22 22 19 23
                24 25 25 21 26 26 27 28 23
                24 29 29 30 30 26 27 28 28
                """, cageValues: "11 16 12 14 14 9 9 6 7 18 5 25 8 9 31 23 22 9 12 24 7 10 9 10 7 13 14 16 9 17 9")

            let solver1 = SudokuSolver(sudoku: killerSudoku1)
            solver1.solve()
        }
    }

    func testKillerSudokuPerformance2() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let killerSudoku2 = KillerSudoku(input: """
                00 01 01 02 03 04 04 05 05
                00 06 01 02 03 03 04 04 07
                08 06 09 09 10 03 11 12 07
                08 06 09 09 10 11 11 12 13
                08 08 14 14 10 13 13 13 13
                08 15 16 16 10 17 17 18 13
                08 15 16 16 10 19 17 18 20
                21 15 22 23 19 19 24 24 20
                21 22 22 23 19 24 24 25 25
                """, cageValues: "13 19 13 19 10 14 7 9 27 16 30 18 13 34 12 16 23 11 6 18 9 10 18 6 24 10")
            let solver2 = SudokuSolver(sudoku: killerSudoku2)
            solver2.solve()
        }
    }

    func testKillerSudokuPerformance3() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let killerSudoku3 = KillerSudoku(input: """
                00 00 00 01 01 02 02 03 03
                04 00 00 05 05 06 07 07 03
                04 00 08 08 08 06 09 07 10
                04 11 12 12 13 13 09 10 10
                04 11 14 14 13 09 09 15 16
                17 17 14 13 13 18 18 15 16
                17 19 14 20 21 21 21 22 16
                23 19 19 20 24 24 22 22 16
                23 23 25 25 26 26 22 22 22
                """, cageValues: "23 14 6 14 23 10 9 17 16 11 18 17 10 24 12 17 17 18 12 19 11 15 31 12 14 5 10")
            let solver3 = SudokuSolver(sudoku: killerSudoku3)
            solver3.solve()
        }
    }
}
