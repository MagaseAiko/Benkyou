-- n4-grammar-108 — 〜と言ってもいい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-108',
    'grammar',
    'N4',
    $$〜と言ってもいい$$,
    $$to itte mo ii$$,
    $$Pode-se dizer que / Não seria exagero dizer que$$,
    $$と言ってもいい é usado para fazer uma afirmação forte, mas com um pouco de cautela. Equivale a "pode-se dizer que" ou "não seria exagero dizer que".

A ideia literal é "mesmo dizendo que é assim, está tudo bem". Quem fala reconhece que talvez não seja exatamente aquilo, mas acha que a descrição é justa.

É muito usado para elogiar ou avaliar algo de forma enfática, como dizer que alguém é praticamente um gênio ou que um lugar é o mais bonito do país.

Com でしょう ou くらい, a frase fica ainda mais suave e natural.$$,
    $$Em textos formais, aparece a forma と言っても過言ではない, que significa "não é exagero dizer que".

Essa estrutura é ótima para dar opiniões fortes sem parecer arrogante.

Não confunda com といっても, que significa "embora se diga que..." e introduz uma ressalva.$$,
    $$Substantivo + と言ってもいい
Frase (forma simples) + と言ってもいい
… + と言ってもいいでしょう / と言ってもいいくらいだ

Escrita: と言ってもいい / といってもいい$$,
    $$と言ってもいい$$,
    $$と言ってもいい|といってもいい|と言ってもよい$$,
    ARRAY['と', '言って', 'も', 'いい']::text[],
    ARRAY['と言ってもいい', 'と言ってもいいでしょう', 'といってもいい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-108', $$彼はこの町で一番の料理人と言ってもいい。$$, $$かれはこのまちでいちばんのりょうりにんといってもいい。$$, $$Pode-se dizer que ele é o melhor cozinheiro desta cidade.$$),
    ('n4-grammar-108', $$今回の試験は成功と言ってもいいでしょう。$$, $$こんかいのしけんはせいこうといってもいいでしょう。$$, $$Pode-se dizer que o teste desta vez foi um sucesso.$$),
    ('n4-grammar-108', $$ここは日本で最も美しい場所と言ってもいい。$$, $$ここはにほんでもっともうつくしいばしょといってもいい。$$, $$Não seria exagero dizer que aqui é o lugar mais bonito do Japão.$$),
    ('n4-grammar-108', $$彼女はもう家族と言ってもいい存在です。$$, $$かのじょはもうかぞくといってもいいそんざいです。$$, $$Ela já é praticamente da família.$$),
    ('n4-grammar-108', $$毎日練習しているので、もうプロと言ってもいいくらいだ。$$, $$まいにちれんしゅうしているので、もうプロといってもいいくらいだ。$$, $$Ele treina todo dia, então já dá para dizer que é quase profissional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この映画は今年最高の作品____でしょう。$$, $$Pode-se dizer que este filme é a melhor obra do ano.$$),
        (2, $$あんなに難しい問題がすぐ解けるなんて、彼は天才____。$$, $$Resolver uma questão tão difícil na hora? Pode-se dizer que ele é um gênio.$$),
        (3, $$このプロジェクトはほぼ完成____。$$, $$Pode-se dizer que este projeto está praticamente concluído.$$),
        (4, $$彼にとって、サッカーは人生そのもの____。$$, $$Para ele, pode-se dizer que o futebol é a própria vida.$$),
        (5, $$東京は世界一便利な町____かもしれない。$$, $$Talvez se possa dizer que Tóquio é a cidade mais prática do mundo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-108', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言ってもいい$$),
        (2, $$と言ってもいい$$),
        (2, $$と言ってもいいでしょう$$),
        (3, $$と言ってもいい$$),
        (3, $$と言ってもいいでしょう$$),
        (4, $$と言ってもいい$$),
        (4, $$と言ってもいいでしょう$$),
        (5, $$と言ってもいい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
