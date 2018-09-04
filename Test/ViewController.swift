//
//  ViewController.swift
//  Test
//
//  Created by Casey Long on 8/31/18.
//  Copyright © 2018 Casey Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // CONSTANTS AND VARIABLES
    
    let WedgeNum = [5, 20, 1, 18, 4, 13, 6, 10, 15, 2, 17, 3, 19, 7, 16, 8, 11, 14, 9, 12, 5, 20]
    var intCenterWedge = 1
    var intTargetWedge = 1
    
    let Shanghai = [2, 2, 2, 9, 9, 9, 11, 11, 11, 4, 4, 4, 20, 20, 20, 6, 6, 6, 13, 13, 13, 15, 15, 15, 18, 18, 18, 7, 7, 7, 16, 16, 16, 19, 19, 19, 5, 5, 5, 17, 17, 17, 8, 8, 8, 14, 14, 14, 10, 10, 10, 3, 3, 3, 12, 12, 12, 1, 1, 1]
    
    var intRoundCounter = 0
    
    // Initialize output csv string
    var strOutputCsv = "Target Wedge, Hit Wedge, Hit Band/n"
    
    let colorBtnBorder = UIColor.black
    let colorTargetBtnBorder = UIColor(red: 1.000, green: 0.832, blue: 0.473, alpha: 1.0)
    let intTargetBtnBorder = 3

    // OUTLETS
    
    // Wedge Labels
    @IBOutlet weak var lblLeftWedge: UILabel!
    @IBOutlet weak var lblMidWedge: UILabel!
    @IBOutlet weak var lblRightWedge: UILabel!
    
    // Top Label
    @IBOutlet weak var lblHit: UILabel!
    
    //Wedge Buttons
    @IBOutlet weak var btnLeftDouble: UIButton!
    @IBOutlet weak var btnLeftOuter: UIButton!
    @IBOutlet weak var btnLeftTriple: UIButton!
    @IBOutlet weak var btnLeftInner: UIButton!
    
    @IBOutlet weak var btnMidDouble: UIButton!
    @IBOutlet weak var btnMidOuter: UIButton!
    @IBOutlet weak var btnMidTriple: UIButton!
    @IBOutlet weak var btnMidInner: UIButton!
    
    @IBOutlet weak var btnRightDouble: UIButton!
    @IBOutlet weak var btnRightOuter: UIButton!
    @IBOutlet weak var btnRightTriple: UIButton!
    @IBOutlet weak var btnRightInner: UIButton!
    
    @IBOutlet weak var btnSingleBull: UIButton!
    @IBOutlet weak var btnDoubleBull: UIButton!
    
    // Wedge Outlines
    @IBOutlet weak var lblLeftOutline: UILabel!
    @IBOutlet weak var lblMidOutline: UILabel!
    @IBOutlet weak var lblRightOutline: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetTargetWedge(intTargetWedge: Shanghai[intRoundCounter])
    }
    
    // ACTIONS
    
    // Swiping
    @IBAction func SwipeRight(_ sender: Any) {
        intCenterWedge = intCenterWedge - 1
        if intCenterWedge == 0 {intCenterWedge = 20}
        BuildPage(intCenterWedge: intCenterWedge, intTargetWedge: Shanghai[intRoundCounter])
    }
    
    @IBAction func SwipeLeft(_ sender: Any) {
        intCenterWedge = intCenterWedge + 1
        if intCenterWedge == 21 {intCenterWedge = 1}
        BuildPage(intCenterWedge: intCenterWedge, intTargetWedge: Shanghai[intRoundCounter])
    }
    
    // Buttons
    
    @IBAction func btnLeftDouble(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge - 1, strHitBand: "Double")
    }
    @IBAction func btnLeftOuter(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge - 1, strHitBand: "Outer")
    }
    @IBAction func btnLeftTriple(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge - 1, strHitBand: "Triple")
    }
    @IBAction func btnLeftInner(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge - 1, strHitBand: "Inner")
    }
    
    @IBAction func btnMidDouble(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge, strHitBand: "Double")
    }
    @IBAction func btnMidOuter(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge, strHitBand: "Outer")
    }
    @IBAction func btnMidTriple(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge, strHitBand: "Triple")
    }
    @IBAction func btnMidInner(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge, strHitBand: "Inner")
    }
    
    @IBAction func btnRightDouble(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge + 1, strHitBand: "Double")
    }
    @IBAction func btnRightOuter(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge + 1, strHitBand: "Outer")
    }
    @IBAction func btnRightTriple(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge + 1, strHitBand: "Triple")
    }
    @IBAction func btnRightInner(_ sender: Any) {
        HitButtonPress(intHitWedge: intCenterWedge + 1, strHitBand: "Inner")
    }
    
    @IBAction func btnSingleBull(_ sender: Any) {
        HitButtonPress(intHitWedge: 99, strHitBand: "Single Bull")
    }
    @IBAction func btnDoubleBull(_ sender: Any) {
        HitButtonPress(intHitWedge: 99, strHitBand: "Double Bull")
    }
    

    
    
    
    
    // FUNCTIONS
    func HitButtonPress(intHitWedge: Int, strHitBand: String){
        if intHitWedge == 99 {
            lblHit.text = strHitBand
        } else {
            lblHit.text = strHitBand + " " +  String(WedgeNum[intHitWedge])
        }
        intRoundCounter = intRoundCounter + 1
        NextRound(intCurrentRoundCounter: intRoundCounter)
    }
    
    func SetTargetWedge(intTargetWedge: Int) {
        BuildPage(intCenterWedge: intTargetWedge, intTargetWedge: intTargetWedge)
        }
    
    func NextRound(intCurrentRoundCounter: Int){
        if intCurrentRoundCounter > Shanghai.count - 1 {
            intRoundCounter = 0
        }
        SetTargetWedge(intTargetWedge: Shanghai[intRoundCounter])
    }
    
    func BuildPage(intCenterWedge: Int, intTargetWedge: Int) {
        // Build basic page centered on center wedge
        lblLeftWedge.text = String(WedgeNum[intCenterWedge - 1])
        lblMidWedge.text = String(WedgeNum[intCenterWedge])
        lblRightWedge.text = String(WedgeNum[intCenterWedge + 1])
        
        btnSingleBull.GreenButton()
        btnDoubleBull.RedButton()
        
        if intCenterWedge % 2 == 0 {  // if even, white middle
            btnLeftDouble.RedButton()
            btnLeftOuter.BlackButton()
            btnLeftTriple.RedButton()
            btnLeftInner.BlackButton()
            
            btnMidDouble.GreenButton()
            btnMidOuter.TanButton()
            btnMidTriple.GreenButton()
            btnMidInner.TanButton()
            
            btnRightDouble.RedButton()
            btnRightOuter.BlackButton()
            btnRightTriple.RedButton()
            btnRightInner.BlackButton()
            
        } else {           // if odd, black middle
            btnLeftDouble.GreenButton()
            btnLeftOuter.TanButton()
            btnLeftTriple.GreenButton()
            btnLeftInner.TanButton()
            
            btnMidDouble.RedButton()
            btnMidOuter.BlackButton()
            btnMidTriple.RedButton()
            btnMidInner.BlackButton()
            
            btnRightDouble.GreenButton()
            btnRightOuter.TanButton()
            btnRightTriple.GreenButton()
            btnRightInner.TanButton()
        }
        
        //Clear old highlights
            lblMidOutline.ClearWedgeHighlight()
            lblLeftOutline.ClearWedgeHighlight()
            lblRightOutline.ClearWedgeHighlight()
            lblMidWedge.ClearWedgeLabelHighlight()
            lblLeftWedge.ClearWedgeLabelHighlight()
            lblRightWedge.ClearWedgeLabelHighlight()
        
        // Add the highlight of Target Wedge if its in the view
        
        if intTargetWedge - intCenterWedge == 0 {
            lblMidOutline.HighlightWedgeOutline()
            lblMidWedge.HighlightWedgeLabel()
        } else if intTargetWedge - intCenterWedge == -1 {
            lblLeftOutline.HighlightWedgeOutline()
            lblLeftWedge.HighlightWedgeLabel()
        } else if intTargetWedge - intCenterWedge == 1 || intTargetWedge - intCenterWedge == -19 {
            lblRightOutline.HighlightWedgeOutline()
            lblRightWedge.HighlightWedgeLabel()
        }
    }
}

//EXTENSIONS

extension UILabel{
    func HighlightWedgeOutline(){
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor(red: 1.000, green: 0.832, blue: 0.473, alpha: 1.0).cgColor
    }
    func ClearWedgeHighlight(){
        self.layer.borderWidth = 0
    }
    func HighlightWedgeLabel(){
        self.backgroundColor = UIColor(red: 1.000, green: 0.832, blue: 0.473, alpha: 1.0)
        self.textColor = UIColor.black
        self.layer.zPosition = 20
    }
    func ClearWedgeLabelHighlight(){
        self.backgroundColor = UIColor.black
        self.textColor = UIColor(red: 0.921, green: 0.921, blue: 0.921, alpha: 1.0)
        self.layer.zPosition = 0
    }
}

extension UIButton{
    func StandardWedgeButton(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    func RedButton(){
        self.StandardWedgeButton()
        self.setBackgroundImage(UIImage(named: "Red"), for: .normal)
        self.setBackgroundImage(UIImage(named: "RedDark"), for: .highlighted)
    }
    func TanButton(){
        self.StandardWedgeButton()
        self.setBackgroundImage(UIImage(named: "Tan"), for: .normal)
        self.setBackgroundImage(UIImage(named: "TanDark"), for: .highlighted)
    }
    func BlackButton(){
        self.StandardWedgeButton()
        self.setBackgroundImage(UIImage(named: "Black"), for: .normal)
        self.setBackgroundImage(UIImage(named: "BlackDark"), for: .highlighted)
    }
    func GreenButton(){
        self.StandardWedgeButton()
        self.setBackgroundImage(UIImage(named: "Green"), for: .normal)
        self.setBackgroundImage(UIImage(named: "GreenDark"), for: .highlighted)
    }
}
