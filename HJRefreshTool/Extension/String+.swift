//
//  String+SVGKImage.swift
//  JavaShop
//
//  Created by LDD on 2018/6/4.
//  Copyright © 2018年 LDD. All rights reserved.
//  @Note String扩展方法 转换SVG
//

import UIKit
//import SVGKit
//import EFQRCode
import CommonCrypto
import RxSwift

extension String {
    
    
    /// 转换svg图片
    ///
    /// - Returns: SVGImage
//    public func toImage() ->UIImage {
//        var image :UIImage?
//        image =  UIImage.init(named: self)
//        if image == nil {
//           image = SVGKImage.init(named: self).uiImage
//        }
//        return image!
//    }
    
    /// 转换NotificationName
    ///
    /// - Returns: NotificationName
    public func toNotificationName() ->Notification.Name{
        return Notification.Name(self)
    }
    
    
    /// 转换为颜色
    ///
    /// - Returns: 颜色
    public func toColor() ->UIColor{
        return UIColor.withHex(hexString: self)
    }
    
    
    /// 完善类全名
    ///
    /// - Returns: 全名
//    public func fitClassname() ->String {
//        return "\(Bundle.main.namespance).\(self)"
//    }
    
    /// 构建Class
    ///
    /// - Returns: type
    public func buildClass() -> AnyClass?{
        return NSClassFromString(self)
    }
   
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize(count:digestLen)
        return String(format: hash as String)
    }
    
//    func qrCode() -> UIImage{
//        return UIImage.init(cgImage: EFQRCode.generate(content: self)!)
//    }
    
//    func rxQrCode() -> Observable<UIImage>{
//        return Observable<UIImage>.create({ obser -> Disposable in
//            obser.onNext(UIImage.init(cgImage: EFQRCode.generate(content: self)!))
//            return Disposables.create()
//        }).backgroundMain()
//    }
    
}
