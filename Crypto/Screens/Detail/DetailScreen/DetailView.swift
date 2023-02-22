//
//  DetailView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                VStack {
                    if viewModel.errorHandler {
                        DetailErrorView()
                    } else {
                        detailView
                    }
                }
                .createToolbarDetail(action: { viewModel.navigationBack()}, text: "\(viewModel.coin.name)")
            }.onAppear {
                viewModel.checkDetail()
            }
        }
    }
}

private extension DetailView {
    
    var detailView: some View {
        VStack { if viewModel.loading {
            DetailLoadingView()
        } else {
            ScrollView {
                GraphView(viewModel: .init(coin: viewModel.coin, apiModel: ApiModel()))
                main
            }
            createBuyCoinButton(text: "buy" + " " + "\(viewModel.coin.name)", action: {})
            }
        }
    }
    
    var coinPrice: some View {
        HStack {
            HStack {
                Text("$" + (viewModel.coin.price.toString()))
                    .font(.system(size: 17))
                    .foregroundColor(.red)
            }
            .frame(width: 85, height: 40)
            .padding(.horizontal, 10)
            .background(Color.charcoal)
            .cornerRadius(15)
            Spacer()
        }
        .padding()
    }
    
    var news: some View {
        VStack {
            HStack {
                Text("News")
                    .foregroundColor(Color.white)
                    .font(.system( size: 26, weight: .bold))
                    .padding(.leading, 20)
                Spacer()
            }
                ForEach(viewModel.detailsNews) { newsModel in
                    createNewsRow(newsModel: newsModel)
            }
        }
    }
    
    var main: some View {
        VStack {
            coinPrice
            news
        }
    }
    
    var createDivider: some View {
        Divider()
            .frame( width: UIScreen.main.bounds.width / 1.1, height: 1)
            .background(Color.gray)
    }
    
    var createTime: some View {
        Divider()
            .frame( width: UIScreen.main.bounds.width / 1.1, height: 1)
            .background(Color.gray)
    }
    func createNewsRow(newsModel: News) -> some View {
        VStack {
            HStack {
                Text("\(newsModel.title)")
                    .font(.system( size: 18, weight: .medium))
                    .foregroundColor(Color.gray.opacity(0.8))
                    .padding(.leading, 20)
                Spacer()
            }
            HStack {
                Text("\(newsModel.date.convertCoin(time: newsModel.date)) ago")
                    .font(.system( size: 18, weight: .medium))
                    .foregroundColor(Color.gray.opacity(0.8))
                    .padding(.leading, 20)
                Spacer()
            }
            createDivider
        }
        .padding(.top, 10)
    }
    
    func createBuyCoinButton(text: String, action: (() -> Void)?) -> some View {
        VStack {
            Button(action: {action?()}) {
                Text(text)
                    .font(.system( size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .frame(width: 330)
        .background(Color.monochrome)
        .cornerRadius(15)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: .init(coin: Coins(id: "Bitcoin", name: "Bitcoin", price: 312312.312, imageURL: ""), apiModel: ApiModel()))
    }
}
