#Requires -Module Az.Resources
<#
.SYNOPSIS
        Scipt will be used to manually deploy arm templates targeted to a resourceGroup
        This script will be used to perform manual testing of templates in ..\ARM.templates dir
#>

param(
        [String]$resourceGroupName = "RG_Vikas.Pandey"
)

# Scipt Vars
$templateDir = (Get-Item $PSScriptRoot).Parent.FullName
$templatefile = "$templateDir\ARM.templates\azuredeploy.json"
$templateParamFileDev = "$templateDir\ARM.templates\azuredeploy.params.json"
#$templateParamFileQA = "$templateDir\ARM.templates\qa\qa.azuredeploy.params.json"
#$templateParamFileProd = "$templateDir\ARM.templates\prod\prod.azuredeploy.params.json"

# deploy ARM templates on resourceGroup
New-AzResourceGroupDeployment -Name "xxxx-script-deploy-manual-$(Get-Date -Format 'yyyyMMdd-hhmm')" `
                              -ResourceGroupName $resourceGroupName `
                              -Mode Incremental `
                              -TemplateFile $templatefile `
                              -TemplateParameterFile $templateParamFileDev `
                              -Verbose

                              
