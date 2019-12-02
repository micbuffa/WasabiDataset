from time import time

import spacy as spacy
from gensim.models.phrases import Phraser, Phrases
from gensim.utils import simple_preprocess


def flatten_list(lst):
    return [item for sublist in lst for item in sublist]


def lemmatization(spacy_nlp, texts, allowed_postags=['NOUN', 'ADJ', 'VERB', 'ADV']):
    texts_out = []
    for sent in texts:
        doc = spacy_nlp(" ".join(sent))
        texts_out.append([token.lemma_ for token in doc if token.pos_ in allowed_postags])
    return texts_out


def complex_preprocess(corpus):
    t = time()
    unigrams = list(map(lambda text: simple_preprocess(text, min_len=1, max_len=100), corpus))
    print('Extracted', len(set(flatten_list(unigrams))), 'unigrams:', time() - t, '\t', unigrams[0][:10])
    bigram_model = Phraser(Phrases(unigrams))
    unigrams_bigrams = [bigram_model[text] for text in unigrams]
    del unigrams
    print('Extracted', len(set(flatten_list(unigrams_bigrams))), 'uni/bigrams:', time() - t, '\t', [b for b in unigrams_bigrams[0] if '_' in b][:10])
    spacy_nlp = spacy.load("en_core_web_sm", disable=['parser', 'ner'])
    lemmatized_tokens = lemmatization(spacy_nlp, unigrams_bigrams, allowed_postags=['NOUN', 'ADJ', 'VERB', 'ADV'])
    del spacy_nlp
    del unigrams_bigrams
    print('Extracted', len(set(flatten_list(lemmatized_tokens))), 'lemmas:', time() - t, '\t', lemmatized_tokens[0])
    return lemmatized_tokens