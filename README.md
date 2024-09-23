# Biodiversity Analysis in National Parks

## Project Overview

This project focuses on analyzing biodiversity in various national parks. The analysis includes species observations, conservation status, and biodiversity comparison across parks. The goal is to gain insights into species diversity, frequency of observations, and identify conservation priorities based on species' at-risk status.

### Key Objectives:
1. **Species Observation Analysis**:
   - Calculate the total number of observations for each species in each park.
   - Identify the most frequently observed species in each park and overall.
   - Analyze the distribution of species categories (e.g., mammals, birds) within parks.
   
2. **Conservation Status Analysis**:
   - Assess the proportion of species in each conservation status category (e.g., endangered, vulnerable, least concern).
   - Identify parks with the highest number of at-risk species (e.g., endangered, critically endangered).

3. **Biodiversity Analysis**:
   - Compute biodiversity indices (e.g., species richness, evenness) to measure diversity in each park.
   - Compare species diversity across parks to highlight those with the highest and lowest diversity.

## Data Description

The project uses two primary datasets:

1. **Observations Table**:
   - `Scientific Name`: The scientific name of the species.
   - `Park Name`: The name of the park where the species was observed.
   - `Observations`: The number of sightings of the species in a given park.

2. **Species Info Table**:
   - `Category`: The biological category of the species (e.g., mammal, bird).
   - `Scientific Name`: The scientific name, matching the observations table.
   - `Common Names`: Popular/common names for the species.
   - `Conservation Status`: The conservation status (e.g., endangered, vulnerable, least concern).

## Analysis Steps

1. **Species Observation Analysis**:
   - Calculate the total observations per species across parks.
   - Determine the most frequently observed species by park.
   - Evaluate the distribution of observations across species categories.

2. **Conservation Status Analysis**:
   - Calculate the proportion of species in each conservation status.
   - Identify parks with the highest concentration of endangered species.

3. **Biodiversity Analysis**:
   - Compute biodiversity metrics (species richness, evenness).
   - Compare species diversity across parks.

## Key Metrics

- Total number of species observations per park.
- Distribution of species categories (e.g., mammals, birds) by park.
- Number of species under different conservation statuses in each park.
- Biodiversity indices across parks.

## Data Visualizations

The following visualizations will be generated as part of the analysis:
- **Bar charts** showing the most frequently observed species in each park.
- **Pie charts** depicting the distribution of species categories (e.g., mammals, birds).
- **Biodiversity maps** highlighting parks with the highest and lowest biodiversity.
- **Conservation status charts** showing the proportion of endangered and vulnerable species in each park.

## Technologies Used
- **Python:** For data analysis and visualization.
- **Pandas:** For data manipulation and aggregation.
- **Matplotlib / Seaborn:** For creating visualizations.
- **Jupyter Notebook:** For interactive data analysis.



## Contributing
Contributions are welcome! Please open an issue or submit a pull request with your changes.
