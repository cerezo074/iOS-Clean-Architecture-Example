//
//  ListAppsImpl.swift
//  AppStoreExample
//
//  Created by Francisco Valbuena on 1/4/17.
//  Copyright © 2017 Francisco Valbuena. All rights reserved.
//

import Foundation

class ListAppsImpl: UseCaseImpl, ListApps {
    func listAllApps() -> AnyCollection<AppThumbnailDTO> {
        let lazyThumbnails = repository.listAllApps().lazy.map(ListAppsImpl.buildThumbnail)
        return AnyCollection(lazyThumbnails)
    }
    
    func listApps(byCategory category: String) -> AnyCollection<AppThumbnailDTO> {
        let lazyThumbnails = repository.listApps(byCategory: category).lazy.map(ListAppsImpl.buildThumbnail)
        return AnyCollection(lazyThumbnails)
    }
}

private extension ListAppsImpl {
    static func buildThumbnail(app: AppData) -> AppThumbnailDTO {
        return AppThumbnailDTO(appstoreID: app.appstoreID, name: app.shortName, iconURL: app.iconURL)
    }
}
