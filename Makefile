# Generate BC Election Turnout Project Report
# author: Kamal Moravej, Chad Neald, Rafael Pilliard Hellwig, Yuan Xiong
# date: 2020-12-01


# Make all targets
all : reports doc/images/cor_matrix.png doc/images/violin_plot.png README.md


# Download csv data from the URL
data/raw/provincial_voter_participation_by_age_group.csv data/raw/provincial_voting_results.csv : src/download_data.R
	Rscript src/download_data.R https://catalogue.data.gov.bc.ca/dataset/44914a35-de9a-4830-ac48-870001ef8935/resource/fb40239e-b718-4a79-b18f-7a62139d9792/download/provincial_voting_results.csv https://catalogue.data.gov.bc.ca/dataset/6d9db663-8c30-43ec-922b-d541d22e634f/resource/646530d4-078c-4815-8452-c75639962bb4/download/provincial_voter_participation_by_age_group.csv --path=data/raw

# cleaning the data set 
data/processed/bc_election_by_district.rds : data/raw/provincial_voter_participation_by_age_group.csv data/raw/provincial_voting_results.csv src/clean_data.r
	Rscript src/clean_data.R --pvr_input=data/raw/provincial_voting_results.csv --pvp_input=data/raw/provincial_voter_participation_by_age_group.csv --out_dir=data/processed

# Visualizing the scatter, violin and correlation plots. 
doc/images/cor_matrix.png doc/images/cow_plot.png doc/images/scatter_plot.png doc/images/violin_plot.png : src/make_figures.R data/processed/bc_election_by_district.rds
	Rscript src/make_figures.R --input=data/processed/bc_election_by_district.rds --out_dir=doc/images

# Running the cor.test() 
data/processed/cor_test.rds : src/perform_statistical_test.R data/processed/bc_election_by_district.rds
	Rscript src/perform_statistical_test.R --input=data/processed/bc_election_by_district.rds --out_dir=data/processed

# Rnder report - pdf, md, and html files.
doc/bc_election_turnout_report.md doc/bc_election_turnout_report.pdf doc/bc_election_turnout_report.html : doc/bc_election_turnout_report.Rmd  doc/images/cow_plot.png doc/images/scatter_plot.png data/processed/cor_test.rds eda/bc_election_turnout_files/figure-html/pvr.jpg eda/bc_election_turnout_files/figure-html/pvp.jpg doc/references.bib
	Rscript -e "rmarkdown::render('doc/bc_election_turnout_report.Rmd', output_format = 'all', quiet = TRUE)"

# Generating Readme
README.md :  README.Rmd doc/images/scatter_plot.png doc/references.bib
	Rscript -e "rmarkdown::render('README.Rmd', quiet = TRUE)"

# Create a target defining all reports
reports : doc/bc_election_turnout_report.md doc/bc_election_turnout_report.pdf doc/bc_election_turnout_report.html

# Clear all make targets
clean: 
	rm -rf data/raw
	rm -rf data/processed
	rm -rf doc/images
	rm README.md
	rm -rf doc/bc_election_turnout_report.md doc/bc_election_turnout_report.pdf doc/bc_election_turnout_report.html doc/bc_election_turnout_report.tex
