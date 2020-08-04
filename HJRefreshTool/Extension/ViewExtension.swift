//
//  ViewExtension.swift
//  Ios组件化Demo
//
//  Created by LDD on 2017/9/19.
//  Copyright © 2017年 LDD. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit
import RxSwift
import RxCocoa

extension UIImageView{
   
    public func centerCrop(){
        self.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    public func setImage(url :String){
        self.kf.setImage(with: URL.init(string: url))
    }
    
//    public func setImageWithAnthor(url :String,placeImageName :String? = HOLDER_IMAGE,imageTransition :KingfisherOptionsInfo? = [.transition(ImageTransition.fade(1))] , downListener : ((Int) -> ())? = nil){
//        self.kf.setImage(with: URL.init(string: url), placeholder: UIImage.init(named: placeImageName!), options: imageTransition, progressBlock: { (downSize, totalSize) in
//            if(downListener != nil){
//                downListener!(Int(Float(downSize)/Float(totalSize)*100))
//            }
//        }, completionHandler: { image, error, cacheType, imageURL in
//            if error != nil {
//                self.image = UIImage.init(named: ERROR_IMAGE)
//            }
//        })
//    }
}

extension UIButton {
    
    public func setFontSize(size :CGFloat){
        titleLabel?.font = UIFont.systemFont(ofSize: size)
    }
    
    public func setImage(url :String,state :UIControl.State){
        self.kf.setImage(with: URL.init(string: url),for: state)
    }
    
    public func setImage(name :String, state :UIControl.State){
        self.setImage(UIImage.init(named: name), for: state)
    }
    
    public func setTouchDownBackGround(name :String){
        setImage(name: name, state: UIControl.State.highlighted)
    }
    
    public func setTouchDownBackGround(url :String){
        setImage(url: url, state: UIControl.State.highlighted)
    }
    
    public func setNomalBackGround(name :String){
        setImage(name: name, state: UIControl.State.normal)
    }
    
    public func setNomalBackGround(url :String){
        setImage(url: url, state: UIControl.State.normal)
    }
    
    public func setSelectBackGround(name :String){
        setImage(name: name, state: UIControl.State.selected)
    }
    
    public func setSelectBackGround(url :String){
        setImage(url: url, state: UIControl.State.selected)
    }
    
    public func setNomalTitle(title :String){
        self.setTitle(title, for: UIControl.State.normal)
    }
    
    public func setNomalTitleColor(hexColor :String){
        self.setTitleColor(UIColor.withHex(hexString: hexColor), for: UIControl.State.normal)
    }
    
    public func setNomalTitleColor(color :UIColor){
        self.setTitleColor(color, for: UIControl.State.normal)
    }
    
    public func setTouchDownTitle(title :String){
        self.setTitle(title, for: UIControl.State.highlighted)
    }
    
    public func setTouchDownTitleColor(color :UIColor){
        self.setTitleColor(color, for: UIControl.State.highlighted)
    }
    
    public func setTouchDownTitleColor(hexColor :String){
         self.setTitleColor(UIColor.withHex(hexString: hexColor), for: UIControl.State.highlighted)
    }
    
    public func setSelectTitle(title :String){
        self.setTitle(title, for: UIControl.State.selected)
    }
    
    public func setSelectTitleColor(color :UIColor){
        self.setTitleColor(color, for: UIControl.State.selected)
    }
    
    public func setSelectTitleColor(hexColor :String){
        self.setTitleColor(UIColor.withHex(hexString: hexColor), for: UIControl.State.selected)
    }
}

extension UILabel {
    
    public func setText(text : String){
        self.text = text
    }
    
    public func setTextColor(color : UIColor){
        self.textColor = color
    }
    
    public func setTextColor(colorHex : String){
        self.textColor = UIColor.withHex(hexString: colorHex)
    }
    
    convenience public init(text :String , textColor : UIColor, textSize :CGFloat) {
        self.init()
        setText(text: text, textColor: textColor, textSize: textSize)
    }
    
    convenience public init(text :String , textColorStr : String, textSize :CGFloat) {
        self.init()
        setText(text: text, textColorStr: textColorStr, textSize: textSize)
    }
    
    convenience public init(text :String , textSize :CGFloat) {
        self.init()
        self.text = text
        self.font = UIFont.systemFont(ofSize: textSize)
    }
    
    convenience public init(text :String) {
        self.init()
        self.text = text
    }
    
    public func setFontSize(size :CGFloat){
        font = UIFont.systemFont(ofSize: size)
    }
    
    public func setText(text :String , textColor : UIColor, textSize :CGFloat){
        self.text = text
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: textSize)
    }
    
    public func setText(text :String , textColorStr : String, textSize :CGFloat){
        self.text = text
        self.textColor = UIColor.withHex(hexString: textColorStr)
        self.font = UIFont.systemFont(ofSize: textSize)
    }
    
    public func setTextAlignment(alignment : NSTextAlignment){
        textAlignment = alignment
    }
    
}

extension UITextField{
    public func setText(text : String){
        self.text = text
    }
    
//    /// 设置字符串最大长度
//    ///
//    /// - Parameter count: 最大长度
//    func setMaxLength(count: Int , error : JavaShopVoidMethod? = nil , isAppendEllipsis : Bool = false) -> Self {
//        rx.text.filterNil().bind {[unowned self] text in
//            if text.length > count {
//                error?()
//                self.setText(text: isAppendEllipsis.judge(trueValue: "\(String(text.prefix(count)))..." , falseValue: String(text.prefix(count))))
//            }
//        }.disposed(by: rx.disposeBag)
//        return self
//    }
    
    public func  setRound(){
        borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    public func setPlaceholder(placeholder :String){
        self.placeholder = placeholder
    }
    
    public func setFontSize(size :CGFloat){
        font = UIFont.systemFont(ofSize: size)
    }
    
    public func setBackImage(imageName :String){
        borderStyle = .none //先要去除边框样式
        background = UIImage(named : imageName);
    }
    
    public func getTextObservable() -> Observable<String?>{
        return rx.text.asObservable()
    }
    
    public func showClearBtn(){
        clearButtonMode = .whileEditing
    }
    
    public func setReturnKeyType(type :UIReturnKeyType){
        self.returnKeyType = type
    }
    
    public func autoFontSzie(fontMinSize :CGFloat){
        adjustsFontSizeToFitWidth=true  //当文字超出文本框宽度时，自动调整文字大小
        minimumFontSize = fontMinSize    //最小可缩小的字号
    }
    
    public func setTextAlignment(alignment : NSTextAlignment){
        textAlignment = alignment
    }
    
    public func setContentVerticalAlignment(alignment : UIControl.ContentVerticalAlignment){
        contentVerticalAlignment = alignment
    }

    public func setTextColor(color : UIColor){
        self.textColor = color
    }
    
    public func setTextColor(colorHex : String){
        self.textColor = UIColor.withHex(hexString: colorHex)
    }
}

extension UITextView{
    public func setText(text : String){
        self.text = text
    }
    
    convenience public init(text :String , textColor : UIColor, textSize :CGFloat) {
        self.init()
        setText(text: text, textColor: textColor, textSize: textSize)
    }
    
    convenience public init(text :String , textColorStr : String, textSize :CGFloat) {
        self.init()
        setText(text: text, textColorStr: textColorStr, textSize: textSize)
    }
    
    public func openScroll(){
        isScrollEnabled = true
    }
    
    public func setText(text :String , textColor : UIColor, textSize :CGFloat){
        self.text = text
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: textSize)
    }
    
    public func setText(text :String , textColorStr : String, textSize :CGFloat){
        self.text = text
        self.textColor = UIColor.withHex(hexString: textColorStr)
        self.font = UIFont.systemFont(ofSize: textSize)
    }
    
    public func setFontSize(size :CGFloat){
        font = UIFont.systemFont(ofSize: size)
    }
    
    public func setTextColor(color : UIColor){
        self.textColor = color
    }
    
    public func setTextColor(colorHex : String){
        self.textColor = UIColor.withHex(hexString: colorHex)
    }
}

extension UIView{
    
    public func lineStyle(color: UIColor) -> UIView{
        setBackGroundColor(color: color)
        return self
    }
    
    public func setTag(tag :Int){
        self.tag = tag
    }
    
    /// 设置背景色
    ///
    /// - Parameter color: UIColor
    public func setBackGroundColor(color : UIColor){
        backgroundColor = color
    }
    
    /// 清除背景颜色
    public func clearBackgroundColor(){
        setBackGroundColor(color: .clear)
    }
    
    /// 设置背景色
    ///
    /// - Parameter colorHex: 颜色Hex字符串
    public func setBackGroundColor(colorHex : String){
        backgroundColor = UIColor.withHex(hexString: colorHex)
    }
    
    
    /// 设置点击事件
    ///
    /// - Parameters:
    ///   - target: 事件所在对象
    ///   - action: 事件Selector
    public func setOnClickListener(target: Any?, action: Selector?){
        isUserInteractionEnabled = true
        let clickEvent = UITapGestureRecognizer.init(target: target, action: action)
        clickEvent.numberOfTapsRequired = 1
        addGestureRecognizer(clickEvent)
    }
    
    
    /// 添加长按事件
    ///
    /// - Parameters:
    ///   - target: 事件所在对象
    ///   - action: 事件Selector
    public func setOnLongClickListener(target: Any?, action: Selector?){
         isUserInteractionEnabled = true
         let longClickEvent = UILongPressGestureRecognizer.init(target: target, action: action)
         longClickEvent.minimumPressDuration = 1.5
         longClickEvent.numberOfTapsRequired = 1
         addGestureRecognizer(longClickEvent)
    }
    
    
    /// 设置全部圆角
    ///
    /// - Parameter rSize: 圆角大小
    public func setRaduis(rSize:CGFloat){
        layer.cornerRadius = rSize
        layer.masksToBounds = true;
    }
    
    
    /// 设置部分圆角
    ///
    /// - Parameters:
    ///   - rSize: 圆角大小
    ///   - corners: 需要设置圆角的部位
    public func setRadius(rSize:CGFloat,corners : UIRectCorner){
        
        /// 运用贝塞尔曲线 绘制圆角
        let maskPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize.init(width: rSize, height: rSize))
        
        /// 使用CaShapeLayer将渲染提交到GPU
        
        let maskLayer = CAShapeLayer.init()
        
            ///设置frame 使用view本身的frame
            maskLayer.frame = bounds
        
            ///将第一步绘制的path设置到layer
            maskLayer.path = maskPath.cgPath
        
            ///设置到layer 绘制
            layer.mask = maskLayer;
    }
    
    /// 隐藏
    public func hide(){
        isHidden = true;
    }
    
    /// 显示
    public func visable(){
        isHidden = false;
    }
    
    /// 隐藏子视图
    public func childHide(){
        childHide(view: self,visable: false)
    }
    
    /// 显示子视图
    public func childVisable(){
        childHide(view: self,visable: true)
    }
    
    /// 添加边线
    ///
    /// - Parameters:
    ///   - top: 顶部还是底部
    ///   - color: 颜色
    ///   - lineWidth: 宽度
    public func addLine(top :Bool = true,color : UIColor = "#E4E6E5".toColor(),lineWidth :CGFloat = 1){
        let line = UIView.init().then { (view) in
            view.backgroundColor = color
//            view.tg_noLayout = true
//            view.tg_useFrame = true
        }
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            if(top){
                make.top.equalToSuperview()
            }else{
                make.bottom.equalToSuperview()
            }
            make.height.equalTo(lineWidth)
        }
        self.bringSubviewToFront(line)
    }
    
    /// 隐藏或者显示子类
    ///
    /// - Parameters:
    ///   - view: 父视图
    ///   - visable:显示还是隐藏
    private func childHide(view :UIView,visable :Bool){
        let childViews = view.subviews;
        if (childViews.count > 0) {
            childViews.forEach({ (item) in
                if visable {
                    item.visable()
                }
                else {
                    item.hide()
                }
                childHide(view: item,visable: visable)
            })
        }
    }

    // Runtime动态扩展属性
    var opt : String? {
        set {
            objc_setAssociatedObject(self, RunTimeParamKeys.RUNTIME_VIEW_OPT_KEY, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeParamKeys.RUNTIME_VIEW_OPT_KEY) as? String
        }
    }
    
}

/// 使用RunTime临时添加参数的索引
class RunTimeParamKeys {
    
    /// UIView扩展参数
    public static let RUNTIME_VIEW_OPT_KEY = UnsafeRawPointer.init(bitPattern: "RUNTIME_VIEW_OPT_KEY".hashValue)!
    
}

