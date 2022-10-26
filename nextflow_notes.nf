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


// #############  Syntax and Workflow  ###############
// Nextflow is a Domain Specific Languages (DSL), e.g., SQL is used to work with databases.
/* A workflow is made up of:
  - Processes: describe a task to be run. A process script can be written in any scripting language that can be executed by the Linux platform (Bash, Perl, Ruby, Python, etc.). One instance of a process per element in a channel. 
  - Channels: link Processes together by controlling the input and outputs.  

Nextflow scripts are exectuted with:
`nextflow run SCRIPT.nf`
*/

// nextflow is not sensitive to whitespace
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
println mylist.collect{ it+3 }
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



// #### Useful commands ####
println("list size is:  ${mylist.size()}")  // prints to screen/output/terminal. Uses Bash-type variable interpolation.



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
//  These can be overridden when executing a nextflow workflow with `--in <value>`

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
    /* Triple quote syntax """, Triple-single-quoted strings may span multiple lines. The content of the string can cross line boundaries without the need to split the string in several pieces and without concatenation or newline escape characters. */
    """
    printf '${read} '
    gunzip -c ${read} | wc -l
    """
}


// END OF EXAMPLE SCRIPT //


