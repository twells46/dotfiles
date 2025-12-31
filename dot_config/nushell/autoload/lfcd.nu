alias lf-default = lf
def --env --wrapped lf [...argv] {
    cd (lf-default -print-last-dir ...$argv)
}
