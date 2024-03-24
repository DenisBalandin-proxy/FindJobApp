//
//  CoordinatorTabBarView.swift
//  FindJob
//
//  Created by Denis on 3/19/24.
//
import SwiftUI

struct CoordinatorTabBarView: View {
    @ObservedObject var object: CoordinatorObject
    
    var body: some View {
        if object.isLogin != nil {
            GeometryReader { geometry in
                ZStack(alignment: .bottomLeading) {
                    TabView(selection: $object.tab) {
                        JobsCoordinatorView(object: object.searchCoordinator)
                            .tag(CoordinatorTab.search)
                            .tabItem {
                                VStack {
                                    Image(.search).renderingMode(.template)
                                    Text("Поиск")
                                }
                            }
                        
                        FavoritesCoordinatorView(object: object.favoritesCoordinator)
                            .tag(CoordinatorTab.favorite)
                            .tabItem {
                                VStack {
                                    Image(.favorite).renderingMode(.template)
                                    Text("Избранное")
                                }
                            }
                        
                        Text("Отклики")
                            .tag(CoordinatorTab.responses)
                            .tabItem {
                                VStack {
                                    Image(.responses).renderingMode(.template)
                                    Text("Отклики")
                                }
                            }
                        
                        Text("Сообщения")
                            .tag(CoordinatorTab.messages)
                            .tabItem {
                                VStack {
                                    Image(.messages).renderingMode(.template)
                                    Text("Сообщения")
                                }
                            }
                        
                        Text("Профиль")
                            .tag(CoordinatorTab.profile)
                            .tabItem {
                                VStack {
                                    Image(.profile).renderingMode(.template)
                                    Text("Профиль")
                                }
                            }
                    }
                    if (object.favoritesCoordinator.favoriteViewModel.vacancies.count != 0) {
                        ZStack {
                            
                            Circle()
                                .foregroundColor(.red)
                            
                            Text("\(object.favoritesCoordinator.favoriteViewModel.vacancies.count)")
                                .foregroundColor(.white)
                                .font(Font.system(size: 12))
                        }
                        .frame(width: 15, height: 15)
                        .offset(x: ( ( 2 * 2) - 0.95 ) * ( geometry.size.width / ( 2 * 5 ) ) + 2, y: -30)
                        .opacity(1.0)
                    }
                }
            }
        } else {
            TabView {
                CoordinatorView(coordinator: object.loginCoordinator)
                    .tabItem {
                        VStack {
                            Image(.search).renderingMode(.template)
                            Text("Поиск")
                        }
                    }
                CoordinatorView(coordinator: object.loginCoordinator)
                    .tabItem {
                        VStack {
                            Image(.favorite).renderingMode(.template)
                            Text("Избранное")
                        }
                    }
                CoordinatorView(coordinator: object.loginCoordinator)
                    .tabItem {
                        VStack {
                            Image(.responses).renderingMode(.template)
                            Text("Отклики")
                        }
                    }
                CoordinatorView(coordinator: object.loginCoordinator)
                    .tabItem {
                        VStack {
                            Image(.messages).renderingMode(.template)
                            Text("Сообщения")
                        }
                    }
                CoordinatorView(coordinator: object.loginCoordinator)
                    .tabItem {
                        VStack {
                            Image(.profile).renderingMode(.template)
                            Text("Профиль")
                        }
                    }
            }
        }
    }
}
