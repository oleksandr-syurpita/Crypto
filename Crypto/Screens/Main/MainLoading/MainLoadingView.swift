//
//  MainLoadingView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import SwiftUI

struct MainLoadingView: View {
    
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
                .createToolbar(text: "crypto".localized)
            }
        }
    }
}

private extension MainLoadingView {
    
    var list: some View {
        VStack {
            VStack(spacing: 20) {
                ForEach(viewModel.coin) { coins in
                    createButton()
                }
            }
        }
    }
    
    var settingsButton: some View {
        HStack {
            Spacer()
            Button(action: {}) {
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
    
    func createButton() -> some View {
        VStack {
            VStack {
                Button(action: {}) {
                    HStack {
                        ShimmerView()
                            .frame(width: 40, height: 40)
                            .cornerRadius(.infinity)
                        Spacer()
                        ShimmerView()
                            .frame(width: 250, height: 30)
                            .cornerRadius(15)
                        Spacer()
                    }
                    .cornerRadius(15)
                    .padding([.leading,.trailing], 20)
                }
                .frame(height: 70)
            }
        }
        .background(Color.noire)
        .cornerRadius(15)
        .padding([.leading,.trailing], 20)
    }
}

struct MainLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        MainLoadingView()
    }
}
