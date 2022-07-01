//
//  AlbumDataModel.swift
//  03
//
//  Created by 김지민 on 2022/04/23.
//


import Foundation

struct AlbumDataModel {
    let albumImageName: String
    let albumTitle: String
    let albumSinger: String
}

extension AlbumDataModel {
    static let sampleData: [AlbumDataModel] = [
        AlbumDataModel(albumImageName: "album1", albumTitle: "앨범", albumSinger: "가수"),
        AlbumDataModel(albumImageName: "album2", albumTitle: "앨범커버", albumSinger: "가수이름"),
        AlbumDataModel(albumImageName: "album3", albumTitle: "앨범3", albumSinger: "가수3"),
        AlbumDataModel(albumImageName: "album4", albumTitle: "앨범4", albumSinger: "가수4"),
        AlbumDataModel(albumImageName: "album5", albumTitle: "앨범5", albumSinger: "가수이름5"),
        AlbumDataModel(albumImageName: "album6", albumTitle: "앨범커버6", albumSinger: "가수이름")
    ]
}
