-- n5-grammar-69 — 〜てはいけない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-69',
    'grammar',
    'N5',
    $$〜てはいけない$$,
    $$te wa ikenai$$,
    $$Não pode / É proibido / Não deve$$,
    $$てはいけない é usado para dizer que algo é proibido ou não deve ser feito. Equivale a "não pode" ou "é proibido".

Literalmente, a estrutura significa "fazer isso não está bem". O verbo vai para a forma て, recebe は e depois いけない. Quando a forma て termina em で, a estrutura fica ではいけない.

É usada para regras, leis, proibições e conselhos firmes. Pais, professores e avisos públicos usam muito essa forma.

Na forma educada, fica てはいけません. Na fala do dia a dia, é comum a versão contraída ちゃいけない / じゃいけない.

Por ser forte, てはいけない não costuma ser usado para proibir algo diretamente a um superior. Nesses casos, prefere-se uma forma indireta.$$,
    $$Para responder a um pedido de permissão feito com てもいいですか, a resposta negativa natural é いいえ、〜てはいけません, mas muitas vezes os japoneses suavizam com すみません、ちょっと….

As formas てはだめ e ちゃだめ têm sentido parecido e são mais coloquiais.

O oposto de てはいけない é てもいい (pode fazer).$$,
    $$Verbo na forma て + は + いけない
Verbo na forma て (terminada em で) + は + いけない

Educado: てはいけません
Contração falada: ちゃいけない / じゃいけない$$,
    $$てはいけない$$,
    $$てはいけない|てはいけません|ではいけない|ではいけません$$,
    ARRAY['て', 'は', 'いけない']::text[],
    ARRAY['てはいけない', 'てはいけません', 'ではいけない', 'ではいけません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-69', $$ここでタバコを吸ってはいけません。$$, $$ここでタバコをすってはいけません。$$, $$Não é permitido fumar aqui.$$),
    ('n5-grammar-69', $$授業中に携帯電話を使ってはいけない。$$, $$じゅぎょうちゅうにけいたいでんわをつかってはいけない。$$, $$Não pode usar o celular durante a aula.$$),
    ('n5-grammar-69', $$この川で泳いではいけません。$$, $$このかわでおよいではいけません。$$, $$Não é permitido nadar neste rio.$$),
    ('n5-grammar-69', $$美術館の中で写真を撮ってはいけません。$$, $$びじゅつかんのなかでしゃしんをとってはいけません。$$, $$Não é permitido tirar fotos dentro do museu.$$),
    ('n5-grammar-69', $$人の悪口を言ってはいけないよ。$$, $$ひとのわるくちをいってはいけないよ。$$, $$Não se deve falar mal dos outros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$図書館で食べ物を食べ____。$$, $$Não é permitido comer na biblioteca.$$),
        (2, $$ここに車を止め____。$$, $$Não é permitido estacionar aqui.$$),
        (3, $$テストのとき、辞書を見____。$$, $$Durante a prova, não pode olhar o dicionário.$$),
        (4, $$お酒を飲んだら、車を運転し____。$$, $$Depois de beber, não se deve dirigir.$$),
        (5, $$このボタンを押し____と言われました。$$, $$Me disseram que não posso apertar este botão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てはいけません$$),
        (1, $$てはいけない$$),
        (2, $$てはいけません$$),
        (2, $$てはいけない$$),
        (3, $$てはいけません$$),
        (3, $$てはいけない$$),
        (4, $$てはいけません$$),
        (4, $$てはいけない$$),
        (5, $$てはいけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
