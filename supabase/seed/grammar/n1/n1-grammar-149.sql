-- n1-grammar-149 — 〜を兼ねて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-149',
    'grammar',
    'N1',
    $$〜を兼ねて$$,
    $$wo kanete$$,
    $$Para também / Aproveitando para / Servindo também como$$,
    $$を兼ねて indica que uma ação serve a dois ou mais objetivos ao mesmo tempo. Equivale a "para também" ou "servindo também como".

Por exemplo, "faço caminhada também como exercício" ou "a viagem a trabalho serviu também de passeio".

É uma expressão comum, usada tanto na fala quanto na escrita.$$,
    $$Expressões comuns são 趣味と実益を兼ねて, 運動を兼ねて e 観光を兼ねて.

É parecido com がてら e かたがた.$$,
    $$Substantivo + を兼ねて + Verbo
Substantivo + と + Substantivo + を兼ねて$$,
    $$を兼ねて$$,
    $$を兼ねて|を兼ね|をかねて$$,
    ARRAY['を', '兼ねて']::text[],
    ARRAY['を兼ねて', 'を兼ね']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-149', $$運動を兼ねて、毎朝散歩している。$$, $$うんどうをかねて、まいあささんぽしている。$$, $$Caminho toda manhã, também como exercício.$$),
    ('n1-grammar-149', $$出張と観光を兼ねて、京都に行った。$$, $$しゅっちょうとかんこうをかねて、きょうとにいった。$$, $$Fui a Kyoto a trabalho e, ao mesmo tempo, para passear.$$),
    ('n1-grammar-149', $$趣味と実益を兼ねて、家庭菜園を始めた。$$, $$しゅみとじつえきをかねて、かていさいえんをはじめた。$$, $$Comecei uma horta em casa, como hobby e também para ter benefício prático.$$),
    ('n1-grammar-149', $$この部屋は書斎と客間を兼ねている。$$, $$このへやはしょさいときゃくまをかねている。$$, $$Este quarto serve de escritório e também de quarto de hóspedes.$$),
    ('n1-grammar-149', $$お礼を兼ねて、先生の家を訪ねた。$$, $$おれいをかねて、せんせいのいえをたずねた。$$, $$Visitei a casa do professor, aproveitando para agradecer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$気分転換____、旅行に出かけた。$$, $$Saí de viagem também para mudar de ares.$$),
        (2, $$勉強____、英語の映画を見ている。$$, $$Assisto filmes em inglês também para estudar.$$),
        (3, $$下見____、会場に行ってみた。$$, $$Fui ao local também para fazer um reconhecimento.$$),
        (4, $$ダイエット____、自転車で通勤している。$$, $$Vou de bicicleta para o trabalho também para emagrecer.$$),
        (5, $$挨拶____、新しい近所の人を訪ねた。$$, $$Visitei os novos vizinhos aproveitando para me apresentar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-149', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を兼ねて$$),
        (1, $$を兼ね$$),
        (1, $$をかねて$$),
        (2, $$を兼ねて$$),
        (2, $$を兼ね$$),
        (2, $$をかねて$$),
        (3, $$を兼ねて$$),
        (3, $$を兼ね$$),
        (3, $$をかねて$$),
        (4, $$を兼ねて$$),
        (4, $$を兼ね$$),
        (4, $$をかねて$$),
        (5, $$を兼ねて$$),
        (5, $$を兼ね$$),
        (5, $$をかねて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
