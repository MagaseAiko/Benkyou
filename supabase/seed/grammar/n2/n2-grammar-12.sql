-- n2-grammar-12 — 〜だけのことはある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-12',
    'grammar',
    'N2',
    $$〜だけのことはある$$,
    $$dake no koto wa aru$$,
    $$Faz jus a / Vale o que / Não é à toa que$$,
    $$だけのことはある é usado para dizer que um resultado bom faz jus à condição, ao esforço ou ao preço. Equivale a "faz jus a", "vale o que..." ou "não é à toa que".

A ideia é que a qualidade observada corresponde exatamente ao que se esperava, ou ao que foi investido. Por exemplo, "este hotel faz jus ao preço: o serviço é ótimo" ou "não é à toa que treinou dez anos".

Ela fica geralmente no final da frase. Com て (だけのことはあって), liga-se à avaliação que vem em seguida.

O sentido é muito parecido com だけあって, mas だけのことはある costuma aparecer no fim da frase, como uma conclusão de admiração. さすが combina muito com essa expressão.$$,
    $$O tom é sempre positivo, de admiração ou elogio.

É comum depois de uma constatação: primeiro a pessoa vê o resultado, depois diz だけのことはある.

Em avaliações de produtos caros, 高いだけのことはある ("vale o preço") é muito comum.$$,
    $$Verbo / Adjetivo (forma simples) + だけのことはある
Substantivo + だけのことはある
… + だけのことはあって、 + Avaliação positiva
さすが + … + だけのことはある$$,
    $$だけのことはある$$,
    $$だけのことはあ$$,
    ARRAY['だけ', 'の', 'こと', 'は', 'ある']::text[],
    ARRAY['だけのことはある', 'だけのことはあって', 'だけのことはあります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-12', $$このホテルは高いだけのことはある。サービスが最高だ。$$, $$このホテルはたかいだけのことはある。サービスがさいこうだ。$$, $$Este hotel faz jus ao preço. O serviço é ótimo.$$),
    ('n2-grammar-12', $$すごい演奏だ。さすが十年も練習しただけのことはある。$$, $$すごいえんそうだ。さすがじゅうねんもれんしゅうしただけのことはある。$$, $$Que apresentação incrível. Não é à toa que treinou dez anos.$$),
    ('n2-grammar-12', $$有名な店だけのことはあって、とてもおいしい。$$, $$ゆうめいなみせだけのことはあって、とてもおいしい。$$, $$Faz jus à fama da loja: é muito gostoso.$$),
    ('n2-grammar-12', $$苦労しただけのことはあって、いい結果が出た。$$, $$くろうしただけのことはあって、いいけっかがでた。$$, $$Valeu todo o esforço: o resultado foi bom.$$),
    ('n2-grammar-12', $$見事なプレーだった。彼はプロだけのことはある。$$, $$みごとなプレーだった。かれはプロだけのことはある。$$, $$Foi uma jogada brilhante. Não é à toa que ele é profissional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この料理はおいしい。一流のシェフが作った____。$$, $$Esta comida é deliciosa. Faz jus a ter sido feita por um chef de primeira.$$),
        (2, $$彼女の英語は上手だ。アメリカに住んでいた____。$$, $$O inglês dela é ótimo. Não é à toa que morou nos Estados Unidos.$$),
        (3, $$景色が素晴らしい。三時間も山を登った____。$$, $$A paisagem é maravilhosa. Valeu as três horas de subida.$$),
        (4, $$この時計は丈夫だ。高かった____。$$, $$Este relógio é resistente. Faz jus ao preço que paguei.$$),
        (5, $$よく覚えているね。毎日勉強している____。$$, $$Você lembra muito bem, hein. Não é à toa que estuda todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-12', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけのことはある$$),
        (2, $$だけのことはある$$),
        (3, $$だけのことはある$$),
        (4, $$だけのことはある$$),
        (5, $$だけのことはある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
