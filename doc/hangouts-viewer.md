# hangouts-viewer
A ruby cli interface for parsing and representing google hangouts conversations.

## Command line options:
### -h, --help
	print this help text

### -i, --input FILE
	use FILE as the exported Hangouts.json file. 

### -o, --output FILE
	save output as FILE

### -f, --format [json, text]
	exporting format: json for more compact json to use with hv-client, otherwise flat text files

### -l, --list
	list all people and conversations

### -c, --conversation id[,id,...]
	export only the selected conversations

### -p, --people id[,id,...]
	export only conversations involving the following people


