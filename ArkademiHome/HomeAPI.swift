//
//  HomeAPI.swift
//  ArkademiHome
//
//  Created by Arkademi Tech on 31/10/23.
//

import Foundation

//BANNER
struct BannerResponse: Codable {
    let data: [Banner]
}

struct Banner: Codable {
    let link: String
    let img: String
}

//POPULAR CATEGORIES
struct CategoryPopularResponse: Codable{
    let data: [Category]
}

struct Category: Codable {
    let name: String
    let image: String
}

//NEWEST COURSE
struct NewestResponse: Codable{
    let data: [Int]
    
}

//TRENDING COURSE
struct TrendingResponse: Codable{
    let data: [String]
    
}

//DETAIL COURSE
struct CourseResponse:Codable{
    let data:[Course]
    
}

struct Course:Codable{
    let course:CourseDetail
}

struct CourseDetail:Codable{
    let name:String
    let price:String
    let regular_price:String
    let featured_image:String
    let instructor:Instructor
    let average_rating:String
    let total_students:Int
    
    
}

struct Instructor:Codable{
    let name:String
}

//BISNIS COURSE
struct BisnisResponse: Codable{
    
}

//PENGEMBANGAN COURSE


class apiCall{
    let apiCourse = "https://api-course.arkademi.com"
    
    func fetchData(completion:@escaping (BannerResponse) -> ()) {
        guard let url = URL(string: "\(apiCourse)/api/v1/homepage/home_sliders_mobile") else { return }
               
               URLSession.shared.dataTask(with: url) { (data, _, _) in
                   let comments = try! JSONDecoder().decode(BannerResponse.self, from: data!)
                   print(comments)
                   
                   DispatchQueue.main.async {
                       completion(comments)
                   }
               }
               .resume()
    }
    
    func fetchCategories(completion:@escaping (CategoryPopularResponse) -> ()) {
        guard let url = URL(string: "\(apiCourse)/api/v1/course/revamp-categories/populer") else { return }
               
               URLSession.shared.dataTask(with: url) { (data, _, _) in
                   let comments = try! JSONDecoder().decode(CategoryPopularResponse.self, from: data!)
                   print(comments)
                   
                   DispatchQueue.main.async {
                       completion(comments)
                   }
               }
               .resume()
        
    }
    
    func fetchDetailClass(id: String,completion:@escaping (CategoryPopularResponse) -> ()) {
        guard let url = URL(string: "\(apiCourse)/api/v1/course/\(id)") else { return }
               
               URLSession.shared.dataTask(with: url) { (data, _, _) in
                   let comments = try! JSONDecoder().decode(CategoryPopularResponse.self, from: data!)
                   print(comments)
                   
                   DispatchQueue.main.async {
                       completion(comments)
                   }
               }
               .resume()
        
    }
    
    func fetchNewestClass(id: String,completion:@escaping (CategoryPopularResponse) -> ()) {
        guard let url = URL(string: "\(apiCourse)/api/v1/homepage/course_latest_id") else { return }
               
               URLSession.shared.dataTask(with: url) { (data, _, _) in
                   let comments = try! JSONDecoder().decode(CategoryPopularResponse.self, from: data!)
                   print(comments)
                   
                   DispatchQueue.main.async {
                       completion(comments)
                   }
               }
               .resume()
        
    }
    
    func fetchCategoriesId(id: String,completion:@escaping (CategoryPopularResponse) -> ()) {
        guard let url = URL(string: "\(apiCourse)/api/v1/course/category/\(id)/coursesids") else { return }
               
               URLSession.shared.dataTask(with: url) { (data, _, _) in
                   let comments = try! JSONDecoder().decode(CategoryPopularResponse.self, from: data!)
                   print(comments)
                   
                   DispatchQueue.main.async {
                       completion(comments)
                   }
               }
               .resume()
        
    }
    
    func fetchBisnis(completion:@escaping (CategoryPopularResponse) -> ()) {
        
    }
    func fetchPengembangan(completion:@escaping (CategoryPopularResponse) -> ()) {
        
    }
//  \(apiCourse)/api/v1/homepage/course_onsales_id

    func fetchTrending(completion:@escaping (CategoryPopularResponse) -> ()) {
//        \(apiCourse)/api/v1/homepage/course_best_sellers_id
        
    }
    
    
    
}



