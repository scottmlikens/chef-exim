Exim Cookbook
=========

[Exim][1] Exim is a message transfer agent (MTA) developed at the University of Cambridge for use on Unix systems connected to the Internet. It is freely available under the terms of the GNU General Public Licence. In style it is similar to Smail 3, but its facilities are more general. There is a great deal of flexibility in the way mail can be routed, and there are extensive facilities for checking incoming mail. Exim can be installed in place of Sendmail, although the configuration of Exim is quite different.

Overview
--------

* This cookbook configures exim4 as an internet site on Ubuntu.  No great configuration or anything.

Usage
--------

* Modify `recipes/default.rb` with the username and password to your *Sendgrid* Account 
* Add the recipe to your runlist and run chef.

Revisions
---------

- 0.0.1 - Initial
- 0.0.2 - Added SMTP Authentication
