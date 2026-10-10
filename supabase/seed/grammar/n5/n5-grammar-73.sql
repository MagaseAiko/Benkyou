-- n5-grammar-73 — とても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-73',
    'grammar',
    'N5',
    $$とても$$,
    $$totemo$$,
    $$Muito / Bastante$$,
    $$とても é um advérbio que significa "muito". Ele aumenta a intensidade de adjetivos, advérbios e alguns verbos.

Ele vem antes da palavra que intensifica. É muito comum antes de adjetivos い e な, como "muito bonito" ou "muito difícil".

とても é neutro e pode ser usado tanto em conversas educadas quanto em informais. Também funciona bem com sentimentos, como "fiquei muito feliz".

Normalmente とても é usado em frases afirmativas. Em frases negativas, para dizer "não muito", o japonês usa あまり.$$,
    $$Na fala casual, すごく e めっちゃ são muito usados no lugar de とても. すごく é comum em qualquer conversa informal, e めっちゃ é bem jovem e coloquial.

Em níveis mais avançados, とても aparece com verbos no negativo com o sentido de "de jeito nenhum consigo", mas esse uso é diferente do "muito" básico.

Repetir とても várias vezes seguidas pode soar infantil. Para variar, use たいへん em situações formais.$$,
    $$とても + Adjetivo い
とても + Adjetivo な
とても + Advérbio
とても + Verbo de sentimento ou estado$$,
    $$とても$$,
    $$とても$$,
    ARRAY['とても']::text[],
    ARRAY['とても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-73', $$この映画はとてもおもしろいです。$$, $$このえいがはとてもおもしろいです。$$, $$Este filme é muito interessante.$$),
    ('n5-grammar-73', $$今日はとても寒いですね。$$, $$きょうはとてもさむいですね。$$, $$Hoje está muito frio, né?$$),
    ('n5-grammar-73', $$彼女はとても上手に日本語を話します。$$, $$かのじょはとてもじょうずににほんごをはなします。$$, $$Ela fala japonês muito bem.$$),
    ('n5-grammar-73', $$この町はとても静かです。$$, $$このまちはとてもしずかです。$$, $$Esta cidade é muito tranquila.$$),
    ('n5-grammar-73', $$プレゼント、とてもうれしかったです。$$, $$プレゼント、とてもうれしかったです。$$, $$Fiquei muito feliz com o presente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$富士山は____高い山です。$$, $$O Monte Fuji é uma montanha muito alta.$$),
        (2, $$このケーキは____おいしいです。$$, $$Este bolo é muito gostoso.$$),
        (3, $$昨日のテストは____難しかったです。$$, $$A prova de ontem foi muito difícil.$$),
        (4, $$田中さんは____親切な人です。$$, $$O Tanaka é uma pessoa muito gentil.$$),
        (5, $$お手紙、____うれしかったです。$$, $$Fiquei muito feliz com a sua carta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とても$$),
        (2, $$とても$$),
        (3, $$とても$$),
        (4, $$とても$$),
        (5, $$とても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
