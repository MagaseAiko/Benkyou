-- n4-grammar-97 — 〜てくる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-97',
    'grammar',
    'N4',
    $$〜てくる$$,
    $$te kuru$$,
    $$Vir (fazendo) / Ir e voltar / Começar a$$,
    $$てくる junta a forma て de um verbo com 来る (vir). A ideia central é movimento ou mudança que se aproxima de quem fala, no espaço ou no tempo.

Os usos principais são:
• Ir, fazer algo e voltar: como "vou comprar algo e já volto". É muito comum em frases do dia a dia.
• Movimento em direção a quem fala: algo ou alguém que vem se aproximando, como uma criança correndo até você.
• Mudança até agora: algo que vem mudando do passado até o presente, como "vem esquentando".
• Começo de um fenômeno: algo que começa a acontecer e é percebido por quem fala, como começar a chover ou começar a doer.

O oposto é ていく, que indica movimento ou mudança se afastando de quem fala ou indo para o futuro.$$,
    $$A frase 行ってきます, dita ao sair de casa, vem desse uso: "vou e volto". A resposta é いってらっしゃい.

No uso de mudança, てくる olha do passado até agora. Para mudanças que vão continuar no futuro, usa-se ていく.

Na escrita, quando o sentido é abstrato, てくる costuma ser escrito em hiragana.$$,
    $$Verbo na forma て + くる

Educado: てきます
Passado: てきた / てきました
Mudança contínua: てきている$$,
    $$てくる$$,
    $$てくる|てきた|てきま|てきて|でくる|できた$$,
    ARRAY['て', 'くる']::text[],
    ARRAY['てくる', 'てきます', 'てきた', 'てきました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-97', $$ちょっとコンビニで飲み物を買ってきます。$$, $$ちょっとコンビニでのみものをかってきます。$$, $$Vou rapidinho à loja de conveniência comprar bebida e já volto.$$),
    ('n4-grammar-97', $$子供が私のところに走ってきました。$$, $$こどもがわたしのところにはしってきました。$$, $$A criança veio correndo até mim.$$),
    ('n4-grammar-97', $$最近、暖かくなってきましたね。$$, $$さいきん、あたたかくなってきましたね。$$, $$Ultimamente vem esquentando, né?$$),
    ('n4-grammar-97', $$あ、雨が降ってきた。$$, $$あ、あめがふってきた。$$, $$Ah, começou a chover.$$),
    ('n4-grammar-97', $$日本に住む外国人が増えてきている。$$, $$にほんにすむがいこくじんがふえてきている。$$, $$O número de estrangeiros morando no Japão vem aumentando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ちょっと郵便局に行っ____。$$, $$Vou rapidinho ao correio e já volto.$$),
        (2, $$向こうから犬が走っ____。$$, $$Um cachorro veio correndo lá do outro lado.$$),
        (3, $$急にお腹が痛くなっ____。$$, $$De repente, minha barriga começou a doer.$$),
        (4, $$寒くなっ____から、セーターを出しましょう。$$, $$Começou a esfriar, então vamos tirar os suéteres.$$),
        (5, $$窓から虫が入っ____。$$, $$Entrou um inseto pela janela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-97', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てきます$$),
        (1, $$てくる$$),
        (2, $$てきました$$),
        (2, $$てきた$$),
        (3, $$てきました$$),
        (3, $$てきた$$),
        (4, $$てきた$$),
        (5, $$てきました$$),
        (5, $$てきた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
