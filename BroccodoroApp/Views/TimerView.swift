//
//  TimerView.swift
//  BroccodoroApp
//
//  Created by Julien Barra on 26/07/2025.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var viewModel = TimerViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(Color.green, lineWidth: 10)
                Text(viewModel.timeFormatted())
                    .font(.system(size: 72, weight: .bold, design: .monospaced))
            }
            .frame(width: 250, height: 250)
            Spacer()
            
            HStack {
                Button(action: {
                    viewModel.isRunning ? viewModel.pauseTimer() : viewModel.startTimer()
                }) {
                    Image(systemName: viewModel.isRunning ? "pause" : "play")
                }
                Spacer()
                
                Button (action: {
                    viewModel.resetTimer()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
                
            }
            .frame(width: 150, height: 50)
            .font(.system(size: 32))
            Spacer()
        }
        .frame(maxWidth: 500, maxHeight: 1000)
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    TimerView()
}
