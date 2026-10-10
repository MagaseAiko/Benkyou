-- n1-grammar-19 — 〜であれ〜であれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-19',
    'grammar',
    'N1',
    $$〜であれ〜であれ$$,
    $$de are ~ de are$$,
    $$Seja... seja / Quer... quer / Tanto... quanto$$,
    $$であれ〜であれ apresenta dois exemplos e mostra que, em qualquer um dos casos, a conclusão é a mesma. Equivale a "seja... seja" ou "quer... quer".

Por exemplo, "seja homem, seja mulher, todos têm os mesmos direitos" ou "seja de dia, seja de noite, ele trabalha".

É uma expressão formal, comum na escrita.$$,
    $$É parecido com にしろ〜にしろ e にせよ〜にせよ, mas であれ〜であれ só vem depois de substantivos.

Os dois elementos costumam ser opostos ou do mesmo grupo.$$,
    $$Substantivo + であれ + Substantivo + であれ$$,
    $$であれ〜であれ$$,
    $$であれ$$,
    ARRAY['で', 'あれ']::text[],
    ARRAY['であれ〜であれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-19', $$男性であれ女性であれ、同じ権利がある。$$, $$だんせいであれじょせいであれ、おなじけんりがある。$$, $$Seja homem, seja mulher, todos têm os mesmos direitos.$$),
    ('n1-grammar-19', $$晴れであれ雨であれ、試合は行われる。$$, $$はれであれあめであれ、しあいはおこなわれる。$$, $$Com sol ou com chuva, a partida será realizada.$$),
    ('n1-grammar-19', $$大人であれ子供であれ、命の重さは同じだ。$$, $$おとなであれこどもであれ、いのちのおもさはおなじだ。$$, $$Seja adulto, seja criança, o valor da vida é o mesmo.$$),
    ('n1-grammar-19', $$日本人であれ外国人であれ、ルールは守ること。$$, $$にほんじんであれがいこくじんであれ、ルールはまもること。$$, $$Seja japonês, seja estrangeiro, siga as regras.$$),
    ('n1-grammar-19', $$成功であれ失敗であれ、経験は財産になる。$$, $$せいこうであれしっぱいであれ、けいけんはざいさんになる。$$, $$Seja sucesso, seja fracasso, a experiência vira patrimônio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昼____夜であれ、彼は働き続けている。$$, $$De dia ou de noite, ele continua trabalhando.$$),
        (2, $$賛成であれ反対____、意見を述べてください。$$, $$A favor ou contra, dê a sua opinião.$$),
        (3, $$肉____魚であれ、新鮮なものを選ぶべきだ。$$, $$Seja carne, seja peixe, deve-se escolher o que é fresco.$$),
        (4, $$学生であれ社会人____、学ぶことは大切だ。$$, $$Seja estudante, seja trabalhador, aprender é importante.$$),
        (5, $$金持ち____貧乏であれ、幸せになる権利がある。$$, $$Seja rico, seja pobre, todos têm direito à felicidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$であれ$$),
        (2, $$であれ$$),
        (3, $$であれ$$),
        (4, $$であれ$$),
        (5, $$であれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
