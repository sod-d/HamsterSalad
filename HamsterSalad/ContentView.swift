//
//  ContentView.swift
//  HamsterSalad
//
//  Created by soyoung kim on 3/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
            
            recomendView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("추천")
                }
            
            NewspaperView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("새소식")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "face.smiling.inverse")
                    Text("MY")
                }
        }
    }
}

// 각 화면의 기본 구조
struct HomeView: View {
    var body: some View {
        VStack {
            CardView() // 카드 UI 표시
            Spacer()
        }
    }
}

struct recomendView: View {
    var body: some View {
        Text("추천 화면")
    }
}

struct NewspaperView: View {
    var body: some View {
        Text("새소식 화면")
    }
}
struct ProfileView: View {
    var body: some View {
        Text("MY 화면")
    }
}

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("소영님의 순자산")
                .font(.headline)
                .foregroundColor(.white)
            Text("₩123,456,789")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.green)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    ContentView()
}
