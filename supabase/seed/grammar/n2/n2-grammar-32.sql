-- n2-grammar-32 — 〜以上は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-32',
    'grammar',
    'N2',
    $$〜以上は$$,
    $$ijou wa$$,
    $$Já que / Uma vez que / Visto que$$,
    $$以上は é usado para dizer que, como uma situação é assim, existe uma obrigação, uma decisão ou uma consequência natural. Equivale a "já que", "uma vez que" ou "visto que".

A primeira parte apresenta um fato ou uma decisão já tomada (prometer, aceitar, participar, ser estudante). A segunda mostra o que, por isso, deve ser feito: uma obrigação, uma determinação ou uma conclusão firme.

Por exemplo, "já que prometi, tenho que cumprir" ou "uma vez que vou participar, quero vencer".

A segunda parte costuma ter べきだ, なければならない, つもりだ, たい ou expressões de determinação.

O sentido é muito parecido com からには e 上は. 以上は soa um pouco mais formal. A forma sem は (以上、) também é comum.$$,
    $$以上は, からには e 上は são praticamente sinônimos. からには é mais comum na conversa; 上は é o mais formal.

Não confunda com 以上に (mais do que) e com 以上 de números (acima de).

Em contratos e regras, 以上は aparece para indicar responsabilidade: 契約した以上は….$$,
    $$Verbo (forma simples) + 以上は / 以上、 + Obrigação / Decisão
Substantivo + である + 以上は$$,
    $$以上は$$,
    $$以上は|以上、$$,
    ARRAY['以上', 'は']::text[],
    ARRAY['以上は', '以上']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-32', $$約束した以上は、守らなければならない。$$, $$やくそくしたいじょうは、まもらなければならない。$$, $$Já que prometi, tenho que cumprir.$$),
    ('n2-grammar-32', $$引き受けた以上、最後までやるべきだ。$$, $$ひきうけたいじょう、さいごまでやるべきだ。$$, $$Uma vez que aceitou, deve ir até o fim.$$),
    ('n2-grammar-32', $$試合に出る以上は、勝ちたい。$$, $$しあいにでるいじょうは、かちたい。$$, $$Já que vou participar da partida, quero vencer.$$),
    ('n2-grammar-32', $$学生である以上、勉強するのは当然だ。$$, $$がくせいであるいじょう、べんきょうするのはとうぜんだ。$$, $$Visto que é estudante, é natural estudar.$$),
    ('n2-grammar-32', $$日本に住む以上は、日本の法律を守るべきだ。$$, $$にほんにすむいじょうは、にほんのほうりつをまもるべきだ。$$, $$Já que mora no Japão, deve respeitar as leis japonesas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$自分で決めた____、やるしかない。$$, $$Já que fui eu quem decidiu, não há outra opção a não ser fazer.$$),
        (2, $$お金をもらう____、ちゃんと働かなければならない。$$, $$Já que vou receber dinheiro, tenho que trabalhar direito.$$),
        (3, $$留学する____、その国の言葉を勉強すべきだ。$$, $$Uma vez que vai fazer intercâmbio, deve estudar a língua do país.$$),
        (4, $$参加すると言った____、休むわけにはいかない。$$, $$Já que disse que ia participar, não posso faltar.$$),
        (5, $$リーダーである____、責任を持たなければならない。$$, $$Visto que é o líder, tem que assumir a responsabilidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$以上は$$),
        (1, $$以上$$),
        (2, $$以上は$$),
        (2, $$以上$$),
        (3, $$以上は$$),
        (3, $$以上$$),
        (4, $$以上は$$),
        (4, $$以上$$),
        (5, $$以上は$$),
        (5, $$以上$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
