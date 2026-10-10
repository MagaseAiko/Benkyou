-- n3-grammar-143 — 〜とみえる・〜とみえて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-143',
    'grammar',
    'N3',
    $$〜とみえる・〜とみえて$$,
    $$to mieru / to miete$$,
    $$Parece que / Pelo visto / Ao que tudo indica$$,
    $$とみえる e とみえて são usados para fazer uma suposição baseada em algo que se observa. Equivalem a "parece que", "pelo visto" ou "ao que tudo indica".

A primeira parte é a suposição (o que a pessoa deduz), e a segunda parte, com とみえて, é a evidência observada que levou a essa conclusão. Por exemplo, "ele devia estar muito cansado, pelo visto, porque dormiu na hora".

Com とみえる no fim da frase, a dedução vem depois da evidência: "a rua está molhada. Parece que choveu de madrugada".

O sujeito costuma ser outra pessoa ou uma situação, e não quem fala, porque a ideia é deduzir algo a partir do que se vê.

É uma expressão um pouco formal e literária, comum em narrativas.$$,
    $$とみえる é parecido com らしい e ようだ, mas soa mais literário.

A palavra よほど (muito, bastante) aparece muito junto: よほど疲れていたとみえて.

Não confunda com に見える (parecer, pela aparência), que descreve como algo parece visualmente.$$,
    $$Frase (suposição, forma simples) + とみえて、 + Evidência observada
Evidência (com ponto final) + Frase (suposição) + とみえる

Escrita: とみえる / と見える$$,
    $$とみえる$$,
    $$とみえる|とみえて|と見える|と見えて|とみえ|と見え$$,
    ARRAY['と', 'みえる']::text[],
    ARRAY['とみえる', 'とみえて', 'と見える', 'と見えて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-143', $$彼はよほど疲れていたとみえて、すぐに寝てしまった。$$, $$かれはよほどつかれていたとみえて、すぐにねてしまった。$$, $$Pelo visto ele estava muito cansado, porque dormiu na hora.$$),
    ('n3-grammar-143', $$道が濡れている。夜中に雨が降ったとみえる。$$, $$みちがぬれている。よなかにあめがふったとみえる。$$, $$A rua está molhada. Parece que choveu de madrugada.$$),
    ('n3-grammar-143', $$彼女は何かいいことがあったとみえて、ずっと笑っている。$$, $$かのじょはなにかいいことがあったとみえて、ずっとわらっている。$$, $$Pelo visto aconteceu algo bom com ela, porque não para de sorrir.$$),
    ('n3-grammar-143', $$子供たちはお腹がすいていたとみえて、全部食べてしまった。$$, $$こどもたちはおなかがすいていたとみえて、ぜんぶたべてしまった。$$, $$As crianças, pelo visto, estavam com fome, porque comeram tudo.$$),
    ('n3-grammar-143', $$この店は人気があるとみえて、いつも行列ができている。$$, $$このみせはにんきがあるとみえて、いつもぎょうれつができている。$$, $$Ao que tudo indica esta loja é popular, porque sempre tem fila.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は急いでいた____、挨拶もしないで出て行った。$$, $$Pelo visto ele estava com pressa, porque saiu sem nem cumprimentar.$$),
        (2, $$犬は散歩に行きたい____、ドアの前で待っている。$$, $$O cachorro, pelo visto, quer passear, porque está esperando na porta.$$),
        (3, $$電気が消えている。みんなもう寝た____。$$, $$As luzes estão apagadas. Parece que todos já foram dormir.$$),
        (4, $$彼女はその映画が気に入った____、三回も見た。$$, $$Pelo visto ela gostou desse filme, porque viu três vezes.$$),
        (5, $$彼は勉強しなかった____、試験の点が悪かった。$$, $$Pelo visto ele não estudou, porque tirou nota baixa na prova.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-143', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とみえて$$),
        (1, $$と見えて$$),
        (2, $$とみえて$$),
        (2, $$と見えて$$),
        (3, $$とみえる$$),
        (3, $$と見える$$),
        (4, $$とみえて$$),
        (4, $$と見えて$$),
        (5, $$とみえて$$),
        (5, $$と見えて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
