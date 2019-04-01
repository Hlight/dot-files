
---
### Remove .gitignore files from repo:
Recursive Command to remove ".gitignore" files from repository but keep local copies:
`git rm --cached .gitignore` --cached option keeps local untracked file.
'git rm --cached $0' the $0 is filename placeholder for find command.
```bash
find . -name '.gitignore' -exec bash -c 'git rm --cached $0' {} \;
```
---