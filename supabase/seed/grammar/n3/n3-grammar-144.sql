-- n3-grammar-144 — 〜とすれば・〜としたら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-144',
    'grammar',
    'N3',
    $$〜とすれば・〜としたら$$,
    $$to sureba / to shitara$$,
    $$Se / Supondo que / Caso$$,
    $$とすれば e としたら são usados para apresentar uma hipótese ou suposição, e depois falar das consequências ou fazer uma pergunta sobre ela. Equivalem a "se", "supondo que" ou "caso".

A ideia literal é "se considerarmos que...". A condição pode ser algo imaginário ("se você tivesse cem milhões de ienes"), algo incerto ("se essa história for verdade") ou um plano ("se for fazer intercâmbio, qual país seria bom?").

としたら é mais comum na conversa, e とすれば soa um pouco mais formal e lógico. A forma とすると também existe, com sentido parecido.

Ele vem depois da forma simples completa. Com substantivos e adjetivos な, usa-se だ antes.$$,
    $$Comparado a たら e ば, とすれば e としたら destacam que a condição é uma suposição, e não algo certo.

Perguntas do tipo 生まれ変わるとしたら, 何になりたい？ ("se você renascesse, o que gostaria de ser?") são muito comuns em conversas.

Em textos lógicos, とすれば aparece para tirar conclusões a partir de uma premissa.$$,
    $$Frase (forma simples) + とすれば / としたら / とすると、 + Consequência / Pergunta
Substantivo / Adjetivo な + だ + とすれば / としたら$$,
    $$とすれば$$,
    $$とすれば|としたら|とすると$$,
    ARRAY['と', 'すれば']::text[],
    ARRAY['とすれば', 'としたら', 'とすると']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-144', $$明日雨が降るとすれば、試合は中止だ。$$, $$あしたあめがふるとすれば、しあいはちゅうしだ。$$, $$Se chover amanhã, a partida será cancelada.$$),
    ('n3-grammar-144', $$一億円あるとしたら、何をしますか。$$, $$いちおくえんあるとしたら、なにをしますか。$$, $$Supondo que você tivesse cem milhões de ienes, o que faria?$$),
    ('n3-grammar-144', $$彼の話が本当だとすれば、大変なことだ。$$, $$かれのはなしがほんとうだとすれば、たいへんなことだ。$$, $$Se a história dele for verdade, é algo grave.$$),
    ('n3-grammar-144', $$今から出発するとすると、何時に着きますか。$$, $$いまからしゅっぱつするとすると、なんじにつきますか。$$, $$Se sairmos agora, a que horas chegaremos?$$),
    ('n3-grammar-144', $$留学するとすれば、どの国がいいですか。$$, $$りゅうがくするとすれば、どのくにがいいですか。$$, $$Se fosse fazer intercâmbio, qual país seria bom?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$生まれ変わる____、何になりたいですか。$$, $$Se você renascesse, o que gostaria de ser?$$),
        (2, $$その噂が本当だ____、困ったことになる。$$, $$Se esse boato for verdade, vamos ter problemas.$$),
        (3, $$今度旅行に行く____、どこへ行きたい？$$, $$Se você fosse viajar da próxima vez, aonde gostaria de ir?$$),
        (4, $$一人で行く____、電車が一番便利だ。$$, $$Se for sozinho, o trem é o mais prático.$$),
        (5, $$彼が犯人だ____、動機は何だろう。$$, $$Se ele for o culpado, qual seria o motivo?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-144', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とすれば$$),
        (1, $$としたら$$),
        (2, $$とすれば$$),
        (2, $$としたら$$),
        (3, $$とすれば$$),
        (3, $$としたら$$),
        (4, $$とすれば$$),
        (4, $$としたら$$),
        (5, $$とすれば$$),
        (5, $$としたら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
