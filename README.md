## Migration Script

This section contains a Bash script that facilitates the migration of your projects from GitLab to GitHub. Here's a step-by-step breakdown of the script and how to use it:

### Prerequisites

Before running the script, ensure that you have the GitLab CLI tool `glab` installed on your system. You can download it from the [official releases page](https://github.com/profclems/glab/releases) and follow the installation instructions mentioned in the script comments.

### Script Breakdown

The script performs the following operations in a loop for each project URL specified in the `projects` array:

1. **Extracts the Project Name**: It extracts the project name from the URL to use it in subsequent steps.
   
2. **Clones the Project from GitLab**: The script clones the project repository from GitLab using the `git clone --mirror` command, which creates a bare repository with a complete mirror of the data.

3. **Creates a New Repository on GitHub**: Using the GitHub CLI tool `gh`, it creates a new repository on GitHub with the extracted project name.

4. **Pushes the Project Data to GitHub**: The script pushes the mirrored data to the new GitHub repository using the `git push --mirror` command.

5. **Cleans Up**: After successfully pushing the data to GitHub, it removes the cloned project directory to clean up the local system.

### Usage Instructions

To use the script, follow these steps:

1. Save the script as `migrate.sh`.
2. Open a terminal and navigate to the directory where `migrate.sh` is located.
3. Run `chmod +x migrate.sh` to make the script executable.
4. Run `./migrate.sh` to execute the script.

### Customization

Before running the script, replace `gitlab_username` and `github_username` with your respective GitLab and GitHub usernames. Also, populate the `projects` array with the URLs of the GitLab projects you want to migrate.

### Conclusion

This script provides a seamless way to migrate your projects from GitLab to GitHub, archiving them on GitLab after successful migration. It showcases the ability to automate repetitive tasks using Bash scripting, making the migration process efficient and error-free.

