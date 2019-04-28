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
            return cell
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
            if let avc = self.storyboard?.instantiateViewController(withIdentifier: "reserved") as? NotiController{
                self.present(avc, animated: true, completion: nil)
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

