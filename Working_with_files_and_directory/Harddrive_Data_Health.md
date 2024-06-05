**To verify the integrity of your files on an external hard drive after a year, use a checksum or hashing tool when you first copy the data to the drive.**

## Linux (Bash)

**1. Generate Checksums**: When you first copy the data, generate checksums for all files and save the list to a file:

```bash
cd /path/to/external/drive
find . -type f -exec md5sum {} + > checksums.md5

# or
find /path/to/external/drive -type f -exec md5sum {} + > checksums.md5
```

**2. Store the Checksum File**: Keep checksums.md5 in a safe location, possibly even in multiple locations (e.g., cloud storage, another external drive).

**3. Verify After a Year**: After a year, you can verify the integrity of the files by comparing the current checksums with the ones you saved:

```bash
cd /path/to/external/drive
md5sum -c checksums.md5
```

This will report any discrepancies between the current state of the files and their state when the checksums were generated. If any files are reported as FAILED, it means they have been altered or corrupted.

## Windows (Powershell)

**1. Compute and Store Hashes Initially**: When you first store your files, compute their hashes and save the information in a file.

```ps1
Get-ChildItem -Path "D:\MyPhotosAndVideos" -Recurse | Get-FileHash | Export-Csv -Path "D:\hashes.csv"
```

**2. Verify Hashes After a Year**: After a year, recompute the hashes and compare them with the previously stored hashes.

```ps1
$originalHashes = Import-Csv -Path "D:\hashes.csv"
$currentHashes = Get-ChildItem -Path "D:\MyPhotosAndVideos" -Recurse | Get-FileHash

foreach ($file in $currentHashes){
    $originalHash = $originalHashes | Where-Object { $_.Path -eq $file.Path }
    if ($file.Hash -ne $originalHash.Hash){
        Write-Host "File $($file.Path) has been modified or is corrupt."
    }
}
```
This script will output the paths of files that have changed or are potentially corrupt.
