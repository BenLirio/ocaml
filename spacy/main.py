import spacy
nlp = spacy.load("en_core_web_sm")

doc = nlp("Autonomous cars shift insurance liability toward manufacturers")


