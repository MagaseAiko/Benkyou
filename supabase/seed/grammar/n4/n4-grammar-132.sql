-- n4-grammar-132 — あげる・くれる・もらう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-132',
    'grammar',
    'N4',
    $$あげる・くれる・もらう$$,
    $$ageru / kureru / morau$$,
    $$Dar / Dar (para mim) / Receber$$,
    $$あげる, くれる e もらう são os verbos de dar e receber. A escolha depende da direção da coisa e de quem está envolvido.

• あげる: dar algo para outra pessoa. A coisa sai de quem fala (ou do seu grupo) e vai para alguém de fora, ou vai de uma terceira pessoa para outra.
• くれる: dar algo para quem fala ou para alguém do seu grupo, como a família. A coisa vem de fora em direção a "mim".
• もらう: receber algo de alguém. O sujeito é quem recebe, e quem deu é marcado com に ou から.

O ponto mais importante é que, quando alguém dá algo para você, não se usa あげる: usa-se くれる. Isso mostra o ponto de vista de quem fala.

Esses mesmos verbos aparecem com a forma て (てあげる, てくれる, てもらう) para falar de favores.$$,
    $$Com pessoas da sua família, くれる também é usado quando alguém dá algo para um familiar seu, porque a família é vista como parte do seu grupo.

Para dar algo a animais e plantas, usa-se やる, que é mais informal.

Quando o presente vem de uma instituição, como uma empresa ou escola, もらう costuma usar から, e não に.$$,
    $$Quem dá + は / が + Quem recebe + に + Coisa + を + あげる
Quem dá + が + (私に) + Coisa + を + くれる
Quem recebe + は / が + Quem dá + に / から + Coisa + を + もらう

Formas respeitosas e humildes:
あげる → さしあげる (para superiores)
くれる → くださる (de superiores)
もらう → いただく (de superiores)$$,
    $$あげる$$,
    $$あげ|くれ|もら$$,
    ARRAY['あげる', 'くれる', 'もらう']::text[],
    ARRAY['あげる', 'くれる', 'もらう', 'さしあげる', 'くださる', 'いただく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-132', $$私は友達に誕生日プレゼントをあげました。$$, $$わたしはともだちにたんじょうびプレゼントをあげました。$$, $$Dei um presente de aniversário para meu amigo.$$),
    ('n4-grammar-132', $$母が私に時計をくれました。$$, $$ははがわたしにとけいをくれました。$$, $$Minha mãe me deu um relógio.$$),
    ('n4-grammar-132', $$私は先生から本をもらいました。$$, $$わたしはせんせいからほんをもらいました。$$, $$Ganhei um livro do professor.$$),
    ('n4-grammar-132', $$弟は田中さんにお菓子をもらった。$$, $$おとうとはたなかさんにおかしをもらった。$$, $$Meu irmão mais novo ganhou doces do Tanaka.$$),
    ('n4-grammar-132', $$友達が妹に花をくれた。$$, $$ともだちがいもうとにはなをくれた。$$, $$Meu amigo deu flores para a minha irmã mais nova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は妹にケーキを____。$$, $$Dei um bolo para a minha irmã mais nova.$$),
        (2, $$誕生日に父が私にかばんを____。$$, $$No meu aniversário, meu pai me deu uma bolsa.$$),
        (3, $$私は友達から手紙を____。$$, $$Recebi uma carta de um amigo.$$),
        (4, $$隣の人が私の家族に野菜を____。$$, $$O vizinho deu verduras para a minha família.$$),
        (5, $$田中さんは山田さんに本を____。$$, $$O Tanaka deu um livro para o Yamada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-132', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あげました$$),
        (1, $$あげた$$),
        (2, $$くれました$$),
        (2, $$くれた$$),
        (3, $$もらいました$$),
        (3, $$もらった$$),
        (4, $$くれました$$),
        (4, $$くれた$$),
        (5, $$あげました$$),
        (5, $$あげた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
