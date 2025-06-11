# 1. Make sure your Heroku remote is set (only once)
git remote add heroku https://git.heroku.com/your-app-name.git

# 2. From your repo root, split out the todo_project into its own branch
git subtree split --prefix=RB175/todo_project -b deploy-branch

# 3. Push that branch to Heroku’s main
git push heroku deploy-branch:main

# 4. (Optional) Delete the temporary branch locally
git branch -D deploy-branch
