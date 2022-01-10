//
//  ContentView.swift
//  AnimatedBackground
//
//  Created by M H on 10/01/2022.
//

import SwiftUI

struct ContentView: View {
	
	var scrsize = UIScreen.main.bounds
	@State var isAnimated = false
	
    var body: some View {
		ZStack {
			getSinWave(interval: scrsize.width * 1.5, amplitude: 110,  height: 65 + scrsize.height / 2)
				.foregroundColor(Color.black.opacity(0.4))
				.offset(x: isAnimated ? (scrsize.width * 1.5) * -1 : 0)
				.animation(.linear(duration: 6).repeatForever(autoreverses: false))

			getSinWave(interval: scrsize.width, amplitude: 200, height: 70 + scrsize.height / 2)
				.foregroundColor(Color.black.opacity(0.4))
				.offset(x: isAnimated ? scrsize.width * -1 : 0)
				.animation(.linear(duration: 3).repeatForever(autoreverses: false))

			getSinWave(interval: scrsize.width * 3, amplitude: 200,  height: 95 + scrsize.height / 2)
				.foregroundColor(Color(red: 0.1, green: 0.6, blue: 1).opacity(0.4))
				.offset(x: isAnimated ? (scrsize.width * 3) * -1 : 0)
				.animation(.linear(duration: 7).repeatForever(autoreverses: false))
		} // z
		.onAppear(perform: {
			self.isAnimated = true
		})
//			.stroke(lineWidth: 2)
    }
	
	func getSinWave(interval: CGFloat, amplitude: CGFloat, height: CGFloat) -> Path {
		Path{ path in
			path.move(to: CGPoint(x: 0, y: height))
			path.addCurve(
				to: CGPoint(x: interval, y: height),
				control1: CGPoint(x: interval * 0.35, y: amplitude + height),
				control2: CGPoint(x: interval * 0.65, y: -amplitude + height))
			
			path.addCurve(
				to: CGPoint(x: 2 * interval, y: height),
				control1: CGPoint(x: interval * 1.35, y: amplitude + height),
				control2: CGPoint(x: interval * 1.65, y: -amplitude + height))
			
			path.addLine(to: CGPoint(x: 2 * interval, y: scrsize.height))
			path.addLine(to: CGPoint(x: 0, y: scrsize.height))

		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
