import os
import sys

os.system("echo $(snow --config-file config.toml connection test) >> result.log")

os.system(f"echo $(snow --config-file config.toml object stage copy {sys.argv[2]} {sys.argv[3]} --overwrite) >> result.log")

#os.walk(top, topdown=True, onerror=None, followlinks=False)
os.system("""
{
    echo 'LOG_SNOWCLI_STAGE_UPDATE<<EOF'
    echo &(cat result.log)
    echo EOF
} >> "$GITHUB_ENV"
""")

for subdir, dirs, files in os.walk(rootdir):
    for file in files:
        #print os.path.join(subdir, file)
        filepath = subdir + os.sep + file

        if filepath.endswith(".asm"):
            print (filepath)