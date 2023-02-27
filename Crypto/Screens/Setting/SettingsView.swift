//
//  SettingsView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                        createButtonForToggle(text: "notifications".localized, isOn: $viewModel.isOn)
                        createButtonSettings(clicked: {}, text: "our_website".localized)
                        createButtonVersion(text: "version".localized, number: "\(Bundle.main.appVersion)")
                    }
                }
                .createToolbarSettings(
                    action: viewModel.moveToBack,
                    text: "settings".localized)
            }
        }
    }
}

extension SettingsView {
    func createButtonForToggle(text: String, isOn: Binding<Bool>) -> some View {
        VStack {
            VStack {
                Button(action: {}, label: {
                    HStack {
                        HStack {
                            Text(text)
                                .font(.system(size: 18))
                                .bold()
                                .foregroundColor(Color.white)
                                .padding()
                            Spacer()
                            Toggle(isOn: isOn, label: {})
                                .toggleStyle(SwitchToggleStyle(tint: Color.cultured))
                                .frame(width: 60, height: 40)
                        }
                        .padding([.leading, .trailing], 20)
                    }
                })
            }
        }
            .frame(width: 330,height: 70)
            .background(Color.noire)
            .cornerRadius(20)
            .padding([.leading, .trailing, .bottom], 20)
    }
    
    func createButtonVersion(text: String, number: String) -> some View {
        VStack {
            VStack {
                HStack {
                    HStack {
                        Text(text)
                            .font(.system(size: 18))
                            .foregroundColor(Color.white)
                            .bold()
                            .padding()
                        Spacer()
                        Text("\(number)")
                            .font(.system(size: 18))
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(10)
                            .background(Color.carbon)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                    }
                    .padding([.leading, .trailing], 20)
                }
            }
        }
        .frame(width: 330,height: 70)
        .background(Color.noire)
        .cornerRadius(20)
        .padding([.leading, .trailing, .bottom], 20)
    }
    
    func createButtonSettings(clicked: (() -> Void)?, text: String) -> some View {
        VStack {
            VStack {
                Button(action: {
                    clicked?()
                }, label: {
                    HStack {
                        HStack {
                            Text(text)
                                .font(.system(size: 18))
                                .foregroundColor(Color.white)
                                .bold()
                                .padding()
                            Spacer()
                        }
                        .padding([.leading, .trailing], 20)
                    }
                })
            }
        }
        .frame(width: 330,height: 70)
        .background(Color.noire)
        .cornerRadius(20)
        .padding([.leading, .trailing, .bottom], 20)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
