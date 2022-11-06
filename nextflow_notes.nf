// #############  Nextflow notes  ##############
// https://carpentries-incubator.github.io/workflows-nextflow/aio/index.html
/* Nextflow is its own DSL (Domain Specific Language)
 Advantages:
  Fast protyping – let’s you write a computational pipeline from smaller tasks
  Reproducibility – supports Docker and Singularity containers
  Portable – can run locally, Slurm, SGE, PBS, and cloud (Google, Kubernetes and AWS)
  Unified parallelism – can process chunks through the entire pipeline (QC -> align -> call snps)
  Continuous checkpoints – each chunk and process it goes through is checkpointed
  Stream oriented – promotes programming approach extending Unix pipes model.
*/


// #############  Workflow  ###############
// Nextflow is a Domain Specific Languages (DSL), e.g., SQL is used to work with databases.
/* A workflow is made up of:
  - Processes: describe a task to be run. A process script can be written in any scripting language that can be executed by the Linux platform (Bash, Perl, Ruby, Python, etc.). A task is when one instance of a process is run for one element/item in a channel. 
  - Channels: link Processes together though their inputs and outputs. 


// ####  Processes  ####


// #### Channels #### 

/* Channels link processes and control the data.
 Two types of channels:
 - A queue (CONSUMABLE) channels is used to store multiple values.
 - A value (REUSABLE) channel is used to store a single value/object: this can be a list with multiple values, eg. a reference genome sequence file that is required by multiple steps within a process, or by more than one process.

// ####  Queue channels  ####

// .fromPath returns files (default) or directories that match the glob. checkIfExists is False by default.
myFileChannel = Channel.fromPath( '/data/some/bigfile.txt', checkIfExists:true)
myFileChannel = Channel.fromPath( '/data/big/*.txt' )  // *glob can be used, doesn't include hidden files.
myDirChannel = Channel.fromPath( '/data/dir*' , type = 'dir' )  // type can be used to find 'file' 'dir' or 'any' - default is 'file'
Channel.fromFilePairs('/my/data/SRR*_{1,2}.fastq')  // creates a list of tuples: [SRR493366, [/my/data/SRR493366_1.fastq, /my/data/SRR493366_2.fastq]]

// .watchPath By default it watches only for new files created in the specified folder. Can watch for 'create' 'modify' 'delete'myFileChannel = Channel.watchPath( '/path/*.fa', 'create,modify')

// Run process x times, and link to these files: Use Channel.from() method to define the range over which to repeat the task execution, then chain it with the Channel.map() operator to associate each index with the corresponding input files. Finally, use the resulting channel as input for the process. see https://nextflow-io.github.io/patterns/process-per-file-range/

// If one process outputs more than one file




// #### Executing scripts ####
Nextflow scripts are exectuted with:
`nextflow run SCRIPT.nf`
nextflow run wc-params.nf --sleep 10
*/



// #############  Syntax  ################
// ####  Key Points  ####

// - nextflow is not sensitive to whitespace


// ####  Variables  ####
/* Variables can be an integer, float, string or Boolean. They are defined with `=`. 
Strings are defined with "quotes" (read special characters eg. "$bashvar" would be read as the content of the variable) or /slashes/ (which ignore special characters EXCEPT FOR $VARIABLES), or 'single quotes' (which ignore all special characters, eg. \* etc, would print $bashvar as a string of characters). 


// ####  Lists  ####
// Lists or arrays are defined with []. Indexing starts at 0. Negative indexes go back from the end of the array. To define a range use `myarray[<num1>..<num2>]`.
println mylist.get(1)  // print 2nd element in list.
println(mylist.size())  // print no. elements in list.
mylist = [1,2,3]
println mylist
println mylist + [1]  // add element
println mylist - [1]  // take away element at index.
println mylist * 2
println mylist.reverse()
println mylist.collect({ it+3 })  // IMPORTANT: iterates over a list and can take a closure/expression, or a variable with a closure assigned to it (see closure section)
println mylist.unique().size()
println mylist.count(1)
println mylist.min()
println mylist.max()
println mylist.sum()
println mylist.sort()
println mylist.find{it%2 == 0}
println mylist.findAll{it%2 == 0}

// #### Maps (Dictionaries) #### 
// Like python dictionaries. Defined in [] like a list, with multiple values are separated by a comma. Note: the key value is not enclosed in quotes, BUT when retrieving the value of a key is encosed in quotes:
roi = [ chromosome : "chr17", start: 7640755, end: 7718054, genes: ['ATP1B2','TP53','WRAP53']]
println(roi['chromosome'])

// ####  Closures (like functions)  ####
// A closure is a block of code/expression/funtion that can be passed as an argument to a function. They are enclosed in `{}`, and use the default variable `it`, but other variables can be defined. eg. 
square_it = { it * it }
multipy_vals = { value1, value2 -> value1 * value2 }  // { parameters -> expression/function } 

// Some methods can take closures
x = [ 1, 2, 3, 4 ]
y = x.collect(square)
println(y)  // returns: [ 1, 4, 9, 16 ]


// #### Useful commands ####
println("list size is:  ${mylist.size()}")  // prints to screen/output/terminal. Uses Bash-type variable interpolation.



// ##############  Script Structure  ###############

/* EXAMPLE SCRIPT Structure: 
1. #!/usr/bin/env nextflow
2. Define parameters
3. Define workflow (input channel, process and input channel, process output channel)
4. Define processes (input, output, script) 
*/



//  EXAMPLE SCRIPT:  //

#!/usr/bin/env nextflow
// Use updated syntax: DSL2
nextflow.enable.dsl=2

/*  Comments are uninterpreted text included with the script.
    They are useful for describing complex parts of the workflow
    or providing useful information such as workflow usage.

    Usage:
       nextflow run wc.nf --input <input_file>

    Multi-line comments start with a slash asterisk /* and finish with an asterisk slash. 
*/
//  Single line comments start with a double slash // and finish on the same line


//  Workflow default parameters are written as params.<parameter> and can be initialised using the `=` operator.
//  These can be overridden when executing a nextflow workflow with `--<parameter> <value>`.

params.input = "data/yeast/reads/ref1_1.fq.gz"
//params.output = "something"


//  The default workflow: defines input channel (using previously defined parameters), defines process and its input channel, defines process output channel.
workflow {

    //  Input data is received through channels
    input_ch = Channel.fromPath(params.input)

    /*  The script to execute is called by its process name,
        and input is provided between brackets. */
    NUM_LINES(input_ch)

    /*  Process output is accessed using the `out` channel.
        The channel operator view() is used to print
        process output to the terminal. */
    NUM_LINES.out.view()
}


/*  A Nextflow process block
    Process names are written, by convention, in uppercase.
    This convention is used to enhance workflow readability. */
process NUM_LINES {

    input:
    path read

    output:
    stdout

    script:
    /* Bash by default. Triple quote syntax """, Triple-single-quoted strings may span multiple lines. The content of the string can cross line boundaries without the need to split the string in several pieces and without concatenation or newline escape characters. */
    """
    printf '${read} '
    gunzip -c ${read} | wc -l
    """
}


// END OF EXAMPLE SCRIPT //



// ####  Parameter files  #### 
// Contains parameters and written in JSON or YAML format. The -params-file option is used to pass the parameters file to the script.
// Excuted with:
$ nextflow run wc-params.nf -params-file wc-params.json


// EXAMPLE PARAMETER FILE //

{
  "sleep": 5,
  "input": "data/yeast/reads/etoh60_1*.fq.gz"
}

// END OF PARAMETER FILE EXAMPLE //




// Modular structure //

include { SCRNASEQ } from './workflows/scrnaseq'



// ###################################
//     Configuration files
// ###################################

Settings in a configuration file are sets of name-value pairs (name = value). The name is a specific property to set, while the value can be anything you can assign to a variable (see nextflow scripting), for example, strings, booleans, or other variables. It is also possible to access any variable defined in the host environment such as $PATH, $HOME, $PWD, etc.

// "dot" notation:
params.input = ''             // The workflow parameter "input" is assigned an empty string to use as a default value
params.outdir = './results'   // The workflow parameter "outdir" is assigned the value './results' to use by default.
// "brace notation:
params {
    input  = ''
    outdir = './results'
}

Parameters starting with a single dash - (e.g., -c my_config.config) are configuration options for nextflow, while parameters starting with a double dash -- (e.g., --outdir) are workflow parameters defined in the params scope: params.outdir in the .nf script can be altered via the command line with a --outdir. Overrides config and default value in the .nf script.

The majority of Nextflow configuration settings must be provided on the command-line, however a handful of settings can also be provided within a configuration file, such as workdir = '/path/to/work/dir' (-w /path/to/work/dir) or resume = true (-resume), and do not belong to a configuration scope.




// ###################################
//     Docker
// ###################################

To use Docker, we must provide a container image path using the process.container directive, and also enable docker in the docker scope, docker.enabled = true. A container image path takes the form (protocol://)registry/repository/image:version--build. By default, Docker containers run software using a privileged user. This can cause issues, and so it is also a good idea to supply your user and group via the docker.runOptions.


