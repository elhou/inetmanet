//
// Copyright (C) 2005 Andras Varga
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

#ifndef ISCRIPTABLE_H
#define ISCRIPTABLE_H

#include <omnetpp.h>
#include "INETDefs.h"


/**
 * Modules that need to be scriptable by ScenarioManager should "implement"
 * (subclass from) this class.
 *
 * @see ScenarioManager
 * @author Andras Varga
 */
class INET_API IScriptable
{
  public:
    virtual ~IScriptable() {}

    /**
     * Called by ScenarioManager whenever a script command needs to be
     * carried out by the module. 
     * 
     * The command is represented by the XML element or element tree. 
     * The command name can be obtained as:
     *
     * <pre>
     * node->getTagName()
     * </pre>
     *
     * And parameter are XML attributes, e.g. a "neighbour" parameter can be
     * retrieved as:
     *
     * <pre>
     * node->getAttribute("neighbour")
     * </pre>
     *
     * More complex input can be passed in child elements. 
     * 
     * @see cXMLElement
     */
    virtual void processCommand(const cXMLElement& node) = 0;
};

#endif