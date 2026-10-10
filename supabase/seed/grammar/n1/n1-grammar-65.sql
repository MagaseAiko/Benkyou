-- n1-grammar-65 — 〜ことのないように
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-65',
    'grammar',
    'N1',
    $$〜ことのないように$$,
    $$koto no nai you ni$$,
    $$Para que não / De modo a não / Para evitar que$$,
    $$ことのないように indica o objetivo de evitar que algo ruim aconteça. Equivale a "para que não" ou "para evitar que".

É uma forma formal de ないように, muito usada em avisos, instruções e regras. Por exemplo, "tome cuidado para que não aconteçam erros".

A segunda parte costuma ser um pedido, um aviso ou uma ação de prevenção.$$,
    $$É mais formal que ないように e aparece muito em documentos e anúncios.

A forma ことのないよう, sem に, é ainda mais formal.$$,
    $$Verbo (forma dicionário) + ことのないように + Pedido / Aviso$$,
    $$ことのないように$$,
    $$ことのないように|ことのないよう|ことがないように|ことがないよう$$,
    ARRAY['こと', 'の', 'ない', 'ように']::text[],
    ARRAY['ことのないように', 'ことのないよう', 'ことがないように']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-65', $$同じ失敗を繰り返すことのないように、気をつけてください。$$, $$おなじしっぱいをくりかえすことのないように、きをつけてください。$$, $$Tome cuidado para não repetir o mesmo erro.$$),
    ('n1-grammar-65', $$忘れ物をすることのないよう、確認してください。$$, $$わすれものをすることのないよう、かくにんしてください。$$, $$Verifique para não esquecer nada.$$),
    ('n1-grammar-65', $$事故が起こることのないように、安全対策を強化した。$$, $$じこがおこることのないように、あんぜんたいさくをきょうかした。$$, $$Reforçamos as medidas de segurança para evitar que ocorram acidentes.$$),
    ('n1-grammar-65', $$二度とこのようなことがないように努めます。$$, $$にどとこのようなことがないようにつとめます。$$, $$Faremos o possível para que isso não aconteça de novo.$$),
    ('n1-grammar-65', $$遅れることのないように、早めに家を出た。$$, $$おくれることのないように、はやめにいえをでた。$$, $$Saí de casa mais cedo para não me atrasar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$書類に間違いがある____、よく確認してください。$$, $$Verifique bem para que não haja erros no documento.$$),
        (2, $$けがをする____、準備運動をしましょう。$$, $$Vamos fazer aquecimento para evitar lesões.$$),
        (3, $$二度と遅刻する____、目覚ましを二つかけた。$$, $$Coloquei dois despertadores para nunca mais me atrasar.$$),
        (4, $$迷惑をかける____、静かにしてください。$$, $$Fique em silêncio para não incomodar ninguém.$$),
        (5, $$情報が外にもれる____、注意してください。$$, $$Tome cuidado para que as informações não vazem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことのないように$$),
        (1, $$ことのないよう$$),
        (2, $$ことのないように$$),
        (2, $$ことのないよう$$),
        (3, $$ことのないように$$),
        (3, $$ことのないよう$$),
        (4, $$ことのないように$$),
        (4, $$ことのないよう$$),
        (5, $$ことのないように$$),
        (5, $$ことのないよう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
