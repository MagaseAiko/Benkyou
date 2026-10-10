-- n3-grammar-39 — 〜結果
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-39',
    'grammar',
    'N3',
    $$〜結果$$,
    $$kekka$$,
    $$Como resultado de / Depois de / O resultado$$,
    $$結果 significa "resultado". Como gramática, ele é usado para dizer que algo aconteceu como consequência de uma ação ou de um processo. Equivale a "como resultado de" ou "depois de".

Com verbos na forma た, indica que, depois de fazer algo, chegou-se a um resultado. Por exemplo, "depois de pensar bem, decidi estudar no exterior".

Com substantivos, usa-se の antes: 調査の結果 (como resultado da pesquisa), 話し合いの結果 (como resultado da conversa).

É uma forma objetiva e um pouco formal, muito usada em relatórios, notícias, explicações e decisões importantes.$$,
    $$結果的に significa "no fim das contas" ou "como resultado" e aparece muito em análises.

Para resultados de provas e exames, 結果 é usado como substantivo comum: 試験の結果.

Na linguagem de negócios, 〜の結果 é uma forma clara de apresentar conclusões.$$,
    $$Verbo na forma た + 結果、 + Resultado
Substantivo + の + 結果、 + Resultado
Substantivo + の + 結果 + は + … (o resultado de... é...)

Escrita: 結果 / けっか$$,
    $$結果$$,
    $$結果|けっか$$,
    ARRAY['結果']::text[],
    ARRAY['結果', 'けっか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-39', $$よく考えた結果、留学することにした。$$, $$よくかんがえたけっか、りゅうがくすることにした。$$, $$Depois de pensar bem, decidi fazer intercâmbio.$$),
    ('n3-grammar-39', $$調査の結果、新しいことがわかった。$$, $$ちょうさのけっか、あたらしいことがわかった。$$, $$Como resultado da pesquisa, descobriu-se algo novo.$$),
    ('n3-grammar-39', $$話し合いの結果、計画を変更した。$$, $$はなしあいのけっか、けいかくをへんこうした。$$, $$Depois da conversa, mudamos o plano.$$),
    ('n3-grammar-39', $$毎日練習した結果、試合に勝てた。$$, $$まいにちれんしゅうしたけっか、しあいにかてた。$$, $$Como resultado de treinar todo dia, conseguimos vencer a partida.$$),
    ('n3-grammar-39', $$試験の結果は来週発表されます。$$, $$しけんのけっかはらいしゅうはっぴょうされます。$$, $$O resultado da prova será divulgado na semana que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$検査の____、問題はありませんでした。$$, $$O resultado do exame não mostrou nenhum problema.$$),
        (2, $$家族と相談した____、仕事をやめることにした。$$, $$Depois de conversar com a família, decidi sair do emprego.$$),
        (3, $$一生懸命勉強した____、合格できた。$$, $$Como resultado de estudar muito, consegui passar.$$),
        (4, $$アンケートの____、多くの人が賛成した。$$, $$Pelo resultado do questionário, a maioria concordou.$$),
        (5, $$医者に診てもらった____、ただの風邪だとわかった。$$, $$Depois de me consultar com o médico, descobri que era só um resfriado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$結果$$),
        (1, $$けっか$$),
        (2, $$結果$$),
        (2, $$けっか$$),
        (3, $$結果$$),
        (3, $$けっか$$),
        (4, $$結果$$),
        (4, $$けっか$$),
        (5, $$結果$$),
        (5, $$けっか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
