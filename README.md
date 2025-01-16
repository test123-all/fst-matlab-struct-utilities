<!-- heading declaration and main RDFa data declaration in HTML-->
<div xmlns:schema="https://schema.org/" typeof="schema:SoftwareSourceCode" id="software-1">
   <h1 property="schema:name">FST matlab struct utilities</h1>
   <meta property="schema:codeRepository" content="https://github.com/test123-all/fst-matlab-struct-utilities">
   <meta property="schema:codeSampleType" content="full solution">
   <meta property="schema:license" content="https://opensource.org/license/mit">
   <meta property="schema:programmingLanguage" content="Matlab">
   <h2>Introduction:</h2>
   <p property="schema:description">
      This is the repository of the FST matlab struct utilities, a Mathworks Matlab package that consists of some helper
      functions to be able to work easier and more effective with larger and highly nested Matlab structs.
   </p>
</div>


<b>DISCLAIMER:</b> <br>
This software in its current version is in an early proof of concept phase and used in the
https://preprints.inggrid.org/repository/view/40/ paper and contributed to the results mentioned in the paper.<br>
<br>
Since this software is in an early proof of concept phase it is not commented out comprehensively yet,
the functional segregation isn't good and in conclusion the function and variable names might be subject to
significant change in the future. Therefore, the backwards compatibility of the API won't be granted for now. <br>
<br>
Please note that we are no longer able to provide an exact time span for the refactoring work at this time, as the
German government has recently reduced funding for scientific purposes overall, leaving the future of all sciences
somewhat uncertain. Thank you very much for your understanding. <br>


## How to use this package?:
```matlab
%% Combine structs
sub_struct1 = struct('substruct1', 1, 'substruct2', 2, 'substruct3', 3);
sub_struct2 = struct('substruct4', 4, 'substruct5', 5);
struct1 = struct('field1', 1, 'field2', sub_struct1, 'field3', 3);
struct2 = struct('field2', sub_struct2, 'field4', 4);

expected_output_sub_struct = struct('substruct1', 1, 'substruct2', 2, 'substruct3', 3, 'substruct4', 4, 'substruct5', 5);
expected_output_struct = struct('field1', 1, 'field2', expected_output_sub_struct, 'field3', 3, 'field4', 4);

output_struct = combineStructs(struct1, struct2);

% output_struct and expected_output_struct are the same


%% Set a value inside a nested struct with a struct path
struct1 = struct('field1', 1, 'field3', 3);

output_struct = setValueInsideNestedStructWithPath(struct1, '.field2.sub1.subsub1.subsubsub1', 5);

expected_output_struct = struct1;
expected_output_struct.field2.sub1.subsub1.subsubsub1 = 5;

% output_struct and expected_output_struct are the same


%% Get a value inside a nested struct with a struct path
struct3 = struct('sub1', 1, 'sub2', 2, 'sub3', 4);
struct2 = struct('test_field1', 1, 'testfield2', struct3);
struct1 = struct('field1', 1, 'field2', struct2, 'field3', 3);

[output_value, error_flag] = getValueInsideNestedStructWithPath(struct1, '.field2.testfield2.sub3');

% The output_value is in this case 4
```

## Possible Improvements:
The following list includes possible improvements that have been identified up to this version and is non-exhaustive:
1. TODO: Refactoring of the code and tests


## Dependencies:
This repository uses no third party dependencies.

The license choice is the MIT License (https://opensource.org/license/mit)


<!-- maintainer- and creator- RDFa data declaration in HTML-->
<div xmlns:schema="https://schema.org/" about="#software-1">
    <h2>Current Maintainer[s]:</h2>
    <div typeof="schema:Person">
        <strong property="schema:givenName">Sebastian</strong>
        <strong property="schema:familyName">Neumeier</strong>
        <strong>(<a href="https://orcid.org/0000-0001-9533-9004" property="schema:identifier">https://orcid.org/0000-0001-9533-9004</a>)</strong>
        <span property="schema:email">sebastian.neumeieratstud.tu-darmstadt.de</span>
    </div>
    <h2>Authors:</h2>
    <p xmlns:dcterms="http://purl.org/dc/terms/">The first scripts in this repository used to generate usable datasets
        were originally created in
        <span property="dcterms:date" content="2023-10-01">October 2023</span>,
        <span property="dcterms:date" content="2023-10-01">November 2023</span>
        and
        <span property="dcterms:date" content="2023-10-01">December 2023</span>
        by:
    </p>
    <div typeof="schema:Person">
        <strong property="schema:givenName">Sebastian</strong>
        <strong property="schema:familyName">Neumeier</strong>
        <strong>(<a href="https://orcid.org/0000-0001-9533-9004" property="schema:identifier">https://orcid.org/0000-0001-9533-9004</a>)</strong>
        , <span property="schema:affiliation">
            Chair of Fluid Systems at Technical University of Darmstadt
            (<a href="https://ror.org/05n911h24">https://ror.org/05n911h24</a>)
        </span>
        : <span property="schema:role">Conceptualization, Implementation, Documentation</span>.
    </div>
    <div typeof="schema:Person">
        <strong property="schema:givenName">Manuel</strong>
        <strong property="schema:familyName">Rexer</strong>
        <strong>(<a href="https://orcid.org/0000-0003-0559-1156" property="schema:identifier">https://orcid.org/0000-0003-0559-1156</a>)</strong>
        , <span property="schema:affiliation">
            Chair of Fluid Systems at Technical University of Darmstadt
            (<a href="https://ror.org/05n911h24">https://ror.org/05n911h24</a>)
        </span>
        : <span property="schema:role">Project Manager, Provider of Use Cases that lead to the need of better struct utilities in Mathworks Matlab and the creation of this package, Supervision</span>.
    </div>
</div>


## Additional Ressources:
This software is somehow connected to the following paper[s] or contributed to the results of the following papers:
<ol>
   <li>
       <div>
           <strong>
               <span property="schema:name">How to Make Bespoke Experiments FAIR: Modular Dynamic Semantic Digital Twin and Open Source Information Infrastructure</span>
               <span>(</span>
               <a property="schema:relatedLink" href="https://preprints.inggrid.org/repository/view/40/" typeof="schema:Article">
                   <span>https://preprints.inggrid.org/repository/view/40/</span>
               </a>
               <span>)</span>
           </strong>
           <span>(January 2025, currently only available as a preprint.)</span>
       </div>
   </li>
</ol>
