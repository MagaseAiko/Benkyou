-- n1-grammar-137 — 〜には及ばない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-137',
    'grammar',
    'N1',
    $$〜には及ばない$$,
    $$ni wa oyobanai$$,
    $$Não é necessário / Não precisa / Não chega aos pés de$$,
    $$には及ばない tem dois usos principais.

O primeiro indica que algo não é necessário, de forma educada. Equivale a "não é necessário" ou "não precisa". Por exemplo, "não precisa vir até aqui".

O segundo indica que alguém ou algo não alcança o nível de outro. Equivale a "não chega aos pés de". Por exemplo, "eu não chego aos pés dele em inglês".$$,
    $$No primeiro uso, é parecido com までもない e 必要はない.

A expressão お礼には及びません significa "não precisa agradecer".$$,
    $$Verbo (forma dicionário) + には及ばない (não é necessário)
Substantivo + には及ばない (não alcança)$$,
    $$には及ばない$$,
    $$には及ばない|には及びません|にはおよばない|に及ばない$$,
    ARRAY['に', 'は', '及ばない']::text[],
    ARRAY['には及ばない', 'には及びません', 'に及ばない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-137', $$わざわざ来ていただくには及びません。$$, $$わざわざきていただくにはおよびません。$$, $$Não é necessário vir até aqui.$$),
    ('n1-grammar-137', $$心配するには及ばないよ。$$, $$しんぱいするにはおよばないよ。$$, $$Não precisa se preocupar.$$),
    ('n1-grammar-137', $$英語では、私は彼には及ばない。$$, $$えいごでは、わたしはかれにはおよばない。$$, $$Em inglês, eu não chego aos pés dele.$$),
    ('n1-grammar-137', $$お礼には及びません。$$, $$おれいにはおよびません。$$, $$Não precisa agradecer.$$),
    ('n1-grammar-137', $$どんなに練習しても、プロには及ばない。$$, $$どんなにれんしゅうしても、プロにはおよばない。$$, $$Por mais que eu treine, não chego ao nível de um profissional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ご返事をいただく____。$$, $$Não é necessário responder.$$),
        (2, $$この程度のけがなら、病院に行く____。$$, $$Com um machucado desses, não precisa ir ao hospital.$$),
        (3, $$料理の腕では、母____。$$, $$Na cozinha, não chego aos pés da minha mãe.$$),
        (4, $$急ぐ____。ゆっくりでいいですよ。$$, $$Não precisa ter pressa. Pode ser com calma.$$),
        (5, $$私の実力は、まだ先輩____。$$, $$Minha habilidade ainda não chega à do meu veterano.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-137', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$には及ばない$$),
        (1, $$には及びません$$),
        (2, $$には及ばない$$),
        (2, $$には及びません$$),
        (3, $$には及ばない$$),
        (3, $$には及びません$$),
        (4, $$には及ばない$$),
        (4, $$には及びません$$),
        (5, $$には及ばない$$),
        (5, $$には及びません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
