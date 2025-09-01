# SwiftEasyUIKit
A UIKit library for creating a beautiful UI easier.

# Features
- NFView
<img width="2420" height="1668" alt="image" src="https://github.com/user-attachments/assets/249a2223-9412-4623-843b-6aa6f597ef9e" />


# Requirements
- iOS 14.0+
- Xcode 14.0+
- Swift 5.7+

# Installation
This library supports Swift Package Manager.

In Xcode, select File > Add Packages...

Paste your GitHub repository URL into the search bar:

https://github.com/ObaShion/SwiftEasyUIKit
For Dependency Rule, select Up to Next Major Version.

Click Add Package and add the library to your app's target.

# Usage
## NFViewController

### 1. Prepare Your Data and Destination View
Your data models (NFHeroHeaderItem, NFCollectionItem) and a view controller that conforms to NFItemConfigurable are required.

```Swift
// Your destination view controller
import UIKit
import SwiftEasyUIKit // Import the library

class DetailViewController: UIViewController, NFItemConfigurable {
    private var item: NFCollectionItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = item?.title
    }
    
    // This method is required by the NFItemConfigurable protocol
    func configure(with item: NFCollectionItem) {
        self.item = item
    }
}
```
### 2. Initialize and Present NFViewController
In your main view controller (e.g., inside viewDidLoad), create your data arrays and initialize NFViewController, passing in a closure for the tap handler.

```Swift

// MainViewController.swift
import UIKit
import SwiftEasyUIKit // Import the library

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My App"
        setupNFView()
    }
    
    private func setupNFView() {
        // 1. Prepare your data
        let heroItems = [
            NFHeroHeaderItem(title: "Featured Movie 1", image: UIImage(named: "hero-image-1")!),
            NFHeroHeaderItem(title: "Featured Movie 2", image: UIImage(named: "hero-image-2")!)
        ]
        
        let collectionItems = [
            NFCollectionItem(title: "Item 1", description: "Description for item 1", image: UIImage(named: "grid-image-1")!),
            NFCollectionItem(title: "Item 2", description: "Description for item 2", image: UIImage(named: "grid-image-2")!)
        ]
        
        // 2. Define the action to be performed when a grid item is tapped
        let selectAction: (NFCollectionItem) -> Void = { [weak self] selectedItem in
            let detailVC = DetailViewController()
            detailVC.configure(with: selectedItem)
            self?.navigationController?.pushViewController(detailVC, animated: true)
        }

        // 3. Initialize NFViewController with your data and the select action
        let nfVC = NFViewController(
            nfHeroHeaderItem: heroItems,
            nfCollectionItem: collectionItems,
            nfSectionTitle: "Trending Now",
            onSelectItem: selectAction
        )
        
        // 4. Add it as a child view controller
        self.addChild(nfVC)
        self.view.addSubview(nfVC.view)
        nfVC.didMove(toParent: self)
        
        // 5. Set up its layout
        nfVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nfVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            nfVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            nfVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            nfVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
```

# Customization
## Grid Layout
You can customize the grid by changing the numberOfColumns and spacing properties in NFViewController. Remember to make them public to access them from outside the library.

## Carousel Layout
To adjust the appearance of the carousel (e.g., item size, rotation, spacing), you can modify the properties in NFHeroHeaderCollectionViewLayout.swift.

## License
SwiftEasyUIKit is available under the MIT license.
