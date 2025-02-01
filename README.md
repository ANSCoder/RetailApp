

# RetailApp

RetailApp is a modern iOS application built using **SwiftUI** and **Swift**. It demonstrates best practices in iOS development, including dependency injection, clean architecture, and the coordinator pattern. The app allows users to browse products, view product details, and add items to their cart.

---

## **Features**
- **Product Listing**: Browse a list of available products.
- **Product Details**: View detailed information about a product.
- **Add to Cart**: Add products to the shopping cart.
- **Dependency Injection**: Uses **Swinject** for dependency management.
- **Coordinator Pattern**: Implements a coordinator pattern for navigation.
- **Unit Testing**: Includes unit tests for critical components.

---

## **Technologies Used**
- **SwiftUI**: For building the user interface.
- **Swinject**: For dependency injection.
- **Coordinator Pattern**: For managing navigation flow.
- **Combine**: For reactive programming (if applicable).
- **XCTest**: For unit testing.

---

## **Getting Started**

### **Prerequisites**
- Xcode 14 or later.
- Swift 5.7 or later.
- macOS Ventura or later (for Xcode compatibility).

---

### **Installation**
1. Clone the repository:
   ```bash
   git clone https://github.com/ANSCoder/RetailApp.git
   ```
2. Open the project in Xcode:
   ```bash
   cd RetailApp
   open RetailApp.xcodeproj
   ```
3. Build and run the project using Xcode.

---

### **Project Structure**
The project is organized into the following directories:

```
RetailApp/
├── Sources/
│   ├── Models/              # Data models (e.g., Product)
│   ├── Views/               # SwiftUI views
│   ├── ViewModels/          # ViewModels for SwiftUI views
│   ├── Services/            # Service layer (e.g., CartService, AnalyticsService)
│   ├── Coordinators/        # Navigation coordinators
│   ├── DIContainer/         # Dependency injection setup
│   └── Utilities/           # Helper classes and extensions
├── Tests/                   # Unit tests
└── RetailApp.xcodeproj      # Xcode project file
```

---

### **Dependency Injection**
The app uses **Swinject** for dependency injection. All dependencies are registered in the `DependencyMap` struct and resolved using the `DIContainer`.

#### **Example: Registering a Dependency**
```swift
container.register(CartService.self) { _ in
    CartManager()
}
```

#### **Example: Resolving a Dependency**
```swift
let cartService = DIContainer.shared.resolve(CartService.self)
```

---

### **Coordinator Pattern**
The app uses a coordinator pattern to manage navigation. Each screen has a corresponding coordinator that handles navigation logic.

#### **Example: ProductDetailCoordinator**
```swift
final class ProductDetailCoordinator: Coordinator {
    private let product: Product
    private let resolver: Resolver

    init(product: Product, resolver: Resolver) {
        self.product = product
        self.resolver = resolver
    }

    func start() -> AnyView {
        let viewModel = resolver.resolve(ProductDetailViewModel.self, argument: product)!
        return AnyView(ProductDetailView(viewModel: viewModel))
    }
}
```

---

### **Unit Testing**
The app includes unit tests for critical components, such as ViewModels and services. Tests are located in the `Tests` directory.

#### **Running Tests**
1. Open the project in Xcode.
2. Select the `RetailAppTests` target.
3. Press `Cmd + U` to run all tests.

---

### **Contributing**
Contributions are welcome! If you'd like to contribute to the project, please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes.
4. Submit a pull request.

---

### **License**
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

### **Acknowledgements**
- [Swinject](https://github.com/Swinject/Swinject) for dependency injection.
- [SwiftUI](https://developer.apple.com/xcode/swiftui/) for building the user interface.
- [GitHub](https://github.com) for hosting the repository.

---

### **Contact**
For questions or feedback, please contact:
- **Anand Nimje**  
  GitHub: [ANSCoder](https://github.com/ANSCoder)  

---

This `README.md` provides a comprehensive overview of your project and makes it easy for others to understand, set up, and contribute to the repository. Let me know if you'd like to add or modify anything! 😊
