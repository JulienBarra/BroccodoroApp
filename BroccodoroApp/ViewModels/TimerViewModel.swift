//
//  TimerViewModel.swift
//  BroccodoroApp
//
//  Created by Julien Barra on 26/07/2025.
//

import Foundation


class TimerViewModel: ObservableObject {
    @Published var timeRemaining: Int = 40 * 60
    @Published var isRunning: Bool = false
    private var timer: Timer?
    
    // Démarre le timer
    func startTimer() {
        guard !isRunning else { return }

        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.pauseTimer()
            }
        }
    }

    // Met en pause
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }

    // Remet le timer à zéro
    func resetTimer() {
        pauseTimer()
        timeRemaining = 25 * 60
    }
    
    // Pour formater le temps en "MM:SS"
    func timeFormatted() -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
