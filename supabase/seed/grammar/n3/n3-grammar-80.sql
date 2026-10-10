-- n3-grammar-80 — 〜において・〜における
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-80',
    'grammar',
    'N3',
    $$〜において・〜における$$,
    $$ni oite / ni okeru$$,
    $$Em / No âmbito de / Na área de$$,
    $$において e における são formas formais de indicar o lugar, a situação ou a área em que algo acontece. Equivalem a "em", "no âmbito de" ou "na área de".

において funciona como a partícula で, mas em linguagem formal. Ele vem antes de verbos: 会議は東京において行われる (a reunião será realizada em Tóquio).

における vem antes de substantivos e os descreve: 日本における外国人 (os estrangeiros no Japão).

Além de lugares físicos, essas formas indicam áreas, campos e situações abstratas, como "na sociedade moderna", "na área da ciência" ou "na educação".

São típicas de textos escritos, notícias, discursos, documentos oficiais e textos acadêmicos.$$,
    $$Na conversa do dia a dia, usar において soa exageradamente formal. Prefira で.

Em convites oficiais e programas de eventos, aparecem frases como 〜において開催します.

における é muito usado em títulos de trabalhos acadêmicos, como "o papel de X na sociedade".$$,
    $$Substantivo (lugar / área / situação) + において + Verbo
Substantivo + における + Substantivo
Substantivo + においては + … (no que diz respeito a...)
Substantivo + においても + … (também em...)$$,
    $$において$$,
    $$において|における|においては|に於いて$$,
    ARRAY['に', 'おいて']::text[],
    ARRAY['において', 'における', 'においては', 'においても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-80', $$国際会議は東京において行われる。$$, $$こくさいかいぎはとうきょうにおいておこなわれる。$$, $$A conferência internacional será realizada em Tóquio.$$),
    ('n3-grammar-80', $$現代社会において、インターネットは欠かせない。$$, $$げんだいしゃかいにおいて、インターネットはかかせない。$$, $$Na sociedade moderna, a internet é indispensável.$$),
    ('n3-grammar-80', $$彼は科学の分野において有名だ。$$, $$かれはかがくのぶんやにおいてゆうめいだ。$$, $$Ele é famoso na área da ciência.$$),
    ('n3-grammar-80', $$日本における外国人の数は増えている。$$, $$にほんにおけるがいこくじんのかずはふえている。$$, $$O número de estrangeiros no Japão está aumentando.$$),
    ('n3-grammar-80', $$教育においては、家庭の役割も大切だ。$$, $$きょういくにおいては、かていのやくわりもたいせつだ。$$, $$No que diz respeito à educação, o papel da família também é importante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$卒業式は体育館____行われます。$$, $$A cerimônia de formatura será realizada no ginásio.$$),
        (2, $$日本____少子化は大きな問題だ。$$, $$A queda da natalidade no Japão é um grande problema.$$),
        (3, $$ビジネス____、時間を守ることは大切だ。$$, $$Nos negócios, é importante ser pontual.$$),
        (4, $$戦争中____人々の生活について調べた。$$, $$Pesquisei sobre a vida das pessoas durante a guerra.$$),
        (5, $$彼女は音楽の世界____活躍している。$$, $$Ela se destaca no mundo da música.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$において$$),
        (2, $$における$$),
        (3, $$において$$),
        (4, $$における$$),
        (5, $$において$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
