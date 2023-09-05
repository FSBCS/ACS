# Lecture Notes: Introduction to Git & GitHub

## I. Introduction

- **Git**: A distributed version control system that tracks changes to files and directories, facilitating project history and collaboration.

- **GitHub**: A platform hosting Git repositories, streamlining collaborative development, backup, and project sharing.

---

## II. Components of a Git Repository

1. **Working Directory**: 
   - Your active workspace with all project files.

2. **Staging Area**: 
   - An intermediary zone for changes to be committed.

3. **.git Directory (Repository)**: 
   - Core of Git; contains commit history and tracks changes.

---

## III. Fundamental Git Commands

1. **Initialization & Cloning**:
   - `git init`: Start a new repository.
   - `git clone [url]`: Clone a repository.

2. **File Management**:
   - `git add [file]`: Stage changes.
   - `git commit -m "message"`: Save staged changes.

3. **Repository Inspection**:
   - `git status`: View change status.
   - `git log`: View commit history.

4. **Remote Operations**:
   - `git pull origin [branch]`: Fetch changes from a remote repository.
   - `git push origin [branch]`: Push changes to a remote repository.

5. **Branch Operations**:
   - `git branch`: List branches.
   - `git branch [branch-name]`: Create a new branch.
   - `git checkout [branch-name]` OR `git switch [branch-name]`: Switch branches.
   - `git branch -d/-D [branch-name]`: Delete a branch (safely/forcefully).
   - `git branch -m [old-name] [new-name]`: Rename a branch.
   - `git merge [branch-name]`: Merge branches.

6. **Reset Operations**:
   - `git reset [--soft/--mixed/--hard] [commit]`: Reset to a specific commit. 
     - Soft: Moves HEAD, stages changes.
     - Mixed: Moves HEAD, unstages changes (default).
     - Hard: Moves HEAD, discards all changes.

---

## IV. GitHub as a Remote

1. **Setting Up**:
   - Create a new repository on GitHub.
   - Link the local repository using: `git remote add origin [Your-Repository-URL]`.

2. **Synchronization**:
   - Push with: `git push -u origin [branch-name]`.
   - Pull with: `git pull origin [branch-name]`.

3. **Collaboration**:
   - Use branches for features or fixes.
   - Open a Pull Request (PR) to suggest changes.
   - Review, modify, and merge PRs as necessary.

---

## V. Git Pointers: Navigating Commits

1. **HEAD**: 
   - Points to the current commit.
   - Represents the present in your repository's timeline.
   - Detached state: when HEAD points to a commit, not a branch.

2. **origin/[branch-name]**:
   - Refers to branches on the remote repository (`origin`).
   - `origin` is the default name for the remote after cloning.

3. **Additional Pointers**:
   - **Branch Pointers**: Reference specific commits and move with new commits.
   - **Tags**: Permanent references to specific commits.

---

## VI. Conclusion

Git and GitHub offer robust tools for software development and collaboration. With foundational knowledge, developers can efficiently manage projects, coordinate with teams, and maintain a rich record of project evolution. As one advances, more intricate Git functionalities await exploration, enhancing development capabilities and project management.

(Visualize Git)[https://git-school.github.io/visualizing-git/#cherry-pick]
