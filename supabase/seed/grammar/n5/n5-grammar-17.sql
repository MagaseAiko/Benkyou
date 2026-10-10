-- n5-grammar-17 — 一番
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-17',
    'grammar',
    'N5',
    $$一番$$,
    $$ichiban$$,
    $$O mais / Número um / Primeiro lugar$$,
    $$一番 é usado para formar o superlativo, ou seja, para dizer que algo é "o mais" de um grupo. Literalmente, significa "número um".

Ele vem antes de um adjetivo, de um advérbio ou de expressões como 好き, mostrando que aquilo está no grau máximo: o mais alto, o mais barato, o que eu mais gosto.

Muitas vezes, o grupo de comparação é indicado antes, com expressões como の中で ("entre") ou com um lugar seguido de で, como "no Japão" ou "na turma".

一番 também pode ser usado como substantivo, com o sentido de "primeiro lugar".$$,
    $$Para perguntar "qual é o mais...", usa-se uma palavra interrogativa com が, como 何が, 誰が, どこが ou いつが, seguida de 一番.

Quando a comparação é entre exatamente duas coisas, o japonês não usa 一番, e sim a estrutura com より e ほうが.

Na escrita do dia a dia, いちばん em hiragana é muito comum, principalmente quando funciona como advérbio.$$,
    $$一番 + Adjetivo
一番 + Advérbio / 好き / 嫌い
[Grupo] + の中で + [A] + が + 一番 + Adjetivo
[Lugar] + で + 一番 + Adjetivo + Substantivo
一番 + Substantivo (primeiro lugar)

Escrita: 一番 / いちばん$$,
    $$一番$$,
    $$一番|いちばん$$,
    ARRAY['一番']::text[],
    ARRAY['一番', 'いちばん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-17', $$富士山は日本で一番高い山です。$$, $$ふじさんはにほんでいちばんたかいやまです。$$, $$O Monte Fuji é a montanha mais alta do Japão.$$),
    ('n5-grammar-17', $$果物の中でりんごが一番好きです。$$, $$くだもののなかでりんごがいちばんすきです。$$, $$De todas as frutas, a que eu mais gosto é maçã.$$),
    ('n5-grammar-17', $$一番近い駅はどこですか。$$, $$いちばんちかいえきはどこですか。$$, $$Qual é a estação mais próxima?$$),
    ('n5-grammar-17', $$クラスで誰が一番背が高いですか。$$, $$クラスでだれがいちばんせがたかいですか。$$, $$Quem é o mais alto da turma?$$),
    ('n5-grammar-17', $$朝、学校に一番早く来たのは田中さんでした。$$, $$あさ、がっこうにいちばんはやくきたのはたなかさんでした。$$, $$Quem chegou mais cedo à escola de manhã foi o Tanaka.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族の中で父が____背が高いです。$$, $$Na minha família, quem é mais alto é meu pai.$$),
        (2, $$一年で____寒い月は何月ですか。$$, $$Qual é o mês mais frio do ano?$$),
        (3, $$スポーツの中で何が____好きですか。$$, $$De todos os esportes, qual você mais gosta?$$),
        (4, $$この店で____人気があるのはこのケーキです。$$, $$O mais popular desta loja é este bolo.$$),
        (5, $$マラソン大会で____になりました。$$, $$Fiquei em primeiro lugar na maratona.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一番$$),
        (1, $$いちばん$$),
        (2, $$一番$$),
        (2, $$いちばん$$),
        (3, $$一番$$),
        (3, $$いちばん$$),
        (4, $$一番$$),
        (4, $$いちばん$$),
        (5, $$一番$$),
        (5, $$いちばん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
