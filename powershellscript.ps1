

# Set variables
$resourceGroupName = "newresourcegroup"
$webAppName = "powershellwebapp1"
$location = "centralus"
$repositoryUrl = "https://github.com/shrestagowdaa/my-first-static-web-app.git"
$branch = "main"
$appLocation = "/src"    
$apiLocation = "/Api"    
$outputLocation = "/src" 
$skuName = "Standard"

# Create a new Azure Static Web App

New-AzStaticWebApp -ResourceGroupName $resourceGroupName -Name $webAppName `
    -Location $location -RepositoryUrl $repositoryUrl
    -Branch $branch -AppLocation $appLocation -ApiLocation $apiLocation `
    -OutputLocation $outputLocation -SkuName $skuName




