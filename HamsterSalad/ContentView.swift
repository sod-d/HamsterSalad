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
//            Spacer()
            MainIconMenuView()
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

//MainIconList
struct MainIconMenuView: View {
    let menuItems = [
        ("chart.bar.fill", "자산"),
        ("dollarsign.circle.fill", "혜택"),
        ("doc.text.fill", "소비"),
        ("person.crop.circle.fill", "MY")
    ]
    var body: some View{
        HStack {
            ForEach(menuItems, id: \.0) { item in
                Spacer() //균등하게 배치를 위해 Spacer 추가
                VStack {
                    Image(systemName: item.0)
                        .font(.system(size:40))
                        .foregroundStyle(.gray)
                    Text(item.1)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer() //균등하게 배치를 위해 Spacer 추가

            }
        }
        .padding(.vertical, 15) // 위아래 여백 추가
        .frame(maxWidth: .infinity) // 가로 최대 크기 확장
        .background(Color.white) // 배경색 추가 (필요하면)
//        .cornerRadius(10) // 모서리 둥글게
//        .shadow(radius: 3) // 그림자 추가 (선택사항)
    }
}

#Preview {
    ContentView()
}
