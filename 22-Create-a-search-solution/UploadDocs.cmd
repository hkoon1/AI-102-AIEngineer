@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem Set values for your storage account
set subscription_id=afc6f403-3bed-4dc5-bcef-34c7a275af68
set azure_storage_account=trystorageaccount01
set azure_storage_key=MztmLZM8WyecE3bzMBQpekqACmGaErxdpB+N3xx64nnwQ897wXFEWff10I5aPnJHjEDzuSj7t//YZoyfux+/5g==


echo Creating container...
call az storage container create --account-name !azure_storage_account! --subscription !subscription_id! --name margies --public-access blob --auth-mode key --account-key !azure_storage_key! --output none

echo Uploading files...
call az storage blob upload-batch -d margies -s data --account-name !azure_storage_account! --auth-mode key --account-key !azure_storage_key!  --output none
