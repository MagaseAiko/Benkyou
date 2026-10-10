-- n2-grammar-64 — 〜ままに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-64',
    'grammar',
    'N2',
    $$〜ままに$$,
    $$mama ni$$,
    $$Conforme / Do jeito que / Ao sabor de$$,
    $$ままに indica que alguém age seguindo algo, sem resistir ou sem planejar. Equivale a "conforme", "do jeito que" ou "ao sabor de".

Pode indicar seguir a vontade de outra pessoa, como "fazer conforme mandaram", ou seguir os próprios sentimentos, como "andar conforme os pés levam".

Também aparece em expressões fixas, como "sentir conforme o coração manda".$$,
    $$Expressões comuns são 言われるままに (conforme mandaram), 思うままに (como quiser) e 気の向くままに (ao sabor da vontade).

Muitas vezes transmite a ideia de agir de forma passiva ou livre, sem pensar muito.$$,
    $$Verbo (forma dicionário / passiva) + ままに
Verbo (forma た) + ままに
Substantivo + の + ままに$$,
    $$ままに$$,
    $$ままに$$,
    ARRAY['まま', 'に']::text[],
    ARRAY['ままに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-64', $$言われるままに、書類にサインしてしまった。$$, $$いわれるままに、しょるいにサインしてしまった。$$, $$Assinei os documentos do jeito que me mandaram.$$),
    ('n2-grammar-64', $$足の向くままに、町を歩いた。$$, $$あしのむくままに、まちをあるいた。$$, $$Andei pela cidade para onde os pés me levavam.$$),
    ('n2-grammar-64', $$思うままに絵を描いてください。$$, $$おもうままにえをかいてください。$$, $$Desenhe do jeito que quiser.$$),
    ('n2-grammar-64', $$気の向くままに旅をするのが好きだ。$$, $$きのむくままにたびをするのがすきだ。$$, $$Gosto de viajar ao sabor da vontade.$$),
    ('n2-grammar-64', $$感じたままに話してください。$$, $$かんじたままにはなしてください。$$, $$Fale conforme você sentiu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$店員に勧められる____、高い服を買った。$$, $$Comprei uma roupa cara conforme o vendedor recomendou.$$),
        (2, $$心の____、歌を歌った。$$, $$Cantei conforme o coração mandava.$$),
        (3, $$見た____、正直に説明した。$$, $$Expliquei com sinceridade do jeito que vi.$$),
        (4, $$時間の流れる____、一日を過ごした。$$, $$Passei o dia ao sabor do tempo.$$),
        (5, $$彼は欲望の____行動する。$$, $$Ele age conforme seus desejos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ままに$$),
        (2, $$ままに$$),
        (3, $$ままに$$),
        (4, $$ままに$$),
        (5, $$ままに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
