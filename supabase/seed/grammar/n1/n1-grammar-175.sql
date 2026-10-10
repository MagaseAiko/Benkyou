-- n1-grammar-175 — 〜たことにする / 〜たことになる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-175',
    'grammar',
    'N1',
    $$〜たことにする / 〜たことになる$$,
    $$ta koto ni suru / ta koto ni naru$$,
    $$Fazer de conta que / Considerar que / Ser considerado como$$,
    $$たことにする e たことになる tratam algo como se tivesse acontecido, mesmo que não seja totalmente verdade.

たことにする indica que a pessoa decide considerar algo de uma forma, muitas vezes fingindo. Equivale a "fazer de conta que". Por exemplo, "vamos fazer de conta que não ouvimos nada".

たことになる indica que, por algum critério, algo passa a ser considerado assim. Equivale a "ser considerado como". Por exemplo, "se você não avisar, será considerado como ausente".$$,
    $$A forma なかったことにする é muito usada, com o sentido de "esquecer o que aconteceu".

Também pode indicar um cálculo, como "isso significa que...".$$,
    $$Verbo (forma た / なかった) + ことにする
Verbo (forma た / なかった) + ことになる$$,
    $$たことにする$$,
    $$たことにする|たことにします|たことにして|たことにしよう|たことになる|たことになります|だことになる|だことになります$$,
    ARRAY['た', 'こと', 'に', 'する']::text[],
    ARRAY['たことにする', 'たことになる', 'なかったことにする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-175', $$今の話は聞かなかったことにします。$$, $$いまのはなしはきかなかったことにします。$$, $$Vou fazer de conta que não ouvi o que acabou de dizer.$$),
    ('n1-grammar-175', $$この件は、なかったことにしよう。$$, $$このけんは、なかったことにしよう。$$, $$Vamos fazer de conta que isso não aconteceu.$$),
    ('n1-grammar-175', $$連絡しなければ、欠席したことになる。$$, $$れんらくしなければ、けっせきしたことになる。$$, $$Se não avisar, será considerado como ausente.$$),
    ('n1-grammar-175', $$書類を出せば、申し込んだことになります。$$, $$しょるいをだせば、もうしこんだことになります。$$, $$Entregando os documentos, a inscrição será considerada feita.$$),
    ('n1-grammar-175', $$彼が来たことにして、話を進めよう。$$, $$かれがきたことにして、はなしをすすめよう。$$, $$Vamos fazer de conta que ele veio e continuar a conversa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日のことは、見なかった____。$$, $$Vou fazer de conta que não vi o que aconteceu hoje.$$),
        (2, $$この約束は、なかった____。$$, $$Vamos considerar que esta promessa nunca existiu.$$),
        (3, $$十時までに来なければ、遅刻した____。$$, $$Se não chegar até as dez, será considerado atrasado.$$),
        (4, $$サインをすれば、契約に同意した____。$$, $$Assinando, será considerado que concordou com o contrato.$$),
        (5, $$私が払った____、みんなで食べよう。$$, $$Façam de conta que eu paguei e vamos comer todos juntos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-175', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことにする$$),
        (1, $$ことにします$$),
        (2, $$ことにしよう$$),
        (2, $$ことにする$$),
        (3, $$ことになる$$),
        (3, $$ことになります$$),
        (4, $$ことになる$$),
        (4, $$ことになります$$),
        (5, $$ことにして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
