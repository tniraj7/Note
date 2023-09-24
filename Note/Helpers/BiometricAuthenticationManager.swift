import Foundation
import LocalAuthentication

class BiometricAuthenticationManager {
    
    internal var authenticationContext = LAContext()
    let localizedReasonString = "This app uses Face ID / Touch ID to secure your notes."
    
    func isBiometricAuthenticationPossible(policy: LAPolicy) -> Bool {
        return authenticationContext.canEvaluatePolicy(policy, error: nil)
    }
    
    @MainActor func authenticateBiometrics(
        policy: LAPolicy,
        completion: @escaping (Bool) -> Void
    ) {
        guard isBiometricAuthenticationPossible(policy: policy) else {
            completion(false)
            return
        }
        
        authenticationContext
            .evaluatePolicy(
                policy,
                localizedReason: localizedReasonString
            ) { (success, evaluateError) in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
