//
//  ViewController.swift
//  classical_reading
//
//  Created by 남기범 on 18/03/2019.
//  Copyright © 2019 남기범. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //refresh 변수 설정 및 TableView 아울렛 변수 설정
    var refreshControl = UIRefreshControl()
    @IBOutlet weak var mainTableView: UITableView!
    /////////////////////////
    var reserveTime = "20:19"
    var reservedDate = "2019-05-09"
    var reservedBookName = "총,균,쇠"
    var dataLive = "1"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //여러가지 셀을 사용하는 방법
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainUser")!
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "totalbook")!
            return cell
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "totalbook2")!
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reserveDisplay")!
            let timeLabel = cell.viewWithTag(105) as! UILabel
            let reservedDateLabel = cell.viewWithTag(106) as! UILabel
            let reservedBookNameLabel = cell.viewWithTag(107) as! UILabel
            let stateLabel = cell.viewWithTag(108) as! UILabel
            let ImageNext = cell.viewWithTag(109) as! UIImageView
            let NotDataLabel = cell.viewWithTag(110) as! UILabel
            
            //dataLive가 1일 때만 데이터 로드
            if dataLive == "1"{
                timeLabel.text = reserveTime + "부터 20분동안"
                reservedDateLabel.text = reservedDate
                reservedBookNameLabel.text = "도서명: "+reservedBookName
                NotDataLabel.isHidden = true
                timeLabel.isHidden = false
                reservedDateLabel.isHidden = false
                reservedBookNameLabel.isHidden = false
                stateLabel.isHidden = false
                ImageNext.isHidden = false
                return cell
            }
            else{//0일 경우 데이터 로드 안함
                timeLabel.isHidden = true
                reservedDateLabel.isHidden = true
                reservedBookNameLabel.isHidden = true
                stateLabel.isHidden = true
                ImageNext.isHidden = true
                NotDataLabel.isHidden = false
                return cell
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 122
        }
        else if indexPath.row == 1 {
            return 195
        }
        else if indexPath.row == 2 {
            return 235
        }
        else{
            return 76
        }//셀 마다 높이 다르게
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            
            //dataLive가 1일 때만 선택헤서 화면전환 가능
            if dataLive == "1"{
                if let avc = self.storyboard?.instantiateViewController(withIdentifier: "reserved") as? NotiController{
                    avc.dayString = reservedDate
                    avc.timeString = reserveTime
                    avc.bookName = reservedBookName
                    self.present(avc, animated: true, completion: nil)
                }
            }
            else{
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // refresh 초기 설정
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(reloadTable), for: UIControl.Event.valueChanged)
        self.mainTableView?.addSubview(refreshControl)
        
        //UIView에 클릭 이벤트를 삽입하는 과정
//        let gesture = UITapGestureRecognizer(target: self, action:#selector(self.goPageReserved(_:)))
//        self.reservedView.addGestureRecognizer(gesture)
    }
    
//    //UIView를 클릭시에 다른 뷰컨트롤러로 화면 전환하기 위한 함수
//    @objc func goPageReserved(_ sender:UITapGestureRecognizer)
//    {
//        //화면 전환
//        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "reserved")
//        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//        self.present(uvc, animated: true, completion: nil)
//    }

    
    ////////밑으로 제스쳐 취했을 때 데이터 리로드 하는 함수
    @objc func reloadTable(){
        mainTableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    //////////////////////////
}

