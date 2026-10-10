-- n4-grammar-55 — 〜なさい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-55',
    'grammar',
    'N4',
    $$〜なさい$$,
    $$nasai$$,
    $$Faça! / Vá fazer (ordem)$$,
    $$なさい é usado para dar ordens. Equivale a "faça!" ou ao imperativo com tom de autoridade.

Ele é formado tirando ます do verbo e acrescentando なさい. Embora venha de なさる, que é um verbo respeitoso, なさい não soa respeitoso: ele é usado por quem está em posição de autoridade.

Os usos mais comuns são pais falando com filhos, professores falando com alunos e instruções em provas e exercícios escritos.

É mais suave que a forma imperativa (命令形), mas mais forte que てください. Por isso, nunca é usado com superiores ou com pessoas mais velhas.$$,
    $$Em provas japonesas, como o JLPT, as instruções usam muito なさい, como em "escolha a resposta correta".

Uma forma ainda mais suave, também usada por pais, é なさいね ou なさいよ.

Nas expressões おかえりなさい e おやすみなさい, なさい aparece com sentido de cumprimento, sem tom de ordem.$$,
    $$Verbo na forma ます sem ます + なさい
Substantivo de ação + しなさい$$,
    $$なさい$$,
    $$なさい$$,
    ARRAY['なさい']::text[],
    ARRAY['なさい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-55', $$もう七時よ。早く起きなさい。$$, $$もうしちじよ。はやくおきなさい。$$, $$Já são sete horas. Levante logo!$$),
    ('n4-grammar-55', $$ちゃんと野菜を食べなさい。$$, $$ちゃんとやさいをたべなさい。$$, $$Coma direito as verduras.$$),
    ('n4-grammar-55', $$授業中ですよ。静かにしなさい。$$, $$じゅぎょうちゅうですよ。しずかにしなさい。$$, $$Estamos em aula. Fiquem em silêncio.$$),
    ('n4-grammar-55', $$次の質問に答えなさい。$$, $$つぎのしつもんにこたえなさい。$$, $$Responda às perguntas a seguir.$$),
    ('n4-grammar-55', $$宿題をしてから遊びなさい。$$, $$しゅくだいをしてからあそびなさい。$$, $$Vá brincar depois de fazer a lição.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$もう九時だよ。早く寝____。$$, $$Já são nove horas. Vá dormir!$$),
        (2, $$ご飯の前に、手を洗い____。$$, $$Lave as mãos antes de comer.$$),
        (3, $$正しい答えを選び____。$$, $$Escolha a resposta correta.$$),
        (4, $$部屋が汚いわね。片付け____。$$, $$Seu quarto está bagunçado. Arrume-o!$$),
        (5, $$遅れないように、急ぎ____。$$, $$Apresse-se para não se atrasar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なさい$$),
        (2, $$なさい$$),
        (3, $$なさい$$),
        (4, $$なさい$$),
        (5, $$なさい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
