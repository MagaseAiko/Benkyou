import re, sys
sys.path.insert(0, '.')
from build import load
def kata2hira(s): return ''.join(chr(ord(c)-0x60) if 'ァ'<=c<='ヶ' else c for c in s)
bad=0
for g in load(sys.argv[1]):
    for jp, rd, pt in g['E']:
        # sequência de kana do japonês (exceto katakana preservado) deve aparecer em ordem na leitura
        segs = re.findall(r'[ぁ-ゖァ-ヺー。、？！「」…]+', jp)
        pos = 0; r = rd
        for s in segs:
            i = r.find(s, pos)
            if i < 0:
                print(g['n'], 'segmento', s, '|', jp, '|', rd); bad += 1; break
            pos = i + len(s)
print('problemas:', bad)
