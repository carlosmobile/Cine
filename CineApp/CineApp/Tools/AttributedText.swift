
import SwiftUI

/**
 AttributedText is a view for displaying some HTML-tagged text using SwiftUI Text View.
 
 - warning: **Only single-word tags are supported**. Tags with more than one word or
 containing any characters besides **letters** or **numbers** are ignored and not removed.
 
 # Example
 ```
 AttributedText("This is <b>bold</b> and <i>italic</i> text.")
     .foregroundColor(.blue)
     .font(.title)
     .padding()
 ```
 */
public struct AttributedText: View {
    /// Set of supported tags and associated modifiers. This is used by default for all AttributedText
    /// instances except those for which this parameter is defined in the initializer.
    public static var tags: Dictionary<String, (Text) -> (Text)> = [:]
        // This modifier set is presented just for reference.
        // Set the necessary attributes and modifiers for your needs before use.
//        "h1": { $0.font(.largeTitle) },
//        "h2": { $0.font(.title) },
//        "h3": { $0.font(.headline) },
//        "h4": { $0.font(.subheadline) },
//        "h5": { $0.font(.callout) },
//        "h6": { $0.font(.caption) },
//
//        "i": { $0.italic() },
//        "u": { $0.underline() },
//        "s": { $0.strikethrough() },
//        "strong": { $0.fontWeight(.bold) },
//        "b": { $0.fontWeight(.bold) },
//
//        "sup": { $0.baselineOffset(10).font(.footnote) },
//        "sub": { $0.baselineOffset(-10).font(.footnote) }
//    ]
    /// Parser formatted text.
    private let text: Text

    /**
     Creates a text view that displays formatted content.
     
     - parameter htmlString: HTML-tagged string.
     - parameter tags: Set of supported tags and associated modifiers for a particular instance.
     */
    public init(_ htmlString: String, tags: Dictionary<String, (Text) -> (Text)>? = nil) {
        let parser = HTML2TextParser(htmlString, availableTags: tags == nil ? AttributedText.tags : tags!)
        parser.parse()
        text = parser.formattedText
    }

    public var body: some View {
        text
    }
}

#if !TESTING
struct AttributedText_Previews: PreviewProvider {
    static var previews: some View {
        AttributedText("This is <b>bold</b> and <i>italic</i> text. <BR/> other line")
            .foregroundColor(.blue)
            .font(.title)
            .padding()
    }
}
#endif

/**
 Parser for converting HTML-tagged text to SwiftUI Text View.
 */
internal class HTML2TextParser {
    /// The result of the parser's work.
    internal private(set) var formattedText = Text("")
    /// HTML-tagged text.
    private let htmlString: String
    /// Set of currently active tags.
    private var tags: Set<String> = []
    /// Set of supported tags and associated modifiers.
    private let availableTags: Dictionary<String, (Text) -> (Text)>

    /**
     Creates a new parser instance.
     
     - parameter htmlString: HTML-tagged string.
     - parameter availableTags: Set of supported tags and associated modifiers.
     */
    
    internal init(_ htmlString: String, availableTags: Dictionary<String, (Text) -> (Text)>) {
        var tempHtmlString = htmlString
        tempHtmlString = tempHtmlString
            .replacingOccurrences(of: "&nbsp;", with: " ")
            .replacingOccurrences(of: "&apos;", with: "'")
            .replacingOccurrences(of: "&lt;", with: "<")
            .replacingOccurrences(of: "&gt;", with: ">")
            .replacingOccurrences(of: "&amp;", with: "&")
            .replacingOccurrences(of: "&lt;", with: "<")
            .replacingOccurrences(of: "&ntilde;", with: "ñ")
            .replacingOccurrences(of: "&Ntilde;", with: "Ñ")
            .replacingOccurrences(of: "&aacute;", with: "á")
            .replacingOccurrences(of: "&eacute;", with: "é")
            .replacingOccurrences(of: "&iacute;", with: "í")
            .replacingOccurrences(of: "&oacute;", with: "ó")
            .replacingOccurrences(of: "&uacute;", with: "ú")
            .replacingOccurrences(of: "&Aacute;", with: "Á")
            .replacingOccurrences(of: "&Eacute;", with: "É")
            .replacingOccurrences(of: "&Iacute;", with: "Í")
            .replacingOccurrences(of: "&Oacute;", with: "Ó")
            .replacingOccurrences(of: "&Uacute;", with: "Ú")
            .replacingOccurrences(of: "&iexcl;", with: "¡")
            .replacingOccurrences(of: "&cent;", with: "¢")
            .replacingOccurrences(of: "&pound;", with: "£")
            .replacingOccurrences(of: "&curren;", with: "¤")
            .replacingOccurrences(of: "&yen;", with: "¥")
            .replacingOccurrences(of: "&brvbar;", with: "¦")
            .replacingOccurrences(of: "&sect;", with: "§")
            .replacingOccurrences(of: "&uml;", with: "¨")
            .replacingOccurrences(of: "&copy;", with: "©")
            .replacingOccurrences(of: "&ordf;", with: "ª")
            .replacingOccurrences(of: "&laquo;", with: "«")
            .replacingOccurrences(of: "&not;", with: "¬")
            .replacingOccurrences(of: "&shy;", with: " ")
            .replacingOccurrences(of: "&reg;", with: "®")
            .replacingOccurrences(of: "&macr;", with: "¯")
            .replacingOccurrences(of: "&deg;", with: "°")
            .replacingOccurrences(of: "&plusmn;", with: "±")
            .replacingOccurrences(of: "&sup2; ", with: "²")
            .replacingOccurrences(of: "&sup3;", with: "³")
            .replacingOccurrences(of: "&acute;", with: "´")
            .replacingOccurrences(of: "&micro;", with: "µ")
            .replacingOccurrences(of: "&para;", with: "¶")
            .replacingOccurrences(of: "&middot;", with: "·")
            .replacingOccurrences(of: "&cedil;", with: "¸")
            .replacingOccurrences(of: "&sup1;", with: "¹")
            .replacingOccurrences(of: "&ordm;", with: "º")
            .replacingOccurrences(of: "&raquo;", with: "»")
            .replacingOccurrences(of: "&frac14;", with: "¼")
            .replacingOccurrences(of: "&frac12;", with: "½")
            .replacingOccurrences(of: "&frac34;", with: "¾")
            .replacingOccurrences(of: "&iquest;", with: "¿")
            .replacingOccurrences(of: "&Acirc;", with: "Â")
            .replacingOccurrences(of: "&Atilde;", with: "Ã")
            .replacingOccurrences(of: "&Auml;", with: "Ä")
            .replacingOccurrences(of: "&Aring; ", with: "Å")
            .replacingOccurrences(of: "&AElig;", with: "Æ")
            .replacingOccurrences(of: "&Ccedil;", with: "Ç")
            .replacingOccurrences(of: "&Ecirc;", with: "Ê")
            .replacingOccurrences(of: "&Euml;", with: "Ë")
            .replacingOccurrences(of: "&Icirc;", with: "Î")
            .replacingOccurrences(of: "&Iuml;", with: "Ï")
            .replacingOccurrences(of: "&ETH;", with: "Ð")
            .replacingOccurrences(of: "&Ocirc;", with: "Ô")
            .replacingOccurrences(of: "&Otilde;", with: "Õ")
            .replacingOccurrences(of: "&Ouml;", with: "Ö")
            .replacingOccurrences(of: "&times;", with: "×")
            .replacingOccurrences(of: "&Oslash;", with: "Ø")
            .replacingOccurrences(of: "&Ucirc;", with: "Û")
            .replacingOccurrences(of: "&Uuml;", with: "Ü")
            .replacingOccurrences(of: "&Yacute;", with: "Ý")
            .replacingOccurrences(of: "&THORN;", with: "Þ")
            .replacingOccurrences(of: "&szlig;", with: "ß")
            .replacingOccurrences(of: "&acirc;", with: "â")
            .replacingOccurrences(of: "&atilde;", with: "ã")
            .replacingOccurrences(of: "&auml;", with: "ä")
            .replacingOccurrences(of: "&aring;", with: "å")
            .replacingOccurrences(of: "&aelig;", with: "æ")
            .replacingOccurrences(of: "&ccedil;", with: "ç")
            .replacingOccurrences(of: "&ecirc;", with: "ê")
            .replacingOccurrences(of: "&euml;", with: "ë")
            .replacingOccurrences(of: "&icirc;", with: "î")
            .replacingOccurrences(of: "&iuml;", with: "ï")
            .replacingOccurrences(of: "&eth;", with: "ð")
            .replacingOccurrences(of: "&ocirc;", with: "ô")
            .replacingOccurrences(of: "&otilde;", with: "õ")
            .replacingOccurrences(of: "&ouml;", with: "ö")
            .replacingOccurrences(of: "&divide;", with: "÷")
            .replacingOccurrences(of: "&oslash;", with: "ø")
            .replacingOccurrences(of: "&ucirc;", with: "Ú")
            .replacingOccurrences(of: "&uuml;", with: "ü")
            .replacingOccurrences(of: "&yacute;", with: "ý")
            .replacingOccurrences(of: "&thorn;", with: "þ")
            .replacingOccurrences(of: "&yuml;", with: "ÿ")
            .replacingOccurrences(of: "&euro;", with: "€")
            .replacingOccurrences(of: "&agrave;", with: "à")
            .replacingOccurrences(of: "&egrave;", with: "è")
            .replacingOccurrences(of: "&igrave;", with: "ì")
            .replacingOccurrences(of: "&ograve;", with: "ò")
            .replacingOccurrences(of: "&ugrave;", with: "ù")
            .replacingOccurrences(of: "&Agrave;", with: "À")
            .replacingOccurrences(of: "&Egrave;", with: "È")
            .replacingOccurrences(of: "&Igrave;", with: "Ì")
            .replacingOccurrences(of: "&Ograve;", with: "Ò")
            .replacingOccurrences(of: "&Ugrave;", with: "Ù")
            .replacingOccurrences(of: "&quot;", with: "\"")
            .replacingOccurrences(of: "&lsquo;", with: "\'")
            .replacingOccurrences(of: "&rsquo;", with: "\'")
            .replacingOccurrences(of: "&ldquo;", with: "\"")
            .replacingOccurrences(of: "&rdquo;", with: "\"")
            .replacingOccurrences(of: "&quot;", with: "\"")
            .replacingOccurrences(of: "<br />", with: "\n")
            .replacingOccurrences(of: "<BR/>", with: "\n")
            .replacingOccurrences(of: "</p>", with: "\n\n")
        self.htmlString = tempHtmlString
        self.availableTags = availableTags
    }

    /// Starts the text parsing process. The results of this method will be placed in the `formattedText` variable.
    internal func parse() {
        var tag: String? = nil
//        var endTag: Bool = false
        let startIndex = htmlString.startIndex
        var endIndex = htmlString.startIndex

        for index in htmlString.indices {
//            switch htmlString[index] {
//            case "<":
//                tag = String()
//                endIndex = index
//                continue
//
//            case "/":
//                if index != htmlString.startIndex && htmlString[htmlString.index(before: index)] == "<" {
//                    endTag = true
//                } else {
//                    tag = nil
//                }
//                continue
//
//            case ">":
//                if let tag = tag {
//                    addChunkOfText(String(htmlString[startIndex..<endIndex]))
//                    if endTag {
//                        tags.remove(tag.lowercased())
//                        endTag = false
//                    } else {
//                        tags.insert(tag.lowercased())
//                    }
//                    startIndex = htmlString.index(after: index)
//                }
//                tag = nil
//                continue
//
//            default:
//                break
//            }

            if tag != nil {
                if htmlString[index].isLetter || htmlString[index].isHexDigit {
                    tag?.append(htmlString[index])
                } else {
                    tag = nil
                }
            }
        }

        endIndex = htmlString.endIndex
        if startIndex != endIndex {
            addChunkOfText(String(htmlString[startIndex..<endIndex]))
        }
    }

    private func addChunkOfText(_ string: String) {
        guard !string.isEmpty else { return }
        let textChunk = Text(string)

//        for tag in tags {
//            if let action = availableTags[tag] {
//                textChunk = action(textChunk)
//            }
//        }

        formattedText = formattedText + textChunk
    }
}

