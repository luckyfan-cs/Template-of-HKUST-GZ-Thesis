"""PDF checks after compiling the sample and tests/frontmatter.tex (PyMuPDF)."""
import argparse
import fitz

parser = argparse.ArgumentParser()
parser.add_argument('sample')
parser.add_argument('regression')
parser.add_argument('--baseline')
parser.add_argument('--legacy')
a = parser.parse_args()

def check(path, heads, footers):
    doc = fitz.open(path)
    assert len(doc) == len(heads), (path, len(doc))
    for i, (page, head, footer) in enumerate(zip(doc, heads, footers)):
        text = page.get_text().strip()
        assert head in text, (path, i + 1, head)
        assert text.splitlines()[-1] == footer, (path, i + 1, text)
        assert abs(page.rect.width - 595.28) < 1
        assert abs(page.rect.height - 841.89) < 1
        assert '??' not in text
        words = [w for w in page.get_text('words') if w[4] == footer and w[1] > 750]
        assert len(words) == 1, (path, i + 1, 'footer missing/duplicated')
        assert abs((words[0][0] + words[0][2])/2 - page.rect.width/2) < 3
    assert not doc.is_encrypted
    assert all(doc.extract_font(f[0])[3] for page in doc for f in page.get_fonts())
    return doc

sample = check(a.sample, ['Your Thesis Title', 'ABSTRACT', 'AUTHORIZATION',
    'This is to certify', 'ACKNOWLEDGMENTS', 'TABLE OF CONTENTS', 'LIST OF FIGURES',
    'LIST OF TABLES', 'INTRODUCTION', 'SCIENTIFIC BACKGROUND', 'METHODS',
    'CONCLUSION', 'BIBLIOGRAPHY'], ['i','ii','iii','iv','v','vi','vii','viii','1','2','3','4','5'])
reg = check(a.regression, ['Front Matter Regression Test', 'Abstract first page marker.',
    'Abstract continuation marker.', 'AUTHORIZATION', 'This is to certify',
    'ACKNOWLEDGMENTS', 'TABLE OF CONTENTS', 'LIST OF FIGURES', 'LIST OF TABLES',
    'INTRODUCTION', 'Body continuation marker.', 'BIBLIOGRAPHY', 'APPENDIX A'],
    ['i','ii','iii','iv','v','vi','vii','viii','ix','1','2','3','4'])
assert 'Doctor of Philosophy' in reg[0].get_text()
assert 'above PhD thesis' in reg[4].get_text()
assert 'A citation [1]' in reg[9].get_text()
assert 'Regression figure' in reg[7].get_text()
assert 'Regression table' in reg[8].get_text()
assert 'Chapter 1.' in reg[12].get_text()
if a.baseline and a.legacy:
    old, legacy = fitz.open(a.baseline), fitz.open(a.legacy)
    assert len(old) == len(legacy) == len(sample)
    assert all(x.get_pixmap().samples == y.get_pixmap().samples for x,y in zip(old,legacy))
    assert all(old[i].get_pixmap().samples == sample[i].get_pixmap().samples for i in range(8,13))
    print('PASS: legacy rendering identical on all 13 pages; body/bibliography unchanged.')
print('PASS: sample and PhD regression order, page numbers, A4, embedded fonts, citations and lists.')
