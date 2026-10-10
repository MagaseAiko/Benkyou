-- n4-grammar-15 — 〜がり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-15',
    'grammar',
    'N4',
    $$〜がり$$,
    $$gari$$,
    $$Pessoa sensível a / Que sente muito$$,
    $$がり é um sufixo que transforma certos adjetivos de sentimento ou sensação em um substantivo que descreve uma pessoa com essa tendência.

Por exemplo, alguém que sente frio com facilidade é 寒がり; alguém que tem medo fácil é 怖がり; alguém tímido é 恥ずかしがり. A ideia é "a pessoa que sempre demonstra esse sentimento".

Para formar, tira-se o い do adjetivo e acrescenta-se がり. O resultado funciona como um substantivo, ou como um adjetivo な na prática, sendo usado com です, だ, で e な.

Com alguns adjetivos, é comum acrescentar 屋 (や), formando expressões como 恥ずかしがり屋, que significa "pessoa tímida".$$,
    $$Nem todo adjetivo pode virar がり. Os mais comuns são 寒がり, 暑がり, 怖がり, 恥ずかしがり, 寂しがり e 痛がり.

Essa forma vem do verbo がる, que mostra sentimentos de outras pessoas. がり descreve a característica, e がる descreve a ação de demonstrar o sentimento.

O antônimo de 寒がり é 暑がり, e não "não sentir frio": cada um descreve uma sensibilidade diferente.$$,
    $$Adjetivo de sentimento ou sensação sem い + がり
Adjetivo sem い + がり + 屋 (pessoa assim)
Pessoa + は + 〜がり + です / だ
〜がり + で / な + …

Exemplos de formação: 寒い → 寒がり / 暑い → 暑がり / 怖い → 怖がり / 恥ずかしい → 恥ずかしがり$$,
    $$がり$$,
    $$がり$$,
    ARRAY['がり']::text[],
    ARRAY['がり', 'がり屋', 'がりや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-15', $$妹は寒がりなので、いつもセーターを着ています。$$, $$いもうとはさむがりなので、いつもセーターをきています。$$, $$Minha irmã mais nova sente muito frio, então sempre usa suéter.$$),
    ('n4-grammar-15', $$弟は怖がりで、一人で寝られません。$$, $$おとうとはこわがりで、ひとりでねられません。$$, $$Meu irmão mais novo é medroso e não consegue dormir sozinho.$$),
    ('n4-grammar-15', $$彼女は恥ずかしがり屋です。$$, $$かのじょははずかしがりやです。$$, $$Ela é tímida.$$),
    ('n4-grammar-15', $$私は暑がりだから、夏が苦手です。$$, $$わたしはあつがりだから、なつがにがてです。$$, $$Eu sinto muito calor, então não me dou bem com o verão.$$),
    ('n4-grammar-15', $$うちの犬はさびしがりで、いつも私の後をついてくる。$$, $$うちのいぬはさびしがりで、いつもわたしのあとをついてくる。$$, $$Nosso cachorro odeia ficar sozinho e sempre me segue.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は寒____で、冬はあまり外に出ません。$$, $$Meu pai sente muito frio e quase não sai no inverno.$$),
        (2, $$息子は怖____なので、お化け屋敷に入れません。$$, $$Meu filho é medroso, então não consegue entrar na casa assombrada.$$),
        (3, $$あの子は恥ずかし____屋で、人前で話せない。$$, $$Aquela criança é tímida e não consegue falar em público.$$),
        (4, $$母は暑____だから、すぐエアコンをつける。$$, $$Minha mãe sente muito calor, então logo liga o ar-condicionado.$$),
        (5, $$一人暮らしの祖母はさびし____なので、よく電話します。$$, $$Minha avó, que mora sozinha, se sente solitária com facilidade, então ligo com frequência.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がり$$),
        (2, $$がり$$),
        (3, $$がり$$),
        (4, $$がり$$),
        (5, $$がり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
