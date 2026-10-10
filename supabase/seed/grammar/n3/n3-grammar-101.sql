-- n3-grammar-101 — 〜際に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-101',
    'grammar',
    'N3',
    $$〜際に$$,
    $$sai ni$$,
    $$Quando / Na ocasião de / No momento de$$,
    $$際に é uma forma formal de dizer "quando" ou "na ocasião de". Ele indica um momento ou uma situação específica em que algo acontece ou deve ser feito.

É muito usado em avisos, instruções, anúncios e textos de trabalho, principalmente para situações especiais ou importantes, como emergências, pagamentos, embarques e visitas.

Ele vem depois de substantivos com の e da forma simples dos verbos (dicionário ou た).

Com は, 際は dá um tom de instrução ou regra: "no momento de descer, cuidado com os pés". Com には, reforça o destaque.

Comparado a とき, 際に soa bem mais formal e quase não é usado na conversa casual.$$,
    $$Em trens e lojas, avisos como お降りの際は e お支払いの際は são extremamente comuns.

Nas formas escritas, também aparece 際、 com vírgula, sem に.

Para uso cotidiano, prefira とき. 際に soa como linguagem de documento ou de anúncio.$$,
    $$Substantivo + の + 際に / 際は / 際には
Verbo (forma de dicionário / た) + 際に / 際は
お / ご + Substantivo + の + 際は (muito educado)

Escrita: 際 / さい$$,
    $$際に$$,
    $$際に|際は|際には|際、|さいに$$,
    ARRAY['際', 'に']::text[],
    ARRAY['際に', '際は', '際には']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-101', $$日本に来た際に、富士山に登りました。$$, $$にほんにきたさいに、ふじさんにのぼりました。$$, $$Quando vim ao Japão, subi o Monte Fuji.$$),
    ('n3-grammar-101', $$お降りの際は、足元にご注意ください。$$, $$おおりのさいは、あしもとにごちゅういください。$$, $$Ao descer, cuidado com os pés.$$),
    ('n3-grammar-101', $$会議の際に、資料を配ります。$$, $$かいぎのさいに、しりょうをくばります。$$, $$Na ocasião da reunião, distribuiremos os documentos.$$),
    ('n3-grammar-101', $$地震の際には、エレベーターを使わないでください。$$, $$じしんのさいには、エレベーターをつかわないでください。$$, $$Em caso de terremoto, não use o elevador.$$),
    ('n3-grammar-101', $$申し込みの際、身分証明書が必要です。$$, $$もうしこみのさい、みぶんしょうめいしょがひつようです。$$, $$No momento da inscrição, é necessário um documento de identidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$部屋を出る____、電気を消してください。$$, $$Ao sair do quarto, apague a luz, por favor.$$),
        (2, $$出張で東京に行った____、友達に会った。$$, $$Quando fui a Tóquio a trabalho, encontrei um amigo.$$),
        (3, $$非常の____、このボタンを押してください。$$, $$Em caso de emergência, aperte este botão.$$),
        (4, $$お支払いの____、カードもご利用いただけます。$$, $$No momento do pagamento, também é possível usar cartão.$$),
        (5, $$次回お越しの____、このチケットをお持ちください。$$, $$Na próxima visita, traga este ingresso, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-101', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$際に$$),
        (1, $$際は$$),
        (2, $$際に$$),
        (3, $$際は$$),
        (3, $$際に$$),
        (4, $$際は$$),
        (4, $$際に$$),
        (5, $$際は$$),
        (5, $$際に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
