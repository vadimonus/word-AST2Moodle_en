; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "AST-Test to MoodleXML converter for Word "
!define APPNAMEANDVERSION "AST-Test to MoodleXML converter for Word (20160426)"

; Main Install settings
Name "${APPNAMEANDVERSION}"
RequestExecutionLevel user
InstallDir "$LOCALAPPDATA\AST-Test to MoodleXML converter for Word"
InstallDirRegKey HKCU "Software\${APPNAME}" ""
OutFile "Install converter.exe"

Section "AST-Test to MoodleXML converter for Word"

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$APPDATA\Microsoft\Word\STARTUP\"
	File "AST_en.dotm"
	SetOutPath "$INSTDIR\"
	File "Examples.docx"
	File "User manual.docx"
	CreateDirectory "$LOCALAPPDATA\AST-Test to MoodleXML converter for Word"
	CreateDirectory "$SMPROGRAMS\AST-Test to MoodleXML converter for Word"
	CreateShortCut "$SMPROGRAMS\AST-Test to MoodleXML converter for Word\User manual.lnk" "$INSTDIR\User manual.docx"
	CreateShortCut "$SMPROGRAMS\AST-Test to MoodleXML converter for Word\Examples.lnk" "$INSTDIR\Examples.docx"
	CreateShortCut "$SMPROGRAMS\AST-Test to MoodleXML converter for Word\Remove converter.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section -FinishSection

	WriteRegStr HKCU "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

;Uninstall section
Section Uninstall

	;Remove from registry...
	DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKCU "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$SMPROGRAMS\AST-Test to MoodleXML converter for Word\User manual.lnk"
	Delete "$SMPROGRAMS\AST-Test to MoodleXML converter for Word\Examples.lnk"
	Delete "$SMPROGRAMS\AST-Test to MoodleXML converter for Word\Remove converter.lnk"

	; Clean up AST-Test to MoodleXML converter for Word
	Delete "$APPDATA\Microsoft\Word\STARTUP\AST_en.dotm"
	Delete "$INSTDIR\User manual.docx"
	Delete "$INSTDIR\Examples.docx"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\AST-Test to MoodleXML converter for Word"
	RMDir "$INSTDIR"

SectionEnd

Function un.onInit

	MessageBox MB_YESNO|MB_DEFBUTTON2|MB_ICONQUESTION "Remove ${APPNAMEANDVERSION}?" IDYES DoUninstall
		Abort
	DoUninstall:

FunctionEnd

; eof