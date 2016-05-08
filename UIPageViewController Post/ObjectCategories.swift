//
//  ObjectCategories.swift
//  UIPageViewController Post
//
//  Created by 王志尹 on 2016/5/8.
//  Copyright © 2016年 Seven Even. All rights reserved.
//

import UIKit

class ObjectCategories
{
    private var objectcategories = [ObjectCategory]()
    private var immutableObjectCategories = [ObjectCategory]()
    private var sections = [String]()
    
    // MARK: - Public
    
    var numberOfPublishers: Int {
        return objectcategories.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    /*
    init()
    {
        objectcategories = createObjectCategories()
        immutableObjectCategories = objectcategories
        sections = ["My Favorites", "Politics", "Travel", "Technology"]
    }
    
    
    func deleteItemsAtIndexPaths(indexPaths: [NSIndexPath])
    {
        var indexes = [Int]()
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        var newObjectCategories = [ObjectCategory]()
        for (index, objectcategory) in objectcategories.enumerate() {
            if !indexes.contains(index) {
                newObjectCategories.append(objectcategory)
            }
        }
        objectcategories = newObjectCategories
    }
    
    func moveObjectCategoryFromIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        if indexPath != newIndexPath {
            let index = absoluteIndexForIndexPath(indexPath)
            let objectcategory = objectcategories[index]
            objectcategory.section = sections[newIndexPath.section]
            let newIndex = absoluteIndexForIndexPath(newIndexPath)
            objectcategories.removeAtIndex(index)
            objectcategories.insert(objectcategory, atIndex: newIndex)
        }
    }
    
    func indexPathForNewRandomObjectCategory() -> NSIndexPath
    {
        let index = Int(arc4random_uniform(UInt32(immutableObjectCategories.count)))
        let objectcategoryToCopy = immutableObjectCategories[index]
        let newObjectCategory = ObjectCategory(copies: objectcategoryToCopy)
        objectcategories.append(newObjectCategory)
        objectcategories.sortInPlace { $0.section < $1.section }
        return indexPathForObjectCategory(newObjectCategory)
    }
    
    
    func indexPathForObjectCategory(objectcategory: ObjectCategory) -> NSIndexPath
    {
        let section = sections.indexOf(objectcategory.section)
        var item = 0
        for (index, currentObjectCategory) in objectcategoriesForSection(section!).enumerate() {
            if currentObjectCategory === objectcategory {
                item = index
                break
            }
        }
        return NSIndexPath(forItem: item, inSection: section!)
    }
    
    func numberOfObjectCategoriesInSection(index: Int) -> Int {
        let objectcategories = objectcategoriesForSection(index)
        return objectcategories.count
    }
    
    func objectcategoryForItemAtIndexPath(indexPath: NSIndexPath) -> ObjectCategory? {
        if indexPath.section > 0 {
            let objectcategories = objectcategoriesForSection(indexPath.section)
            return objectcategories[indexPath.item]
        } else {
            return objectcategories[indexPath.item]
        }
    }
    
    func titleForSectionAtIndexPath(indexPath: NSIndexPath) -> String?
    {
        if indexPath.section < sections.count {
            return sections[indexPath.section]
        }
        return nil
    }
    
    // MARK: - Private
    
    private func createObjectCategories() -> [ObjectCategory]
    {
        var newObjectCategories = [ObjectCategory]()
        newObjectCategories += MyFavorites.objectcategories()
        newObjectCategories += Politics.objectcategories()
        newObjectCategories += Travel.objectcategories()
        newObjectCategories += Technology.objectcategories()
        return newObjectCategories
    }
    
    private func absoluteIndexForIndexPath(indexPath: NSIndexPath) -> Int
    {
        var index = 0
        for i in 0..<indexPath.section {
            index += numberOfObjectCategoriesInSection(i)
        }
        index += indexPath.item
        return index
    }
    
    private func publishersForSection(index: Int) -> [Publisher] {
        let section = sections[index]
        let objectcategoriesInSection = objectcategories.filter {
            (objectcategory: ObjectCategory) -> Bool in return objectcategory.section == section
        }
        return objectcategoriesInSection
    }
}

class MyFavorites
{
    class func objectcategories() -> [ObjectCategory]
    {
        var objectcategories = [ObjectCategory]()
        objectcategories.append(ObjectCategory(title: "TIME", url: "http://time.com", image: UIImage(named: "TIME")!, section: "My Favorites"))
        objectcategories.append(ObjectCategory(title: "The New York Times", url: "http://www.nytimes.com", image: UIImage(named: "The New York Times")!, section: "My Favorites"))
        objectcategories.append(ObjectCategory(title: "TED", url: "https://www.ted.com", image: UIImage(named: "TED")!, section: "My Favorites"))
        objectcategories.append(ObjectCategory(title: "Re/code", url: "http://recode.net", image: UIImage(named: "Recode")!, section: "My Favorites"))
       objectcategories.append(ObjectCategory(title: "WIRED", url: "http://www.wired.com", image: UIImage(named: "WIRED")!, section: "My Favorites"))
        return objectcategories
    }
}

class Politics
{
    class func objectcategories() -> [ObjectCategory]
    {
        var pobjectcategories = [ObjectCategory]()
        objectcategories.append(ObjectCategory(title: "The Atlantic", url: "http://www.theatlantic.com", image: UIImage(named: "The Atlantic")!, section: "Politics"))
        objectcategories.append(ObjectCategory(title: "The Hill", url: "http://thehill.com", image: UIImage(named: "The Hill")!, section: "Politics"))
        objectcategories.append(ObjectCategory(title: "Daily Intelligencer", url: "http://nymag.com/daily/intelligencer/", image: UIImage(named: "Daily Intelligencer")!, section: "Politics"))
        objectcategories.append(ObjectCategory(title: "Vanity Fair", url: "http://recode.net", image: UIImage(named: "Vanity Fair")!, section: "Politics"))
        objectcategories.append(ObjectCategory(title: "TIME", url: "http://time.com", image: UIImage(named: "TIME")!, section: "Politics"))
        objectcategories.append(ObjectCategory(title: "The Huffington Post", url: "http://www.huffingtonpost.com", image: UIImage(named: "The Huffington Post")!, section: "Politics"))
        return objectcategories
    }
}

class Travel
{
    class func publishers() -> [ObjectCategory]
    {
        var objectcategories = [ObjectCategory]()
        objectcategories.append(ObjectCategory(title: "AFAR", url: "http://www.afar.com", image: UIImage(named: "AFAR")!, section: "Travel"))
        objectcategories.append(ObjectCategory(title: "The New York Times", url: "http://www.nytimes.com", image: UIImage(named: "The New York Times")!, section: "Travel"))
        objectcategories.append(ObjectCategory(title: "Men’s Journal", url: "http://www.mensjournal.com", image: UIImage(named: "Men’s Journal")!, section: "Travel"))
        objectcategories.append(ObjectCategory(title: "Smithsonian", url: "http://www.smithsonianmag.com/?no-ist", image: UIImage(named: "Smithsonian")!, section: "Travel"))
        objectcategories.append(ObjectCategory(title: "Wallpaper", url: "http://www.wallpaper.com", image: UIImage(named: "Wallpaper")!, section: "Travel"))
        objectcategories.append(ObjectCategory(title: "Sunset", url: "http://www.sunset.com", image: UIImage(named: "Sunset")!, section: "Travel"))
        return objectcategories
    }
}

class Technology
{
    class func objectcategories() -> [ObjectCategory]
    {
        var objectcategories = [ObjectCategory]()
        objectcategories.append(ObjectCategory(title: "WIRED", url: "http://www.wired.com", image: UIImage(named: "WIRED")!, section: "Technology"))
        objectcategories.append(ObjectCategory(title: "Re/code", url: "http://recode.net", image: UIImage(named: "Recode")!, section: "Technology"))
        objectcategories.append(ObjectCategory(title: "Quartz", url: "http://qz.com", image: UIImage(named: "Quartz")!, section: "Technology"))
        objectcategories.append(ObjectCategory(title: "Daring Fireball", url: "http://daringfireball.net", image: UIImage(named: "Daring Fireball")!, section: "Technology"))
        objectcategories.append(ObjectCategory(title: "MIT Technology Review", url: "http://www.technologyreview.com", image: UIImage(named: "MIT Technology Review")!, section: "Technology"))
        return objectcategories
    }*/
}
