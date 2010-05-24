# $Id: README-repos.d 777 2010-05-17 02:17:25Z slakmagik $
# vim:set ft=:

In sbopkg parlance, a "repository" is a local or remote service used as a
source of scripts.  For example, slackbuilds.org is a repository.  The
builds.slamd64.com project is another repository.  Every repository has one or
more "branches".  Branches consist of a single tree of scripts.  For example,
slackbuilds.org has a 11.0 branch, a 12.0 branch and so on.

/etc/sbopkg/repos.d is a directory containing files defining the
sbopkg-supported repositories and branches.  All *.repo files are scanned in
alphabetical order.  Every line in a *.repo file defines a branch.  Each line
is compound of the following seven fields:

1.  REPOSITORY (a _short_ name identifying the repository)
2.  BRANCH (a _short_ name identifying the branch of that repository)
3.  DESCRIPTION (a <50 chars description, which _must_be_quoted_)
4.  TAG (the packages' tag)
5.  TOOL (rsync, git or "", is the tool able to check out the repository/branch)
6.  LINK (the tool-dependent link to the branch)
7.  CHECKGPG (whether the repo provides .asc signature files and signed
    tarballs that can be verified with GPG)

For example, one branch (line) of the sbo.repo file might look like this (note
the seven fields):

SBo 12.2 "SBo repository for Slackware 12.2" _SBo rsync slackbuilds.org::slackbuilds/12.2 GPG

If TOOL is set to "", then it will not be possible to automatically update the
branch (i.e., it has no upstream).  This is most commonly used for
locally-maintained repositories on the host filesystem that do not use rsync
or git to pull down the repository tree.  The LINK format is essentially what
is required to be passed to the specified TOOL.  In case of git links, it
_must_ be in the form url@branch.  If TOOL is "", LINK is ignored (but _must_
still be present).  CHECKGPG format can be "GPG" if the repo supports GPG
checking, or "" (which also must be present) if the repo does not support GPG
checks.

Lines _containing_ # are ignored when parsing the files.  Lines containing
backslashes (\) are not allowed.
