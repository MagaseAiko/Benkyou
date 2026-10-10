-- n3-grammar-43 — 〜きり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-43',
    'grammar',
    'N3',
    $$〜きり$$,
    $$kiri$$,
    $$Só / Sozinho(s) / Desde que (e nunca mais)$$,
    $$きり tem alguns usos principais, todos ligados à ideia de "limite" ou "ponto final".

O primeiro é "só", indicando um número limitado de pessoas ou vezes. Por exemplo, 二人きり (só os dois) e 一度きり (uma única vez).

O segundo, com o verbo na forma た, significa "desde que... e nunca mais". Indica que algo aconteceu e, depois disso, a situação esperada não voltou a acontecer. Por exemplo, "encontrei-o no ano passado e, desde então, nunca mais nos falamos" ou "meu filho saiu de manhã e ainda não voltou".

O terceiro aparece em expressões fixas, como 寝たきり (acamado), indicando um estado que continua sem mudar.

Na fala, きり costuma virar っきり, como em 二人っきり.$$,
    $$Com o verbo na forma た, a segunda parte quase sempre é negativa ou mostra que algo não aconteceu de novo.

寝たきり é usado para pessoas que ficam acamadas por doença ou idade.

それっきり significa "depois disso, nunca mais" e é muito usado em conversas.$$,
    $$Número + きり (só: 二人きり / 一度きり)
Verbo na forma た + きり、 + Frase negativa (desde que... e nunca mais)
Verbo た + きり + だ / になる (estado que continua)

Fala: っきり
Escrita: きり / 切り$$,
    $$きり$$,
    $$きり|切り|っきり$$,
    ARRAY['きり']::text[],
    ARRAY['きり', 'っきり', '切り']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-43', $$部屋には私と彼の二人きりだった。$$, $$へやにはわたしとかれのふたりきりだった。$$, $$No quarto, estávamos só eu e ele.$$),
    ('n3-grammar-43', $$彼とは去年会ったきり、連絡していない。$$, $$かれとはきょねんあったきり、れんらくしていない。$$, $$Eu o vi no ano passado e, desde então, nunca mais nos falamos.$$),
    ('n3-grammar-43', $$息子は朝出かけたきり、まだ帰ってこない。$$, $$むすこはあさでかけたきり、まだかえってこない。$$, $$Meu filho saiu de manhã e ainda não voltou.$$),
    ('n3-grammar-43', $$一度きりの人生だから、楽しみたい。$$, $$いちどきりのじんせいだから、たのしみたい。$$, $$A vida é uma só, então quero aproveitar.$$),
    ('n3-grammar-43', $$祖母は病気で寝たきりになった。$$, $$そぼはびょうきでねたきりになった。$$, $$Minha avó ficou acamada por causa da doença.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$兄は十年前に家を出た____、帰ってこない。$$, $$Meu irmão mais velho saiu de casa há dez anos e nunca mais voltou.$$),
        (2, $$二人____で話したいことがある。$$, $$Tenho uma coisa para falar só com você, a sós.$$),
        (3, $$このチャンスは一回____だ。$$, $$Esta chance é uma só.$$),
        (4, $$彼女とは高校を卒業した____会っていない。$$, $$Desde que me formei no colégio, nunca mais a vi.$$),
        (5, $$先週電話した____、彼から連絡がない。$$, $$Liguei semana passada e, desde então, ele não deu notícias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$きり$$),
        (2, $$きり$$),
        (3, $$きり$$),
        (4, $$きり$$),
        (5, $$きり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
