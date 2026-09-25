# Put each document's build products in build/<document>/.
#
# latexmk has no placeholder for the output directory, so derive it from the
# .tex file named on the command line (CI invokes latexmk once per document).
# An explicit -outdir on the command line, as Overleaf and LaTeX Workshop pass,
# takes precedence over this.
my @tex = grep { !/^-/ && /\.tex$/ } @ARGV;
if (@tex == 1) {
    (my $doc = $tex[0]) =~ s{^.*/|\.tex$}{}g;
    $out_dir = "build/$doc";
} else {
    $out_dir = "build";
}
