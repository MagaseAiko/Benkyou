-- n4-grammar-122 — 〜より
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-122',
    'grammar',
    'N4',
    $$〜より$$,
    $$yori$$,
    $$Do que / Mais (do que)$$,
    $$No N4, より aparece em comparações de forma mais livre do que no N5. Ele marca o ponto de comparação, como "do que".

Além das estruturas básicas, より é muito usado com verbos e expressões de expectativa: 思ったより (do que eu pensava), 予定より (do que o planejado), いつもより (do que de costume).

Ele também liga ações: "em vez de telefonar, é melhor conversar pessoalmente", com より depois da primeira ação.

Antes de um adjetivo, sem ponto de comparação explícito, より funciona como advérbio e significa "mais", como em "uma vida melhor" ou "mais pessoas". Esse uso é mais comum na escrita e em discursos.$$,
    $$思ったより é uma das expressões mais úteis do japonês para falar de surpresas: "foi mais fácil do que eu pensava".

O uso de より como "mais", antes de adjetivos, é influência da escrita e soa um pouco formal.

Na escrita formal, より também pode significar "a partir de", como em horários de eventos.$$,
    $$A + より + Adjetivo (mais... do que A)
思った / 予定 / いつも + より + Adjetivo
Verbo A + より + Verbo B + ほうが + Adjetivo
より + Adjetivo + Substantivo (mais...)$$,
    $$より$$,
    $$より$$,
    ARRAY['より']::text[],
    ARRAY['より']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-122', $$今日の試験は思ったより簡単でした。$$, $$きょうのしけんはおもったよりかんたんでした。$$, $$A prova de hoje foi mais fácil do que eu pensava.$$),
    ('n4-grammar-122', $$去年より今年のほうが雪が多い。$$, $$きょねんよりことしのほうがゆきがおおい。$$, $$Este ano tem mais neve do que o ano passado.$$),
    ('n4-grammar-122', $$より良い生活のために、毎日頑張っています。$$, $$よりよいせいかつのために、まいにちがんばっています。$$, $$Eu me esforço todo dia por uma vida melhor.$$),
    ('n4-grammar-122', $$飛行機は予定より早く着きました。$$, $$ひこうきはよていよりはやくつきました。$$, $$O avião chegou mais cedo do que o previsto.$$),
    ('n4-grammar-122', $$電話するより、会って話したほうがいい。$$, $$でんわするより、あってはなしたほうがいい。$$, $$É melhor conversar pessoalmente do que telefonar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$テストは思った____難しかった。$$, $$A prova foi mais difícil do que eu pensava.$$),
        (2, $$今朝はいつも____早く起きました。$$, $$Hoje de manhã, acordei mais cedo do que de costume.$$),
        (3, $$新しいパソコンは前のもの____ずっと速い。$$, $$O computador novo é muito mais rápido do que o anterior.$$),
        (4, $$____多くの人に、この本を読んでほしい。$$, $$Quero que mais pessoas leiam este livro.$$),
        (5, $$外で食べる____、家で作るほうが安い。$$, $$Fazer comida em casa é mais barato do que comer fora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-122', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$より$$),
        (2, $$より$$),
        (3, $$より$$),
        (4, $$より$$),
        (5, $$より$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
