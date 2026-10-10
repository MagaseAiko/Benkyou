-- n1-grammar-151 — 〜を機に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-151',
    'grammar',
    'N1',
    $$〜を機に$$,
    $$wo ki ni$$,
    $$Aproveitando / A partir de / Por ocasião de$$,
    $$を機に indica que um acontecimento serve como oportunidade para começar algo novo ou mudar. Equivale a "aproveitando" ou "por ocasião de".

O acontecimento costuma ser importante, como um casamento, uma mudança, uma aposentadoria ou um aniversário. Por exemplo, "aproveitando a aposentadoria, comecei a pintar".

É uma expressão formal, parecida com をきっかけに e を契機に.$$,
    $$É parecido com をきっかけに, mas を機に destaca que a pessoa aproveitou a oportunidade de forma consciente.

Também é escrito をきに.$$,
    $$Substantivo + を機に / を機として
Verbo (forma simples) + の + を機に$$,
    $$を機に$$,
    $$を機に|を機として|をきに$$,
    ARRAY['を', '機', 'に']::text[],
    ARRAY['を機に', 'を機として']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-151', $$退職を機に、絵を習い始めた。$$, $$たいしょくをきに、えをならいはじめた。$$, $$Aproveitando a aposentadoria, comecei a aprender pintura.$$),
    ('n1-grammar-151', $$結婚を機に、仕事を辞めた。$$, $$けっこんをきに、しごとをやめた。$$, $$Por ocasião do casamento, deixei o trabalho.$$),
    ('n1-grammar-151', $$入院したのを機に、生活を見直した。$$, $$にゅういんしたのをきに、せいかつをみなおした。$$, $$A partir da internação, revi meu estilo de vida.$$),
    ('n1-grammar-151', $$四十歳の誕生日を機として、健康に気をつけるようにした。$$, $$よんじゅっさいのたんじょうびをきとして、けんこうにきをつけるようにした。$$, $$Aproveitando o aniversário de quarenta anos, passei a cuidar da saúde.$$),
    ('n1-grammar-151', $$引っ越しを機に、いらない物を処分した。$$, $$ひっこしをきに、いらないものをしょぶんした。$$, $$Aproveitando a mudança, me desfiz das coisas que não precisava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$就職____、一人暮らしを始めた。$$, $$Aproveitando o primeiro emprego, comecei a morar sozinho.$$),
        (2, $$子供の誕生____、たばこをやめた。$$, $$A partir do nascimento do meu filho, parei de fumar.$$),
        (3, $$新年____、日記をつけ始めた。$$, $$Aproveitando o Ano-Novo, comecei a escrever um diário.$$),
        (4, $$会社の移転____、通勤方法を変えた。$$, $$Por ocasião da mudança da empresa, mudei o jeito de ir ao trabalho.$$),
        (5, $$病気になったの____、お酒をやめた。$$, $$A partir de quando fiquei doente, parei de beber.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-151', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を機に$$),
        (1, $$を機として$$),
        (2, $$を機に$$),
        (2, $$を機として$$),
        (3, $$を機に$$),
        (3, $$を機として$$),
        (4, $$を機に$$),
        (4, $$を機として$$),
        (5, $$を機に$$),
        (5, $$を機として$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
