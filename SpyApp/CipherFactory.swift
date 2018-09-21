import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "A/N Ceasar": AlphanumericCesarCipher(),
        "Rail Fence": RailFenceCipher(),
        "Vigenere": VigenereCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
