//
//  ContentView.swift
//  HamsterSalad
//
//  Created by soyoung kim on 3/6/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var accountViewModel = AccountViewModel()
    var body: some View {
        
        //하단 탭바
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
        .onAppear { //화면이 나타날 때 API 요청
            accountViewModel.fetchAccounts()
        }
    }
}

// 각 화면의 기본 구조
struct HomeView: View {
    var body: some View {
        ScrollView(){
            VStack(spacing: 0) { // 리스트 형식으로 배치
                AdCardView()  // 광고 배너 카드
                MainIconMenuView() //                
                accountsListView()  // 입출금 계좌 리스트

            }
//            .padding() // 전체 여백 추가
        }
    }
}

//하단 탭바 화면
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

//home 화면
//광고 카드뷰
struct AdCardView: View {
    @State private var currentIndex = 0
    let banners = [
        ("3월에만 받을 수 있는 이벤트", "최대 17만원 용돈받기 >", "gift.fill"),
        ("친구 초대하면 추가 혜택", "최대 5천원 적립 >", "person.2.fill"),
        ("카드 실적 달성 이벤트", "포인트 최대 10배 >", "creditcard.fill")
    ]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<banners.count, id: \.self){ index in
                ZStack(alignment: .bottomTrailing){
                    VStack(alignment: .leading, spacing: 10) { //텍스트를 왼쪽 정렬
                        HStack(spacing: 10){
                            VStack{
                                Text(banners[index].0)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                Text(banners[index].1)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Image(systemName: banners[index].2)
                                .font(.system(size: 45))
                                .padding(.trailing, 20)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding()
                    
                    Text("\(currentIndex + 1) / \(banners.count)") // 현재 페이지 / 전체 페이지
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(8)
                        .padding(.trailing, 30)
                        .padding(.bottom, 25)
                }
            }
        }
        .frame(height: 100)
        
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % banners.count //automatic Slides
            }
        }
        

    }
}

struct accountsListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading){
                    Text("입출금계좌")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("999,999,999원")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                }
                Spacer()
                Button(action: {
                //송금 액션
                print("송금 버튼 눌림")
                }) {
                    Text("송금")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

            }            
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
        ("arrow.up.and.down.and.sparkles", "용돈벌기"),
        ("arrow.clockwise.heart.fill", "보험리모델링"),
        ("rectangle.and.text.magnifyingglass", "대출찾기"),
        ("creditcard.fill", "카드이벤트")
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
