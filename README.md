# Transcriptomics
<img src="Figuren/Volcano_plot.png" alt="Volcanoplot" width="600"/>

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
