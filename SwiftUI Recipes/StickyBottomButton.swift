//
//  StickyBottomButton.swift
//  SwiftUI Recipes
//
//  Created by Azura Sakan Taufik on 03/03/22.
//

import SwiftUI

class StickyBottomButtonVM: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
}

struct StickyBottomButton: View {
    @ObservedObject var viewModel = StickyBottomButtonVM()
    
    var body: some View {
        VStack {
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            // MARK: - Step 1 Add Spacer to takes up the space between the TextFields (or any view) and Button
            Spacer()
            Button(action: {
                print("I am clicked")
            }, label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
            })
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(8)
        } //: VSTACK
        .padding(32)
        // MARK: - Step 2 Ignore the built-in safe area at the bottom that covers the area of the keyboard
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct StickyBottomButton_Previews: PreviewProvider {
    static var previews: some View {
        StickyBottomButton()
    }
}
