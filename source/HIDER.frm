VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H8000000D&
   BorderStyle     =   5  'Sizable ToolWindow
   ClientHeight    =   270
   ClientLeft      =   5910
   ClientTop       =   5475
   ClientWidth     =   1800
   FillStyle       =   0  'Solid
   Icon            =   "HIDER.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   270
   ScaleWidth      =   1800
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   1800
      Top             =   960
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FF0000&
      Caption         =   "  H   I   D   E   R"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private Const HWND_TOPMOST = -1 'bring to top and stay there
Private Const HWND_NOTOPMOST = -2 'put the window into a normal position

Private Const SWP_NOMOVE = &H2 'don't move window
Private Const SWP_NOSIZE = &H1 'don't size window

Private Declare Function GetForegroundWindow Lib "user32" () As Long

Private Sub Form_Load()

End Sub

Private Sub Timer1_Timer()
'If the window on top is not this window...
If Me.hWnd <> GetForegroundWindow Then
'Make this form be on top
Call SetWindowPos(GetForegroundWindow, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE)
'Make the window on top below this form
Call SetWindowPos(hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE)
End If
End Sub



