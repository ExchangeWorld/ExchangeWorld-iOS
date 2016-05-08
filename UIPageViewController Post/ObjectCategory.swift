//
//  ObjectCategory.swift
//  UIPageViewController Post
//
//  Created by 王志尹 on 2016/5/8.
//  Copyright © 2016年 Seven Even. All rights reserved.
//

import UIKit

class ObjectCategory
{
    var title: String
    var url: String
    var image: UIImage
    var section: String
    
    init(title: String, url: String, image: UIImage, section: String)
    {
        self.title = title
        self.url = url
        self.image = image
        self.section = section
    }
    
    convenience init(copies objectcategory: ObjectCategory)
    {
        self.init(title: objectcategory.title, url: objectcategory.url, image: objectcategory.image, section: objectcategory.section)
    }

    
}

