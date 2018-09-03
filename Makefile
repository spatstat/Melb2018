LAB_RMD = $(wildcard labs/lab*.Rmd)
LAB_MD = $(patsubst %.Rmd, docs/%.md, $(LAB_RMD))
SOL_RMD = $(wildcard solutions/solution*.Rmd)
SOL_MD = $(patsubst %.Rmd, docs/%.md, $(SOL_RMD))

all: $(LAB_MD) $(SOL_MD)

docs/labs/lab%.md: labs/lab%.Rmd
	Rscript -e 'f <- rmarkdown::render("$<", output_format = rmarkdown::github_document(html_preview = FALSE)); file.rename(f, file.path("docs", "labs", basename(f)))'

docs/solutions/solution%.md: solutions/solution%.Rmd
	Rscript -e 'f <- rmarkdown::render("$<", output_format = rmarkdown::github_document(html_preview = FALSE)); file.rename(f, file.path("docs", "solutions", basename(f))); plot_dir <- sub(".md", f, replacement="_files", fixed=TRUE); if(dir.exists(plot_dir)){ plot_dir_docs <- file.path("docs", "solutions", basename(plot_dir)); unlink(plot_dir_docs, recursive = TRUE); file.rename(plot_dir, plot_dir_docs)}'

.PHONY: all clean
