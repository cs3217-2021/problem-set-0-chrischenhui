protocol Sudoku {
    mutating func set(cell: Cell, to value: Int?) -> Set<Int>

    func select_unassigned_variable_and_domain() -> (Cell, Set<Int>)

    func least_constraining_values(cell: Cell, domain: Set<Int>) -> [(value: Int, count: Int)]

    func reset_assignment(cell: Cell, value: Int, removedDomain: Set<Int>)

    func inference(cell: Cell, value: Int) -> (Bool, [(Cell, Int)])

    func reset_domain(domainUpdates: [(Cell, Int)])

    func is_consistent_with_value(cell: Cell, value: Int) -> Bool

    func gridify() -> String

    var isSolved: Bool { get }
}
