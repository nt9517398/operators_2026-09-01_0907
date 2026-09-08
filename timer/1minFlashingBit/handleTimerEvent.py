def handleTimerEvent():
	
	import threading, time, system

	tagPath = "[default]1minFlashingBit"

	def pulse():
		try:
			# Turn ON
			system.tag.writeBlocking([tagPath], [True])
			# Wait 0.5 seconds
			time.sleep(0.5)
			# Turn OFF
			system.tag.writeBlocking([tagPath], [False])
		except Exception as e:
			system.util.getLogger("1minPulse").error("Pulse error: {}".format(e))

	# Run the pulse in a detached thread
	threading.Thread(target=pulse).start()