-- n1-grammar-218 — 〜ともなく / 〜ともなしに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-218',
    'grammar',
    'N1',
    $$〜ともなく / 〜ともなしに$$,
    $$tomo naku / tomo nashi ni$$,
    $$Sem querer / Sem intenção / Distraidamente$$,
    $$ともなく e ともなしに indicam que alguém fez algo sem intenção clara, de forma distraída. Equivalem a "sem querer" ou "distraidamente".

Costumam vir com verbos como ver, ouvir ou pensar. Por exemplo, "liguei a TV sem intenção de assistir".

Com palavras interrogativas, como どこからともなく, significam "de algum lugar que não se sabe".$$,
    $$Expressões comuns são 見るともなく見る, 聞くともなく聞く e どこからともなく.

É uma expressão literária.$$,
    $$Verbo (forma dicionário) + ともなく / ともなしに + Mesmo verbo
Palavra interrogativa + ともなく$$,
    $$ともなく$$,
    $$ともなく|ともなしに$$,
    ARRAY['とも', 'なく']::text[],
    ARRAY['ともなく', 'ともなしに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-218', $$見るともなくテレビを見ていた。$$, $$みるともなくテレビをみていた。$$, $$Estava vendo TV sem prestar atenção.$$),
    ('n1-grammar-218', $$聞くともなしに、隣の人の話が聞こえてきた。$$, $$きくともなしに、となりのひとのはなしがきこえてきた。$$, $$Sem querer, acabei ouvindo a conversa de quem estava ao lado.$$),
    ('n1-grammar-218', $$どこからともなく、いいにおいがしてきた。$$, $$どこからともなく、いいにおいがしてきた。$$, $$De algum lugar, veio um cheiro bom.$$),
    ('n1-grammar-218', $$考えるともなく、昔のことを思い出していた。$$, $$かんがえるともなく、むかしのことをおもいだしていた。$$, $$Distraidamente, fiquei lembrando do passado.$$),
    ('n1-grammar-218', $$誰からともなく、拍手が起こった。$$, $$だれからともなく、はくしゅがおこった。$$, $$Sem que se soubesse quem começou, surgiram aplausos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$窓の外を見る____見ていた。$$, $$Estava olhando pela janela distraidamente.$$),
        (2, $$ラジオを聞く____聞いていたら、懐かしい曲が流れた。$$, $$Estava ouvindo rádio sem prestar atenção quando tocou uma música nostálgica.$$),
        (3, $$どこから____、音楽が聞こえてくる。$$, $$De algum lugar, vem o som de música.$$),
        (4, $$誰に言う____、彼はつぶやいた。$$, $$Ele murmurou sem se dirigir a ninguém.$$),
        (5, $$いつから____、二人は付き合い始めた。$$, $$Sem que se saiba quando, os dois começaram a namorar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-218', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ともなく$$),
        (1, $$ともなしに$$),
        (2, $$ともなく$$),
        (2, $$ともなしに$$),
        (3, $$ともなく$$),
        (4, $$ともなく$$),
        (5, $$ともなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
