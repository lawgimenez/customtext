//
//  DetailsView.swift
//  CustomText
//
//  Created by Lawrence Gimenez on 6/29/24.
//

import SwiftUI

struct DetailsView: View {
    
    @State private var attributedText = NSAttributedString(string: """
           This feelin' is brought to you by adrenaline and good rap
           Black Pendleton ball cap (West, west, west)
           We don't share the same synonym, fall back (West, west, west)
           Been in it before Internet had new acts
           Mimicking radio's nemesis made me wack
           My innocence limited, the experience lacked
           Ten of us with no tentative tactic that cracked
           The mind of a literate writer, but I did it, in fact
           You admitted it once I submitted it, wrapped in plastic
           Remember scribblin', scratchin' diligent sentences backwards
           Visiting freestyle cyphers for your reaction
           Now, I can live in a stadium, pack it the fastest
           Gamblin' Benjamin benefits, sinnin' in traffic
           Spinnin' women in cartwheels, linen fabric on fashion
           Winnin' in every decision, Kendrick is master that mastered it
           Isn't it lovely how menaces turned attraction?
           Pivotin' rappers, finish your fraction while writing blue magic
           Thank God for rap
           I would say it got me a plaque, but what's better than that?
           The fact it brought me back home
           """)
    
    var body: some View {
        VStack {
            TextSelectable(text: attributedText)
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("highlightAdded"))) { output in
            if let highlight = output.userInfo!["data"] as? Highlight {
                let mutableString = NSMutableAttributedString.init(string: attributedText.string)
                let highlightAttributes: [NSAttributedString.Key: Any] = [
                    .backgroundColor: highlight.uiColor,
                ]
                mutableString.addAttributes(highlightAttributes, range: NSRange(location: highlight.location, length: highlight.length))
                attributedText = mutableString
            }
        }
        .padding()
    }
}

#Preview {
    DetailsView()
}
