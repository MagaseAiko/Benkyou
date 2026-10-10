-- n4-grammar-04 — 〜後で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-04',
    'grammar',
    'N4',
    $$〜後で$$,
    $$ato de$$,
    $$Depois de / Mais tarde$$,
    $$後で é usado para dizer que uma ação acontece depois de outra. Equivale a "depois de" ou, sozinho, "mais tarde".

Com verbos, o verbo que vem antes fica sempre na forma た, mesmo que a frase fale do futuro. Isso acontece porque a primeira ação precisa estar terminada antes da segunda.

Com substantivos, usa-se の antes de 後で, como "depois da aula".

Sozinho, no começo da frase, 後で significa "mais tarde" ou "depois", e é muito usado para adiar algo de forma educada.

Comparando com てから: as duas indicam sequência, mas てから destaca mais a ordem obrigatória, enquanto 後で apenas situa a ação depois de outra no tempo.$$,
    $$O oposto de 後で é 前に, que usa o verbo na forma de dicionário. Lembrar desse contraste ajuda: antes = dicionário, depois = た.

A forma 後 sem で também existe, como em 後、〜, e soa um pouco mais escrita.

後で電話します e 後で連絡します são frases muito comuns para dizer que você vai entrar em contato depois.$$,
    $$Verbo na forma た + 後で
Substantivo + の + 後で
後で + Verbo (mais tarde)

Escrita: 後で / あとで$$,
    $$後で$$,
    $$後で|あとで$$,
    ARRAY['後', 'で']::text[],
    ARRAY['後で', 'あとで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-04', $$宿題をした後で、テレビを見ます。$$, $$しゅくだいをしたあとで、テレビをみます。$$, $$Vou ver TV depois de fazer a lição.$$),
    ('n4-grammar-04', $$授業の後で、先生に質問しました。$$, $$じゅぎょうのあとで、せんせいにしつもんしました。$$, $$Depois da aula, fiz uma pergunta ao professor.$$),
    ('n4-grammar-04', $$ご飯を食べた後で、薬を飲んでください。$$, $$ごはんをたべたあとで、くすりをのんでください。$$, $$Tome o remédio depois de comer.$$),
    ('n4-grammar-04', $$今ちょっと忙しいので、後で電話します。$$, $$いまちょっといそがしいので、あとででんわします。$$, $$Agora estou um pouco ocupado, então ligo mais tarde.$$),
    ('n4-grammar-04', $$仕事が終わった後で、一緒に飲みに行きませんか。$$, $$しごとがおわったあとで、いっしょにのみにいきませんか。$$, $$Depois do trabalho, quer ir beber alguma coisa comigo?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$歯を磨いた____、寝ます。$$, $$Vou dormir depois de escovar os dentes.$$),
        (2, $$映画を見た____、レストランで食事をしました。$$, $$Depois de ver o filme, jantamos num restaurante.$$),
        (3, $$会議の____、少し話せますか。$$, $$Podemos conversar um pouco depois da reunião?$$),
        (4, $$今忙しいので、____連絡します。$$, $$Agora estou ocupado, então entro em contato mais tarde.$$),
        (5, $$試験が終わった____、みんなでカラオケに行った。$$, $$Depois que a prova acabou, fomos todos ao karaokê.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$後で$$),
        (1, $$あとで$$),
        (2, $$後で$$),
        (2, $$あとで$$),
        (3, $$後で$$),
        (3, $$あとで$$),
        (4, $$後で$$),
        (4, $$あとで$$),
        (5, $$後で$$),
        (5, $$あとで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
