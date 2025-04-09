import SwiftUI

struct Account: Codable, Identifiable {
    let id: Int
    let name: String
    let balance: Int
}

class AccountViewModel: ObservableObject {
    @Published var accounts: [Account] = []
    
    func fetchAccounts() {
        guard let url = URL(string: "https") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                if let decodedData = try? JSONDecoder().decode([Account].self, from: data) {
                    DispatchQueue.main.async {
                        self.accounts = decodedData
                    }
                }
            } 
        }.resume() 
    }
} 
