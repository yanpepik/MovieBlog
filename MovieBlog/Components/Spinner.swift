//
//  Spinner.swift
//  MovieBlog
//
//  Created by Yan Pepik on 27/07/2023.
//

import SwiftUI

struct Spinner: View {
    @State var isAnimating: Bool

    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .onAppear {
                isAnimating = true
            }
    }
}
