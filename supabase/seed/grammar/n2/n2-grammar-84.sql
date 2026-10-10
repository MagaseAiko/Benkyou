-- n2-grammar-84 — なお
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-84',
    'grammar',
    'N2',
    $$なお$$,
    $$nao$$,
    $$Além disso / Observação / Ainda mais$$,
    $$なお tem dois usos principais.

O primeiro é no começo de uma frase, para acrescentar uma informação complementar. Equivale a "além disso" ou "observação". É muito usado em avisos, e-mails e documentos formais. Por exemplo, "além disso, o estacionamento não está disponível".

O segundo é como advérbio, com o sentido de "ainda mais" ou "mais ainda". Por exemplo, "se você puder vir, será ainda melhor".$$,
    $$No uso de complemento, é parecido com ちなみに, mas なお é mais formal.

No uso de advérbio, é parecido com さらに e もっと.

A expressão なおさら significa "mais ainda".$$,
    $$Frase + なお、 + Informação complementar
なお + Adjetivo / Verbo (ainda mais)$$,
    $$なお$$,
    $$なお$$,
    ARRAY['なお']::text[],
    ARRAY['なお', 'なおさら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-84', $$会議は三時からです。なお、駐車場はありません。$$, $$かいぎはさんじからです。なお、ちゅうしゃじょうはありません。$$, $$A reunião é a partir das três. Além disso, não há estacionamento.$$),
    ('n2-grammar-84', $$申し込みは今月末までです。なお、詳細はホームページをご覧ください。$$, $$もうしこみはこんげつまつまでです。なお、しょうさいはホームページをごらんください。$$, $$As inscrições vão até o fim do mês. Para detalhes, veja o site.$$),
    ('n2-grammar-84', $$薬を飲んだが、なお熱が下がらない。$$, $$くすりをのんだが、なおねつがさがらない。$$, $$Tomei o remédio, mas a febre ainda não baixou.$$),
    ('n2-grammar-84', $$来てくれれば、なおうれしい。$$, $$きてくれれば、なおうれしい。$$, $$Se você vier, ficarei ainda mais feliz.$$),
    ('n2-grammar-84', $$説明を聞いて、なおさらわからなくなった。$$, $$せつめいをきいて、なおさらわからなくなった。$$, $$Ouvindo a explicação, fiquei ainda mais confuso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試験は九時に始まります。____、遅刻した人は入室できません。$$, $$A prova começa às nove. Além disso, quem se atrasar não poderá entrar.$$),
        (2, $$参加費は無料です。____、飲み物は各自でご用意ください。$$, $$A participação é gratuita. Observação: cada um deve trazer sua própria bebida.$$),
        (3, $$少し休んだが、____疲れが取れない。$$, $$Descansei um pouco, mas o cansaço ainda não passou.$$),
        (4, $$安くて、おいしければ____いい。$$, $$Se for barato e gostoso, melhor ainda.$$),
        (5, $$本日は休業です。____、明日は通常通り営業します。$$, $$Hoje estamos fechados. Além disso, amanhã funcionaremos normalmente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なお$$),
        (2, $$なお$$),
        (3, $$なお$$),
        (4, $$なお$$),
        (5, $$なお$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
