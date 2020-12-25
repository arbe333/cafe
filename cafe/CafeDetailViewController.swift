//
//  CafeDetailViewController.swift
//  cafe
//
//  Created by arbe on 2020/12/22.
//

// 代辦：url 變官網連結

import UIKit

class CafeDetailViewController: UIViewController {

    let cafe: Cafe
    
    init?(coder: NSCoder, cafe: Cafe) {
        self.cafe = cafe
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> WebViewController? {
        let controller = WebViewController(coder: coder)
        if let url = cafe.url {
            controller?.url = url
        }
        return controller
    }
    
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mrtLabel: UILabel!
    @IBOutlet weak var limitedTimeLabel: UILabel!
    @IBOutlet weak var openTimeLabel: UILabel!
    
    @IBOutlet weak var wifiView: UIView!
    @IBOutlet weak var seatView: UIView!
    @IBOutlet weak var quietView: UIView!
    @IBOutlet weak var tastyView: UIView!
    @IBOutlet weak var cheapView: UIView!
    @IBOutlet weak var musicView: UIView!
    
    @IBAction func urlButton(_ sender: Any) {
    }
    
    func Ranking(levelOf: Float, text: String) -> UIView {
        let aDegree = CGFloat.pi / 180
        let lineWidth: CGFloat = 10
        let radius: CGFloat = 50
        let startDegree: CGFloat = 270
        
        let circlePath = UIBezierPath(ovalIn: CGRect(x: lineWidth, y: lineWidth, width: radius*2, height: radius*2))
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.gray.cgColor
        circleLayer.lineWidth = lineWidth/2
        circleLayer.fillColor = UIColor.clear.cgColor
        
        let percentage = CGFloat(levelOf * 20)
        let percentagePath = UIBezierPath(arcCenter: CGPoint(x: lineWidth + radius, y: lineWidth + radius), radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * (startDegree + 360 * percentage / 100), clockwise: true)
        let percentageLayer = CAShapeLayer()
        percentageLayer.path = percentagePath.cgPath
        percentageLayer.strokeColor  = UIColor(red: 218/256, green: 218/256, blue: 218/256, alpha: 1).cgColor
        percentageLayer.lineWidth = lineWidth
        percentageLayer.fillColor = UIColor.clear.cgColor
        percentageLayer.lineCap = CAShapeLayerLineCap.round // 讓端點是圓滑的

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 2*(radius+lineWidth), height: 2*(radius+lineWidth)))
        label.textAlignment = .center
        label.text = text
        label.font = .systemFont(ofSize: 32)
        
        let rankingView = UIView()
        rankingView.layer.backgroundColor = UIColor.clear.cgColor
        rankingView.layer.addSublayer(circleLayer)
        rankingView.layer.addSublayer(percentageLayer)
        rankingView.addSubview(label)
        
        return rankingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NameLabel.text = cafe.name
        cityLabel.text = cafe.city
        
        if let info = cafe.limited_time,
           info != "" {
            limitedTimeLabel.text = "限時：" + info
        } else {
            limitedTimeLabel.text = ""
        }
        openTimeLabel.text = cafe.open_time!
        mrtLabel.text = cafe.mrt
//        urlLabel.text = "網址: \(String(cafe.url!))"
        
        // 自動換行
        NameLabel.numberOfLines = 0
//        urlLabel.numberOfLines = 0
        
        if let wifi = cafe.wifi,
           let seat = cafe.seat,
           let quiet = cafe.quiet,
           let tasty = cafe.tasty,
           let cheap = cafe.cheap,
           let music = cafe.music {
            wifiView.addSubview(Ranking(levelOf: wifi, text: "wifi"))
            wifiView.layer.backgroundColor = UIColor.clear.cgColor
            
            seatView.addSubview(Ranking(levelOf: seat, text: "seat"))
            seatView.layer.backgroundColor = UIColor.clear.cgColor
            
            quietView.addSubview(Ranking(levelOf: quiet, text: "quiet"))
            quietView.layer.backgroundColor = UIColor.clear.cgColor
            
            tastyView.addSubview(Ranking(levelOf: tasty, text: "tasty"))
            tastyView.layer.backgroundColor = UIColor.clear.cgColor
            
            cheapView.addSubview(Ranking(levelOf: cheap, text: "cheap"))
            cheapView.layer.backgroundColor = UIColor.clear.cgColor
            
            musicView.addSubview(Ranking(levelOf: music, text: "music"))
            musicView.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
}
