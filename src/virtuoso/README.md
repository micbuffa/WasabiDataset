# Importing WASABI named graphs into Virtuoso

To use the tools in this folder, you first need to update script `virtuoso-import.sh`: change the `'your password'` string to the actual admin password of your Virtuoso instance.

Then, use script `import-wasabi.sh` to import the different graphs into Virtuoso.
This script assumres that the Turtle files have already been generated in folder `../xr2rml/$WASABI_DATASET`.
