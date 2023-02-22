//
//  ContentView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import SwiftUI

struct IntroView: View {
    
    @ObservedObject var viewModel: IntroViewModel
    
    var coins: Coins
    
    var body: some View {
        ZStack {
            image
            VStack {
                topText
                Spacer()
                bottomButton
            }
        }
    }
}

extension IntroView {
    
    var image: some View {
        ZStack {
            Image.mainImage
                .resizable()
                .ignoresSafeArea()
        }
    }
    
    var topText: some View {
        VStack(spacing: 20) {
            createText(text: "Welcome", size: 40)
            createText(text: "To the Crypto", size: 30)
        }.padding(.top, 20)
            .opacity(viewModel.animation ? 1.0 : 0.0)
            .onAppear() {
                withAnimation(Animation.easeInOut(duration: 2.0)) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        viewModel.animation.toggle()
                    }
                }
            }
    }
    
    var bottomButton: some View {
        VStack {
            createButton(action: {
                viewModel.navigation(coins: coins)
                viewModel.checkCoins()
            }, text: "Let’s start!")
        }.padding(.bottom,30)
    }
    
    func createButton(action: (() -> Void)?, text: String) -> some View {
        Button(action: {
            action?()
        }, label: {
            Text(text)
                .font(.system(size: 27,weight: .bold))
                .foregroundColor(.cultured)
        })
        .frame(width: 330, height: 70)
        .background(Color.monochrome)
        .cornerRadius(15)
        .opacity(viewModel.animationButton ? 1.0 : 0.0)
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 2.0)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewModel.animationButton.toggle()
                }
            }
        }
    }
    
    func createText(text: String, size: CGFloat) -> some View {
        Text(text)
            .font(.system(size: size,weight: .bold))
            .foregroundColor(.cultured)
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(viewModel: .init(apiModel: ApiModel()), coins: Coins(id: "", name: "", price: 123.123, imageURL: ""))
    }
}
