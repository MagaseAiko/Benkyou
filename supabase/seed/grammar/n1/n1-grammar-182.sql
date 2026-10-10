-- n1-grammar-182 — 〜たら〜ところだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-182',
    'grammar',
    'N1',
    $$〜たら〜ところだ$$,
    $$tara ~ tokoro da$$,
    $$Se tivesse... teria / Se fosse... seria / Caso contrário teria$$,
    $$たら〜ところだ indica uma situação hipotética, contrária à realidade. Equivale a "se tivesse..., teria...".

A pessoa imagina o que teria acontecido se algo fosse diferente. Muitas vezes há alívio ou arrependimento. Por exemplo, "se não tivesse levado guarda-chuva, teria me molhado todo".

As formas ば〜ところだ e なら〜ところだ têm o mesmo sentido.$$,
    $$É muito comum na forma ところだった, no passado.

Também aparece como ところです, mais educado.$$,
    $$Verbo (forma たら / ば) + 〜 + Verbo (forma dicionário) + ところだ / ところだった$$,
    $$たら〜ところだ$$,
    $$ところだ|ところです$$,
    ARRAY['たら', 'ところ', 'だ']::text[],
    ARRAY['たら〜ところだ', 'たら〜ところだった', 'ば〜ところだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-182', $$傘を持っていなかったら、ずぶぬれになるところだった。$$, $$かさをもっていなかったら、ずぶぬれになるところだった。$$, $$Se eu não tivesse levado guarda-chuva, teria ficado encharcado.$$),
    ('n1-grammar-182', $$君が教えてくれなかったら、忘れるところだった。$$, $$きみがおしえてくれなかったら、わすれるところだった。$$, $$Se você não tivesse me avisado, eu teria esquecido.$$),
    ('n1-grammar-182', $$もう少し安かったら、買うところだ。$$, $$もうすこしやすかったら、かうところだ。$$, $$Se fosse um pouco mais barato, eu compraria.$$),
    ('n1-grammar-182', $$時間があれば、手伝うところですが、今日は無理です。$$, $$じかんがあれば、てつだうところですが、きょうはむりです。$$, $$Se eu tivesse tempo, ajudaria, mas hoje não dá.$$),
    ('n1-grammar-182', $$いつもなら怒るところだが、今日は許してあげる。$$, $$いつもならおこるところだが、きょうはゆるしてあげる。$$, $$Normalmente eu ficaria bravo, mas hoje vou perdoar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ブレーキが遅れていたら、事故になる____。$$, $$Se tivesse freado mais tarde, teria havido um acidente.$$),
        (2, $$地図がなかったら、道に迷う____。$$, $$Sem o mapa, eu teria me perdido.$$),
        (3, $$普通なら断る____が、あなたの頼みなら引き受けます。$$, $$Normalmente eu recusaria, mas sendo um pedido seu, aceito.$$),
        (4, $$目覚ましが鳴らなかったら、遅刻する____。$$, $$Se o despertador não tivesse tocado, eu teria me atrasado.$$),
        (5, $$お金があれば、行く____けど、今月は厳しい。$$, $$Se eu tivesse dinheiro, iria, mas este mês está apertado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-182', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところだった$$),
        (2, $$ところだった$$),
        (3, $$ところだ$$),
        (3, $$ところです$$),
        (4, $$ところだった$$),
        (5, $$ところだ$$),
        (5, $$ところです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
