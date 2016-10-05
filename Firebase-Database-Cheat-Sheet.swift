//
//
//  An iOS Cheat Sheet for Firebase Database using Xcode 8, Swift 3, and Firebase as of 2016/10
//
//


/* Initial setup - follow guide here: https://firebase.google.com/docs/database/ios/start */


/* Set up variable as Firebase Database Reference */
var ref: FIRDatabaseReference!
ref = FIRDatabase.database().reference()


/* Saving Data */

//Save data with setValue()
ref.child("people").setValue("HI")
ref.child("people").setValue(nil)


//Save data with childByAutoID()
let key = ref.child("restaurants").childByAutoId().key
let restaurant = ["name": "McDonalds",
                  "website": "www.mcdonalds.com"]

let childUpdates = ["/restaurants/\(key)": restaurant]

ref.updateChildValues(childUpdates)


/* Data Removal */

//Remove data using removeValue()
ref.removeValue()

//Reove non-dictionary data using setValue()
ref.child("people").setValue("HI")
ref.child("people").setValue(nil)

//Remove dictionary data using setValue()
ref.child("restaurants/").setValue(["name": restaurant_Name.text!,
                                    "name2": restaurant_Name.text!])
ref.child("restaurants/name").setValue(nil)


//Remove data using updateChildValues
let updatedRestaurant = ["name": NSNull()]

let secondChildUpdates = ["/restaurants/\(key)": updatedRestaurant]

ref.updateChildValues(secondChildUpdates)


/* Set up completion handler to see if data has been correctly saved to Firebase */

ref.child("people").setValue("HI", withCompletionBlock: { (error, snapshot) in
    
    if error != nil {
        
        print("oops, an error")
        
    } else {
        
        print("completed, value is \(snapshot), and error is \(error)")
        
    }
    
})
