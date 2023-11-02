//
//  ContentView.swift
//  ArkademiHome
//
//  Created by Arkademi Tech on 31/10/23.
//

import SwiftUI



let categories = ["Pohon Skill","Kursus siap kerja","Sertifikasi","Standar ISO","Keuangan","Bisnis","Keselamatan Kerja","Administrasi","Teknologi","Pengembangan diri"]

struct MainiView: View {
    var body: some View {
        TabView{
            HomeView().tabItem{
                Label("Home",systemImage: "house.fill")}
            Text("kelas saya").tabItem{
                Label("Kelas",systemImage: "book.fill")}
            Text("profile").tabItem{
                Label("Profile",systemImage: "person.fill")}
        }
    }
}

struct HomeView: View {
    
    @State private var banner = BannerResponse(data: [Banner(link: "", img: "")])
    
    @State private var popCategories = CategoryPopularResponse(data:[Category(name: "", image: "")])
    
    var body: some View {
        
        ScrollView{
            VStack() {
                VStack{
                    //logo + search bar + icon notif & wishlist
                    VStack(){
                        HStack{
                           
                            Image("ArkademiIcon").resizable().frame(width:144,height:34)
                            Spacer()
                            Image(systemName: "bell")  .foregroundStyle(.white)
                                .font(.system(size: 25.0))
                            Spacer().frame(width:8)
                            Image(systemName: "heart").foregroundStyle(.white)
                                .font(.system(size: 25.0))
                        }
                        Spacer().frame(height:20)
                        HStack(){
                            Spacer().frame(width:14)
                            Image(systemName:"magnifyingglass").foregroundColor(.blue)
                            Text("Cari kursus").foregroundColor(.gray)
                            Spacer()
                        }.frame(minWidth: 380,maxWidth: .infinity,minHeight: 0,maxHeight:.infinity ).padding([.top,.bottom],18).background(.white).cornerRadius(8)
                       
                        
                       
                    }.padding([.leading,.trailing],16).padding([.top,.bottom],14).background(
                        LinearGradient(gradient: Gradient(colors: [.blue, Color.blue.opacity(0.8)]), startPoint: .leading, endPoint: .trailing)
                    )
                    //category view
                    ScrollView(.horizontal) {
                        HStack(spacing:10){
                            Spacer().frame(width: 6)
                            ForEach(0..<categories.count,id: \.self) { index in
                        CategoryView(label: categories[index])
                        }
                            Spacer().frame(width: 6)
                     
                    }
                    }
                    //Banner
                   AsyncImage(url: URL(string: banner.data.first!.img)) { image in
                       image.resizable()
                   } placeholder: {
                       ProgressView()
                   }.frame(minWidth: 380,maxWidth: .infinity,minHeight: 165,maxHeight:165).cornerRadius(8).padding(10).onAppear(){
                       apiCall().fetchData { (banners) in
                                           self.banner = banners
                       }
                   }
                    HStack{
                        VStack(alignment:.leading){
                           AsyncImage(url: URL(string:"https://d19izmiuoyzsz.cloudfront.net/attachment/Ni9jsrKlAWkiEWfguyAQ8BU2Acd6dAKC1pAaNhne.png")) { image in
                               image.resizable()
                           } placeholder: {
                               ProgressView()
                           }.frame(minWidth: 0,maxWidth: 110,minHeight: 0,maxHeight:40)
                            Text("Punya Voucher Prakerja?").font(.system(size: 15,weight:.bold))
                                .foregroundColor(.black)
                            Spacer().frame(height:6)
                            Text("Tukar kode voucher prakerja anda di sini.").font(.system(size: 12))
                                .foregroundColor(.black)
                        }
                        HStack{
                            Image(systemName: "bag.circle").foregroundStyle(.white)
                                .font(.system(size: 15))
                            Text("TUKAR VOUCHER").font(.system(size: 11,weight:.bold))
                                .foregroundColor(.white)
                        }.padding([.top,.bottom],9).padding([.leading,.trailing],12).background(.orange).cornerRadius(20)
                        
                    }.padding(10).background(Image("PrakerjaBackground")).cornerRadius(8).shadow(color: .gray, radius: 2, x: 0, y: 0)
                   
                    Spacer().frame(height:18)
                    VStack(alignment: .leading){
                        HStack{
                            Text("Kursus Siap Kerja").font(.system(size: 21,weight:.bold))
                                .foregroundColor(.black)
                            Text("Baru").font(.system(size: 11,weight:.bold))
                                .foregroundColor(.white).padding(5).background(.teal.opacity(0.7)).cornerRadius(4)
                        }
                       
                        Spacer().frame(height:10)
                        Text("Kursus online yang siap membantu kamu dalam\nmeningkatkan skill dan mengembangkan karier profesional").font(.system(size: 11.5))
                        Spacer().frame(height:10)
                        HStack{
                            Text("Lihat Semua Kursus").font(.system(size: 14,weight:.bold)).foregroundColor(.blue)
                            Image(systemName: "arrow.forward").foregroundStyle(.blue)
                                .font(.system(size: 11))
                        }
                        Spacer().frame(height:24)
                        ScrollView(.horizontal) {
                            HStack(spacing:14){
                               CourseCardView(title: "paana")
                               CourseCardView(title: "paanb")
                               CourseCardView(title: "paanc")
                            }
                        }
                        
                    }.padding([.leading,.trailing],14).padding([.top,.bottom],22).background(.white).overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 0.4)).padding([.leading,.trailing],14)
                   
                    VStack(alignment:.leading){
                        Spacer().frame(height:18)
                        Text("Preparation Test").font(.system(size: 23,weight:.bold))
                            .foregroundColor(.black)
                        HStack{
                            VStack(alignment:.leading){
                                Spacer()
                                HStack{
                                    Spacer().frame(width:18)
                                    VStack(alignment:.leading){
                                        Text("CPNS").font(.system(size: 20,weight:.bold))
                                        Text("3 Paket Tes").font(.system(size: 14))
                                        Spacer().frame(height:18)
                                    }
                                   
                                    Spacer()
                                }
                            }
                            .frame(minWidth: 0,maxWidth: .infinity,minHeight: 120,maxHeight:120).background(Image("CpnsBackground").resizable())
                            VStack(alignment:.leading){
                                Spacer()
                                HStack{
                                    Spacer().frame(width:18)
                                    VStack(alignment:.leading){
                                        Text("PPPK").font(.system(size: 20,weight:.bold))
                                        Text("11 Paket Tes").font(.system(size: 14))
                                        Spacer().frame(height:18)
                                    }
                                   
                                    Spacer()
                                }
                            }.frame(minWidth: 0,maxWidth: .infinity,minHeight: 120,maxHeight:120).background(Image("PppkBackground").resizable())
                        }
                    }.padding([.leading,.trailing],14)
                    VStack(alignment:.leading){
                        Spacer().frame(height:20)
                        Text("Mini Course").font(.system(size: 23,weight:.bold))
                            .foregroundColor(.black).padding([.leading],14)
//                        AsyncImage(url:URL(string:"https://d19izmiuoyzsz.cloudfront.net/attachment/F9tYXNsWbHufohhiQg1dERz0utBdwrodFIw7AAsG.png")) { image in
//                            image.resizable()
//                        } placeholder: {
//                            ProgressView()
//                        }.frame(width:.infinity,height:120).padding([.leading,.trailing],14)
                        Spacer().frame(height:10)
                        ScrollView(.horizontal) {
                            HStack(spacing:10){
                                Spacer().frame(width:2)
                               AsyncImage(url:URL(string:"https://d19izmiuoyzsz.cloudfront.net/attachment/yBjaS6lSUqnCygRJ9SEVYyjbfP0ywBiSWY6uD4Nk.png")) { image in
                                   image.resizable()
                               } placeholder: {
                                   ProgressView()
                               }.frame(width:170,height:120)
                               AsyncImage(url:URL(string:"https://d19izmiuoyzsz.cloudfront.net/attachment/moDn2psqLFPZoKG9atJk6Swr4UbIb8rdOApMaqM5.png")) { image in
                                   image.resizable()
                               } placeholder: {
                                   ProgressView()
                               }.frame(width:170,height:120)
                               AsyncImage(url:URL(string:"https://d19izmiuoyzsz.cloudfront.net/attachment/twIhk1HGF6lQyZnRHHRwZ58ZsgmEsabrF0GjvEEW.png")) { image in
                                   image.resizable()
                               } placeholder: {
                                   ProgressView()
                               }.frame(width:170,height:120)
                                Spacer().frame(width:2)
                            }
                        }
                    }
                   
                }
                Spacer().frame(height:20)
                VStack(alignment:.leading){
                    Text("Kategori Terpopuler").font(.system(size: 23,weight:.bold))
                        .foregroundColor(.black).padding([.leading],14)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows:[GridItem(.fixed(122),spacing:8),GridItem(.fixed(122),spacing:0)]) {
                            ForEach(0..<popCategories.data.count,id: \.self) { index in
                                VStack{
                                    AsyncImage(url:URL(string:popCategories.data[index].image)) { image in
                                                                        image.resizable()
                                                                    } placeholder: {
                                                                        ProgressView()
                                                                    }.frame(width:60,height: 55)
                                                                   
                                   
                                    Text("\(popCategories.data[index].name)").font(.system(size: 11,weight: .medium))
                                }.cornerRadius(8).frame(width:120,height:120)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.gray, lineWidth: 0.2))
                            }
                        }.padding([.leading,.trailing],14).onAppear(){
                            apiCall().fetchCategories { (categories) in
                                                                       self.popCategories = categories
                                                   }
                        }
                        }
                }
                VStack{
                    Spacer().frame(height:20)
                    HStack{
                        Text("Kelas Terbaru").font(.system(size: 23,weight:.bold))
                            .foregroundColor(.black)
                        Spacer()
                        Text("Lihat Semua").font(.system(size: 15,weight:.bold))
                            .foregroundColor(.blue)
                    }.padding([.leading,.trailing],14)
                    ScrollView(.horizontal) {
                        HStack(spacing:14){
                            Spacer().frame(width:0)
                            Text("cardbase a").frame(width:180, height:220).background(.green)
                            Text("cardbase b").frame(width:180, height:220).background(.green)
                            Text("cardbase c").frame(width:180, height:220).background(.green)
                            Spacer().frame(width:0)
                        }
                    }
                    
                }
                VStack{
                    Spacer().frame(height:20)
                    HStack{
                        Text("Bisnis").font(.system(size: 23,weight:.bold))
                            .foregroundColor(.black)
                        Spacer()
                        Text("Lihat Semua").font(.system(size: 15,weight:.bold))
                            .foregroundColor(.blue)
                    }.padding([.leading,.trailing],14)
                    ScrollView(.horizontal) {
                        HStack(spacing:14){
                            Spacer().frame(width:0)
                            Text("cardbase a").frame(width:180, height:220).background(.green)
                            Text("cardbase b").frame(width:180, height:220).background(.green)
                            Text("cardbase c").frame(width:180, height:220).background(.green)
                            Spacer().frame(width:0)
                        }
                    }
                    
                }
                VStack{
                    Spacer().frame(height:20)
                    HStack{
                        Text("Pengembangan Diri").font(.system(size: 23,weight:.bold))
                            .foregroundColor(.black)
                        Spacer()
                        Text("Lihat Semua").font(.system(size: 15,weight:.bold))
                            .foregroundColor(.blue)
                    }.padding([.leading,.trailing],14)
                    ScrollView(.horizontal) {
                        HStack(spacing:14){
                            Spacer().frame(width:0)
                            Text("cardbase a").frame(width:180, height:220).background(.green)
                            Text("cardbase b").frame(width:180, height:220).background(.green)
                            Text("cardbase c").frame(width:180, height:220).background(.green)
                            Spacer().frame(width:0)
                        }
                    }
                    
                }
                VStack{
                    Spacer().frame(height:20)
                    HStack{
                        Text("Rekomendasi").font(.system(size: 23,weight:.bold))
                            .foregroundColor(.black)
                        Spacer()
                        Text("Lihat Semua").font(.system(size: 15,weight:.bold))
                            .foregroundColor(.blue)
                    }.padding([.leading,.trailing],14)
                    LazyVGrid(columns:[GridItem(.adaptive(minimum:150),spacing:20)]) {
                        ForEach(0..<categories.count,id: \.self) { index in
                            Text("cardbase a").frame(width:200, height:220).background(.green)
                        }
                    }.padding([.leading,.trailing],14).background(.yellow)
                    
                }
                VStack{
                    Spacer().frame(height:40)
                    Text("ARKADEMI V 1.0").font(.system(size:20,weight: .bold))
                    Spacer().frame(height:8)
                    Text("All rights reserved PT Arkademi Daya Indonesia 2017-2023").font(.system(size:13,weight: .medium))
                    Spacer().frame(height:40)
                }
               
                
                
            }
            
            Spacer().frame(height:30)
        }
       
        
    }
}

struct CourseCardView: View{
    var title: String
    
    var body: some View {
        Text(title).frame(width:200, height:240).background(.green).cornerRadius(8).shadow(color: .gray, radius: 2, x: 0, y: 0)
    }
}

struct CategoryView: View {
    @State var label: String
    
    var body: some View {
        ZStack {
            Text(label).padding([.leading,.trailing],10).padding([.top,.bottom],5).background(.white).cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 1))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainiView()
    }
}
