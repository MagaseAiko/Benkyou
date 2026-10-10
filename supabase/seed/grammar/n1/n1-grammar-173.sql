-- n1-grammar-173 — 〜すら / 〜ですら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-173',
    'grammar',
    'N1',
    $$〜すら / 〜ですら$$,
    $$sura / desura$$,
    $$Nem mesmo / Até mesmo / Nem sequer$$,
    $$すら e ですら destacam um exemplo extremo para mostrar que algo é surpreendente. Equivalem a "nem mesmo" ou "até mesmo".

Com frases negativas, mostram que nem o mínimo foi feito, como "não tenho nem tempo para dormir". Com frases afirmativas, mostram que até o caso mais improvável acontece, como "até as crianças sabem disso".

É uma forma mais formal e literária de さえ.$$,
    $$É parecido com さえ, mas すら é mais formal e enfático.

Com partículas, também aparece como にすら ou とすら.$$,
    $$Substantivo + すら / ですら
Substantivo + に + すら
Verbo (forma ます sem ます) + すら + しない$$,
    $$すら$$,
    $$すら|ですら$$,
    ARRAY['すら']::text[],
    ARRAY['すら', 'ですら', 'にすら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-173', $$忙しくて、寝る時間すらない。$$, $$いそがしくて、ねるじかんすらない。$$, $$Estou tão ocupado que não tenho nem tempo para dormir.$$),
    ('n1-grammar-173', $$そんなことは子供ですら知っている。$$, $$そんなことはこどもですらしっている。$$, $$Até as crianças sabem disso.$$),
    ('n1-grammar-173', $$彼は自分の名前すら書けなかった。$$, $$かれはじぶんのなまえすらかけなかった。$$, $$Ele não conseguia escrever nem o próprio nome.$$),
    ('n1-grammar-173', $$先生ですら、この問題は解けなかった。$$, $$せんせいですら、このもんだいはとけなかった。$$, $$Nem mesmo o professor conseguiu resolver este problema.$$),
    ('n1-grammar-173', $$彼女は私に挨拶すらしない。$$, $$かのじょはわたしにあいさつすらしない。$$, $$Ela nem sequer me cumprimenta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れて、立つこと____できなかった。$$, $$Estava tão cansado que nem conseguia ficar de pé.$$),
        (2, $$専門家____、この現象は説明できない。$$, $$Nem mesmo os especialistas conseguem explicar este fenômeno.$$),
        (3, $$彼はお礼の言葉____言わなかった。$$, $$Ele nem sequer disse uma palavra de agradecimento.$$),
        (4, $$この漢字は、日本人____読めない人が多い。$$, $$Muitos japoneses, até mesmo eles, não conseguem ler este kanji.$$),
        (5, $$一円____持っていない。$$, $$Não tenho nem um iene.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-173', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$すら$$),
        (2, $$ですら$$),
        (3, $$すら$$),
        (4, $$ですら$$),
        (5, $$すら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
