# SPARQLBench
SPARQLBench is a micro SPARQL benchmark creation framework which is able to create customized SPARQL benchmarks from real SPARQL query logs. The framework is flexible enough to generate benchmarks of varying sizes and according to the user-defined criteria on the most important SPARQL features to be considered for SPARQL query processing benchmarking. The generation of benchmarks is achieved by selecting prototypical queries (of a user-defined size and specialized selection criteria) using different clustering algorithms.

### Generating Benchmarks from CLI
Download the folder [SPARQLBench-CLI](https://github.com/dice-group/SPARQL-Bench/tree/master/SPARQLBench-CLI) which contains a runable jar and a comtomized benchmark generation query file `personalized-query.txt`. Note that SPARQLBench requires the LSQ dataset endpoint URL to be provided as input. Existing LSQ endpoints are available from [here](https://hobbitdata.informatik.uni-leipzig.de/sparql-bench/lsq-endpoints/). More endpoints both for Windows and Linux will be available soon. The Windows Virtuoso endpoint can be started from `bin/start.bat` while Linux can be started from `bin/start_virtuoso.sh`.  
From the folder run the following commands: 
```html
### DBSCAN+Kmeans++ Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -i <maxNoIterations> -t <noTrialRun> -e <endpointUrl> -q <queryPersonalized> -r <radius> -p <minPts> -o <outputFile>
An example format: 
java -jar sparqlbench.jar   -m db+km++   -n 10   -i 10   -t 10   -e http://localhost:8890/sparql   -q personalized-query.txt   -r 1   -p 1   -o db+km++-10supqueries-benchmark.ttl

### Kmeans++ Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -i <maxNoIterations> -t <noTrialRun> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar sparqlbench.jar   -m km++   -n 10   -i 10   -t 10   -e http://localhost:8890/sparql   -q personalized-query.txt   -o km++-10supqueries-benchmark.ttl


### FEASIBLE Format ### 
 java -jar saprqlbench.jar -m <method> -n <noQueries> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar sparqlbench.jar   -m feasible   -n 10  -e http://localhost:8890/sparql   -q personalized-query.txt   -o feasible-10supqueries-benchmark.ttl


### Agglomerative Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar sparqlbench.jar   -m agglomerative   -n 10  -e http://localhost:8890/sparql   -q personalized-query.txt   -o agglomerative-10supqueries-benchmark.ttl


### FEASIBLE-Exemplars Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar sparqlbench.jar   -m feasible-exmp   -n 10  -e http://localhost:8890/sparql   -q personalized-query.txt   -o feasible-exmp-10supqueries-benchmark.ttl


### Random Selection Format ### 
 java -jar sparqlbench.jar -m <method> -n <noQueries> -e <endpointUrl> -q <queryPersonalized> -o <outputFile>
An example format: 
java -jar sparqlbench.jar   -m random   -n 10  -e http://localhost:8890/sparql   -q personalized-query.txt   -o random-10supqueries-benchmark.ttl

Where

noQueries = Number of queries in the benchmark
maxNoIterations = Maximum number of iterations for the KMeans++ clustering algorithm. In our evaluation we used maxNoIterations = 10. 
noTrialRun = Number of trial run for the KMeans++ clustering algorithm. In our evaluation we used noTrialRun = 10.
endpointURL = The LSQ endpoint URL containing containment relationships as well
queryPersonalized = The personalized query for custom benchmark generation
radius = Radius for the queries to be considered as outliers. In our evaluation we used radius = 1
minPts = Minimum points or queries in a cluster. In our evaluation we used min. points = 1
outputFile = The output TTL file where the resulting benchmark will be printed

```
### Generating Benchmarks from Source 
Download the source code from [here](https://hobbitdata.informatik.uni-leipzig.de/sparql-bench/source-code/). Unzip the folder which contains 4 Java projects: Agglomerative, commons-math3, FEASIBLE, SPARQLBench-Generator. SPARQLBench-Generator is the main project from where benchmarks can be generated. Note this project requires the other 3 projects to be included in the build path. Also all the Jar files in the `lib` folder of FEASIBLE and Agglomerative need to be added into the main project.
```
//Generate KMeans++ benchmarks from 
package org.aksw.simba.sparqlbench.centroid
public class KmeansPlusPlus 

//Generate DBSCAN+KMeans++ benchmarks from 
package org.aksw.simba.sparqlbench.hybrid
public class DbscanAndKMeansPluPlus 

//Generate FEASIBLE benchmarks from 
package org.aksw.simba.sparqlbench.feasible
public class FEASIBLEClustering 

//Generate FEASIBLE-Exemplars benchmarks from 
package org.aksw.simba.sparqlbench.feasible
public class FeasibleExemplars

//Generate Random selection benchmarks from 
package org.aksw.simb.sparqlbench.random
public class RandomSelection

//You can also generate Agglomerative benchmarks from 
package org.aksw.simba.sparqlbench.hierarchical
public class Agglomerative
However, Agglomerative clustering does not allow to generate fix number of clusters
```
### LSQ Datasets
The LSQ datasets can be downloaded from [here](https://hobbitdata.informatik.uni-leipzig.de/lsq-dumps/1.0.1/).

#### Load a LSQ Dataset via dockerized Virtuoso
You can also use a dockerized Virtuoso to load the dataset. Make sure Docker is installed on your system and you are in the [docker group](https://docs.docker.com/install/linux/linux-postinstall/).

First, download and extract a LSQ dataset, e.g. [dbpedia-20160117](https://hobbitdata.informatik.uni-leipzig.de/lsq-dumps/1.0.1/lsq.1_0_1.2017-12-21.dbpedia-20160117.qel.sorted.nt.bz2):
 ```shell script
sh 01-download_and_extract_lsq_dataset.sh "https://hobbitdata.informatik.uni-leipzig.de/lsq-dumps/1.0.1/lsq.1_0_1.2017-12-21.dbpedia-20160117.qel.sorted.nt.bz2"
```
Second, start the Virtuoso endpoint using Docker:
```shell script
sh 02-start_lsq_endpoint.sh
```
The LSQ endpoint is running now at http://127.0.0.1:8890/sparql. 
### Authors
  * [Muhammad Saleem](https://sites.google.com/site/saleemsweb/) (AKSW, University of Leipzig) 
  * [Axel-Cyrille Ngonga Ngomo](http://aksw.org/AxelNgonga.html) (AKSW, University of Leipzig)
