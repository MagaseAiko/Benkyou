-- n3-grammar-76 — 〜に関する・〜に関して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-76',
    'grammar',
    'N3',
    $$〜に関する・〜に関して$$,
    $$ni kansuru / ni kanshite$$,
    $$Sobre / A respeito de / Relativo a$$,
    $$に関する e に関して são usados para indicar o assunto ou o tema de algo. Equivalem a "sobre", "a respeito de" ou "relativo a".

に関する vem antes de um substantivo e o descreve: 歴史に関する本 (um livro sobre história).

に関して vem antes de um verbo ou de uma frase: この件に関して質問がある (tenho uma pergunta a respeito deste assunto).

O sentido é parecido com について, mas に関する e に関して soam mais formais e objetivos. Por isso, aparecem muito em documentos, reuniões, notícias e textos acadêmicos.

Com は, a forma に関しては destaca o tema, às vezes com contraste: "em relação a economia, ele entende bem".$$,
    $$Na conversa casual, について é mais comum. に関して é típico de situações formais.

Antes de substantivos, について usa の (についての本), enquanto に関する se liga direto (に関する本).

Em e-mails de trabalho, 〜に関しまして é uma versão ainda mais polida.$$,
    $$Substantivo + に関する + Substantivo
Substantivo + に関して + Verbo / Frase
Substantivo + に関しては + … (quanto a...)

Escrita: に関する / にかんする$$,
    $$に関する$$,
    $$に関す|に関し|にかんし|にかんす$$,
    ARRAY['に', '関する']::text[],
    ARRAY['に関する', 'に関して', 'に関しては', 'に関しまして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-76', $$日本の歴史に関する本を読んでいます。$$, $$にほんのれきしにかんするほんをよんでいます。$$, $$Estou lendo um livro sobre a história do Japão.$$),
    ('n3-grammar-76', $$この件に関して、何か質問はありますか。$$, $$このけんにかんして、なにかしつもんはありますか。$$, $$Há alguma pergunta a respeito deste assunto?$$),
    ('n3-grammar-76', $$環境問題に関するレポートを書いた。$$, $$かんきょうもんだいにかんするレポートをかいた。$$, $$Escrevi um relatório sobre problemas ambientais.$$),
    ('n3-grammar-76', $$事故に関して、警察が調べている。$$, $$じこにかんして、けいさつがしらべている。$$, $$A polícia está investigando o acidente.$$),
    ('n3-grammar-76', $$彼は経済に関しては詳しい。$$, $$かれはけいざいにかんしてはくわしい。$$, $$Quanto a economia, ele entende bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$留学____情報を集めている。$$, $$Estou reunindo informações sobre intercâmbio.$$),
        (2, $$その問題____、話し合いましょう。$$, $$Vamos conversar a respeito desse problema.$$),
        (3, $$最近、健康____ニュースが増えている。$$, $$Ultimamente, as notícias sobre saúde estão aumentando.$$),
        (4, $$新しい規則____、説明があった。$$, $$Houve uma explicação a respeito das novas regras.$$),
        (5, $$彼はコンピューター____知識が豊富だ。$$, $$Ele tem muito conhecimento sobre computadores.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に関する$$),
        (2, $$に関して$$),
        (3, $$に関する$$),
        (4, $$に関して$$),
        (5, $$に関する$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
