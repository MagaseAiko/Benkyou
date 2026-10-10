-- n1-grammar-212 — 〜と見るや
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-212',
    'grammar',
    'N1',
    $$〜と見るや$$,
    $$to miru ya$$,
    $$No instante em que viu / Assim que percebeu / Mal notou$$,
    $$と見るや indica que, no exato momento em que alguém percebe uma situação, reage imediatamente. Equivale a "no instante em que viu" ou "mal notou".

É mais enfático e literário que とみると, destacando a rapidez da reação. Por exemplo, "no instante em que viu a polícia, o ladrão fugiu".

É uma expressão comum na escrita.$$,
    $$É parecido com や否や e が早いか.

Também é escrito とみるや.

Não se usa para falar de si mesmo.$$,
    $$Frase (forma simples) + と見るや + Reação imediata
Substantivo + と見るや$$,
    $$と見るや$$,
    $$と見るや|とみるや$$,
    ARRAY['と', '見る', 'や']::text[],
    ARRAY['と見るや', 'とみるや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-212', $$警察が来たと見るや、犯人は逃げ出した。$$, $$けいさつがきたとみるや、はんにんはにげだした。$$, $$No instante em que viu a polícia chegar, o criminoso fugiu.$$),
    ('n1-grammar-212', $$チャンスと見るや、彼はすぐに行動した。$$, $$チャンスとみるや、かれはすぐにこうどうした。$$, $$Mal notou a oportunidade, ele agiu na hora.$$),
    ('n1-grammar-212', $$形勢が不利と見るや、相手は作戦を変えた。$$, $$けいせいがふりとみるや、あいてはさくせんをかえた。$$, $$Assim que percebeu que estava em desvantagem, o adversário mudou de estratégia.$$),
    ('n1-grammar-212', $$値段が下がったと見るや、客が殺到した。$$, $$ねだんがさがったとみるや、きゃくがさっとうした。$$, $$No instante em que viram o preço cair, os clientes invadiram a loja.$$),
    ('n1-grammar-212', $$雨がやんだと見るや、子供たちは外に飛び出した。$$, $$あめがやんだとみるや、こどもたちはそとにとびだした。$$, $$Mal notaram que a chuva tinha parado, as crianças saíram correndo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$相手が疲れた____、彼は一気に攻めた。$$, $$No instante em que viu o adversário cansado, ele atacou com tudo.$$),
        (2, $$席が空いた____、彼女はすぐに座った。$$, $$Mal notou que um lugar vagou, ela sentou na hora.$$),
        (3, $$儲かる____、多くの会社が参入した。$$, $$Assim que perceberam que dava lucro, muitas empresas entraram no mercado.$$),
        (4, $$敵が弱った____、兵士たちは前進した。$$, $$No instante em que viram o inimigo enfraquecido, os soldados avançaram.$$),
        (5, $$先生がいない____、生徒たちは騒ぎ始めた。$$, $$Mal perceberam que o professor não estava, os alunos começaram a fazer bagunça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-212', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と見るや$$),
        (1, $$とみるや$$),
        (2, $$と見るや$$),
        (2, $$とみるや$$),
        (3, $$と見るや$$),
        (3, $$とみるや$$),
        (4, $$と見るや$$),
        (4, $$とみるや$$),
        (5, $$と見るや$$),
        (5, $$とみるや$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
