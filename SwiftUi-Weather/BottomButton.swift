//
//  BottomButton.swift
//  SwiftUi-Weather
//
//  Created by Mohit Tomer on 14/12/23.
//

import SwiftUI


struct BottomButton: View {
    
    // MARK: PROPERTIES
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    BottomButton(title: "Test Title", textColor: .white, backgroundColor: .green)
}
