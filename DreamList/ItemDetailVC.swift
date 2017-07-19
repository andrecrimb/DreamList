//
//  ItemDetailVC.swift
//  DreamList
//
//  Created by Andre Rosa on 18/07/17.
//  Copyright © 2017 Andre Rosa. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var detailField: UITextView!
    @IBOutlet weak var priceField: UITextField!
    
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let backBtn = self.navigationController?.navigationBar.topItem {
            backBtn.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.dataSource = self
        storePicker.delegate = self
        
//        let store = Store(context: context!)
//        store.name = "Best Buy"
//        let store2 = Store(context: context!)
//        store2.name = "Amazon"
//        let store3 = Store(context: context!)
//        store3.name = "AliExpress"
//        let store4 = Store(context: context!)
//        store4.name = "Submarino"
//        let store5 = Store(context: context!)
//        store5.name = "American Store"
//        let store6 = Store(context: context!)
//        store6.name = "Casas Bahia"
//        
//        ad?.saveContext()
        getStores()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
    
    func getStores(){
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do{
            self.stores = try context!.fetch(fetchRequest)
            
            self.storePicker.reloadAllComponents()
        } catch{
            //
        }
    }
    
}
