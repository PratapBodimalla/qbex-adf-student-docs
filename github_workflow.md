
# Working with GitHub

## 1. Login to GitHub and Signup

## 2. Create a Repository

## 3. Install git in your local system

## 4. Install VSCODE (optional)

## 5. Develop / Build / Implement your application / code

## 6. Push the code to GitHub Repository with the following commands (execute these commands in command prompt):

```bash
echo "# qbex-student-api-app-BE" >> README.md
git init
git add README.md
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/PratapBodimalla/qbex-student-api-app-BE.git
git push -u origin main
```

## 7. How to push changes:
	
### a. Clone the repository

### b. Create new branch and checkout

```bash
git branch
git checkout -b <branchname>
git branch
```

### c. Check the status

```bash
git status
```

### d. Check the differences

```bash
git diff
```

### e. Add changes

```bash
git add .
```

### f. Check the status again

```bash
git status
```

### g. Commit the changes

```bash
git commit -m "second changes"
```

### h. Push the branch

```bash
git push origin <branch name>
```

### i. Create pull request

### j. Review file changes 

### k. Add comment and merge pull request

### l. Delete the branch (optional)

## Others:

```bash
git reset --hard HEAD~1
```
