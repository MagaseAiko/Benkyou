-- n1-grammar-197 — 〜とあって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-197',
    'grammar',
    'N1',
    $$〜とあって$$,
    $$to atte$$,
    $$Por ser / Como / Já que$$,
    $$とあって indica uma situação especial que explica um resultado natural. Equivale a "por ser" ou "como".

É muito usado em notícias e descrições para explicar por que algo aconteceu. Por exemplo, "como era feriado, o parque estava cheio" ou "por ser o último dia, muita gente veio".

É uma expressão formal e objetiva.$$,
    $$Não se usa para falar de si mesmo.

A segunda parte descreve um fato, não um desejo ou uma ordem.

É parecido com ので e だから, mas とあって destaca que a situação é especial.$$,
    $$Substantivo + とあって
Verbo / Adjetivo (forma simples) + とあって$$,
    $$とあって$$,
    $$とあって$$,
    ARRAY['と', 'あって']::text[],
    ARRAY['とあって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-197', $$連休とあって、空港は旅行客でいっぱいだった。$$, $$れんきゅうとあって、くうこうはりょこうきゃくでいっぱいだった。$$, $$Por ser feriado prolongado, o aeroporto estava cheio de viajantes.$$),
    ('n1-grammar-197', $$最終日とあって、会場には多くの人が訪れた。$$, $$さいしゅうびとあって、かいじょうにはおおくのひとがおとずれた。$$, $$Como era o último dia, muitas pessoas visitaram o local.$$),
    ('n1-grammar-197', $$人気歌手が来るとあって、ファンが集まった。$$, $$にんきかしゅがくるとあって、ファンがあつまった。$$, $$Como um cantor famoso viria, os fãs se reuniram.$$),
    ('n1-grammar-197', $$初めての海外旅行とあって、彼女は緊張していた。$$, $$はじめてのかいがいりょこうとあって、かのじょはきんちょうしていた。$$, $$Por ser a primeira viagem ao exterior, ela estava nervosa.$$),
    ('n1-grammar-197', $$年に一度の祭りとあって、町はにぎわっている。$$, $$ねんにいちどのまつりとあって、まちはにぎわっている。$$, $$Por ser o festival anual, a cidade está movimentada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏休み____、プールは子供でいっぱいだ。$$, $$Por serem férias de verão, a piscina está cheia de crianças.$$),
        (2, $$セール中____、店は大混雑している。$$, $$Como está em liquidação, a loja está lotada.$$),
        (3, $$決勝戦____、スタジアムは満員だった。$$, $$Por ser a final, o estádio estava lotado.$$),
        (4, $$無料で参加できる____、多くの申し込みがあった。$$, $$Como dava para participar de graça, houve muitas inscrições.$$),
        (5, $$久しぶりの晴れ____、公園は家族連れでにぎわった。$$, $$Por ser um dia de sol depois de muito tempo, o parque ficou cheio de famílias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-197', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とあって$$),
        (2, $$とあって$$),
        (3, $$とあって$$),
        (4, $$とあって$$),
        (5, $$とあって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
