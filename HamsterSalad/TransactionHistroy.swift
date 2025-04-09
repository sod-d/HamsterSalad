//
//  TransactionHistroy.swift
//  HamsterSalad
//
//  Created by soyoung kim on 3/7/25.
//

import SwiftUI

struct TransactionHistroy: View {
    var body: some View {
        VStack{
            AssetView() //거래내역 표시
        }
    }
}

//거래내역
struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let amount: String
    let date: String
}

struct AssetView: View {
    let transactions = [
        Transaction(title: "스타벅스", amount: "-₩5,000", date: "2025-03-06"),
        Transaction(title: "GS25", amount: "-₩3,200", date: "2025-03-05"),
        Transaction(title: "급여 입금", amount: "+₩2,500,000", date: "2025-03-01"),
    ]

    var body: some View {
        List(transactions) { transaction in
            HStack {
                VStack(alignment: .leading) {
                    Text(transaction.title)
                        .font(.headline)
                    Text(transaction.date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Text(transaction.amount)
                    .font(.headline)
                    .foregroundColor(transaction.amount.contains("-") ? .red : .blue)
            }
            .padding(10)
        }
    }
}

#Preview {
    TransactionHistroy()
}
