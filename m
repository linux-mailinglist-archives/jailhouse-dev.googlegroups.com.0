Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBSOOTXUAKGQESUAUD3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67947F56
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 12:11:22 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id n49sf15710222edd.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 03:11:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560766282; cv=pass;
        d=google.com; s=arc-20160816;
        b=HvPXixaZF2SlIvEXBat0mQHnmsffB7InYWrAtM5tsHg6OQJuu7+EzId2O3NR6fjsVR
         hbFxpyMxFbHRiv12ebJJQ9UjX3t8XPtc24AApMbaE3zFiWnj8vwEwwgCVfuxVJ76U2/F
         WMnFugxP093mYEtg0djmFAlDu0PeY8x/xuGQ1yoruaypkfbwky6RKJHvUt+pkJpKpuwG
         x5ErpD5ae3o89A8bLAKGex4TPpTQvv2gJ1GJXwsrVNXsXwOQqXqFOxoSZDJUPmtdsGz4
         uB9KWAgQLNI9a+f584eLLWprmMUYRZr/KaM4jB0kzREHQ+RcV10TH77PPUOy/jkx6ysZ
         3onw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=rwjEdWKn2TrwZ5AD3YeTTrUKvFjejbPTmVFi587uVvQ=;
        b=hxens6r69jk6ZSPq+XreWI7r3yyVQdl7TBPQ9fII9UZwzfZcMcz5Gwk0YPlwNVdCr2
         4GTVw7cQcmIBcz2M49dtJZa4fsB9SVZBX5c0IIgv73m05byZ2BBZpMBY17Z/1yc0VQqG
         zGsjx3gVN5Qvt+/d49SC7iV4rT9r/gIsOBB6/MyqFM46f+g6koz8kkBwlOahyIdN/wzI
         N9VmAn4zrZzMsdYDJryZ9kevLfHM9hW59C+D6Hd094299ZFwcCoFbcBTVYimezhTrsrb
         NOswDjkoUizA9SdLuAtXzOIIc5FDERMhFpLZJmdJwlOkbEa4i+A8tX4GpL6PfMXGcQNf
         CcNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=X2S7PtsS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rwjEdWKn2TrwZ5AD3YeTTrUKvFjejbPTmVFi587uVvQ=;
        b=UtQvdzFToTCYvEBDG+MVYiAeF50mnpsXBqWIUgwPjl8iE4BkU9RqSoa5MvMQ/q/lAU
         FadXXvGX2lREB2yFPCtAKCQ56epn9j5whU2hgF0xyHCScRgpEfL9zN8yIE2y7Wveft2F
         HlggfFLG2dq7mnv0RrXY1g2dj7Mdz3zocw2mu1TYLiz2jWqi3nTI2kHwqfcnFsWS4nw1
         rEg1jxyrSF44Dwyl/Zd3LpzOKmDEFgVCCEfTVlFwBedmxU65M2Hz1nO2/wM8TEILi9sJ
         AH7Dn9LTw4Hb1rHMVx0pueqdtyzhEFNRm4HLqWsMQSJp5s7SqQWdgdXsViCvWRSGf7lF
         hkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rwjEdWKn2TrwZ5AD3YeTTrUKvFjejbPTmVFi587uVvQ=;
        b=KDVkuZCv/u/5r5wiKLOqPtM+2odZzuAQs6FpjjKiC3YNSolfhmRayF+wK8K7SAk0RP
         bfHwjFBFMUYeF/EPkB8ROGgvjRYk468BsjwL94ZjOOsBMwGmq/yqxPH/pwjW5/SgirFe
         BlGnzhcadYvuk4QtGtn3TXL8Ve0cIJ1zLuUizGb6KxedB79Or8z1gx/Sw9P7S817SQuz
         bVV8EhehuGQ71z3GQY/sC8BDfPHtPXRCm4VuNCHCe1tm2Y3bpcISFnA5ZF3R7cyKIbuP
         YG3KOBcv8tgFfAALmzI2bui6Mi6BpNJn27l3pADZwS5JORkEpKgDENUMJkUlufqtyvh+
         HusA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXeq/QU7EaYFAOy3kgLOWCIp511ZcUCqCGvTPV0GaRap97hixf9
	9Br/yAMWGaKyGZIBYjybc5w=
X-Google-Smtp-Source: APXvYqyIjLAwz5eT5TjeiQLYNYkSrg3WEAvzf9oFnaR5ZB0EjbHuj2rbM9tnzjARFd7ddk/OHp/BcA==
X-Received: by 2002:a17:906:7d16:: with SMTP id u22mr94823922ejo.85.1560766281922;
        Mon, 17 Jun 2019 03:11:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9583:: with SMTP id w3ls4670769eda.5.gmail; Mon, 17 Jun
 2019 03:11:21 -0700 (PDT)
X-Received: by 2002:a50:9965:: with SMTP id l34mr84752121edb.152.1560766281441;
        Mon, 17 Jun 2019 03:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560766281; cv=none;
        d=google.com; s=arc-20160816;
        b=DTCoonSEUhRUiS22vFeiUrRggGEPjDloUaw1Nf+VQwpsme5gQvHPC+dv3RoLKV/YQt
         1oPwQraVxsocBgmqjQxIhwf2o6U+1w7JyuTtlgwCWo2VxHBcX5SdD/rhc0VGTd22A9Fn
         M9AN+o5v2BDJSHugh30lhOxw+/VcX7KmTGjGi20NkO9hX7ThpFzys6FOj7l25gwx7svr
         Qlu5joh8vnMAjdRx2lpQPHhL+F+z4UjWkQ0NtrplYqtTkyLcd6H9CaCi/EDhiqntZDNY
         Oz31PrSeGSTspTxtnpfA0SAVquTo6NCqj3BMQwP5krAEJC5xpTfQ10Om1/okXL/ilLKg
         wmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=vAo1AU7Yq4F+zkVoSnNFCprP0SLD0qD4wTIwx5Oxf8U=;
        b=Qj+P3uIjVSmdyhS0XxGvm+Si6z4PnTIELDtE7WLpRgpGen8tZ+rQnVR08kbKaH21Sz
         6eepU89pgfzXr5NbzIfCTbg08GITmh52jlMIxLXPJlKnwJ+NCrq/42+qrdfNPzFFNAjs
         B0MSFCH+gqem+W35vPmH54vmLgsPmxaZcGJgovSPCtz1rvaULZcJ/vX+waGlT5JRyo9B
         zdtLv8IMyyxo9b4dW+0dWRv936zJbnPCFPfb6I2JsM/IuS0cR5spJ6kK6W/M54m88oLA
         6Fn855J9Kv3jqqa6pb49+RR4iZowF4Kb+jcHyg7AWfWK1bFckapKSJVftPeallhj6cQv
         uXhA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=X2S7PtsS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id z20si638593edc.1.2019.06.17.03.11.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 03:11:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45S6S86fyhzxxW;
	Mon, 17 Jun 2019 12:11:20 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 17 Jun
 2019 12:11:20 +0200
Subject: Re: Finalizing 0.11
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
References: <9a1a19fe-57c5-a5d2-f5a3-547e07bbcf8b@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <e7496701-fcd6-8c8b-ee43-84245c782943@oth-regensburg.de>
Date: Mon, 17 Jun 2019 12:11:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9a1a19fe-57c5-a5d2-f5a3-547e07bbcf8b@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=X2S7PtsS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Jan,

On 6/17/19 9:49 AM, Jan Kiszka wrote:
> Hi all,
> 
> by the end of this week, I'd like to tag a new release. If you have
> anything pending that should be included, make sure to post it soon. My
> integration queue is empty, so also let me know if I missed something.

Andrej still has two patches in his queue, but they're not necessarily
required for v0.11.

There's still the MSR bitmap issue on AMD64. Valentine didn't respond
yet, I'll have a look at that soon, it's an open issue that should be fixed.

Other than that, I'm in the meanwhile pretty sure that there's something
odd with VT-d, but I can't yet tell what it is exactly.

  Ralf

> 
> After that release, a major rework of ivshmem device is scheduled. A
> prototype that supports multiple peers and has other optimizations of
> the previous "ivshmem2" approach is almost ready, just needs patch queue
> refactoring.
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e7496701-fcd6-8c8b-ee43-84245c782943%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
