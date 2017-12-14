//
//  SkeletonCollectionDataSource.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public typealias ReusableCellIdentifier = String

class SkeletonCollectionDataSource: NSObject {
    
    weak var originalTableViewDataSource: SkeletonTableViewDataSource?
    weak var originalCollectionViewDataSource: UICollectionViewDataSource?
    
    convenience init(tableViewDataSource: SkeletonTableViewDataSource? = nil, collectionViewDataSource: UICollectionViewDataSource? = nil) {
        self.init()
        self.originalTableViewDataSource = tableViewDataSource
        self.originalCollectionViewDataSource = collectionViewDataSource
    }
}

// MARK: - UITableViewDataSource
extension SkeletonCollectionDataSource: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return originalTableViewDataSource?.numSections(in:tableView) ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return originalTableViewDataSource?.collectionSkeletonView(tableView, numberOfRowsInSection:section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = originalTableViewDataSource?.collectionSkeletonView(tableView, cellIdenfierForRowAt: indexPath) ?? ""
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return originalTableViewDataSource?.collectionSkeletonView(tableView, viewForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return originalTableViewDataSource?.collectionSkeletonView(tableView, hightForHeaderInSection: section) ?? 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return originalTableViewDataSource?.collectionSkeletonView(tableView, hightForCellAtIndexPath: indexPath) ?? 0.0
    }
}

// MARK: - UICollectionViewDataSource
extension SkeletonCollectionDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
