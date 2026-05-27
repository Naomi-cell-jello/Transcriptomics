
## Inhoud/structuur





## Inleiding


Rheumatoïde artritis is een chronische auto-immuunziekte die wordt gekenmerkt door ontsteking van de gewrichten. Deze ontstekingen kunnen leiden tot blijvende gewrichtsschade en verminderde functionaliteit. De exacte oorzaak van Reuma is nog niet volledig bekend (Feldmann & Maini, 1999). Maar vermoedelijk is het een gevolg van een combinatie van genetische factoren, omgevingsfactoren én een verstoord immuunsysteem. 
Omdat er momenteel geen genezing bestaat voor reuma is het belangrijk om meer inzicht te krijgen in het moleculaire mechanisme van de ziekte. Transcriptomics biedt mogelijkheid om genexpressiepatronen te analyseren en een verschil tussen gezond en ziek weefsel te identificeren (Conesa et al., 2016). Hierdoor kunnen betrokken genen en pathways worden getraceerd. In deze analyse wordt RNA-sequentie data geanalyseerd van patiënten met reuma en controles zonder reuma. Het doel van deze analyse is om differentieel tot expressie gebrachte genen te identificeren en te onderzoeken welke Gene Ontology-termen en KEGG pathways betrokken zijn bij de ziekte.

## Methode

In dit onderzoek werd RNA-seq data geanalyseerd van in totaal acht weefsels, afkomstig van vier gezonde controles en vier patiënten met rheumatoïde artritis. De ruwe sequencing reads werden eerst gemapt naar het humane referentiegenoom (GRch38) met behulp van het Rsubread package in R. Vervolgens werd met featureCounts het aantal reads per gen bepaald, wat resulteerde in een count matrix. 

Differentiële genexpressie tussen de controlegroep en de RA-groep werd geanalyseerd met behulp van het DESeq2 package. Hierbij werden genen met aangepaste p-waarde (padj) <0.05 als significant beschouwd. Om betekenis te geven aan de tot expressie gebrachte genen, werd een Gene Ontology (GO) analyse uitgevoerd met behulp van clusterProfiler (Carbon et al., 2021). Hiermee konden genen worden gegroepeerd op basis van hun betrokkenheid bij biologische processen. Daarnaast werd een KEGG pathway analyse uitgevoerd om inzicht te krijgen in welke signaalroutes en pathways betrokken zijn bij reuma. Het werkschema van de analyse is weergegeven in figuur 1. 

<p align="center">
![Workflow](Figuren/Workflow1.png)
</p>


**Figuur 1. Weergave van de workflow. **

## Resultaten

De differentiële genexpressie analyse met behulp van DESeq2 toonde aan dat er duidelijke verschillen bestaan in genexpressie tussen patiënten met reumatoïde artritis en gezonde controles. Een groot aantal genen werd significant verschillend tot expressie gebracht (padj < 0.05), wat zichtbaar is in de volcano plot (Figuur 2). 
<p align="center">
<img src="Figuren/volcano_plot.png" alt="Volcanoplot" width="600"/>


**Figuur 2. Volcano plot differentiële genexpressie.**

De plot toont de log2 fold change tegenover de aangepaste p-waarde (padj) 
voor alle genen. Significant op- en neer gereguleerde genen zijn zichtbaar, 
wat wijst op duidelijke verschillen in genexpressie tussen reumatoïde artritis 
en controle samples.
</p>


Zowel opgereguleerde als neer gereguleerde genen werden geïdentificeerd, wat wijst op veranderingen in verschillende biologische processen.
De Gene Ontology (GO) analyse liet zien dat de differentieel tot expressie gebrachte genen voornamelijk betrokken zijn bij immuun-gerelateerde biologische processen. De meest verrijkte processen omvatten onder andere leukocyte mediated immunity, lymphocyte mediated immunity, T-cell differentiation en B-cell activation (Figuur 3). 
<p align="center">
<img src="Figuren/GO_plot.png" alt="GO_plot" width="600"/>
</p>

**Figuur 3. Verrijking GO-proces bij reumatoïde artritis.**

De plot toont de meest verrijkte biologische processen gebaseerd op differentieel tot expressie gebrachte genen tussen reumatoïde artritis en controlegroepen. Opvallend is dat vooral immuun-gerelateerde processen verrijkt zijn, zoals leukocyten- en lymfocyten-gemedieerde immuniteit, T-cel differentiatie en B-cel activatie. Dit wijst op een verhoogde activiteit van het immuunsysteem, wat kenmerkend is voor reumatoïde artritis.


Deze processen wijzen op een verhoogde activiteit van zowel het aangeboren als het adaptieve immuunsysteem.
De KEGG pathway analyse bevestigde deze bevindingen door de identificatie van relevante immuun-gerelateerde pathways (Yu et al., 2022), zoals cytokine–cytokine receptor interaction en de JAK-STAT signaling pathway (Figuur 4).

<p align="center">
<img src="Figuren/kegg_pathway_plot.png" alt="KEGG_pathway" width="600"/>
</p>

**Figuur 4. Kegg pathway plot.**

Deze plot toont de meest verrijkte pathways. Immuun-gerelateerde pathways 
zoals cytokine signaling en de JAK-STAT signaling pathway zijn prominent 
aanwezig. De pathway olfactory transduction wordt ook weergegeven, Deze wordt beschouwd als irrelevant. 


Deze processen zijn geassocieerd met activatie van zowel het aangeboren als het adaptieve immuunsysteem (Carbon et al., 2020). Daarnaast werd ook de pathway olfactory transduction sterk gevonden. Deze pathway is gerelateerd aan reukreceptoren en is niet relevant voor reumatoïde artritis. De verschijning van deze pathway in de analyse is verklaarbaar door de grote hoeveelheid olfactory receptor genen in het genoom (Niimura, 2012). 
Gezamenlijk tonen deze resultaten aan dat veranderingen in genexpressie bij reumatoïde artritis voornamelijk gerelateerd zijn aan immuunactivatie en ontstekingsprocessen.


## Conclusie
De RNA-seq analyse van gewrichtslijmvlies van patiënten met reumatoïde artritis en gezonde controles heeft aangetoond dat er duidelijke verschillen bestaan in genexpressie tussen beide groepen. Een groot aantal genen werd significant differentieel tot expressie gebracht, wat wijst op veranderingen in verschillende biologische processen.
De GO-analyse liet zien dat vooral immuun-gerelateerde processen verrijkt zijn, zoals leukocyten- en lymfocyten-gemedieerde immuniteit, T-cel differentiatie en B-cel activatie. Deze bevindingen benadrukken de centrale rol van het immuunsysteem bij het ontstaan en de progressie van reumatoïde artritis en komen overeen met één eerder onderzoek (Platzer et al., 2019).
De KEGG pathway analyse bevestigde deze resultaten door de identificatie van belangrijke immuun-gerelateerde pathways, zoals cytokine signaling en de JAK-STAT signaling pathway. Hoewel ook niet-relevante pathways zoals olfactory transduction naar voren kwamen. 
Voor vervolgonderzoek wordt aanbevolen om strengere filtering van genen toe te passen en meerdere datasets te analyseren om de betrouwbaarheid van de resultaten te vergroten (Leek et al., 2012).



## Referentie 

Cabral, N. (2004b). Dalí como peligro (1904-1989). Letras Libres, 6(68), 28–31. https://doi.org/10.12659/msm.915451
Yu, F., Hu, G., Li, L., Yu, B., & Liu, R. (2022). Identification of key candidate genes and biological pathways in the synovial tissue of patients with rheumatoid arthritis. Experimental And Therapeutic Medicine, 23(6), 368. https://doi.org/10.3892/etm.2022.11295
Carbon, S., Douglass, E., Good, B. M., Unni, D. R., Harris, N. L., Mungall, C. J., Basu, S., Chisholm, R. L., Dodson, R. J., Hartline, E., Fey, P., Thomas, P. D., Albou, L., Ebert, D., Kesling, M. J., Mi, H., Muruganujan, A., Huang, X., Mushayahama, T., . . . Karra, K. (2020b). The Gene Ontology resource: enriching a GOld mine. Nucleic Acids Research, 49(D1), D325–D334. https://doi.org/10.1093/nar/gkaa1113
Niimura, Y. (2012). Update on the olfactory receptor gene superfamily in humans and mice. Chromosome Research, 20(1), 51–61. https://doi.org/10.1007/s10577-011-9291-3
Leek, J. T., Johnson, W. E., Parker, H. S., Jaffe, A. E., & Storey, J. D. (2012). The sva package for removing batch effects and other unwanted variation in high-throughput experiments. Bioinformatics, 28(6), 882–883. https://doi.org/10.1093/bioinformatics/bts034
Platzer, A., Nussbaumer, T., Karonitsch, T., Smolen, J. S., & Aletaha, D. (2019). Analysis of gene expression in rheumatoid arthritis and related conditions offers insights into sex-bias, gene biotypes and co-expression patterns. PLoS ONE, 14(7), e0219698. https://doi.org/10.1371/journal.pone.0219698Feldmann, M., & Maini, R. N. (1999). The role of cytokines in the pathogenesis of rheumatoid arthritis. PubMed, 38 Suppl 2, 3–7. https://pubmed.ncbi.nlm.nih.gov/10646481
