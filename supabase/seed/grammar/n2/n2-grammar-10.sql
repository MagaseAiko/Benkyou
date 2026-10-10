-- n2-grammar-10 — 〜だけましだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-10',
    'grammar',
    'N2',
    $$〜だけましだ$$,
    $$dake mashi da$$,
    $$Pelo menos / Já é alguma coisa / Ainda bem que$$,
    $$だけましだ é usado para dizer que, apesar de uma situação ruim, existe algo que a torna menos grave. Equivale a "pelo menos", "já é alguma coisa" ou "ainda bem que".

まし significa "melhor (entre opções ruins)". Assim, a estrutura diz "só por isso, já está melhor".

A primeira parte costuma apresentar o problema, e a segunda, com だけましだ, mostra o lado menos ruim. Por exemplo, "o salário é baixo, mas pelo menos tenho emprego" ou "me machuquei, mas ainda bem que sobrevivi".

O tom é de consolo, conformismo ou otimismo realista.

Com まだ, a forma だけまだましだ reforça a ideia.$$,
    $$まし sozinho também é usado em comparações, como AよりBのほうがましだ ("B é menos ruim que A").

É uma expressão muito comum para consolar alguém depois de um problema.

O tom é realista: não diz que a situação é boa, apenas que poderia ser pior.$$,
    $$Verbo / Adjetivo (forma simples) + だけましだ
Adjetivo な + な + だけましだ
… + だけまだましだ (reforço)
… + だけでもましだ$$,
    $$だけましだ$$,
    $$だけましだ|だけまし|だけでもまし|だけまだまし$$,
    ARRAY['だけ', 'まし', 'だ']::text[],
    ARRAY['だけましだ', 'だけまだましだ', 'だけでもましだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-10', $$給料は安いが、仕事があるだけましだ。$$, $$きゅうりょうはやすいが、しごとがあるだけましだ。$$, $$O salário é baixo, mas pelo menos tenho emprego.$$),
    ('n2-grammar-10', $$けがはしたけど、命が助かっただけましだ。$$, $$けがはしたけど、いのちがたすかっただけましだ。$$, $$Me machuquei, mas ainda bem que sobrevivi.$$),
    ('n2-grammar-10', $$今日は雨だけど、雪じゃないだけましだ。$$, $$きょうはあめだけど、ゆきじゃないだけましだ。$$, $$Hoje está chovendo, mas pelo menos não é neve.$$),
    ('n2-grammar-10', $$狭い部屋だが、住む所があるだけまだましだ。$$, $$せまいへやだが、すむところがあるだけまだましだ。$$, $$O quarto é pequeno, mas pelo menos tenho onde morar.$$),
    ('n2-grammar-10', $$試合には負けたが、一点取れただけましだった。$$, $$しあいにはまけたが、いってんとれただけましだった。$$, $$Perdemos a partida, mas pelo menos marcamos um ponto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$財布は盗まれたが、カードが無事だった____。$$, $$Roubaram minha carteira, mas pelo menos os cartões estavam a salvo.$$),
        (2, $$熱はあるけど、食欲がある____。$$, $$Estou com febre, mas pelo menos tenho apetite.$$),
        (3, $$遅刻したけど、来た____。$$, $$Ele chegou atrasado, mas pelo menos veio.$$),
        (4, $$給料は少ないけど、もらえる____。$$, $$O salário é pouco, mas pelo menos recebo.$$),
        (5, $$寒いけど、風がない____。$$, $$Está frio, mas pelo menos não está ventando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけましだ$$),
        (2, $$だけましだ$$),
        (3, $$だけましだ$$),
        (4, $$だけましだ$$),
        (5, $$だけましだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
