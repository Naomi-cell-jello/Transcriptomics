# Genexpressieanalyse toont verstoorde immuun-gerelateerde genexpressiepatronen bij reumatoïde artritis vergeleken met gezonde controles




## Inleiding


Rheumatoïde artritis is een chronische auto-immuunziekte die wordt gekenmerkt door ontsteking van de gewrichten. jaarlijks treft de ziekte ongeveer 1% van de wereldbevolking. Deze ontstekingen kunnen leiden tot blijvende gewrichtsschade en verminderde functionaliteit. De exacte oorzaak van reuma is nog niet volledig bekend [1]. Maar vermoedelijk is het een gevolg van een combinatie van genetische factoren, omgevingsfactoren én een verstoord immuunsysteem. 
uit eerder onderzoek blijkt dat bij reumatoïde artritis meerdere immuun-gerelateerde pathways verstoord zijn, waaronder cytokine-cytokine receptor interacties, T-cel activaties en JAK-STAT signalering [2]. 

Omdat er momenteel geen genezing bestaat voor reuma is het belangrijk om meer inzicht te krijgen in het moleculaire mechanisme van de ziekte. Transcriptomics biedt mogelijkheid om genexpressiepatronen te analyseren en een verschil tussen gezond en ziek weefsel te identificeren [2]. Hierdoor kunnen betrokken genen en pathways worden getraceerd. In deze analyse wordt RNA-sequentie data geanalyseerd van patiënten met reuma en controles zonder reuma. Het doel van deze analyse is om differentieel tot expressie gebrachte genen te identificeren en te onderzoeken welke Gene Ontology-termen en KEGG pathways betrokken zijn bij de ziekte. De volledige tekst van dit document is terug te vinden in de README van deze [README](https://github.com/Naomi-cell-jello/Transcriptomics) repository. De ruwe data is beschikbaar via hier: [ruwe data](data_RA_raw) De gebruikte dataset is afkomstig van het volgende artikel: ((Platzer et al., 2019c)

## Inhoud/structuur

- `Data_RA_raw` - datasets voor de analyse
- `Casus R` - verwerkte datasets gegenereerd met scripts 
- `Figuren/` - grafieken
- `bronnen/` - gebruikte bronnen 
- `README` - het document om de tekst hier te genereren
- `Data_stewardship` - aantoning van de competentie beheren


## Methode

In dit onderzoek werd RNA-seq data geanalyseerd van in totaal acht weefsels, afkomstig van vier gezonde controles en vier patiënten met rheumatoïde artritis. In tabel 1 is een overzicht weergegeven van de metadata van de gebruikte samples, waaronder leeftijd, geslacht en de conditie.
### Tabel 1. Metadata van de samples

| Sample ID   | Leeftijd | Geslacht | Conditie                              |
|-------------|----------|----------|----------------------------------------|
| SRR4785819  | 31       | Female   | Normal                                 |
| SRR4785820  | 15       | Female   | Normal                                 |
| SRR4785828  | 31       | Female   | Normal                                 |
| SRR4785831  | 42       | Female   | Normal                                 |
| SRR4785979  | 54       | Female   | Rheumatoid arthritis (established)     |
| SRR4785980  | 66       | Female   | Rheumatoid arthritis (established)     |
| SRR4785986  | 60       | Female   | Rheumatoid arthritis (established)     |
| SRR4785988  | 59       | Female   | Rheumatoid arthritis (established)     |



De ruwe sequencing reads werden eerst gemapt naar het humane referentiegenoom (GRCh38), beschikbaar via NCBI:https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.26/.  met behulp van het Rsubread (versie 2.24.0) package in R. Vervolgens werd met featureCounts het aantal reads per gen bepaald, wat resulteerde in een count matrix. 

Differentiële genexpressie tussen de controlegroep en de RA-groep werd geanalyseerd met behulp van het DESeq2 (versie 1.50.2) package. Hierbij werden genen met aangepaste p-waarde (padj) <0.05 als significant beschouwd. Om betekenis te geven aan de tot expressie gebrachte genen, werd een Gene Ontology (GO) analyse uitgevoerd met behulp van clusterProfiler (versie  4.18.4) [3]. Hiermee konden genen worden gegroepeerd op basis van hun betrokkenheid bij biologische processen. Daarnaast werd een KEGG pathway analyse uitgevoerd om inzicht te krijgen in welke signaalroutes en pathways betrokken zijn bij reuma. Het flowschema van de analyse is weergegeven in figuur 1. 
<p align="center">
<img src="Figuren/Flowschema.png" alt="Flowschema" width="1000"/>
</p>


**Figuur 1. Flowschema.** Overzicht van de RNA-seq analyse. De figuur toont de stappen van referentiegenoom-indexeren en mapping van de RNA-seq reads tot statistische analyse.

# Volcano plot - differentiële genexpressie

De differentiële genexpressie analyse met behulp van DESeq2 toonde aan dat er duidelijke verschillen bestaan in genexpressie tussen patiënten met reumatoïde artritis en gezonde controles. De resultaten van deze analyse zijn gevisualiseerd in een volcanoplot gegenereerd met het R-package EnchandVolcano, weergegeven in figuur 2. 

De Volcano plot (figuur 2) toont de verschillen in genexpressie tussen vier RA-samples en vier gezonde controles. In totaal werden ongeveer 150 genen significant differentieel tot expressie gebracht (padj < 0.05), waarvan ongeveer 50 genen opgereguleerd en 60 genen neer gereguleerd in RA-weefsel. Deze duidelijke verschuiving in expressiepatronen wijst op verstoring van meerdere biologische processen. 


<p align="center">
<img src="Figuren/volcano_plot.png" alt="Volcanoplot" width="600"/>


**Figuur 2. Volcano plot differentiële genexpressie.** Volcano plot van differentiële genexpressie tussen RA (n=4) en gezonde controles (n=4). Roood: significante opgereguleerde genen. Groen: significante neer gereguleerd. Grijs: niet significant.

# GO-analyse - biologische processen
De GO-analyse (figuur 3) laat zien dat vooral immuun-gerelateerde processen verrijkt zijn. de meest significante processen omvatten leukocyte mediated immunity, lymphocyte mediated immunity, T-cell differentiation en B-cell activation. Deze processen zijn kenmerkend voor de verhoogde immuunactiviteit bij reumatoïde artritis.

<p align="center">
<img src="Figuren/GO_plot.png" alt="GO_plot" width="600"/>
</p>

**Figuur 3. Verrijking GO-proces bij reumatoïde artritis.** Verrijkte GO-processen gebaseerd op significante differentiële genen tussen RA en controles.

# KEGG pathways-analyse - signaalroutes
Naast de GO-analyse werd een KEGG pathway-analyse uitgevoerd (figuur 4). Deze analyse toont dat vooral immuun-gerelateerde pathways verrijkt zijn, waaronder cytokine-cytokine receptor interaction, JAK-STAT signaling pathway en natural killer cell mediated cytotoxicity. De pathway olfactory transduction werd eveneens verrijkt gevonden, maar deze wordt beschouwd als biologisch irrelevant voor RA vanwege grote hoeveelheid olfactory receptor-genen in het genoom.

<p align="center">
<img src="Figuren/kegg_pathway_plot.png" alt="KEGG_pathway" width="600"/>
</p>

**Figuur 4. Kegg pathway plot.** KEGG pathway-analyse van significante differentiële genen tussen RA en controles. Grootte = aantal genen; kleur = p.adjust.


Deze processen zijn geassocieerd met activatie van zowel het aangeboren als het adaptieve immuunsysteem [3]. Daarnaast werd ook de pathway olfactory transduction sterk gevonden. Deze pathway is gerelateerd aan reukreceptoren en is niet relevant voor reumatoïde artritis. De verschijning van deze pathway in de analyse is verklaarbaar door de grote hoeveelheid olfactory receptor genen in het genoom [5]. 
Gezamenlijk tonen deze resultaten aan dat veranderingen in genexpressie bij reumatoïde artritis voornamelijk gerelateerd zijn aan immuunactivatie en ontstekingsprocessen.
het volledige script dat voor deze analyse is gebruikt is beschikbaar in deze Github repository (zie map ‘Casus R’).

## Conclusie
De RNA-seq analyse laat zien dat reumatoïde artritis gepaard gaat met systematische verstoringen in immuun-gerelateerde genexpressie, wat de centrale rol vann het immuunsysteem in dit ziektebeeld verder onderbouwt [6]. In plaats van slechts individuele genen te beïnvloeden, wijzen de resultaten op ontregeling  vna complete biologische processen en signaalroutes, waaronder T-cel differentiatie, B-cel activatie en JAK-STAT signalering. [3, 4]

Deze bevindingen suggereren dat RA niet alleen wordt gekenmerkt door lokale ontsteking in het gewricht, maar door brede immuunactivatie op moleculair niveau, wat aansluit bij de huidige inzichten in de pathofysiologie van auto-immuunziekten. De aanwezigheid van niet-relevante pathways, zoals olfactory transduction, benadrukt daarnaast het belang van zorgvuldige filtering en interpretatie bij grootschalige transcriptomics-analyses.

Op basis van de resultaten kan worden geconcludeerd dat transcriptomics een waardevolle methode is om ziektespecifieke moleculaire patronen te identificeren die mogelijk kunnen bijdragen aan toekomstige ontwikkelingen. Voor vervolgonderzoek is het aan te bevelen om meerdere datasets te combineren en aanvullende functionele analyses uit te voeren om de robuustheid te vergroten. [7]

## Referentie 
[1][Bronnen-Xiong et al2019.pdf](https://github.com/user-attachments/files/28348950/Bronnen-Xiong.et.al2019.pdf)
[2][Bronnen-Olender et al.2008.pdf](https://github.com/user-attachments/files/28348954/Bronnen-Olender.et.al.2008.pdf)
[3][Bronnen-Carbon et al2020d.pdf](https://github.com/user-attachments/files/28348688/Bronnen-Carbon.et.al2020d.pdf)
[4][Bronnen-Yu et al2022b.pdf](https://github.com/user-attachments/files/28348735/Bronnen-Yu.et.al2022b.pdf)
[5][Bronnen-Niimura2012.pdf](https://github.com/user-attachments/files/28348859/Bronnen-Niimura2012.pdf)
[6][Bronnen-Platzer et al2019b.pdf](https://github.com/user-attachments/files/28348881/Bronnen-Platzer.et.al2019b.pdf)
[7][Bronnen-Leek2012.pdf](https://github.com/user-attachments/files/28348925/Bronnen-Leek2012.pdf)

