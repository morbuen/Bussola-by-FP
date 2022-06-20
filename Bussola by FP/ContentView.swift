//
//  ContentView.swift
//  Bussola by FP
//
//  Created by Francesco Puzone on 20/06/22.
//

import SwiftUI
import CoreLocation
import CoreMotion
var observer : NSKeyValueObservation?

class HapticManger
{
    static let instance = HapticManger()
    
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle)
    {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct CompassMarkerView: View {
    let marker: Marker
    let compassDegress: Double
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 1,
                       height: 18)
                .foregroundColor(self.capsuleColor())
                .opacity(0.75)
                .padding(.bottom, 250)
        }
        .rotationEffect(Angle(degrees: marker.degrees))
    }
    private func capsuleColor() -> Color {
        return round(self.marker.degrees) == round(compassDegress) ? .black : .white
    }
}

struct CompassMarkerText: View {
    let marker: Marker
    let compassDegress: Double
    
    var body: some View {
        VStack {
            Text(marker.label)
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .rotationEffect(self.textAngle())
                .padding(.bottom, 180)
        }
        .rotationEffect(Angle(degrees: marker.degrees))
    }
    
    private func textAngle() -> Angle {
        return Angle(degrees: self.compassDegress - self.marker.degrees)
    }
}

struct CompassMarkerView2: View {
    let marker: Marker
    let compassDegress: Double
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 2,
                       height: 18)
                .foregroundColor(self.capsuleColor())
                .padding(.bottom, 250)
        }
        .rotationEffect(Angle(degrees: marker.degrees))
    }
    private func capsuleColor() -> Color {
        return round(self.marker.degrees) == round(compassDegress) ? .black : .white
    }
}

struct CompassMarkerText2: View {
    let marker: Marker
    let compassDegress: Double
    
    var body: some View {
        VStack {
            Text(marker.degreeText())
                .fontWeight(.light)
                .foregroundColor(.white)
                .rotationEffect(self.textAngle())
                .padding(.bottom, 340)
        }
        .rotationEffect(Angle(degrees: marker.degrees))
    }
    private func textAngle() -> Angle {
        return Angle(degrees: self.compassDegress - self.marker.degrees)
    }
}

struct ContentView : View {
    @ObservedObject var compassHeading = CompassHeading()
    let generator = UIImpactFeedbackGenerator(style: .medium)
    let generator2 = UIImpactFeedbackGenerator(style: .heavy)
    
    @ObservedObject private var locationManager = LocationManager()
    var observation : NSKeyValueObservation?
    //            @ObservedObject var motionManager = ViewController()
    
    var body: some View {
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        
        let url = URL(string: "maps://?saddr=&daddr=\(coordinate.latitude),\(coordinate.longitude)")
        
        return ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Rectangle()
                .frame(width: 3,
                       height: 70, alignment: .center)
                .foregroundColor(.white)
                .position(x: 206, y: 170)
            
            Rectangle()
                .frame(width: 1,
                       height: 120, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.6)
                .position(x: 206, y: 319)
            
            Rectangle()
                .frame(width: 120,
                       height: 1, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.6)
                .position(x: 206, y: 319)
            
            Ellipse()
                .frame(width: 75, height: 75, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.13)
                .position(x: 206, y: 319)
            
            //            Text("°")
            //                .font(.system(size: 44))
            //                .fontWeight(.thin)
            //                .opacity(0.7)
            //                .foregroundColor(Color.white)
            //                .position(x: 215, y: 319)
            
            VStack {
                ZStack {
                    Image(systemName: "arrowtriangle.up.fill").foregroundColor(.red)
                        .padding(.bottom, 295.0)
                    ForEach(Marker.markers(), id: \.self) { marker in
                        CompassMarkerView(marker: marker,
                                          compassDegress: self.compassHeading.degrees)
                    }
                    ForEach(Marker.markers2(), id: \.self) { marker in
                        CompassMarkerText(marker: marker,
                                          compassDegress: self.compassHeading.degrees)
                    }
                    ForEach(Marker.markers2(), id: \.self) { marker in
                        CompassMarkerView2(marker: marker,
                                           compassDegress: self.compassHeading.degrees)
                    }
                    ForEach(Marker.markers2(), id: \.self) { marker in
                        CompassMarkerText2(marker: marker,
                                           compassDegress: self.compassHeading.degrees)
                    }
                }
                .padding(130.0)
                .rotationEffect(Angle(degrees: -self.compassHeading.degrees))
                
                Text("\(self.compassHeading.degrees,  specifier: "%.0f")° \(self.compassHeading.direzione)")
                    .font(.system(size: 64))
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                
                
                Text("\(coordinate.latitudeDMS), \(coordinate.longitudeDMS)")
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 1.0)
                    .onTapGesture {
                        if UIApplication.shared.canOpenURL(url!) {
                            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                        }
                    }
                Text("\(locationManager.location?.altitude ?? 0, specifier: "%.1f") m Elevation")
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
            }.onAppear {
                observeDegrees()
            }
        }
    }
    
    func observeDegrees(){
        observer = compassHeading.observe(\.degrees, options: .new){
            degrees, change in
            
            let newVal: Double = Double(round(change.newValue!))
            
            if newVal == 0.0 {
                generator2.impactOccurred()
            } else if newVal == 30.0 {
                generator.impactOccurred()
            } else if  newVal == 60.0 {
                generator.impactOccurred()
            } else if  newVal == 90.0 {
                generator.impactOccurred()
            } else if  newVal == 120.0 {
                generator.impactOccurred()
            } else if  newVal == 150.0 {
                generator.impactOccurred()
            } else if  newVal == 180.0 {
                generator.impactOccurred()
            } else if  newVal == 210.0 {
                generator.impactOccurred()
            } else if  newVal == 240.0 {
                generator.impactOccurred()
            } else if  newVal == 270.0 {
                generator.impactOccurred()
            } else if  newVal == 300.0 {
                generator.impactOccurred()
            } else if  newVal == 330.0 {
                generator.impactOccurred()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
