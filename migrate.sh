#!/bin/bash

# Instructions to install GitLab CLI
# 1. Download the latest release from https://github.com/profclems/glab/releases
# 2. Extract the downloaded file and move the 'glab' binary to /usr/local/bin or any directory in your PATH.
# 3. Verify the installation by running 'glab --version' in the terminal.

# Instructions to run this script
# 1. Save this script as 'migrate.sh'.
# 2. Open a terminal and navigate to the directory where 'migrate.sh' is located.
# 3. Run 'chmod +x migrate.sh' to make the script executable.
# 4. Run './migrate.sh' to execute the script.

# Archive your GitLab Repos afte migrating

# Please replace 'gitlab_username' with your GitLab username and 'github_username' with your GitHub username.
gitlab_username="gitlab_username"
github_username="github_username"

# List of GitLab project URLs
projects=(
      "https://gitlab.com/$gitlab_username/sunday-funday"
    # ... add more project URLs here
)

# Loop through each project URL
for project_url in "${projects[@]}"; do
  # Extract the project name from the URL
  repo_name=$(basename "$project_url" .git)
  
  echo "Migrating project: $repo_name"

  # Clone the project from GitLab
  echo "Cloning project from GitLab..."
  git clone --mirror "$project_url"

  # Change into the cloned project directory
  cd "$repo_name.git" || exit

  # Create a new repository on GitHub using GitHub CLI
  echo "Creating new repository on GitHub..."
  gh repo create "$github_username/$repo_name" --public -y

  # Push the project data to the new GitHub repository
  echo "Pushing project data to GitHub..."
  git push --mirror "https://github.com/$github_username/$repo_name.git"

  # Change back to the parent directory
  cd ..

  # Remove the cloned project directory
  echo "Removing cloned project directory..."
  rm -rf "$repo_name.git"

  echo "Migration of $repo_name completed."
done

echo "Migration of all projects completed."

