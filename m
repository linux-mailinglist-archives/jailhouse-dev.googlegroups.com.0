Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBS75RD4AKGQE6QVQ7QI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id CB762214FAD
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Jul 2020 22:57:47 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id f5sf39088770wrv.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Jul 2020 13:57:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593982667; cv=pass;
        d=google.com; s=arc-20160816;
        b=x8Ex0GAaa4cuO1YsWT8t9R49LBq7KVtCK+EcSa7hVd2DV28IpE/8wypWFgw6b9aGHa
         fYqGm899Qu5v+3NC35QnkbjWL42MPF1LNKv+pDubL/U9Xra8GpfK1Tlz9IuNDNK1hatp
         vdB/KfUss4G2mTcOWnlfdohGAC7bpBBQTXnF24IFXsz7VOqL7DvdH16PoAMgBAnpac6s
         TwNl13B8HlJw9O4UhH9XNwKh8rDPVXZ//nNNDAMvEPBkcCmUYAQeVzu9yh/g8h/hbQh3
         5OTtp7BHT5lKY2I+XWhmUMjnnP1CdAOToTp7HRxSqu/tyDUv++EH/aXRAgDNEGzTTlcB
         mKjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=cXxjc1aCAA51u/WLgZngqi7KRuPz9kuxFTSgo1ZLo3I=;
        b=Gn0hJsQspgyXHHIIdML0vtQXMYobvf1iJ+bmFg4ZAIRnRlgsgYP17yxyVdE98bt7Rh
         yoj5ziwPMeZfUr+E2bMACyvqVcjFt/FodAusDqWGij7LOr1PIumrN4tPQWcwSOe6GPkT
         uTbsOY1Equ8gxMqjpKA3q7h4gwgfvY6D5CLx4aFGY3ZzjfafYGLjlX5sIixwoMJljHNT
         6LBF/qOaT9la9dUOQHDkLvYwzF1RURMP+GcnPmpXSoAbJbd4JWj5BNWGmS9yTSLVF+oB
         Vp6T2DbFsM+aa0YmUFPE2yu45X0eUqG46/elSZUsLFLQcVk5MfCs8IzM+soXluhcUGG2
         6h3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=DYLDhi46;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cXxjc1aCAA51u/WLgZngqi7KRuPz9kuxFTSgo1ZLo3I=;
        b=OrtYmWIGqVqSQtzaw0d3avCqaTEeRT9Z8n2fjqQqeSD109DW3FqcLhXz95ghqMRhvW
         pSyWpu50uwEkjYCatfeQNjQixEtEfRmPGcPx2xpwB8Zp07xn4rUFKyfHu6AA3pXFn/71
         pMPsKDfoOjf3ojiG09C8ZNmSxRj6pYJECi69kNZ/vlpWEvvZx6BQeWzdWcuI23VqEJ38
         TMNHfTBjpWSg5YdZh8DZn43Gi3ef0O6NuBYtpsnlVO5hVVU57D6+VWRpCjOhidp/d29t
         0WCZUJt0HUzADYPTE+iWJZvNAxHom4SmO5bQlwPRG0FU9MVUWPzBoqJ9GN5nl8Jkk4A2
         vLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cXxjc1aCAA51u/WLgZngqi7KRuPz9kuxFTSgo1ZLo3I=;
        b=Y9+e28AQtFKjBnFUNpgBIIXFlTdCdOdFywfpusAPGQs+ygZrQZEH9crIHY8/txK30H
         4yto7aET0J2AxzwtJ6pYldNQMClk/YIzeSRW4S+ffWYrG6n+rzgd0YRcQfEUGoxci07G
         YdBtMySRbgDX2aG0EPyU3CJf3/5NSvhhKz8Smd4OPgLdC0AahsYvxZCLFXRHND40rfZS
         utqnIVRxef9gbYWV3m86o0/cVifjs0Ip6RskmmzDGwmF0RSHGQjXE8S2teXp1QWaIXXY
         idoL44R6UL7R6Cq1JwL70SciGXnTAgKPG8abwcwUf6YC/zRDb6KnjybZVXae2TqFWFkv
         2nQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5311r3Jc6l7Sm7aPn89aBA0RMRKTx5LEM5nrOGKaGz033hxFkBL1
	Gir0rCa7Vx2dj3MXhhHwfm4=
X-Google-Smtp-Source: ABdhPJzD9T9io6xcPDgpKF3wW4eDwzULM4wdKlaceZRK9PsgLz8aNWfjm/BzMZyOKjrIOxEuj7h13g==
X-Received: by 2002:a05:600c:2154:: with SMTP id v20mr50093799wml.185.1593982667519;
        Sun, 05 Jul 2020 13:57:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6507:: with SMTP id x7ls6754859wru.0.gmail; Sun, 05 Jul
 2020 13:57:47 -0700 (PDT)
X-Received: by 2002:adf:8501:: with SMTP id 1mr50224911wrh.153.1593982666921;
        Sun, 05 Jul 2020 13:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593982666; cv=none;
        d=google.com; s=arc-20160816;
        b=DxDZ19PqOab7jCaFUeQNIzUIYJXV2+xJpl07D9rnXYLV7SHec206EliqYNZphU4vRb
         IBa1euLwWqloj9vUpDtA9jCCtBFn06s5P08azxthIdBBND6RYaE9XsaOV1wi0+Lkh3NS
         Y+gvcUyPmZc59/Q14m3sknXRUMDJpLCLgY0zUYg0FZUwXCHChWc2qNjmv8Snji6Ydmin
         jBjHYw9eAHHMDpCsgzQhisC12AkZFPpCcB394jCY/zSfpZ3LxOtdYOYP58WN3hkWOugV
         8btGgKRIetz5s+TIzEfdAlDgd4puGVaLyl/fB3S39bVbSvF2Nc4HwdwUFKTkd70UwG/7
         smOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=6Dfq2p+wcgVGdjYPL2AU1Ex1MrWtKse7+/wl1QkciZM=;
        b=hu+oKyksdf9eOEAZ4GrojNS6q0+IeyvGtJ1qXhZ+oMskAQkISvS906O+jrvp7tuPZk
         6weVR0gX+JZnMgjAR1nWjI7dQT4JUv3cJLd4RtvKqr9xkcBOKHElcdL8WNmlcOftTEGs
         qVj7ONTgsOiGWIXpUDkrAS5Phvx9DUsOpqHW4zlHmAT9udTpQrtTYKmEzc1IjpVsnuef
         Q8NLYj/4X4IRi2MU0LfbHvnyNIrwtEDLyR7231v246N5uXhG84ibL2cnt/NGTgC3xSGD
         xgvOiyGUiPnz7WeyQaIiDtCSFZJrOp5Cacoe+FoZIHWcFxY2pbeu1dOzWF5HVLxUeVL6
         +2pQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=DYLDhi46;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id q193si354844wme.0.2020.07.05.13.57.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 13:57:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([95.157.53.180]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LtFEp-1kts131ZxT-012tEf; Sun, 05
 Jul 2020 22:57:46 +0200
Subject: Re: [PATCH 03/11] pyjailhouse: config_parser: consolidate binary
 parsing into CStruct class
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
 <20200630064228.4742-3-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <1a36f470-27ac-42fd-2dc3-e990bf671164@web.de>
Date: Sun, 5 Jul 2020 22:57:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630064228.4742-3-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:YF4SSa5LLdDJvMm3OW3Cm9SL09lS5tRrXBlpDX1s0V94qo3nWZs
 iWt2IE81ZjEPKaUmC3Oalp+kohU5oKwVi8WJSbt7am511XyHbRefogg0dkeqQ5XUfumb8xw
 dWuqt7F3eOBf3DH3brhge6oYm1KR4eoBOPCM9+Ywj/0cbywrbGytpsYgfiuh5kf39CvTJZJ
 MW3pKWrSY73r4TjrtpJJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OA/WN4yGwAE=:mrBsze7aG5FtmVVNW6tHGE
 9WvT57D7em24yD6hoUrayGA6l+HqEose++WEkgEC4LOgxT0tExyX39NPcnKl0cMqR1r6Y1FBE
 Z/YaRPzdu29/KNy5a6fEOE81ZWS06ccoZdLWswxeIJt+sIxXVjZHrVkphGgcQ4kqVKw7u+RSn
 kQVJrmwYmlx1ErTcuPh/I1ByJYw9ODwi4YG5xQYzVMxU/pFZFj+tPsSVAOcpz9UkiOOMMCjmI
 Hw9faRYA8Qf9Mi5+gk0BtQ9Fn9fNmZ+8SzdSp03tLnZ+sjybvmZF8oITg+7GPRRLNEV3YI/df
 /r6S0jXnplgKSHz1njpSGdJL4hLvZoPvB688+EUazcaiDLh78vW9FaQsqQm5px32q4jULjyhr
 G3dAmLjqiDALXseKNSEgvb7EhhtVOwnmq6jxoMCIwek+h/z+zBiE+VhFLgnk8GubWJpUJ1wXb
 UVPrBaNO3hnZEX2fKOmT9e5/6/aIQDIA0qJHk7aJWh6y2KIM6cXh6KITJMvZtXS8OdVbONRlh
 b0TfY/mCc0gh/Co7JJji8VmgP7BwU4wrL3pc0oYV6AFYMXk4oRYUTWLuMM/Yrq41JswPJSj37
 UUKWpNhxw+bMl3FbJWo0sH1oX17OgKrXs577B9LhoOedcRWkvUJ4dmaeakMMpCdJchjocBALH
 QdTzwpfWHPJ0R6C9yFNuK0xdQEe0v8cH1xwfoQkcYs8BqWWUsDNnsSzztOHBlqjItLbDdgJUg
 GbaE29/sOh+7RjbTDQX4EDOi1iIUb8VtzETQ72jAbQ9rBejkkNxDJDepi7BFKJjv0lbYoz+cW
 pGtH5DKkunHqLWsim1vx7FwrSMzwxnCGeyAowrdNlqBpeRst2S96NkCUpjyb2YQcoKkWMLtQI
 O6pxIt0ANT9emnu+BPj89ZJxOHfOOFq2DqdSIjS/O8Mtd0QJqoRpjLBOtbPqkcBVL5SW+ZGxI
 haiwWpdaS6a3w1aeAMUfQ1PtmRbljZt/3YJUCAT1CTQ/NIMQx5bq7wiIF5odD0kj7q78m2rm/
 tX8taJDebnzO2tIXrW2Bam+1a0Nj4W3M2SH2eXNufaub7Y88SUAxZTxARZy+wl9E5Jra3eCI1
 2l4HRXD3XsxGKlHJ/rgWkHKQjoI4IvV1ESj3DtWtCHLS8h6KReV4Bcts6Kmvx4CVErHK0azuH
 B/Vm6vx7VXWeoa6NYIwxDoL+g9SH7s5/asTyIVDjWPQP7tT2WC1pZRMdRFQsorNyI0XVIAI6i
 JHwzMDoaiuwuxVQNu
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=DYLDhi46;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

On 30.06.20 08:42, Andrej Utz wrote:
> The class slots define component fields in a more grounded way.
> This greatly simplifies definition of parseable compoments.
>
> The first `__slots__` tuple in each class defines a constant list of
> fields and also the corresponding binary ones in the C struct.
> `_BIN_FIELD_NUM` ensures that subsequent slot additions are ignored by
> CStruct as they must be constructed by the owning class itself.

_BIN_FIELD_NUM is always len(__slots__) - then why do we need that extra
var at all?

>
> For complex parsing the class method `parse` needs to be overriden, see
> `CellConfig`.

"overridden"

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a36f470-27ac-42fd-2dc3-e990bf671164%40web.de.
