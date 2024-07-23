<?php
/**
 * Recursively scan a directory and return an array of all file paths.
 *
 * @param string $dir Directory to scan.
 * @return array Array of file paths.
 */
function scanDirectory($dir) {
    $fileList = [];
    $items = scandir($dir);
    foreach ($items as $item) {
        if ($item === '.' || $item === '..') {
            continue;
        }

        $filePath = $dir . DIRECTORY_SEPARATOR . $item;
        if (is_dir($filePath)) {
            $fileList = array_merge($fileList, scanDirectory($filePath));
        } else {
            $fileList[] = $filePath;
        }
    }
    return $fileList;
}

/**
 * Main function to generate the file list.
 */
function generateFileList() {
    // Directory to scan
    $baseDir = __DIR__;
    
    // Get all files
    $allFiles = scanDirectory($baseDir);
    
    // Output file
    $outputFile = $baseDir . DIRECTORY_SEPARATOR . 'file_list.txt';
    
    // Write to output file
    file_put_contents($outputFile, implode(PHP_EOL, $allFiles));
    
    echo "File list has been generated: $outputFile\n";
}

// Run the script
generateFileList();
?>

