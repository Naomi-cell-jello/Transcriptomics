# Transcriptomics
<p align="center">
<img src="Figuren/volcano_plot.png" alt="Volcanoplot" width="600"/>
</p>

- Inleiding: +- 200 woorden met aanleiding, achtergrondinformatie en doelstel-
ling. Bronnen (PDF) kunnen in een aparte folder met verwijzing.


Rheumatoïde artritis is een chronische auto-immuunziekte die wordt gekenmerkt door ontsteking van de gewrichten. Deze ontstekingen kunnen leiden tot blijvende gewrichtsschade en verminderde functionaliteit. De exacte oorzaak van Reuma is nog niet volledig bekend. Maar vermoedelijk is het een gevolg van een combinatie van genetische factoren, omgevingsfactoren en één verstoord immuunsysteem. 
Omdat er momenteel geen genezing bestaat voor reuma is het belangrijk om meer inzicht te krijgen in het moleculaire mechnaisme van de ziekte. Transcriptomics biedt mogelijkheid om genexpressiepatronen te analyseren en een verschil tussen gezond en ziek weefsel te identificeren. Hierdoor kunnen betrokken genen en pathways worden getraceerd. In deze analyse wordt RNA-sequentie data geanalyseerd van patiënten met reuma en controles zonder reuma. Het doel van deze analyse is om differitieel tot expressie gebrachte genen te identificeren en te onderzoeken welke Gene Ontology-termen en KEGG pathways betrokken zijn bij de ziekte.

- Methode: +- 200 woorden met methode, flowschema. Zie leerdoelen voor mi-
nimale inhoud. Scripts, data etc. kunnen in een aparte folder met verwijzing.

In dit onderzoek werd RNA-seq data geanalyseerd van in totaal acht weefsels, afkomstig van vier gezonde controles en vier patiënten met rheumatoïde artritis. De ruwe sequencing reads werden eerst gemapt naar het humane referentiegenoom (GRch38) met behulp van het Rsubread package in R. Vervolgens werd met featureCounts het aantal reads per gen bepaald, wat resulteerde in een count matrix. 

Differentiële genexpressie tussen de controlegroep en de RA-groep werd geanalyseerd met behulp van het DESeq2 package. Hierbij werden genen met aangepaste p-waarde (padj) <0.05 als significant beschouwd. Om betekenis te geven aan de tot expressie gebrachte genen, werd een Gene Ontology (GO) analyse uitgevoerd met behulp van clusterProfiler. Hiermee konden genen worden gegroepeerd op basis van hun betrokkenheid bij biologische processen. Daarnaast werd een KEGG pathway analyse uitgevoerd om inzicht te krijgen in welke signaalroutes en pathways betrokken zijn bij reuma. Het werkschema van de analyse is weergegeven in figuur 1. 
<img src="assets/Workflow.png" alt="Workflow transcriptomics" width="600"/>


- Resultaten: +- 200 woorden, inclusief correcte verwijzingen.

- Conclusie: +- 200 woorden, inclusief aanbevelingen en onderzoek in context

plaatsen

Referentie
Cabral, N. (2004b). Dalí como peligro (1904-1989). Letras Libres, 6(68), 28–31. https://doi.org/10.12659/msm.915451
Yu, F., Hu, G., Li, L., Yu, B., & Liu, R. (2022). Identification of key candidate genes and biological pathways in the synovial tissue of patients with rheumatoid arthritis. Experimental And Therapeutic Medicine, 23(6), 368. https://doi.org/10.3892/etm.2022.11295
Carbon, S., Douglass, E., Good, B. M., Unni, D. R., Harris, N. L., Mungall, C. J., Basu, S., Chisholm, R. L., Dodson, R. J., Hartline, E., Fey, P., Thomas, P. D., Albou, L., Ebert, D., Kesling, M. J., Mi, H., Muruganujan, A., Huang, X., Mushayahama, T., . . . Karra, K. (2020b). The Gene Ontology resource: enriching a GOld mine. Nucleic Acids Research, 49(D1), D325–D334. https://doi.org/10.1093/nar/gkaa1113
Niimura, Y. (2012). Update on the olfactory receptor gene superfamily in humans and mice. Chromosome Research, 20(1), 51–61. https://doi.org/10.1007/s10577-011-9291-3
Platzer, A., Nussbaumer, T., Karonitsch, T., Smolen, J. S., & Aletaha, D. (2019). Analysis of gene expression in rheumatoid arthritis and related conditions offers insights into sex-bias, gene biotypes and co-expression patterns. PLoS ONE, 14(7), e0219698. https://doi.org/10.1371/journal.pone.0219698Feldmann, M., & Maini, R. N. (1999). The role of cytokines in the pathogenesis of rheumatoid arthritis. PubMed, 38 Suppl 2, 3–7. https://pubmed.ncbi.nlm.nih.gov/10646481