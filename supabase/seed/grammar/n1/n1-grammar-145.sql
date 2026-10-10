-- n1-grammar-145 — 〜を控えて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-145',
    'grammar',
    'N1',
    $$〜を控えて$$,
    $$wo hikaete$$,
    $$Às vésperas de / Com... pela frente / Diante de$$,
    $$を控えて indica que um acontecimento importante está próximo. Equivale a "às vésperas de" ou "com... pela frente".

A segunda parte costuma descrever a preparação ou o estado da pessoa diante desse acontecimento. Por exemplo, "às vésperas da prova, os alunos estão nervosos".

É uma expressão formal.$$,
    $$Costuma vir com palavras como 試験, 結婚, 出発, 本番 e 選挙.

Também pode indicar um lugar próximo, como 後ろに山を控えて, "com a montanha atrás".$$,
    $$Substantivo (acontecimento / tempo) + を控えて / を控え
Substantivo + を控えた + Substantivo$$,
    $$を控えて$$,
    $$を控えて|を控え|を控えた|に控えて|に控え|をひかえて$$,
    ARRAY['を', '控えて']::text[],
    ARRAY['を控えて', 'を控え', 'を控えた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-145', $$試験を明日に控えて、学生たちは緊張している。$$, $$しけんをあしたにひかえて、がくせいたちはきんちょうしている。$$, $$Com a prova amanhã, os alunos estão nervosos.$$),
    ('n1-grammar-145', $$結婚を来月に控え、準備に忙しい。$$, $$けっこんをらいげつにひかえ、じゅんびにいそがしい。$$, $$Com o casamento no mês que vem, estou ocupado com os preparativos.$$),
    ('n1-grammar-145', $$本番を控えて、最後の練習をした。$$, $$ほんばんをひかえて、さいごのれんしゅうをした。$$, $$Às vésperas da apresentação, fizemos o último ensaio.$$),
    ('n1-grammar-145', $$選挙を控えた候補者たちは、演説を続けている。$$, $$せんきょをひかえたこうほしゃたちは、えんぜつをつづけている。$$, $$Os candidatos, com a eleição pela frente, continuam discursando.$$),
    ('n1-grammar-145', $$出発を一週間後に控えて、荷物をまとめ始めた。$$, $$しゅっぱつをいっしゅうかんごにひかえて、にもつをまとめはじめた。$$, $$Com a partida dali a uma semana, comecei a arrumar a bagagem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$卒業____、学生たちは将来について考えている。$$, $$Às vésperas da formatura, os alunos pensam no futuro.$$),
        (2, $$手術を明日に____、不安でたまらない。$$, $$Com a cirurgia amanhã, estou extremamente ansioso.$$),
        (3, $$大会____、選手たちは毎日練習している。$$, $$Com o campeonato pela frente, os atletas treinam todos os dias.$$),
        (4, $$出産____妻のために、部屋を片付けた。$$, $$Arrumei o quarto para minha esposa, que está às vésperas do parto.$$),
        (5, $$開店____、スタッフは準備に追われている。$$, $$Às vésperas da inauguração, a equipe está atarefada com os preparativos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-145', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を控えて$$),
        (1, $$を控え$$),
        (1, $$をひかえて$$),
        (2, $$控えて$$),
        (2, $$控え$$),
        (3, $$を控えて$$),
        (3, $$を控え$$),
        (3, $$をひかえて$$),
        (4, $$を控えた$$),
        (5, $$を控えて$$),
        (5, $$を控え$$),
        (5, $$をひかえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
