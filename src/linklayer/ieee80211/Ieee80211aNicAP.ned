//
// Copyright (C) 2006 Andras Varga
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//


package inet.linklayer.ieee80211;

import inet.linklayer.ieee80211.mac.Ieee80211aMac;
import inet.linklayer.ieee80211.mgmt.Ieee80211MgmtAP;
import inet.linklayer.radio.Ieee80211aRadio;


//
// This NIC implements an 802.11 network interface card,
// in an AP, using infrastructure mode.
//
module Ieee80211aNicAP
{
    parameters:
        @display("i=block/ifcard");
    gates:
        input uppergateIn; // to upper layers
        output uppergateOut; // from upper layers
        input radioIn; // to receive AirFrames
    submodules:
        mgmt: Ieee80211MgmtAP {
            parameters:
                @display("p=96,69;q=wlanDataQueue");
        }
        mac: Ieee80211aMac {
            parameters:
                queueModule = "mgmt";
                @display("p=96,155");
        }
        radio: Ieee80211aRadio {
            parameters:
                @display("p=96,240");
        }
    connections:
        radioIn --> radio.radioIn;
        radio.uppergateIn <-- mac.lowergateOut;
        radio.uppergateOut --> mac.lowergateIn;

        mac.uppergateOut --> mgmt.macIn;
        mac.uppergateIn <-- mgmt.macOut;

        mgmt.uppergateOut --> uppergateOut;
        mgmt.uppergateIn <-- uppergateIn;

}

