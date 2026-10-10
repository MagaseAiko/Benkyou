-- n5-grammar-19 — いつも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-19',
    'grammar',
    'N5',
    $$いつも$$,
    $$itsumo$$,
    $$Sempre / Normalmente / De costume$$,
    $$いつも significa "sempre". Ele mostra que algo acontece toda vez, de forma constante ou como hábito.

Como é um advérbio, ele normalmente aparece antes do verbo ou do adjetivo, e pode ficar no começo da frase ou logo depois do tema.

Com verbos no presente, いつも expressa hábitos e rotinas. Com adjetivos ou descrições, mostra uma característica que aparece o tempo todo.

Quando vem antes de の e de um substantivo, いつもの quer dizer "o de sempre", "o de costume". E, em comparações com より, いつも funciona como "o normal", o padrão do dia a dia.$$,
    $$A expressão いつもありがとうございます é um agradecimento muito comum, usado para agradecer por tudo o que a pessoa faz normalmente, e não por algo específico.

いつも indica uma frequência quase total. Para frequências menores, o japonês usa palavras como よく (com frequência), 時々 (às vezes) e あまり〜ない (não muito).

いつも é diferente de ずっと: いつも fala de algo que se repete, enquanto ずっと fala de algo contínuo, sem interrupção.$$,
    $$いつも + Verbo (hábito)
いつも + Adjetivo / Substantivo + です
いつもの + Substantivo (o de sempre)
いつも + より (comparado com o normal)$$,
    $$いつも$$,
    $$いつも$$,
    ARRAY['いつも']::text[],
    ARRAY['いつも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-19', $$私はいつも七時に起きます。$$, $$わたしはいつもしちじにおきます。$$, $$Eu sempre acordo às sete.$$),
    ('n5-grammar-19', $$田中さんはいつも元気ですね。$$, $$たなかさんはいつもげんきですね。$$, $$O Tanaka está sempre animado, né?$$),
    ('n5-grammar-19', $$いつもの店で会いましょう。$$, $$いつものみせであいましょう。$$, $$Vamos nos encontrar no lugar de sempre.$$),
    ('n5-grammar-19', $$朝はいつもコーヒーを飲みます。$$, $$あさはいつもコーヒーをのみます。$$, $$De manhã, sempre tomo café.$$),
    ('n5-grammar-19', $$いつもありがとうございます。$$, $$いつもありがとうございます。$$, $$Obrigado por sempre me ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は____新聞を読んでいます。$$, $$Meu pai está sempre lendo jornal.$$),
        (2, $$姉は____忙しいです。$$, $$Minha irmã mais velha está sempre ocupada.$$),
        (3, $$昼ご飯は____会社の食堂で食べます。$$, $$Sempre almoço no refeitório da empresa.$$),
        (4, $$今日は____より早く起きました。$$, $$Hoje acordei mais cedo do que de costume.$$),
        (5, $$すみません、____のコーヒーをください。$$, $$Com licença, me dê o café de sempre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いつも$$),
        (2, $$いつも$$),
        (3, $$いつも$$),
        (4, $$いつも$$),
        (5, $$いつも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
