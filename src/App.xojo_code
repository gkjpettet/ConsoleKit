#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  Using ConsoleKit
		  
		  Dim parser As New OptionParser
		  Dim o As Option
		  
		  ' ###########################
		  ' Required arguments example.
		  ' ###########################
		  ' Name
		  o = New Option("n", "name", "A name is required", Option.OptionType.String)
		  o.IsRequired = True
		  parser.AddOption(o)
		  
		  ' ###########################
		  ' Optional arguments example.
		  ' ###########################
		  ' Limit the number of intents returned.
		  o = New Option("v", "verbose", "Enable verbose mode", Option.OptionType.Boolean)
		  parser.AddOption(o)
		  
		  ' #################################
		  ' Parse the command line arguments.
		  ' #################################
		  Try
		    parser.Parse(args)
		  Catch err
		    ' An error occurred during parsing. Will be one of:
		    ' OptionMissingKeyException
		    ' OptionInvalidKeyValueException
		    ' OptionUnrecognizedKeyException
		    Put(err.Message, Colour.Red)
		    Quit(-1)
		  End Try
		  
		  ' Print out a green "Done" message.
		  Put("Done", Colour.Green)
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
