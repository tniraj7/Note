import Foundation
import LocalAuthentication

class BiometricAuthenticationManager {
    
    internal var authenticationContext = LAContext()
    private let localizedReasonString = "This app uses Face ID / Touch ID to secure your notes."
    
    func isBiometricAuthenticationPossible(policy: LAPolicy) -> Bool {
        return authenticationContext.canEvaluatePolicy(policy, error: nil)
    }
    
    @MainActor func authenticateBiometrics(policy: LAPolicy) async -> Bool {
        guard isBiometricAuthenticationPossible(policy: policy) else {
            return false
        }
        
        do {
            let result = try await authenticationContext.evaluatePolicy(
                policy,
                localizedReason: localizedReasonString)
            if result {
                return true
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
}
