//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Snips
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import libetpan

struct IMAPNamespaceItem {
    let prefix: String
    let delimiter: String
}

extension IMAPNamespaceItem {
    init?(namespaceInfo: mailimap_namespace_info) {
        guard let prefix = String.fromUTF8CString(namespaceInfo.ns_prefix) else { return nil }
        let delimStr = [ namespaceInfo.ns_delimiter, 0 ]
        guard let delimiter = String.fromUTF8CString(delimStr) else { return nil }
        
        self.init(prefix: prefix, delimiter: delimiter)
    }
}

struct IMAPNamespace {
    let items: [IMAPNamespaceItem]
}
