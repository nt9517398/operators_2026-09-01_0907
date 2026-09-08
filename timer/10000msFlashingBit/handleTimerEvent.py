def handleTimerEvent():
	
    tagPath = "[default]1000msFlashingBit"  # Replace with your actual tag path
    current = system.tag.readBlocking([tagPath])[0].value
    system.tag.writeBlocking([tagPath], [not current])