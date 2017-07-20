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
    var itemToEdit: Item?
    
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
        
        if itemToEdit != nil{
            self.title = "Edit Dream"
            loadItemData()
        }
        
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
    
    //busca no banco local todas as lojas salvas
    func getStores(){
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do{
            self.stores = try context!.fetch(fetchRequest)
            
            self.storePicker.reloadAllComponents()
        } catch{
            //
        }
    }
    
    @IBAction func savePress(_ sender: UIButton) {
        
        var item: Item!
        
        if itemToEdit == nil{
            item = Item(context: context!)
        } else {
            item = itemToEdit
        }
        
        if let title = titleField.text{
            item.title = title
        }
        
        if let price = priceField.text{
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailField.text{
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)] //pega o valor do picker
        
        ad?.saveContext()
        
        //dismiss usa quando é popouver
        //dismiss(animated: true, completion: nil)
        // esse usa uqnado é navegacao normal
        navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData(){
        if let item = itemToEdit{
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailField.text = item.details
            
            if let store = item.toStore{
                var index = 0
                repeat{
                    let s = stores[index]
                    if s.name == store.name{
                        //seta o valor nno pickerview
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                } while (index < stores.count)
            }
            
        }
    }
    
    
}
