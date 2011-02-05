README-repos.d

In sbopkg parlance, a "repository" is a local or remote service used as
a source of SlackBuilds. For example, slackbuilds.org is a repository.
The builds.slamd64.com project is another repository. Every repository
has one or more "branches". Branches consist of a single tree of scripts
in a category/application hierarchy. For example, slackbuilds.org has a
11.0 branch, a 12.0 branch and so on.

/etc/sbopkg/repos.d is a directory containing files defining the
repositories and branches sbopkg will use. All *.repo files are scanned
in alphabetical order. Every line in a *.repo file defines a branch
except those _containing_ a '#' which are ignored. Lines containing
backslashes (\) are not allowed.

Each line contains the following seven fields (if a field is not
applicable, it still _must_ be present in the form of an empty quote
(""):

1. REPO
    A _short_ name identifying the repository; e.g., 'SBo'.
2. BRANCH
    A _short_ name identifying the branch of that repository; e.g.,
    '11.0'.
3. DESCRIPTION
    A description of the repo, which _must be quoted_ and must be less
    than 50 characters long; e.g., '"SBo repository for Slackware
    11.0"'.
4. TAG
    The tag the built packages will have; e.g., '_SBo'.
5. TOOL
    The tools used to download the repository/branch. The currently
    supported value is 'rsync'. Using 'git' is also possible. Local
    repos will have an empty quote. If this field is an empty quote, it
    will not be possible to automatically update the branch (i.e., it
    has no upstream).
6. LINK
    The link (URL) to the branch that the TOOL will use. Local repos
    will have an empty quote. In the case of git links, it _must_ be in
    the form url@branch.
7. CHECKGPG
    Filled with 'GPG' if the repo provides .asc signature files and
    signed tarballs that can be verified with GPG, and an empty quote
    otherwise.

For example, one branch (line) of the sbo.repo file looks like this
(note the seven fields):

SBo 11.0 "SBo repository for Slackware 11.0" _SBo rsync slackbuilds.org::slackbuilds/11.0 GPG
