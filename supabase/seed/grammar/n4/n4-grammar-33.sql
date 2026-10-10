-- n4-grammar-33 — 〜頃・〜ごろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-33',
    'grammar',
    'N4',
    $$〜頃・〜ごろ$$,
    $$koro / goro$$,
    $$Por volta de / Na época em que / Quando$$,
    $$頃 tem dois usos principais, e a leitura muda conforme o uso.

Lido ごろ, ele vem depois de horários, datas e momentos específicos para indicar um tempo aproximado. Equivale a "por volta de" ou "lá pelas". Por exemplo, "por volta das sete".

Lido ころ, ele indica uma época ou um período, geralmente mais amplo. Equivale a "na época em que" ou "quando". É muito usado para falar da infância, da juventude ou de um tempo do passado.

No uso de época, ころ funciona como substantivo: vem depois de の com substantivos, e diretamente depois de verbos e adjetivos.

Também pode indicar que chegou o momento esperado de algo, como "já está na hora de ele chegar".$$,
    $$Com horários, ごろ já indica aproximação, então não é necessário に depois. Dizer 七時ごろに também é aceito, mas 七時ごろ sozinho é mais comum.

A expressão 子供の頃 é praticamente fixa para falar da infância.

ぐらい / くらい também indica aproximação, mas de quantidade ou duração, como "cerca de uma hora". ごろ é para um ponto no tempo.$$,
    $$Horário / Data + ごろ (por volta de)
Substantivo + の + 頃 (ころ) (na época de)
Verbo / Adjetivo い + 頃 (ころ)
Adjetivo な + な + 頃 (ころ)

Escrita: 頃 / ころ / ごろ$$,
    $$頃$$,
    $$頃|ころ|ごろ$$,
    ARRAY['頃']::text[],
    ARRAY['頃', 'ころ', 'ごろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-33', $$毎朝七時ごろ起きます。$$, $$まいあさしちじごろおきます。$$, $$Toda manhã acordo por volta das sete.$$),
    ('n4-grammar-33', $$子供の頃、よく海で泳ぎました。$$, $$こどものころ、よくうみでおよぎました。$$, $$Quando eu era criança, nadava muito no mar.$$),
    ('n4-grammar-33', $$三月の終わり頃、桜が咲きます。$$, $$さんがつのおわりごろ、さくらがさきます。$$, $$As cerejeiras florescem lá pelo fim de março.$$),
    ('n4-grammar-33', $$学生の頃は、毎日アルバイトをしていた。$$, $$がくせいのころは、まいにちアルバイトをしていた。$$, $$Na época de estudante, eu trabalhava meio período todo dia.$$),
    ('n4-grammar-33', $$もうそろそろ彼が着く頃です。$$, $$もうそろそろかれがつくころです。$$, $$Já está quase na hora de ele chegar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日は十一時____寝ました。$$, $$Ontem dormi por volta das onze.$$),
        (2, $$若い____、よく旅行をしました。$$, $$Quando era jovem, viajava bastante.$$),
        (3, $$来週の水曜日____、また連絡します。$$, $$Entro em contato de novo lá pela quarta-feira da semana que vem.$$),
        (4, $$小学生の____、犬を飼っていました。$$, $$Na época do primário, eu tinha um cachorro.$$),
        (5, $$桜が咲く____に、日本へ行きたいです。$$, $$Quero ir ao Japão na época em que as cerejeiras florescem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ごろ$$),
        (1, $$頃$$),
        (2, $$頃$$),
        (2, $$ころ$$),
        (3, $$ごろ$$),
        (3, $$頃$$),
        (4, $$頃$$),
        (4, $$ころ$$),
        (5, $$頃$$),
        (5, $$ころ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
