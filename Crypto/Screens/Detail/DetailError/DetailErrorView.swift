//
//  DetailErrorView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import SwiftUI

struct DetailErrorView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                VStack {
                    all
                }
            }
        }
    }
}

extension DetailErrorView {
    
    var all: some View {
        VStack(spacing: 20) {
            image
            text
            createButton(action: {}, text: "Try Again")
        }
    }
    
    var image: some View {
        Image.warning
            .resizable()
            .frame(width: 110,height: 100)
    }
    
    var text: some View {
        VStack(spacing: 0) {
            Text("Seems like error occurred on our\n side.")
                .font(.system(size: 18))
                .foregroundColor(Color.cultured)
                .multilineTextAlignment(.center)

            Text("Tap button below to try again")
                .font(.system(size: 18))
                .foregroundColor(Color.cultured)
                .multilineTextAlignment(.center)
                .padding(10)
        }
        .frame(width: 300, alignment: .center)
    }
    func createButton(action: (() -> Void)?, text: String) -> some View {
        Button(action: {
            action?()
        }, label: {
            Text(text)
                .font(.system(size: 18))
                .foregroundColor(.cultured)
        })
        .frame(width: 330, height: 70)
        .background(Color.monochrome)
        .cornerRadius(15)
    }
}

struct DetailErrorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailErrorView()
    }
}
