-- n3-grammar-115 — 〜たものだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-115',
    'grammar',
    'N3',
    $$〜たものだ$$,
    $$ta mono da$$,
    $$Costumava / Era comum (eu) fazer$$,
    $$たものだ é usado para relembrar, com nostalgia, algo que a pessoa costumava fazer no passado. Equivale a "costumava" ou "era comum eu fazer".

Ele é formado pelo verbo na forma た + ものだ. A ideia é olhar para trás com saudade, lembrando de hábitos da infância, da juventude ou de uma época especial.

É muito comum junto com palavras como よく (com frequência), 毎日, 昔, 子供のころ e 学生時代.

O tom é emocional e reflexivo, diferente de simplesmente usar o passado ou ていた, que só informam o fato.

Na fala casual, ものだ costuma virar もんだ.$$,
    $$ものだ tem outros usos: com a forma de dicionário, indica uma verdade geral ou um dever ("as pessoas são assim", "deve-se fazer assim"). Esses usos aparecem no N2.

たものだ aparece muito em conversas de pessoas mais velhas lembrando o passado.

Para hábitos passados sem nostalgia, basta usar ていた.$$,
    $$Verbo na forma た + ものだ / ものです
よく / 昔 / 子供のころ + … + Verbo た + ものだ

Fala casual: たもんだ$$,
    $$たものだ$$,
    $$たものだ|たものです|たもんだ|だものだ|だものです|だもんだ$$,
    ARRAY['た', 'もの', 'だ']::text[],
    ARRAY['たものだ', 'たものです', 'たもんだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-115', $$子供のころ、よくこの川で泳いだものだ。$$, $$こどものころ、よくこのかわでおよいだものだ。$$, $$Quando eu era criança, costumava nadar muito neste rio.$$),
    ('n3-grammar-115', $$学生時代は、毎晩遅くまで友達と話したものです。$$, $$がくせいじだいは、まいばんおそくまでともだちとはなしたものです。$$, $$Na época de estudante, eu costumava conversar com os amigos até tarde toda noite.$$),
    ('n3-grammar-115', $$昔はよく父に叱られたものだ。$$, $$むかしはよくちちにしかられたものだ。$$, $$Antigamente, eu levava muita bronca do meu pai.$$),
    ('n3-grammar-115', $$若いころは、よく一人で旅行したものだ。$$, $$わかいころは、よくひとりでりょこうしたものだ。$$, $$Quando era jovem, costumava viajar muito sozinho.$$),
    ('n3-grammar-115', $$小さいころ、この公園で毎日遊んだもんだ。$$, $$ちいさいころ、このこうえんでまいにちあそんだもんだ。$$, $$Quando eu era pequeno, brincava todo dia neste parque.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供のころは、よく外で遊んだ____。$$, $$Quando criança, eu costumava brincar muito lá fora.$$),
        (2, $$学生のころは、試験の前によく徹夜し____。$$, $$Na época de estudante, eu costumava virar a noite antes das provas.$$),
        (3, $$昔はこの道を毎日歩いて学校に行った____。$$, $$Antigamente, eu ia para a escola andando por esta rua todo dia.$$),
        (4, $$若いころは、よく夜まで踊った____。$$, $$Quando era jovem, costumava dançar até tarde da noite.$$),
        (5, $$祖母はよく昔の話をしてくれた____。$$, $$Minha avó costumava me contar histórias antigas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-115', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものだ$$),
        (1, $$ものです$$),
        (2, $$たものだ$$),
        (3, $$ものだ$$),
        (4, $$ものです$$),
        (4, $$ものだ$$),
        (5, $$ものだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
