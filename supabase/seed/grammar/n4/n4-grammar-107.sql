-- n4-grammar-107 — 〜と（条件）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-107',
    'grammar',
    'N4',
    $$〜と（条件）$$,
    $$to (jouken)$$,
    $$Quando / Sempre que / Se$$,
    $$と também funciona como condicional. Ele indica que, quando algo acontece, um resultado vem naturalmente ou automaticamente. Equivale a "quando", "sempre que" ou "se".

A ideia principal é de consequência inevitável: fenômenos naturais, funcionamento de máquinas, caminhos, hábitos e verdades gerais. Por exemplo, "quando chega a primavera, as cerejeiras florescem" ou "se apertar este botão, a porta abre".

Ele vem depois da forma de dicionário do verbo, ou da forma simples de adjetivos e substantivos com だ.

Por causa dessa ideia de "automático", a segunda parte não pode ser um pedido, um convite ou uma vontade.

No passado, と também pode indicar uma descoberta: "quando fiz isso, aconteceu tal coisa".$$,
    $$Para dar instruções de caminho, と é a escolha mais natural: まっすぐ行くと、〜があります.

Se a segunda parte for um pedido ou intenção, troque と por たら.

Não confunda com と de "e" (lista) e com と de "com" (companhia).$$,
    $$Verbo na forma de dicionário + と
Verbo na forma ない + と
Adjetivo い + と
Substantivo / Adjetivo な + だ + と$$,
    $$と$$,
    $$と$$,
    ARRAY['と']::text[],
    ARRAY['と']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-107', $$春になると、桜が咲きます。$$, $$はるになると、さくらがさきます。$$, $$Quando chega a primavera, as cerejeiras florescem.$$),
    ('n4-grammar-107', $$このボタンを押すと、ドアが開きます。$$, $$このボタンをおすと、ドアがあきます。$$, $$Se apertar este botão, a porta abre.$$),
    ('n4-grammar-107', $$この道をまっすぐ行くと、右に駅があります。$$, $$このみちをまっすぐいくと、みぎにえきがあります。$$, $$Seguindo reto por esta rua, a estação fica à direita.$$),
    ('n4-grammar-107', $$父はお酒を飲むと、顔が赤くなる。$$, $$ちちはおさけをのむと、かおがあかくなる。$$, $$Sempre que meu pai bebe, o rosto dele fica vermelho.$$),
    ('n4-grammar-107', $$窓を開けると、海が見えた。$$, $$まどをあけると、うみがみえた。$$, $$Quando abri a janela, deu para ver o mar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏になる____、暑くなります。$$, $$Quando chega o verão, esquenta.$$),
        (2, $$この道をまっすぐ行く____、銀行があります。$$, $$Seguindo reto por esta rua, tem um banco.$$),
        (3, $$一に二を足す____、三になる。$$, $$Somando dois a um, dá três.$$),
        (4, $$母は寝不足だ____、機嫌が悪い。$$, $$Quando minha mãe dorme pouco, fica de mau humor.$$),
        (5, $$ドアを開ける____、猫が入ってきた。$$, $$Quando abri a porta, o gato entrou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-107', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と$$),
        (2, $$と$$),
        (3, $$と$$),
        (4, $$と$$),
        (5, $$と$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
