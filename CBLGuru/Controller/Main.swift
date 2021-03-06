//
//  ViewController.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 18/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class Main: UIViewController, iCarouselDelegate, iCarouselDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var carousel: iCarousel!
//    @IBOutlet weak var underScroll: UICollectionView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nav_toolbar: UIToolbar!
    var items : NSMutableArray = []
    @objc var project:ProjectData?
    
    let fases: [String] = ["Big Idea", "Essential Question", "Challenge", "Guiding", "Synthesis", "Solution Concept"]
    let fasesBody: [String] = ["Big Idea é um conceito amplo que pode ser explorado de várias maneiras e é relevante para os alunos e a comunidade em geral.",
                               "A Essential Question permite alunos contextualizarem e personalizarem a Big Idea.",
                               "O Challenge transforma a Essential Question num chamado para ação.",
                               "“Quem são as pessoas afetadas?” “Existe alguma solução para um problema semelhante?” “O que eu preciso saber sobre o problema?”",
                               "A etapa de Synthesis reúne e apresenta os dados reunidos na etapa anterior, dando uma visão ampla da questão abordada.",
                               "Pode envolver planos para uma campanha educacional, projetos de melhoria de um grupo ou comunitária, desenvolvimento de produtos ou outras atividades."]
    let fasesFoot: [String] = ["Clique aqui para adicionar sua Big Idea",
                               "Clique aqui para adicionar sua Essential Question",
                               "Clique aqui para adicionar sua Challenge",
                               "Clique aqui para adicionar suas Guiding Questions",
                               "Clique aqui para adicionar suas Synthesis",
                               "Clique aqui para adicionar sua Solution Concept"]
    let fasesFootImages: [String] = ["big idea.png", "big idea.png", "big idea.png", "guiding.png", "guiding.png", "act.png"]
    
    let scrollLabels: [String] = ["Configurações", "CBL Nudge", "Planejador", "Reflections", "Revisão"]
    let scrollImages: [String] = ["settings.png", "light-bulb.png", "time.png", "reflection.png", "review.png"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch self.carousel.currentItemIndex {
        case 5:
//            Updates Navigation Bar status
            updateNavigationBar(backRed: 0.79, backGreen: 0.23, backBlue: 0.05, tintRed: 0.02, tintGreen: 0.43, tintBlue: 0.50, title: "Act", largeTitle: true)
            
            carousel.backgroundColor = UIColor(red: 30/255, green: 134/255, blue: 152/255, alpha: 1.0) // #1e8698
            superView.backgroundColor = UIColor(red: 30/255, green: 134/255, blue: 152/255, alpha: 1.0) // #1e8698
        case 3, 4:
//            Updates Navigation Bar status
            updateNavigationBar(backRed: 0.89, backGreen: 0.33, backBlue: 0.15, tintRed: 0.67, tintGreen: 0.81, tintBlue: 0.11, title: "Investigate", largeTitle: true)

            carousel.backgroundColor = UIColor(red: 170/255, green: 207/255, blue: 28/255, alpha: 1.0) // #aacf1c
            superView.backgroundColor = UIColor(red: 170/255, green: 207/255, blue: 28/255, alpha: 1.0) // #aacf1c
        default:
//            Updates Navigation Bar status
            updateNavigationBar(backRed: 0.89, backGreen: 0.33, backBlue: 0.15, tintRed: 0.89, tintGreen: 0.33, tintBlue: 0.15, title: "Engage", largeTitle: true)
            
            carousel.backgroundColor = UIColor(red: 227/255, green: 83/255, blue: 39/255, alpha: 1.0) // #e35327
            superView.backgroundColor = UIColor(red: 227/255, green: 83/255, blue: 39/255, alpha: 1.0) // #e35327
        }
        carousel.type = iCarouselType.cylinder
        carousel.delegate = self
        carousel.dataSource = self
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (isTheFirstLaunch()) {
            self.performSegue(withIdentifier: "settingsSegue", sender: nil)
        }
    }
    
    func isTheFirstLaunch() -> Bool {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            return false
        } else {
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            return true
        }
    }
    
    @IBAction func backToHomeFromIntro(_ segue: UIStoryboardSegue) {
        ProjectServices.getFirstProject { (error, project) in
            if (error == nil) {
                // assign project
                self.project = project
                
                OperationQueue.main.addOperation {
                    if(self.project?.name == nil) {
                        self.performSegue(withIdentifier: "settingsSegue", sender: nil)
                    }
                }
            }
            else {
                print("Unable to find first project")
            }
        }
    }
    
    @IBAction func backToHomeFromSettings(_ segue: UIStoryboardSegue) {
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        for _ in 0...6 {
            items.add(_ : UIView())
        }
        return 6
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let largura = self.carousel.frame.width - 50
        let container = UIView(frame: CGRect(x: 0, y: 0, width: self.carousel.frame.width , height: self.carousel.frame.height))
        container.backgroundColor = UIColor.clear
        container.layer.cornerRadius = 5
        
        let view = UIView(frame: CGRect(x: (self.superView.frame.width - largura) / 2.0, y: (container.frame.height - largura - 90), width: largura, height: largura))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        view.layer.shadowOffset = CGSize(width: 5.0, height: 5.0);
        view.layer.shadowRadius = 5;
        view.layer.shadowOpacity = 0.5;
        
        let grayLargura = view.frame.height * (89/344)
        let grayView = UIView(frame: CGRect(x: 0, y: view.frame.height - grayLargura, width: largura, height: grayLargura))
        grayView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0) // #f9f9f9
        grayView.layer.cornerRadius = 5
        
        let labelTitle : UILabel = UILabel(frame: CGRect(x: 30, y: 27, width: view.frame.width - 60, height: 50))
        labelTitle.textAlignment = .left
        labelTitle.text = self.fases[index]
        labelTitle.font = UIFont.boldSystemFont(ofSize: 30)
        
        let labelBody : UILabel = UILabel(frame: CGRect(x: 30, y: 40, width: view.frame.width - 60, height: largura - grayLargura))
        labelBody.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelBody.numberOfLines = 0
        labelBody.textAlignment = .left
        labelBody.text = self.fasesBody[index]
        labelBody.font = labelBody.font.withSize(17)
        
        let imageFoot : UIImageView = UIImageView(image: UIImage(named: self.fasesFootImages[index]))
        imageFoot.frame = CGRect(x: ((grayLargura * 0.8 + 10) - grayLargura * 0.45)/2.0, y: grayLargura * 0.275, width: grayLargura * 0.45, height: grayLargura * 0.45)
        imageFoot.contentMode = UIView.ContentMode.scaleAspectFit
        
        let labelFoot : UILabel = UILabel(frame: CGRect(x: grayLargura * 0.8 + 10, y: 10, width: view.frame.width - 20 - (grayLargura * 0.8), height: grayLargura * 0.8))
        labelFoot.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelFoot.numberOfLines = 2
        labelFoot.textAlignment = .left
        labelFoot.text = self.fasesFoot[index]
        labelFoot.font = labelFoot.font.withSize(17)
        
        view.addSubview(grayView)
        view.addSubview(labelTitle)
        view.addSubview(labelBody)
        grayView.addSubview(imageFoot)
        grayView.addSubview(labelFoot)
        
        container.addSubview(view)
        
        return container
    }
    
    func carouselCurrentItemIndexDidChange(_ sender: iCarousel) {
        print("Index: \(self.carousel.currentItemIndex)");
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        switch self.carousel.currentItemIndex {
        case 5:
//            Updates Navigation Bar status
            updateNavigationBar(backRed: 0.79, backGreen: 0.23, backBlue: 0.05, tintRed: 0.02, tintGreen: 0.43, tintBlue: 0.50, title: "Act", largeTitle: true)

//            updateNavigationBar(backRed: 0.89, backGreen: 0.33, backBlue: 0.15, tintRed: 0.12, tintGreen: 0.53, tintBlue: 0.60, title: "Act", largeTitle: true)
            
//            Updates Background
            carousel.backgroundColor = UIColor(red: 30/255, green: 134/255, blue: 152/255, alpha: 1.0) // #1e8698
            superView.backgroundColor = UIColor(red: 30/255, green: 134/255, blue: 152/255, alpha: 1.0) // #1e8698
        case 3, 4:
//            Updates Navigation Bar status
            updateNavigationBar(backRed: 0.89, backGreen: 0.33, backBlue: 0.15, tintRed: 0.67, tintGreen: 0.81, tintBlue: 0.11, title: "Investigate", largeTitle: true)

//            Updates Background
            carousel.backgroundColor = UIColor(red: 170/255, green: 207/255, blue: 28/255, alpha: 1.0) // #aacf1c
            superView.backgroundColor = UIColor(red: 170/255, green: 207/255, blue: 28/255, alpha: 1.0) // #aacf1c

        default:
//            Updates Navigation Bar status
            updateNavigationBar(backRed: 0.89, backGreen: 0.33, backBlue: 0.15, tintRed: 0.89, tintGreen: 0.33, tintBlue: 0.15, title: "Engage", largeTitle: true)
            
//            Updates Background
            carousel.backgroundColor = UIColor(red: 227/255, green: 83/255, blue: 39/255, alpha: 1.0) // #e35327
            superView.backgroundColor = UIColor(red: 227/255, green: 83/255, blue: 39/255, alpha: 1.0) // #e35327
        }
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        print("Tapped view number: \(index)")
        if (index == 0) {
            performSegue(withIdentifier: "bigIdeaSegue", sender: nil)
        } else if (index == 1) {
            performSegue(withIdentifier: "essentialQuestionSegue", sender: nil)
        } else if (index == 2) {
            performSegue(withIdentifier: "challengeSegue", sender: nil)
        } else if (index == 3) {
            performSegue(withIdentifier: "guidingContentSegue", sender: nil)
        } else if (index == 4) {
            performSegue(withIdentifier: "synthesisSegue", sender: nil)
        } else {
            performSegue(withIdentifier: "actSegue", sender: nil)
        }
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(segue, sender)
//        navigationController?.setNavigationBarHidden(false, animated: false)
//
//    }
    
    //    ----------------FUTURE FEATURE----------------
    //    @IBAction func insertItem() {
    //        let index : Int = self.items.count
    //        self.items.insert(self.carousel.numberOfItems, at: index)
    //        self.carousel.insertItem(at: index, animated: true)
    //    }
    //
    //    @IBAction func removeItem() {
    //        if (self.carousel.numberOfItems > 0) {
    //            let index : NSInteger = self.carousel.currentItemIndex;
    //            self.items.removeObject(at: index);
    //            self.carousel.removeItem(at: index, animated: true)
    //        }
    //    }

    func updateNavigationBar(backRed: CGFloat, backGreen: CGFloat, backBlue: CGFloat, tintRed: CGFloat, tintGreen: CGFloat, tintBlue: CGFloat, title: String, largeTitle: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        nav?.topItem?.title = title
        nav?.prefersLargeTitles = largeTitle
        nav?.backgroundColor = UIColor(red: backRed, green: backGreen, blue: backBlue, alpha:1.0)
        nav?.barTintColor = UIColor(red: tintRed, green: tintGreen, blue: tintBlue, alpha:1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.largeTitleTextAttributes = textAttributes
    }
    
}

