# SPARQLBench
SPARQLBench is a micro SPARQL benchmark creation framework which is able to create customized SPARQL benchmarks from real SPARQL query logs. The framework is flexible enough to generate benchmarks of varying sizes and according to the user-defined criteria on the most important SPARQL features to be considered for SPARQL query processing benchmarking. The generation of benchmarks is achieved by selecting prototypical queries (of a user-defined size and specialized selection criteria) using different clustering algorithms.

### Generating Benchmarks from CLI
Download the folder [SPARQLBench-CLI](https://github.com/dice-group/SPARQL-Bench/tree/master/SPARQLBench-CLI) which contains a runable jar and a comtomized benchmark generation query file personalized-query.txt. Note the spaqlbench requires the LSQ dataset endpoint URL to be provided as input. For now, we have provided Virtuoso 7.2 endpoint for Semantic Web Dog Food (SWDF) from [here](https://hobbitdata.informatik.uni-leipzig.de/sparql-bench/). More endpoints both for windowns and linux will be available soon. The Windows virtuoso endpoint can be started from bin/start.bt while linux can be started from bin/start_virtuoso.sh.  
From the folder run the following commands: 
```html
### DBSCAN+Kmeans++ Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -i <maxNoIterations> -t <noTrialRun> -e <endpointUrl> -q <queryPersonalized> -r <radius> -p <minPts> -o <outputFile>
An example format: 
java -jar spaqlbench.jar   -m db+km++   -n 10   -i 10   -t 10   -e http://localhost:8890/sparql   -q personalized-query.txt   -r 1   -p 1   -o db+km++-10supqueries-benchmark.ttl

### Kmeans++ Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -i <maxNoIterations> -t <noTrialRun> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar spaqlbench.jar   -m km++   -n 10   -i 10   -t 10   -e http://localhost:8890/sparql   -q personalized-query.txt   -o km++-10supqueries-benchmark.ttl


### FEASIBLE Format ### 
 java -jar saprqlbench.jar -m <method> -n <noQueries> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar spaqlbench.jar   -m feasible   -n 10  -e http://localhost:8890/sparql   -q personalized-query.txt   -o feasible-10supqueries-benchmark.ttl


### Agglomerative Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar spaqlbench.jar   -m agglomerative   -n 10  -e http://localhost:8890/sparql   -q personalized-query.txt   -o agglomerative-10supqueries-benchmark.ttl


### FEASIBLE-Exemplars Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar spaqlbench.jar   -m feasible-exmp   -n 10  -e http://localhost:8890/sparql   -q personalized-query.txt   -o feasible-exmp-10supqueries-benchmark.ttl


### Random Selection Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar spaqlbench.jar   -m random   -n 10  -e http://localhost:8890/sparql   -q personalized-query.txt   -o random-10supqueries-benchmark.ttl

Where

noQueries = Number of queries in the benchmark
maxNoIterations = Maximum number of iterations for the KMeans++ clustering algorithm. In our evaluation we used maxNoIterations = 10. 
noTrialRun = Number of trial run for the KMeans++ clustering algorithm. In our evaluation we used noTrialRun = 10.
endpointURL = The LSQ endpoint URL containing containment relationships as well
queryPersonalized = The personalized query for costum benchmark generation
radius = Radius for the queries to be considered as outliers. In our evaluation we used radius = 1
minPts = Minimum points or queries in a cluster. In our evaluation we used min. points = 1
outputFile = The output TTL file where the resulting benchmark will be printed

```
### LSQ Datasets
The LSQ datasets can be downloaded from [here](http://hobbitdata.informatik.uni-leipzig.de/lsq-dumps/)
### Complette Evaluation Results
Our complete evaluation results can be found [here](https://github.com/AKSW/spaqlbench/blob/master/spaqlbench-Evaluation-Results.xlsx)
### Authors
  * [Muhammad Saleem](https://sites.google.com/site/saleemsweb/) (AKSW, University of Leipzig) 
  * [Axel-Cyrille Ngonga Ngomo](http://aksw.org/AxelNgonga.html) (AKSW, University of Leipzig)
