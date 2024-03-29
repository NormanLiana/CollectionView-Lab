//
//  CountryModel.swift
//  Collection-View-Lab
//
//  Created by Liana Norman on 9/28/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String?
    let capital: String?
    let population: Int?
    let alpha2Code: String?
}

//[
//    {
//        "name": "United States Minor Outlying Islands",
//        "topLevelDomain": [
//        ".us"
//        ],
//        "alpha2Code": "UM",
//        "alpha3Code": "UMI",
//        "callingCodes": [
//        ""
//        ],
//        "capital": "",
//        "altSpellings": [
//        "UM"
//        ],
//        "region": "Americas",
//        "subregion": "Northern America",
//        "population": 300,
//        "latlng": [],
//        "demonym": "American",
//        "area": null,
//        "gini": null,
//        "timezones": [
//        "UTC-11:00",
//        "UTC-10:00",
//        "UTC+12:00"
//        ],
//        "borders": [],
//        "nativeName": "United States Minor Outlying Islands",
//        "numericCode": "581",
//        "currencies": [
//        {
//        "code": "USD",
//        "name": "United States Dollar",
//        "symbol": "$"
//        }
//        ],
//        "languages": [
//        {
//        "iso639_1": "en",
//        "iso639_2": "eng",
//        "name": "English",
//        "nativeName": "English"
//        }
//        ],
//        "translations": {
//            "de": "Kleinere Inselbesitzungen der Vereinigten Staaten",
//            "es": "Islas Ultramarinas Menores de Estados Unidos",
//            "fr": "Îles mineures éloignées des États-Unis",
//            "ja": "合衆国領有小離島",
//            "it": "Isole minori esterne degli Stati Uniti d'America",
//            "br": "Ilhas Menores Distantes dos Estados Unidos",
//            "pt": "Ilhas Menores Distantes dos Estados Unidos",
//            "nl": "Kleine afgelegen eilanden van de Verenigde Staten",
//            "hr": "Mali udaljeni otoci SAD-a",
//            "fa": "جزایر کوچک حاشیه‌ای ایالات متحده آمریکا"
//        },
//        "flag": "https://restcountries.eu/data/umi.svg",
//        "regionalBlocs": [],
//        "cioc": ""
//    },
//
