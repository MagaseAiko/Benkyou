-- n5-grammar-20 — 〜じゃない・〜ではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-20',
    'grammar',
    'N5',
    $$〜じゃない・〜ではない$$,
    $$ja nai / dewa nai$$,
    $$Não é / Não está / Não ser$$,
    $$じゃない e ではない são a forma negativa de だ e です. Eles servem para dizer que algo "não é" alguma coisa.

São usados depois de substantivos e de adjetivos な (sem o な). Com adjetivos い, o negativo é diferente: usa-se くない.

A diferença entre as duas formas é o tom. ではない é a forma completa e soa mais formal e mais adequada à escrita. じゃない é a contração falada de では e é a mais comum nas conversas.

Para deixar educado, existem duas opções: じゃありません / ではありません, que são mais formais, e じゃないです / ではないです, que são educadas mas um pouco mais leves.

Com entonação de pergunta, じゃない também pode ser usado para confirmar algo que a pessoa acha que é verdade, como "não é o Tanaka?".$$,
    $$Na escrita formal, como relatórios e textos acadêmicos, prefere-se ではない. Na fala cotidiana, じゃない aparece muito mais.

O uso de じゃない como confirmação depende da entonação: subindo no final, a frase vira uma pergunta do tipo "não é?". Esse uso também aparece com verbos e adjetivos, como em "não é bom?".

Um erro comum é usar じゃない com adjetivos い, como dizer 高いじゃない querendo dizer "não é caro". O correto é 高くない.$$,
    $$Substantivo + じゃない / ではない
Adjetivo な (sem な) + じゃない / ではない

Educado: じゃありません / ではありません / じゃないです / ではないです
Passado: じゃなかった / ではなかった
Passado educado: じゃありませんでした / ではありませんでした / じゃなかったです / ではなかったです$$,
    $$ではない$$,
    $$じゃない|ではない|じゃありません|ではありません|じゃなかった|ではなかった$$,
    ARRAY['じゃ', 'では', 'ない']::text[],
    ARRAY['じゃない', 'ではない', 'じゃありません', 'ではありません', 'じゃないです', 'ではないです', 'じゃなかった', 'ではなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-20', $$私は医者じゃない。$$, $$わたしはいしゃじゃない。$$, $$Eu não sou médico.$$),
    ('n5-grammar-20', $$これは私の傘ではありません。$$, $$これはわたしのかさではありません。$$, $$Este não é o meu guarda-chuva.$$),
    ('n5-grammar-20', $$この町はあまり静かじゃないです。$$, $$このまちはあまりしずかじゃないです。$$, $$Esta cidade não é muito tranquila.$$),
    ('n5-grammar-20', $$昨日は休みじゃなかった。$$, $$きのうはやすみじゃなかった。$$, $$Ontem não foi folga.$$),
    ('n5-grammar-20', $$野菜はあまり好きではありません。$$, $$やさいはあまりすきではありません。$$, $$Não gosto muito de verdura.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は学生____。$$, $$Ele não é estudante.$$),
        (2, $$この部屋はあまりきれい____。$$, $$Este quarto não está muito limpo.$$),
        (3, $$今日は月曜日____。火曜日です。$$, $$Hoje não é segunda-feira. É terça.$$),
        (4, $$昨日のテストは簡単____。$$, $$A prova de ontem não foi fácil.$$),
        (5, $$「あれ、田中さん____？」「うん、そうだよ。」$$, $$"Ei, aquele não é o Tanaka?" "É, sim."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$じゃない$$),
        (1, $$ではない$$),
        (1, $$じゃありません$$),
        (1, $$ではありません$$),
        (1, $$じゃないです$$),
        (1, $$ではないです$$),
        (2, $$じゃない$$),
        (2, $$ではない$$),
        (2, $$じゃありません$$),
        (2, $$ではありません$$),
        (2, $$じゃないです$$),
        (2, $$ではないです$$),
        (3, $$じゃありません$$),
        (3, $$ではありません$$),
        (3, $$じゃないです$$),
        (3, $$ではないです$$),
        (4, $$じゃなかった$$),
        (4, $$ではなかった$$),
        (4, $$じゃありませんでした$$),
        (4, $$ではありませんでした$$),
        (4, $$じゃなかったです$$),
        (4, $$ではなかったです$$),
        (5, $$じゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
