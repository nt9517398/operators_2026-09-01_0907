import csv	#import the python csv library
# Script tools to open csv file and import tags of specified UDT Type

# Open csv file through file selector
def openFile():
	filePath = system.file.openFile("csv","%user%")
	csvFile = open(filePath, 'r')
	reader = csv.DictReader(csvFile)
	print reader.fieldnames
	for row in reader:
		# Call addUDT function based on UDTType
		if row['UDTType'] == '': addAlarms( row )
		# add more conditions for more UDTTypes...

# Function to add instance tag of UDT type 'AIn'
def addAlarms( csvRow ):
	if csvRow['TagProvider'] == "": tagProv = '[default]'
	else: tagProv = '[' + csvRow['TagProvider'] + ']'
	tagPath = tagProv + csvRow['TagPath']
	tagName = tagPath + '/' + csvRow['Name']
	
	if system.tag.exists(tagName):
		system.tag.removeTag(tagName)
		print tagName + ' removed'

	system.tag.addTag( 	parentPath = tagPath,
						name = csvRow['Name'],
						tagType = 'UDT_INST',
						attributes={'UDTParentType':csvRow['UDTType']},
						parameters={'Notes':csvRow['Notes'],
									'Group':csvRow['Group'],
									'ItemName':csvRow['ItemName'],
									'Priority':csvRow['Priority'],
									'EngUnits':csvRow['EngUnits']
									},
						overrides={
										'Priority':{'value':csvRow['Priority']},
										
									}
						)
	print 'Alarms tag ' + tagName + ' added'
