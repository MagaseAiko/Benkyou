-- n3-grammar-99 — 〜さえ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-99',
    'grammar',
    'N3',
    $$〜さえ$$,
    $$sae$$,
    $$Até mesmo / Nem sequer$$,
    $$さえ é uma partícula de ênfase que destaca um caso extremo. Equivale a "até mesmo" ou, em frases negativas, "nem sequer".

A ideia é que, se até aquele caso extremo é verdade, então os outros casos, mais fáceis ou mais óbvios, também são. Por exemplo, "nem o professor sabia" sugere que ninguém mais saberia.

É muito usado em frases negativas, para mostrar uma situação muito ruim ou surpreendente: "não tenho tempo nem para almoçar" ou "não consegui escrever nem o meu nome".

さえ substitui は, が e を. Com outras partículas, fica depois delas, como にさえ e でさえ. Com substantivos que são sujeito, também se usa でさえ, que soa mais enfático.$$,
    $$さえ é parecido com も (até) e すら (até mesmo, mais formal e literário).

Em frases afirmativas, さえ também aparece, como em 子供でさえ知っている (até uma criança sabe).

Com ば, a estrutura さえ〜ば tem outro sentido, "basta que...", e aparece na gramática seguinte.$$,
    $$Substantivo + さえ + Frase (geralmente negativa)
Substantivo + でさえ (sujeito, mais enfático)
Substantivo + partícula + さえ (にさえ / とさえ)
Verbo na forma ます sem ます / Verbo て + さえ$$,
    $$さえ$$,
    $$さえ$$,
    ARRAY['さえ']::text[],
    ARRAY['さえ', 'でさえ', 'にさえ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-99', $$忙しくて、昼ご飯を食べる時間さえない。$$, $$いそがしくて、ひるごはんをたべるじかんさえない。$$, $$Estou tão ocupado que não tenho tempo nem para almoçar.$$),
    ('n3-grammar-99', $$この問題は先生さえわからなかった。$$, $$このもんだいはせんせいさえわからなかった。$$, $$Nem o professor conseguiu resolver esta questão.$$),
    ('n3-grammar-99', $$それは子供でさえ知っていることだ。$$, $$それはこどもでさえしっていることだ。$$, $$Isso é algo que até uma criança sabe.$$),
    ('n3-grammar-99', $$疲れて、立っていることさえできない。$$, $$つかれて、たっていることさえできない。$$, $$Estou tão cansado que não consigo nem ficar de pé.$$),
    ('n3-grammar-99', $$彼は自分の名前さえ書けなかった。$$, $$かれはじぶんのなまえさえかけなかった。$$, $$Ele não conseguia escrever nem o próprio nome.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$驚いて、声____出なかった。$$, $$Fiquei tão surpreso que nem sequer consegui falar.$$),
        (2, $$親友に____言えない秘密がある。$$, $$Tenho um segredo que não consigo contar nem para o meu melhor amigo.$$),
        (3, $$日本語を始めたばかりで、ひらがな____読めない。$$, $$Acabei de começar japonês e nem consigo ler hiragana.$$),
        (4, $$水____飲めないほど、喉が痛い。$$, $$Minha garganta dói tanto que nem consigo beber água.$$),
        (5, $$彼は簡単な料理____作れない。$$, $$Ele não sabe fazer nem uma comida simples.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-99', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さえ$$),
        (2, $$さえ$$),
        (3, $$さえ$$),
        (4, $$さえ$$),
        (5, $$さえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
