//
//  SaveTripViewModel.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/26/24.
//

import Foundation
import Contacts
class SaveTripViewModel {
    
    var contacts = [CNContact]()
    
    func fetchAllContacts() {
        // Request authorization to access contacts
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            guard granted else {
                print("Access to contacts denied.")
                return
            }

            // Specify the keys to fetch
            let keysToFetch = [
                CNContactGivenNameKey,
                CNContactFamilyNameKey,
                CNContactEmailAddressesKey,
                CNContactPhoneNumbersKey,
                CNContactThumbnailImageDataKey
            ]

            // Fetch request
            let request = CNContactFetchRequest(keysToFetch: keysToFetch as [CNKeyDescriptor])
        
            do {
                
                try store.enumerateContacts(with: request) { (contact, stop) in
                    // Process each contact
                    self.contacts.append(contact)
                    print("Name: \(contact.givenName) \(contact.familyName)")

                    // Email addresses
                    for email in contact.emailAddresses {
                        print("Email: \(email.value)")
                    }

                    // Phone numbers
                    for phoneNumber in contact.phoneNumbers {
                        print("Phone: \(phoneNumber.value.stringValue)")
                    }

                    print("-----")
                }
                
                
            } catch {
                print("Error fetching contacts: \(error)")
                
            }
        }
    }
    func addTrip() {
        
    }
    
}
