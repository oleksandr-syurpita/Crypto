//
//  DetailLoadingView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import SwiftUI

struct DetailLoadingView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                        ShimmerView()
                            .frame(width: 330,height: 345)
                            .cornerRadius(15)
                            .padding(.leading, 10)
                        main
                    }
                }
                .createToolbarDetail(action: {}, text: "\(viewModel.coin.name)")
            }
        }
    }
}

private extension DetailLoadingView {
    
    var coinPrice: some View {
        HStack {
            ShimmerView()
            .frame(width: 85, height: 40)
            .background(Color.charcoal)
            .cornerRadius(15)
            .padding(.leading, 20)
            Spacer()
        }
        .padding()
    }
    
    var news: some View {
        VStack {
            HStack {
                ShimmerView()
                    .frame(width: 150,height: 30)
                    .cornerRadius(15)
                    .padding(.leading, 30)
                Spacer()
            }
            ForEach(viewModel.detailsNews, id: \.id) { newsModel in
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
    
    func createNewsRow(newsModel: News) -> some View {
        VStack {
            HStack {
                ShimmerView()
                    .frame(width: 330,height: 35)
                    .cornerRadius(15)
                    .padding(.leading, 30)
                Spacer()
            }
            HStack {
                ShimmerView()
                    .frame(width: 130,height: 20)
                    .cornerRadius(15)
                    .padding(.leading, 30)
                Spacer()
            }
            createDivider
        }
        .padding(.top, 10)
    }
}

struct DetailLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailLoadingView(viewModel: .init(coin: Coins(id: "1", name: "ok", price: 123.312, imageURL: ""), apiModel: ApiModel()))
    }
}
