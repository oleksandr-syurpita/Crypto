//
//  MainView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel(apiModel: ApiModel())
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView {
                        list
                    }
                    settingsButton
                }
                .background(Color.main)
                .createToolbar(text: "Crypto")
            } .onAppear {
                viewModel.checkCoins()
                viewModel.coinsTemp.removeAll()
            }
        }
    }
}

private extension MainView {
    
    var list: some View {
        VStack {
            VStack(spacing: 20) {
                ForEach(viewModel.coinsTemp) { coins in
                    createButton(action: {viewModel.moveToDetails(detail: coins)}, coins: coins)
                        .background(Color.noire)
                        .cornerRadius(15)
                        .padding([.leading,.trailing], 20)
                }
            }
        }
    }
    
    var settingsButton: some View {
        HStack {
            Spacer()
            Button(action: {viewModel.moveToSettings()}) {
                HStack {
                    Image.vector
                }
                .foregroundColor(Color.white)
                .frame(width: 75, height: 75)
                .background(Color.monochrome)
                .cornerRadius(15)
                }
            .padding([.bottom, .trailing], 15)
        }
    }
    
    func createButton(action: (() -> Void)?, coins: Coins) -> some View {
        VStack {
            VStack {
                Button(action: {action?()}) {
                    HStack {
                        Image("\(coins.imageURL)")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 40, height: 40)
                        Text(coins.name)
                            .font(.system( size: 18, weight: .bold))
                            .foregroundColor(Color.cultured)
                            .padding()
                        Spacer()
                        Text("$" + coins.price.toString())
                            .frame(height: 30)
                            .padding(10)
                            .font(.system(size: 16, weight: .medium))
                            .background(Color.carbon)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                    }
                    .cornerRadius(15)
                    .padding([.leading,.trailing], 20)
                }
                .frame(height: 70)
            }
        }
    }
}
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView(viewModel: .init(apiModel: ApiModel()))
        }
    }

