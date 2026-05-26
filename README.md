# Transcriptomics
<p align="center">
<img src="Figuren/volcano_plot.png" alt="Volcanoplot" width="600"/>
</p>

- Inleiding: +- 200 woorden met aanleiding, achtergrondinformatie en doelstel-
ling. Bronnen (PDF) kunnen in een aparte folder met verwijzing.


Rheumatoïde artritis is een chronische auto-immuunziekte die wordt gekenmerkt door ontsteking van de gewrichten. Deze ontstekingen kunnen leiden tot blijvende gewrichtsschade en verminderde functionaliteit. De exacte oorzaak van Reuma is nog niet volledig bekend. Maar vermoedelijk is het een gevolg van een combinatie van genetische factoren, omgevingsfactoren en één verstoord immuunsysteem (Cabral, 2004b).
Omdat er momenteel geen genezing bestaat voor reuma is het belangrijk om meer inzicht te krijgen in het moleculaire mechnaisme van de ziekte. Transcriptomics biedt mogelijkheid om genexpressiepatronen te analyseren en een verschil tussen gezond en ziek weefsel te identificeren. Hierdoor kunnen betrokken genen en pathways worden getraceerd (Yu et al., 2022). In deze analyse wordt RNA-sequentie data geanalyseerd van patiënten met reuma en controles zonder reuma. Het doel van deze analyse is om differitieel tot expressie gebrachte genen te identificeren en te onderzoeken welke Gene Ontology-termen en KEGG pathways betrokken zijn bij de ziekte.

- Methode: +- 200 woorden met methode, flowschema. Zie leerdoelen voor mi-
nimale inhoud. Scripts, data etc. kunnen in een aparte folder met verwijzing.

In dit onderzoek werd RNA-seq data geanalyseerd van in totaal acht weefsels, afkomstig van vier gezonde controles en vier patiënten met rheumatoïde artritis. De ruwe sequencing reads werden eerst gemapt naar het humane referentiegenoom (GRch38) met behulp van het Rsubread package in R. Vervolgens werd met featureCounts het aantal reads per gen bepaald, wat resulteerde in een count matrix. 

Differentiële genexpressie tussen de controlegroep en de RA-groep werd geanalyseerd met behulp van het DESeq2 package. Hierbij werden genen met aangepaste p-waarde (padj) <0.05 als significant beschouwd. Om betekenis te geven aan de tot expressie gebrachte genen, werd een Gene Ontology (GO) analyse uitgevoerd met behulp van clusterProfiler. Hiermee konden genen worden gegroepeerd op basis van hun betrokkenheid bij biologische processen. Daarnaast werd een KEGG pathway analyse uitgevoerd om inzicht te krijgen in welke signaalroutes en pathways betrokken zijn bij reuma. Het werkschema van de analyse is weergegeven in figuur 1. 
<img src="assets/Workflow.png" alt="Workflow transcriptomics" width="600"/>


- Resultaten: +- 200 woorden, inclusief correcte verwijzingen.
De genexpressie analyse met DESeq2 resulteerde in een groot aantal genen die significant verschillend tot expressie kwamen tussen de controlegroep en patiënten met rheumatoïde artritis (padj< 0.05). Zowel opgereguleerde als neer gereguleerde genen werden waargenomen. Zoals weergegeven in de volcano plot (figuur 1).

De GO (Gene Ontology) analyse liet zien dat de differentieel tot expressie gebrachte genen voornamelijk betrokken zijn bij immuungerelateerde processen. De meest verrijkte biologische processen omvatten onder andere leukocyte mediated immunity, lymphocyte differentiation en adaptive immune response, weergegeven in figuur 2 (Carbon et al., 2020b). De resultaten wijzen op een activatie van zowel het aangeboren als het adaptieve immuunstysteem.

De KEGG pathway analyse liet verschillende verrijkte pathways zien in de vergelijking tussen patiënten met reumatoïde artritis en de controlegroep. Enkele van deze pathways, zoals cytokine–cytokine receptor interactie, JAK-STAT signaling pathway en natural killer cell mediated cytotoxicity, zijn direct gerelateerd aan het immuunsysteem. Dit is biologisch relevant, aangezien reumatoïde artritis een auto-immuunziekte is waarbij het immuunsysteem een belangrijke rol speelt (Feldmann & Maini, 1999). Daarnaast werd echter de ook de pathway olfactory transduction sterk gevonden. Deze pathway is gerelateerd aan reukreceptoren en is niet relevant voor reumatoïde artritis. De verschijning van deze pathway in de analyse is verklaarbaar door de grote hoeveelheid olfactory receptor genen in het genoom (Niimura, 2012). Samenvattend laat de KEGG analyse zien dat er duidelijke veranderingen zijn in immuun-gerelateerde pathways bij reumatoïde artritis, ondanks de aanwezigheid van enkele niet-relevante pathways (figuur 3).

- Conclusie: +- 200 woorden, inclusief aanbevelingen en onderzoek in context
- 
De RNA-seq analyse van gewrichtsslijmvlies van patiënten met reumatoïde artritis en gezonde controles heeft aangetoond dat er duidelijke verschillen zijn in genexpressie tussen beide groepen. Deze resultaten komen overeen met eerdere studies waarin immuunprocessen een centrale rol spelen bij reumatoïde artritis (Platzer et al., 2019). Een groot aantal genen werd significant differentieel tot expressie gebracht, wat wijst op veranderingen in onderliggende biologische processen. De GO-analyse liet zien dat vooral immuun-gerelateerde processen verrijkt zijn, zoals leukocyten- en lymfocyten-gemedieerde immuniteit, T-cel differentiatie en B-cel activatie. Deze resultaten komen overeen met het bekende ziektebeeld van reumatoïde artritis, waarbij het immuunsysteem een centrale rol speelt in het veroorzaken van chronische ontsteking. De KEGG pathway analyse benadrukt deze resultaten door de identificatie van relevante immuungerelateerde pathways, zoals cytokine signaling en de JAK-STAT signaling pathway. Hoewel ook niet-relevante pathways zoals olfactory transduction werden gevonden.

Voor vervolgonderzoek wordt aanbevolen om strengere filtering van genen toe te passen. Daarnaast kan het interessant zijn om specifieke immuun-gerelateerde pathways verder te onderzoeken. 
