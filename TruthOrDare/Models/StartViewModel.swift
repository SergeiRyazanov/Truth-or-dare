import UIKit

final class StartViewModel {

    private(set) var options: [AgeOption] = [
        AgeOption(emoji: "🙂", age: "12-15 лет"),
        AgeOption(emoji: "😎", age: "15-18 лет"),
        AgeOption(emoji: "🔥", age: "19-24 года"),
        AgeOption(emoji: "😈", age: "25+ лет")
    ]

    private(set) var selectedIndex: IndexPath?

    func numberOfRows() -> Int {
        
        options.count
    }

    func option(at indexPath: IndexPath) -> AgeOption {
        
        options[indexPath.row]
    }

    func select(at indexPath: IndexPath) {
        
        selectedIndex = indexPath
    }

    func selectedAgeText() -> String? {
        
        guard let selectedIndex else { return nil }
        return options[selectedIndex.row].age
    }

    func isSelected(_ indexPath: IndexPath) -> Bool {
        
        selectedIndex == indexPath
    }
}
