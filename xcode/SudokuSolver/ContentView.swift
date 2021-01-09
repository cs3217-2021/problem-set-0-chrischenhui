//
//  ContentView.swift
//  SudokuSolver
//
//  Created by H on 10/12/19.
//  Copyright © 2019 H. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        VStack {
            Text(modelData.sudokuSolver.gridify())
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
