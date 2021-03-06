# Misc stuff
#
# Anders Logg, 2010-12-16

code_environments = [("\\begin{c++}",        "\\end{c++}"),
                     ("\\begin{python}",     "\\end{python}"),
                     ("\\begin{bash}",       "\\end{bash}"),
                     ("\\begin{uflcode}",    "\\end{uflcode}"),
                     ("\\begin{swigcode}",   "\\end{swigcode}"),
                     ("\\begin{progoutput}", "\\end{progoutput}"),
                     ("\\inputpython{",      "}"),
                     ("\\begin{xml}",        "\\end{xml}"),
                     ("\\begin{align}",      "\\end{align}"),
                     ("\\begin{align}",      "\\end{align}"),
                     ("\\begin{figure}[",    "]"),
                     ("\\begin{figure*}[",   "]"),
                     ("\\begin{multline}",   "\\end{multiline}"),
                     ("\\emp{",              "}"),
                     ("\\texttt{",           "}"),
                     ("\\citep{",            "}"),
                     ("\\citet{",            "}"),
                     ("\\citeauthor{",       "}"),
                     ("\\citeyear{",         "}"),
                     ("\\ref{",              "}"),
                     ("\\subref{",           "}"),
                     ("\\eqref{",            "}"),
                     ("\\label{",            "}"),
                     ("\\url{",              "}"),
                     ("\\import{",           ".pdf_tex}"),
                     ("\\includegraphics",   ".pdf}"),
                     ("\\includegraphics",   ".png}"),
                     ("%",                   "\n"),
                     ("%",                   "\n"),
                     ("\\langtangenidx{",    "}")]

# Special case...
code_environments.append(("\citet[Proposition~6.1, Section~VI.6]{", "}"))

def strip_code_environments(text):
    "String code environments from text"
    for begin, end in code_environments:
        if not begin in text:
            continue
        parts = text.split(begin)
        text = parts[0]
        for part in parts[1:]:
            subparts = part.split(end)
            text += end.join(subparts[1:])
    return text

def strip_text(text):
    "Remove newlines, whitespaces etc"
    text = text.replace("\n", " ")
    text = text.replace("\t", " ")
    while True:
        new_text = text.replace("  ", " ")
        if len(new_text) == len(text):
            break
        text = new_text
    return text
