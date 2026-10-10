-- n3-grammar-04 — 〜合う
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-04',
    'grammar',
    'N3',
    $$〜合う$$,
    $$au$$,
    $$Um ao outro / Mutuamente / Juntos$$,
    $$合う, ligado a outro verbo, indica que duas ou mais pessoas fazem a mesma ação uma com a outra, de forma recíproca. Equivale a "um ao outro", "mutuamente" ou "entre si".

A estrutura junta o verbo na forma ます sem ます com 合う. O resultado funciona como um verbo do grupo 1.

Por exemplo, ajudar-se mutuamente, conversar entre si, trocar opiniões, abraçar-se.

É muito comum com verbos de comunicação e cooperação, como 話す, 助ける, 教える, 協力する e 出す (no sentido de apresentar ideias).

Para reforçar a ideia de reciprocidade, também se usa お互いに (um ao outro) antes do verbo.$$,
    $$話し合う significa "discutir" ou "conversar para chegar a um acordo", e virou uma palavra muito usada sozinha.

Sozinho, 合う significa "combinar", "servir" ou "estar certo", como em サイズが合う (o tamanho serve).

A ideia de cooperação de 合う reflete um valor importante na cultura japonesa: resolver as coisas em grupo.$$,
    $$Verbo na forma ます sem ます + 合う

Educado: 合います
Passado: 合った / 合いました
Forma て: 合って

Combinações comuns: 話し合う / 助け合う / 教え合う / 出し合う / 愛し合う$$,
    $$合う$$,
    $$合い|合う|合っ|合わ$$,
    ARRAY['合う']::text[],
    ARRAY['合う', '合います', '合った', '合いました', '合って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-04', $$あの二人は助け合って生活している。$$, $$あのふたりはたすけあってせいかつしている。$$, $$Aqueles dois vivem se ajudando.$$),
    ('n3-grammar-04', $$会議で、みんなで意見を出し合いました。$$, $$かいぎで、みんなでいけんをだしあいました。$$, $$Na reunião, todos trocaram opiniões.$$),
    ('n3-grammar-04', $$私たちは毎日メールで連絡し合っている。$$, $$わたしたちはまいにちメールでれんらくしあっている。$$, $$Nós nos falamos por e-mail todos os dias.$$),
    ('n3-grammar-04', $$困ったときは、話し合うことが大切だ。$$, $$こまったときは、はなしあうことがたいせつだ。$$, $$Quando há problemas, é importante conversar.$$),
    ('n3-grammar-04', $$久しぶりに会った二人は、抱き合って喜んだ。$$, $$ひさしぶりにあったふたりは、だきあってよろこんだ。$$, $$Os dois, que não se viam havia muito tempo, se abraçaram de alegria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行の計画について、家族で話し____。$$, $$Conversamos em família sobre o plano da viagem.$$),
        (2, $$兄弟は助け____ことが大切です。$$, $$É importante que irmãos se ajudem.$$),
        (3, $$二人はお互いに愛し____いる。$$, $$Os dois se amam.$$),
        (4, $$試合の後、両チームの選手たちは握手し____。$$, $$Depois da partida, os jogadores das duas equipes apertaram as mãos.$$),
        (5, $$みんなで協力し____、仕事を終わらせた。$$, $$Todos cooperaram entre si e terminaram o trabalho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$合いました$$),
        (1, $$合った$$),
        (2, $$合う$$),
        (3, $$合って$$),
        (4, $$合った$$),
        (4, $$合いました$$),
        (5, $$合って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
