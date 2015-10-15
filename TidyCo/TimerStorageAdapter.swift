//
//  TimerStorageAdapter.swift
//  TidyCo
//
//  Created by Aaron Weaver on 10/15/15.
//  Copyright © 2015 Team Silver. All rights reserved.
//

import Foundation

protocol TimerStorageAdapter
{
    func getAllTimers() -> [Timer]
    
    func createTimer() -> String
}