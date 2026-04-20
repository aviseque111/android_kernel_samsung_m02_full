#!/data/data/com.termux/files/usr/bin/bash
KERNEL_ORG_TAR="/storage/emulated/0/Download/linux-4.14.186.tar.xz"
TARGET_DIR="/storage/emulated/0/Download/linux-kernel"
TEMP_DIR="$TMPDIR/arm_merge_$$"

echo "Creating temporary directory at $TEMP_DIR..."
mkdir -p "$TEMP_DIR"

echo "Extracting file list from official kernel..."
tar -tf "$KERNEL_ORG_TAR" --wildcards "*/arch/arm/*" | sed 's|^[^/]*/||' > "$TEMP_DIR/arm_file_list.txt"

TOTAL_FILES=$(wc -l < "$TEMP_DIR/arm_file_list.txt")
echo "Found $TOTAL_FILES files in official arch/arm/."

cd "$TARGET_DIR"
MISSING_COUNT=0
ADDED_COUNT=0

while IFS= read -r file; do
    if [ ! -e "$file" ]; then
        MISSING_COUNT=$((MISSING_COUNT + 1))
        echo "Missing: $file"
        # Extract with verbose flag to see errors
        tar -xvJf "$KERNEL_ORG_TAR" --wildcards "*/$file" --strip-components=1 -C "$TARGET_DIR" 2>&1 | head -2
        if [ -e "$file" ]; then
            ADDED_COUNT=$((ADDED_COUNT + 1))
            echo "Added: $file"
        else
            echo "FAILED to add: $file"
        fi
    fi
done < "$TEMP_DIR/arm_file_list.txt"

echo "----------------------------------------"
echo "Total missing: $MISSING_COUNT"
echo "Successfully added: $ADDED_COUNT"
rm -rf "$TEMP_DIR"
