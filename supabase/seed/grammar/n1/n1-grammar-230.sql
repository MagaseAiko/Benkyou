-- n1-grammar-230 — 〜尽くす
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-230',
    'grammar',
    'N1',
    $$〜尽くす$$,
    $$tsukusu$$,
    $$Completamente / Até o fim / Totalmente$$,
    $$尽くす, depois de outro verbo, indica que a ação foi feita de forma completa, até não restar nada. Equivale a "completamente" ou "até o fim".

Por exemplo, "comeu tudo até acabar" ou "conhece a cidade completamente".

Sozinho, 尽くす também significa "dedicar-se" a alguém ou algo, como "dedicar-se à família".$$,
    $$Combinações comuns são 食べ尽くす, 使い尽くす, 知り尽くす, 燃え尽きる e 言い尽くす.

全力を尽くす significa "dar o melhor de si".$$,
    $$Verbo (forma ます sem ます) + 尽くす
Substantivo + に + 尽くす (dedicar-se)$$,
    $$尽くす$$,
    $$尽くす|尽くした|尽くして|尽くし|つくす|つくした$$,
    ARRAY['尽くす']::text[],
    ARRAY['尽くす', '尽くした', '尽くして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-230', $$彼はこの町のことを知り尽くしている。$$, $$かれはこのまちのことをしりつくしている。$$, $$Ele conhece esta cidade completamente.$$),
    ('n1-grammar-230', $$お金を使い尽くしてしまった。$$, $$おかねをつかいつくしてしまった。$$, $$Gastei todo o dinheiro até não sobrar nada.$$),
    ('n1-grammar-230', $$子供たちは、ケーキを食べ尽くした。$$, $$こどもたちは、ケーキをたべつくした。$$, $$As crianças comeram o bolo inteiro.$$),
    ('n1-grammar-230', $$全力を尽くしたので、後悔はない。$$, $$ぜんりょくをつくしたので、こうかいはない。$$, $$Dei o meu melhor, então não me arrependo.$$),
    ('n1-grammar-230', $$彼女は家族のために尽くした。$$, $$かのじょはかぞくのためにつくした。$$, $$Ela se dedicou à família.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$言いたいことは言い____。$$, $$Disse tudo o que queria dizer.$$),
        (2, $$持っている力をすべて出し____。$$, $$Usei todas as minhas forças até o fim.$$),
        (3, $$彼は料理の技術を知り____いる。$$, $$Ele domina completamente as técnicas culinárias.$$),
        (4, $$試合では最善を____つもりだ。$$, $$Pretendo dar o meu melhor na partida.$$),
        (5, $$この会社のために、三十年間____きた。$$, $$Me dediquei a esta empresa por trinta anos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-230', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$尽くした$$),
        (2, $$尽くした$$),
        (3, $$尽くして$$),
        (4, $$尽くす$$),
        (5, $$尽くして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
