-- n1-grammar-47 — 〜甲斐もなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-47',
    'grammar',
    'N1',
    $$〜甲斐もなく$$,
    $$kai mo naku$$,
    $$Apesar de / Em vão / Sem resultado$$,
    $$甲斐もなく indica que, apesar de um esforço, o resultado esperado não veio. Equivale a "apesar de..., em vão" ou "sem resultado".

A pessoa lamenta que todo o empenho não serviu para nada. Por exemplo, "apesar do tratamento, ele faleceu" ou "apesar de ter estudado, reprovei".

Também aparece como 甲斐がある, com o sentido de "vale a pena".$$,
    $$Também é escrito かいもなく. Depois de outras palavras, pode virar がい, como em やりがい e 生きがい.

Expressões comuns são 努力の甲斐もなく, 看病の甲斐もなく e 応援の甲斐もなく.$$,
    $$Verbo (forma た) + 甲斐もなく
Substantivo + の + 甲斐もなく$$,
    $$甲斐もなく$$,
    $$甲斐もなく|かいもなく|甲斐なく$$,
    ARRAY['甲斐', 'も', 'なく']::text[],
    ARRAY['甲斐もなく', 'かいもなく', '甲斐なく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-47', $$家族の看病の甲斐もなく、祖父は亡くなった。$$, $$かぞくのかんびょうのかいもなく、そふはなくなった。$$, $$Apesar dos cuidados da família, meu avô faleceu.$$),
    ('n1-grammar-47', $$一生懸命練習した甲斐もなく、試合に負けた。$$, $$いっしょうけんめいれんしゅうしたかいもなく、しあいにまけた。$$, $$Treinei com todo o empenho, mas em vão: perdemos a partida.$$),
    ('n1-grammar-47', $$応援の甲斐もなく、チームは予選で敗退した。$$, $$おうえんのかいもなく、チームはよせんではいたいした。$$, $$Apesar da torcida, a equipe foi eliminada nas eliminatórias.$$),
    ('n1-grammar-47', $$努力の甲斐もなく、計画は失敗に終わった。$$, $$どりょくのかいもなく、けいかくはしっぱいにおわった。$$, $$Apesar dos esforços, o plano acabou em fracasso.$$),
    ('n1-grammar-47', $$手術の甲斐なく、犬は助からなかった。$$, $$しゅじゅつのかいなく、いぬはたすからなかった。$$, $$Apesar da cirurgia, o cachorro não sobreviveu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日勉強した____、不合格だった。$$, $$Estudei todos os dias, mas em vão: reprovei.$$),
        (2, $$医者の治療の____、病気は悪化した。$$, $$Apesar do tratamento médico, a doença piorou.$$),
        (3, $$早起きした____、電車に乗り遅れた。$$, $$Acordei cedo, mas em vão: perdi o trem.$$),
        (4, $$説得の____、彼は会社を辞めた。$$, $$Apesar das tentativas de convencê-lo, ele saiu da empresa.$$),
        (5, $$ダイエットした____、体重は減らなかった。$$, $$Fiz dieta, mas sem resultado: não perdi peso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$甲斐もなく$$),
        (1, $$かいもなく$$),
        (2, $$甲斐もなく$$),
        (2, $$かいもなく$$),
        (2, $$甲斐なく$$),
        (3, $$甲斐もなく$$),
        (3, $$かいもなく$$),
        (4, $$甲斐もなく$$),
        (4, $$かいもなく$$),
        (4, $$甲斐なく$$),
        (5, $$甲斐もなく$$),
        (5, $$かいもなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
