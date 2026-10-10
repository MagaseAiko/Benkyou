-- n2-grammar-122 — 〜を契機に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-122',
    'grammar',
    'N2',
    $$〜を契機に$$,
    $$wo keiki ni$$,
    $$Aproveitando / A partir de / Por ocasião de$$,
    $$を契機に indica que um acontecimento serve como ponto de partida para uma mudança. Equivale a "a partir de", "aproveitando" ou "por ocasião de".

Muitas vezes o acontecimento é importante, como um casamento, uma doença, uma crise ou uma mudança de emprego, e leva a uma nova fase. Por exemplo, "a partir da doença, comecei a cuidar da saúde".

É uma expressão formal, parecida com をきっかけに.$$,
    $$É mais formal que をきっかけに e aparece muito em notícias e textos.

A forma を契機として é ainda mais formal.$$,
    $$Substantivo + を契機に / を契機として
Verbo (forma simples) + の + を契機に$$,
    $$を契機に$$,
    $$を契機に|を契機と|をけいきに$$,
    ARRAY['を', '契機', 'に']::text[],
    ARRAY['を契機に', 'を契機として', 'を契機にして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-122', $$病気を契機に、健康に気をつけるようになった。$$, $$びょうきをけいきに、けんこうにきをつけるようになった。$$, $$A partir da doença, passei a cuidar da saúde.$$),
    ('n2-grammar-122', $$結婚を契機として、仕事を辞めた。$$, $$けっこんをけいきとして、しごとをやめた。$$, $$Por ocasião do casamento, deixei o trabalho.$$),
    ('n2-grammar-122', $$オリンピックを契機に、町が大きく変わった。$$, $$オリンピックをけいきに、まちがおおきくかわった。$$, $$A partir das Olimpíadas, a cidade mudou muito.$$),
    ('n2-grammar-122', $$留学したのを契機に、国際問題に興味を持った。$$, $$りゅうがくしたのをけいきに、こくさいもんだいにきょうみをもった。$$, $$A partir do intercâmbio, passei a me interessar por questões internacionais.$$),
    ('n2-grammar-122', $$この事故を契機に、安全対策が見直された。$$, $$このじこをけいきに、あんぜんたいさくがみなおされた。$$, $$A partir deste acidente, as medidas de segurança foram revistas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$転職____、引っ越しをした。$$, $$Aproveitando a mudança de emprego, mudei de casa.$$),
        (2, $$子供の誕生____、たばこをやめた。$$, $$A partir do nascimento do meu filho, parei de fumar.$$),
        (3, $$震災____、防災意識が高まった。$$, $$A partir do terremoto, a consciência sobre prevenção de desastres aumentou.$$),
        (4, $$就職したの____、一人暮らしを始めた。$$, $$Por ocasião do primeiro emprego, comecei a morar sozinho.$$),
        (5, $$この出会い____、彼の人生は変わった。$$, $$A partir deste encontro, a vida dele mudou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-122', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を契機に$$),
        (1, $$を契機として$$),
        (1, $$をけいきに$$),
        (2, $$を契機に$$),
        (2, $$を契機として$$),
        (2, $$をけいきに$$),
        (3, $$を契機に$$),
        (3, $$を契機として$$),
        (3, $$をけいきに$$),
        (4, $$を契機に$$),
        (4, $$を契機として$$),
        (4, $$をけいきに$$),
        (5, $$を契機に$$),
        (5, $$を契機として$$),
        (5, $$をけいきに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
