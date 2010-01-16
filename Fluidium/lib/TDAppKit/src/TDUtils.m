//  Copyright 2010 Todd Ditchendorf
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import <TDAppKit/TDUtils.h>
#import <TDAppKit/NSBezierPath+TDAdditions.h>

NSBezierPath *TDGetRoundRect(NSRect r, CGFloat radius, CGFloat lineWidth) {
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundRect:r radius:radius];
    [path setLineWidth:lineWidth];
    return path;
    
//    CGFloat minX = NSMinX(r);
//    CGFloat midX = NSMidX(r);
//    CGFloat maxX = NSMaxX(r);
//    CGFloat minY = NSMinY(r);
//    CGFloat midY = NSMidY(r);
//    CGFloat maxY = NSMaxY(r);
//    
//    NSBezierPath *path = [NSBezierPath bezierPath];
//    [path setLineWidth:lineWidth];
//    [path moveToPoint:NSMakePoint(minX, midY)];
//    [path appendBezierPathWithArcFromPoint:NSMakePoint(minX, minY) toPoint:NSMakePoint(midX, minY) radius:radius];
//    [path appendBezierPathWithArcFromPoint:NSMakePoint(maxX, minY) toPoint:NSMakePoint(maxX, midY) radius:radius];
//    [path appendBezierPathWithArcFromPoint:NSMakePoint(maxX, maxY) toPoint:NSMakePoint(midX, maxY) radius:radius];
//    [path appendBezierPathWithArcFromPoint:NSMakePoint(minX, maxY) toPoint:NSMakePoint(minX, midY) radius:radius];
//    [path closePath];
//    
//    return path;
}


NSBezierPath *TDDrawRoundRect(NSRect r, CGFloat radius, CGFloat lineWidth, NSGradient *fillGradient, NSColor *strokeColor) {
    //    CGContextRef c = [[NSGraphicsContext currentContext] graphicsPort];
    //
    //    CGContextSetLineWidth(c, lineWidth);
    
    //    NSLog(@"before r: %@", NSStringFromRect(r));
    //    r = CGContextConvertRectToDeviceSpace(c, r);
    //    NSLog(@"after r: %@", NSStringFromRect(r));
    
    NSBezierPath *path = TDGetRoundRect(r, radius, lineWidth);
    [fillGradient drawInBezierPath:path angle:90.0];
    
    [strokeColor setStroke];
    [path stroke];
    
    return path;
    
    //    CGContextSetLineWidth(c, lineWidth);
    //    
    //    CGContextBeginPath(c);
    //    CGContextMoveToPoint(c, minX, midY);
    //    CGContextAddArcToPoint(c, minX, minY, midX, minY, radius);
    //    CGContextAddArcToPoint(c, maxX, minY, maxX, midY, radius);
    //    CGContextAddArcToPoint(c, maxX, maxY, midX, maxY, radius);
    //    CGContextAddArcToPoint(c, minX, maxY, minX, midY, radius);
    //    CGContextClosePath(c);
    //    CGContextDrawPath(c, kCGPathFillStroke);
}
