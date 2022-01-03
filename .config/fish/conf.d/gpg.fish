set -gx GPG_TTY (tty)

switch (uname -s)
  case "Darwin"
    gpgconf --launch gpg-agent
end
