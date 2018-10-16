#tag Module
Protected Module ConsoleKit
	#tag Method, Flags = &h1
		Protected Function Format(message As String, forecolor As ConsoleKit.Colour, backcolor As ConsoleKit.Colour, bold As Boolean, underline As Boolean) As String
		  ' Prints to stdout the passed phrase with the specified formatting.
		  
		  Dim START As String = ChrB(27) + "["
		  Dim OPTIONS_FINISH As String = "m"
		  Dim FINISH As String = ChrB(27) + "[0m"
		  
		  Dim fc, bc, b, u As String
		  
		  Select Case forecolor
		  Case Colour.Black
		    fc = kForegroundBlack
		  Case Colour.Blue
		    fc = kForegroundBlue
		  Case Colour.Cyan
		    fc = kForegroundCyan
		  Case Colour.Green
		    fc = kForegroundGreen
		  Case Colour.Magenta
		    fc = kForegroundMagenta
		  Case Colour.Red
		    fc = kForegroundRed
		  Case Colour.White
		    fc = kForegroundWhite
		  Case Colour.Yellow
		    fc = kForegroundYellow
		  Case Else
		    fc = kForegroundDefault
		  End Select
		  
		  Select Case backcolor
		  Case Colour.Black
		    bc = kBackgroundBlack
		  Case Colour.Blue
		    bc = kBackgroundBlue
		  Case Colour.Cyan
		    bc = kBackgroundCyan
		  Case Colour.Green
		    bc = kBackgroundGreen
		  Case Colour.Magenta
		    bc = kBackgroundMagenta
		  Case Colour.Red
		    bc = kBackgroundRed
		  Case Colour.White
		    bc = kBackgroundWhite
		  Case Colour.Yellow
		    bc = kBackgroundYellow
		  Case Else
		    bc = kBackgroundDefault
		  End Select
		  
		  b = If(bold, kBoldOn, kBoldOff)
		  
		  u = If(underline, kUnderlineOn, kUnderlineOff)
		  
		  Return START + fc + ";" + bc + ";" + b + ";" + u + OPTIONS_FINISH  + message + FINISH
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Put(message As String, forecolor As ConsoleKit.Colour)
		  ' Prints to StdOut the passed message in the specified forecolour using the defaults for the backcolor 
		  ' and bold/underline settings.
		  
		  REALbasic.Print( ConsoleKit.Format(message, forecolor, Colour.Default, False, False) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Put(message As String, forecolor As ConsoleKit.Colour, bold As Boolean, underline As Boolean)
		  ' Prints to stdout the passed message in the specified forecolour and 
		  ' bold/underline settings, using the defaults for the backcolour.
		  
		  REALbasic.Print( ConsoleKit.Format(message, forecolor, Colour.Default, bold, underline) )
		End Sub
	#tag EndMethod


	#tag Note, Name = Credits
		Many thanks to Jeremy Cowgar for sharing his OptionParser classes which are bundled into the ConsoleKit module:
		http://jcowgar.github.io/xojo-option-parser/
		https://github.com/jcowgar/xojo-option-parser
		
	#tag EndNote


	#tag Constant, Name = kBackgroundBlack, Type = Text, Dynamic = False, Default = \"40", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBackgroundBlue, Type = String, Dynamic = False, Default = \"44", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBackgroundCyan, Type = String, Dynamic = False, Default = \"46", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBackgroundDefault, Type = String, Dynamic = False, Default = \"49", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBackgroundGreen, Type = String, Dynamic = False, Default = \"42", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBackgroundMagenta, Type = String, Dynamic = False, Default = \"45", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBackgroundRed, Type = String, Dynamic = False, Default = \"41", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBackgroundWhite, Type = String, Dynamic = False, Default = \"47", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBackgroundYellow, Type = String, Dynamic = False, Default = \"43", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBoldOff, Type = String, Dynamic = False, Default = \"22", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBoldOn, Type = String, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kForegroundBlack, Type = String, Dynamic = False, Default = \"30", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kForegroundBlue, Type = String, Dynamic = False, Default = \"34", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kForegroundCyan, Type = String, Dynamic = False, Default = \"36", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kForegroundDefault, Type = String, Dynamic = False, Default = \"39", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kForegroundGreen, Type = String, Dynamic = False, Default = \"32", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kForegroundMagenta, Type = String, Dynamic = False, Default = \"35", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kForegroundRed, Type = String, Dynamic = False, Default = \"31", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kForegroundWhite, Type = String, Dynamic = False, Default = \"37", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kForegroundYellow, Type = String, Dynamic = False, Default = \"33", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUnderlineOff, Type = String, Dynamic = False, Default = \"24", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUnderlineOn, Type = String, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kVersion, Type = String, Dynamic = False, Default = \"1.0.0", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = Colour, Type = Integer, Flags = &h1
		Black
		  Blue
		  Cyan
		  Green
		  Magenta
		  Red
		  White
		  Yellow
		Default
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
