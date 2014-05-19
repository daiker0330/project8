Sub Cal()
Dim S(6, 100) As String
Dim num(7) As Integer
Dim i As Integer
Dim j As Integer
Dim h As Integer
Dim flag As Integer
Dim t As String
Dim t1 As Integer
Dim t2 As Integer
Dim FSM(5) As String
FSM(1) = "S1"
FSM(2) = "S2"
FSM(3) = "S3"
FSM(4) = "S4"
FSM(5) = "S5"

Open "E:\project\project8\src\ctrl.v" For Output As #1

Print #1, "module ctrl ( Reset , OP , F , RT , Zero , Sign , ";
For i = 4 To 100
    If Cells(1, i).Value <> "" Then
        t = Cells(1, i).Value
        t1 = InStr(t, "(S)")
        If t1 = 0 Then
            Print #1, Cells(1, i).Value; " , ";
        End If
    End If
    Next i
Print #1, "clk ) ;"

'Input And Output
Print #1, "input    [5:0]   OP ;"
Print #1, "input    [5:0]   F ;"
Print #1, "input    [4:0]   RT ;"
Print #1, "input        clk ;"
Print #1, "input        Zero ;"
Print #1, "input        Sign ;"
Print #1, "input        Reset ;"
	
For i = 2 To 100
    If Cells(1, i).Value <> "" And InStr(Cells(1, i).Value, "(S)") Then
        For j = 1 To 6
            num(j) = 0
            Next j
        For j = 2 To 100
            If Cells(j, i).Value <> "" Then
				flag = 0
				For h = 1 To num(6)
					If S(6, h) = Cells(j, i + 1).Value Then
						flag = 1
					End If
					Next h
				If flag = 0 Then
					num(6) = num(6) + 1
					S(6, num(6)) = Cells(j, i + 1).Value
				End If
			End If
            Next j
		num(7) = 1
		do while num(6) > 2
			num(6) = num(6) / 2
			num(7) = num(7) + 1
			loop
		Print #1,"output	[" CStr(num(7)-1) ":0]	";Cells(1,i+1);" ;"
		End If
    Next i
	
For i = 2 To 100
    If Cells(1, i).Value <> "" Then
        t = Cells(1, i).Value
        If InStr(t, "Wr") <> 0 Then
            Print #1, "output";
            Prt (i)
        End If
    End If
    Next i
Print #1,
	
For i = 2 To 100
    If Cells(1, i).Value <> "" And InStr(Cells(1, i).Value, "(S)") Then
        For j = 1 To 6
            num(j) = 0
            Next j
        For j = 2 To 100
            If Cells(j, i).Value <> "" Then
				flag = 0
				For h = 1 To num(6)
					If S(6, h) = Cells(j, i + 1).Value Then
						flag = 1
					End If
					Next h
				If flag = 0 Then
					num(6) = num(6) + 1
					S(6, num(6)) = Cells(j, i + 1).Value
				End If
			End If
            Next j
		num(7) = 1
		do while num(6) > 2
			num(6) = num(6) / 2
			num(7) = num(7) + 1
			loop
		Print #1,"reg	[" CStr(num(7)-1) ":0]	";Cells(1,i+1);" ;"
		End If
    Next i
	
For i = 2 To 100
    If Cells(1, i).Value <> "" Then
        t = Cells(1, i).Value
        If InStr(t, "Wr") Then
            Print #1, "reg";
            Prt (i)
        End If
    End If
    Next i
Print #1,



'Ins
For i = 2 To 100
    If Cells(i, 1).Value <> "" Then
        Print #1, "reg       "; Cells(i, 1).Value; " ;"
    End If
    Next i
Print #1,

'FSM
Print #1, "reg   [2:0]   count ;"
Print #1, "reg   [2:0]   next_count ;"
Print #1, "reg       S1 ;"
Print #1, "reg       S2 ;"
Print #1, "reg       S3 ;"
Print #1, "reg       S4 ;"
Print #1, "reg       S5 ;"
Print #1,

'Initial
Print #1, "always @ ( negedge Reset )"
Print #1, "begin"
Print #1, "  count = 0 ;"
Print #1, "  next_count = 0 ;"
Print #1, "  S1 = 0 ;"
Print #1, "  S2 = 0 ;"
Print #1, "  S3 = 0 ;"
Print #1, "  S4 = 0 ;"
Print #1, "  S5 = 0 ;"
Print #1,
For i = 2 To 100
    If Cells(1, i).Value <> "" Then
        t = Cells(1, i).Value
        If InStr(t, "(S)") = 0 And InStr(t, "Op") Then
            Print #1, "  "; Cells(1, i).Value; " = 0 ;"
        End If
    End If
    Next i
For i = 2 To 100
    If Cells(1, i).Value <> "" Then
        t = Cells(1, i).Value
        If InStr(t, "(S)") = 0 And InStr(t, "Sel") Then
            Print #1, "  "; Cells(1, i).Value; " = 0 ;"
        End If
    End If
    Next i
For i = 2 To 100
    If Cells(1, i).Value <> "" Then
        t = Cells(1, i).Value
        If InStr(t, "Wr") Then
            Print #1, "  "; Cells(1, i).Value; " = 0 ;"
        End If
    End If
    Next i
Print #1,
For i = 2 To 100
    If Cells(i, 1).Value <> "" And Cells(i, 1).Value <> Cells(i - 1, 1).Value Then
        Print #1, "  "; Cells(i, 1).Value; " = 0 ;"
    End If
    Next i
Print #1,"end"

'always
Print #1, "always @ ( * )"
Print #1, "begin"
'FSM
Print #1, "  S1 = ( count == 3'b001 ) ? 1 : 0 ;"
Print #1, "  S2 = ( count == 3'b010 ) ? 1 : 0 ;"
Print #1, "  S3 = ( count == 3'b011 ) ? 1 : 0 ;"
Print #1, "  S4 = ( count == 3'b100 ) ? 1 : 0 ;"
Print #1, "  S5 = ( count == 3'b101 ) ? 1 : 0 ;"
Print #1,

'Ins
For i = 2 To 100
    If Cells(i, 1).Value <> "" Then
        Print #1, "  "; Cells(i, 1).Value; " = ( OP == 6'b"; Cells(i, 2).Value;
        If Cells(i, 3).Value <> "" Then
			If Cells(i, 1).Value = "BLTZ" OR Cells(i, 1).Value = "BGEZ" Then
				Print #1, " && RT == 5'b";
			Else 
				Print #1, " && F == 6'b"; 
			End If	
			Print #1, Cells(i, 3).Value;
        End If
        Print #1, " ) ? 1 : 0 ;"
    End If
    Next i
Print #1,

'Wr
For i = 2 To 100
    If Cells(1, i).Value <> "" And InStr(Cells(1, i).Value, "Wr") Then
        For j = 1 To 5
            num(j) = 0
            Next j
        Print #1, "  "; Cells(1, i).Value; " = ";
        For j = 2 To 100
            If Cells(j, i).Value <> "" Then
				For h = 1 To 5
					If FSM(h) = Cells(j, i).Value Then
						num(h) = num(h) + 1
						S(h, num(h)) = Cells(j, 1).Value
					End If
					Next h
            End If
            Next j
		
        For j = 1 To 5
            If j = 1 Then
                Print #1, "1 * ( ";
            ElseIf j = 2 Then
                Print #1, "     + 1 * ( ";
            ElseIf j = 3 Then
                Print #1, "     + 1 * ( ";
            ElseIf j = 4 Then
                Print #1, "     + 1 * ( ";
            ElseIf j = 5 Then
                Print #1, "     + 1 * ( ";
            End If
            If num(j) = 0 Then
                Print #1, "0";
            End If
            For h = 1 To num(j)
                Print #1, S(j, h);
                If h < num(j) Then
                    Print #1, " + ";
                End If
                Next h
            Print #1, " )"
            Next j
			Print #1,";"
    End If
    Next i
Print #1,
'Op&Sel
For i = 2 To 100
    If Cells(1, i).Value <> "" And InStr(Cells(1, i).Value, "(S)") Then
        For j = 1 To 6
            num(j) = 0
            Next j
        Print #1, "  "; Cells(1, i+1).Value; " = ";
        For j = 2 To 100
            If Cells(j, i).Value <> "" Then
				flag = 0
				For h = 1 To num(6)
					If S(6, h) = Cells(j, i + 1).Value Then
						flag = 1
					End If
					Next h
				If flag = 0 Then
					num(6) = num(6) + 1
					S(6, num(6)) = Cells(j, i + 1).Value
				End If
			End If
            Next j
		
		
		For h = 1 To num(6)
			Cells(55+h,i).Value = S(6,h)
			Next h
		Cells(55+num(6)+1,i).Value = num(6)
		
		t1 = num(6)
		num(7) = 1
		do while t1 > 2
			t1 = t1 / 2
			num(7) = num(7) + 1
			loop
		
		For j = 2 To 100
			If Cells(j, i).Value <> "" Then
				For h = 1 To num(6)
					If S(6, h) = Cells(j, i + 1).Value Then
						//If Cells(j, 1).Value <> "" Then
							Print #1, "		";"1"; " * "; Cells(j, i).Value; " ? " CStr(num(7)) "'d" ; Cstr(h-1) ; " :"
						//ElseIf Cells(j-1, 1).Value = "BEQ" Then
						//	Print #1, "		";Cells(j-1, 1).Value; " * Zero * "; Cells(j, i).Value; " ? " CStr(num(7)) "'d"; Cstr(h-1); " :"
						//ElseIf Cells(j-1, 1).Value = "BNE" Then
						//	Print #1, "		";Cells(j-1, 1).Value; " * ~Zero * "; Cells(j, i).Value; " ? " CStr(num(7)) "'d"; Cstr(h-1); " :"
						//ElseIf Cells(j-1, 1).Value = "BLEZ" Then
						//	Print #1, "		";Cells(j-1, 1).Value; " * ( Zero | Sign ) * "; Cells(j, i).Value; " ? " CStr(num(7)) "'d"; Cstr(h-1); " :"
						//ElseIf Cells(j-1, 1).Value = "BGTZ" Then
						//	Print #1, "		";Cells(j-1, 1).Value; " * ~Sign * ~Zero * "; Cells(j, i).Value; " ? " CStr(num(7)) "'d"; Cstr(h-1); " :"
						//ElseIf Cells(j-1, 1).Value = "BLTZ" Then
						//	Print #1, "		";Cells(j-1, 1).Value; " * Sign * ~Zero * "; Cells(j, i).Value; " ? " CStr(num(7)) "'d"; Cstr(h-1); " :"
						//ElseIf Cells(j-1, 1).Value = "BGEZ" Then
						//	Print #1, "		";Cells(j-1, 1).Value; " * ( Zero | ~Sign ) * "; Cells(j, i).Value; " ? " CStr(num(7)) "'d"; Cstr(h-1); " :"
						//Else
						//	Print #1, "		";Cells(j-1, 1).Value; " * "; Cells(j, i).Value; " ? " CStr(num(7)) "'d" ; Cstr(h-1) ; " :"
						//End If
					End If
					Next h
			End If
			Next j
		Print #1, "		0;"
		End If
    Next i


Print #1, "end"
                                                                       
Print #1,"  always @ ( posedge clk )                                   "
Print #1,"  begin                                                      "
Print #1,"	count = next_count ;                                       "
Print #1,"  end                                                        "
Print #1,"	                                                           "
Print #1,"  always @ ( negedge clk )                                   "
Print #1,"  begin                                                      "
Print #1,"	next_count = 1;                                            "
Print #1,"	//case( count )                                              "
Print #1,"	//  0:next_count = 1 ;                                       "
Print #1,"      //1:next_count = 2 ;                                     "

Print #1,"      //2:next_count = (";
For i = 2 To 100
	If Cells(i,6) = "S2" Then
		Print #1,Cells(i,1);" + ";
	End If
	Next i
Print #1,"//0 ) ? 1 : 1 ;"

Print #1,"      //3:next_count = ("
For i = 2 To 100
	If Cells(i,6) = "S3" Then
		Print #1,Cells(i,1);" + ";
	End If
	Next i
Print #1,"//0 ) ? 1 : 4 ;"

Print #1,"      //4:next_count = ("
For i = 2 To 100
	If Cells(i,6) = "S4" Then
		Print #1,Cells(i,1);" + ";
	End If
	Next i
Print #1,"//0 ) ? 1 : 5 ;"

Print #1,"      //5:next_count = 1 ;                                     "
Print #1,"      //default:next_count = 0;                                "
Print #1,"    //endcase                                                  "
Print #1,"  end                                                        "


Print #1, "endmodule"
Close

End Sub





Sub Prt(i)
Dim t As Integer
t = Cells(100, i)
Print #1, "  ";
Print #1, "  ";
Print #1, " "; Cells(1, i).Value; " ;"
End Sub
