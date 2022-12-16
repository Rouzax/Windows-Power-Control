Function ChoiceMenu {
	param(
		[string] $caption,
		[string] $message,
		[string] $yesMessage,
		[string] $noMessage,	
		[int] $defaultChoice
	)
	$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", $yesMessage
	$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", $noMessage
	$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
	$choiceRTN = $host.ui.PromptForChoice($caption, $message, $options, $defaultChoice)
	if ($choiceRTN -eq 0) {
		$choiceRTN = $true
	}
	else {
		$choiceRTN = $false
	}	
	Return $choiceRTN
}

$Proceed = ChoiceMenu -caption "Please Confirm Server Shutdown in 10 seconds" -message "Are you Sure You Want To Proceed:" -yesMessage "Server will be shutdown" -noMessage "Nothing will happen" -defaultChoice 1


if ($Proceed) {
	&C:\Windows\System32\shutdown.exe /s /t 10
}