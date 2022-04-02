Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBUELUCJAMGQESZXESUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA474EFF8E
	for <lists+jailhouse-dev@lfdr.de>; Sat,  2 Apr 2022 10:14:09 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id r64-20020a1c2b43000000b0038b59eb1940sf3488040wmr.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 02 Apr 2022 01:14:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1648887249; cv=pass;
        d=google.com; s=arc-20160816;
        b=fC7B7IDUPuu8COy/7U60j1YV9hbroRjE0PKxYjTEH+xxxPgrTwdiDjm6t55KkNQdcT
         n8+igWpKBVZz/ntT8tDRiq8r1z2zOwtyd7fgQNjAjo6rQICXcxAjcOvsQOJdpH/UqGpg
         EvY1VIwCu4cCAT+XGhtNZcLWn0vwfVT/OcemQQQqWSwLWBBcmcRA1tO19z9u41UnB8cs
         oHQgLSQWK22wempvI/adc2RbhfwvMrsfZDNHU86hn8sGBT2TGY0YQ52yCwnY7wIdHhDs
         aOuUwPslCdUiXFlcUSxrNOAkZ3PkvaTHJGnAMLU7J1FI1cAeykEohM4oly3nPf0ryvne
         uuiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=SPnr7YBdmgrkcgt2CvO6cmGdgtqTfMGWKmu9WyZghB4=;
        b=avq5dZe8W/I4iOte/M3y+02ZnhhmlUYwM5RWIqagYI9zsTc4OHseLBvQwddiOPy2pQ
         vcUkffT9seRPTPHhzD/mXgGyhP6S7HVgmgPp2yfdJbQVQtxGaH5Biw2478cMjhiz3dTv
         ZKK84Scd4/tdsJlV7EL9AzG11ORU7SLpQEaKnH7uy/CkBVSaPffsPcmZWDHgZx0WomJd
         pKfOR7ubPwaXG9072VmlUD/tsg1nxt9QI2ezG/pOWTxtGb68pDCsGDrpswDbwqtB+ZCH
         rLTiSPxvBdyqrQ2bNoQpeunZnEgWXLlSn+kXE58F4flvNexZWmmR5FsOfg8rTZ6BjahI
         +hug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=niXVxbta;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SPnr7YBdmgrkcgt2CvO6cmGdgtqTfMGWKmu9WyZghB4=;
        b=fPSA/EgfQE5BTB0moP3VgxLr9jjOoHMV89UnWYtTv1MHTOby+N6+ZmB2r8M9uFzW4F
         FDwJUtLnDd4zKCYh6P2jUk68JsKi15pBS8ulhHOv1REynzZJCWudswpQS7DXnBDXnUPU
         eyBaBYgUE6Dt0YwrFx87tikeItWI8HeAmgTn522ms1hpqwk5YgmDulVmpYRsyXhuNgCK
         6ECt0bAr1NeBGWJfPue+CoXqaneEpVPR7E6zESiHBRACZTxolS0EsN/zFMrLV5scI34r
         ULEOpgASE8q0vF782GXI3qziHTBt/Nlj+GLzQBJ/SRag7sBXIQxTSoRSgFO3Kkme+t98
         W0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SPnr7YBdmgrkcgt2CvO6cmGdgtqTfMGWKmu9WyZghB4=;
        b=ok1k2dFjKYDkQESWnEqqkApKPRY4GxXiUbxs4NPLcppKwxg5JQ6RzBDuMmCyJ3L1Jk
         IlQ9R5t9gSEYFCNoS5g3hG+BvrCMSFk0R+6BEaM0wGvrr1A/pwp3qoXhnC97btKo9S75
         XGVp++D9B8ffQ5WJoyNd5mVlGmNzFeo1dW9bctNbjkGSQ41rsbDbuIV+tZemYZaAnNd3
         PaKvFbf9MrswXUPidAMeasXTFpxNTmer1qWU4TlL76o8Ul0dfSr9IgVKzC1WJMpx+ac2
         kY7xTxJLAHiD3ink2em3uI0Pknm+pOt0Gg/XK+rI1kbHI/9O44rccLp7z/RSPNXslIRz
         9Otw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530OKPfWcOcWCEVjcuMdu4fGeStIMj0lO/zESjE9C8fxL1G17p0L
	TFUz+9gUFLB1fxwD/A9zf7M=
X-Google-Smtp-Source: ABdhPJz8QMjDf25ttxbmQyT9BXc0gw+0M9iw4pm1fFUcNcvo/aVv53boOWwrJ2MMyGZ/gw6pZu+zCQ==
X-Received: by 2002:a05:6000:1e05:b0:204:12a3:ff6d with SMTP id bj5-20020a0560001e0500b0020412a3ff6dmr10713636wrb.321.1648887249044;
        Sat, 02 Apr 2022 01:14:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4e01:b0:38c:9f99:b05 with SMTP id
 b1-20020a05600c4e0100b0038c9f990b05ls1045709wmq.1.canary-gmail; Sat, 02 Apr
 2022 01:14:07 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc4:b0:38c:d622:f445 with SMTP id o4-20020a05600c4fc400b0038cd622f445mr11736924wmq.73.1648887247895;
        Sat, 02 Apr 2022 01:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648887247; cv=none;
        d=google.com; s=arc-20160816;
        b=bsLH+HgdHirc2YhYntYKHiSIaCChOLppncZTGkmcST8QbbtKKWiRztt6GTFEGSlZrR
         paKS/yo5klfuk8uldtuIhHHMZoebEraAkiUzVWTL7leTw2ga+tVgDBt5A9/VMG3u7o6K
         81jxV7v0/Bh1W1jZhXc/SR/GGVjoVKX49zgVtjK3+xgZlSqKpjVtVy8XJFfmtEzjx2Rd
         SsZzhpoGGl6G8dQ8d5YsHhxzHVgVGslDxb805moF98GVcqSogxkanQWgCGFBmFDbv+R6
         VD4CB2jMZT6kN18dRaeciNNXaTWz2EGMMjxforZE9sL9eGAdZo8UEPRWVnag2wsK/2/v
         qMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7hhU8nbkVT/9u3Gv/dFfdAaGjWUxokoJ3l+FF/2ilk0=;
        b=elfBIzoqahYcTRkenHwR7xzMl6/ELKyAaZR78hr+/Dlzkc/H9qv7SeWOz8Ov6njbzR
         6k3EHV501r17Ac2pbNXS4Rf0FU9IBFuoth22M6qgjSDwCbBB5DpPOWkqfcp9P52iurty
         o3wrpIFu3kT6oBiKVKcn+aITzH5tJjunyAHbX3p3VtGG92raFF/OrGMZfybg5py9NYI2
         Eo5W53HsO0xLNBROcjeI/JJFMlY4gIQayYT7XLaTkNooCL+ztOsX47M4qyHPuwspWNFQ
         cvcLQBNCR/LHmV4X8Rdz+J0Rk1Jypo5Sfssi7IsVxqohEQejcwedwRV9hZdOXxuQA4YP
         gKMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=niXVxbta;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id 129-20020a1c0287000000b00389f5a1b55asi88908wmc.0.2022.04.02.01.14.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([82.83.53.221]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mcpuw-1oARsV2Tju-00a1zP; Sat, 02
 Apr 2022 10:14:06 +0200
Message-ID: <27e635ef-500f-6f19-a461-9a5e88d12c8d@web.de>
Date: Sat, 2 Apr 2022 10:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Jetson TX2 - access to peripherals from inmate
Content-Language: en-US
To: johannes lex <johannes.lex.5@googlemail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <b708cd52-3034-4d11-a61c-1e4c992c096dn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <b708cd52-3034-4d11-a61c-1e4c992c096dn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s+M8Rf74yrYko2swi8vMJTL9LGucG57nrpFokGE0pJeDBd1PasU
 Jyk2Yb5z4CMD6V3Jid9vaDLATjFRmZ5p3V6J7W15OEYnruCNeoztHHIYKZC1ruF2GbicnxR
 nhk6uu06Jpp7IeZ7hyqV4/fz/w6UUKsVzc5CxUtIiZDq5WlHC+Q0/rAh4pi+ODD6cX4AhhP
 eBDBIQBHT5YuAY5GzZs+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M80BuR/nn0c=:EntBRRYvjDP/py8UyGN5fM
 sou9iYwEPaatjijeeQRp6hVuBwHV5vhhRPtJSy+k9S4cUHo7TonDNykutpCt54ZXUa7L6VieB
 kFGVTrgAssSVeKsRvcetO1H+mP4eFIFEoffWr9LAyuavjfd33WO2gaBB6V/I+0n7O2UXe9PI9
 iiavR7y9tHi1i4EwK2KLKmYH4JT0j1OqhQ8PapjOT8H+Fpeq0NPlrL3nauw3RQragwrXcH76o
 OX18sIeu4muKUtYE2LE1w4snBNGXNrbvX1xqdcxOWc+CcHXHAUjTXQBqIBXFHV9BmDaK2VhAF
 RMIYJu88BtCMeByL+9NTC7D8hPvH9aSsh5h6WRMXsz+QtNwZKPUQop/32471nDpGXChv1qJSU
 mSYS+PTDnBfgiiyji0KLRdbGa4QApNp6H3pQTsFB4YoqFS9/ld4bjEHjrquodo/xtxmH0Oi9K
 PrKMvabtlc6iwN7rJm+KnnnowkVbbsmXtM+hwMVC0zaQhNLBCk2W1KL0TJFvR50cfMu6T0Uti
 jUIVNF8A1jrfMcJAJv/mVWwSrS5MTN9BDBhLvxBHXQCSFpWd9+3j2i0HtDKoP3F5G96WWLtaT
 YRpemrlU3tHYMkG/+L9VDbfg++RHtmcfkVYal4USg95xPQzVessSwkiyrC/X9oA6OIikxBYkF
 2/GX16uqLGu0qavxpJm8NTSMwoBg+h3n2mfTKFr1rUznKKvVYSGJUbWrf30JyFowEkORVC/KD
 mHF80fHFPVAFJ1JoUirb0b5u9N+0OschinElvlvfpNxdm4SIrKnJFU0OsCht9Lq/DRUm7lwmg
 dDkPf3k0+WRnViY/q1MaXZze4sFDgoU+pV7KUyICJJdX0X0C1OKDRBX3PHO8OfmQMQByxphSj
 kRahbk3GTp0O/R57hMqXOcjpTMH4wy6dgaBTc+VCKOan7tt01/kVJN1A4KHDP2STjYVDAhG8f
 E/3Wvkzh1FfaqPk/JblugQgubZeFZqjXJ30+Cw9WNV+CzWpRqhbpvfSMdZ/OD4GuG7SzHnDR0
 a3X/fmSUWrniI4Igxy9wGxg9suhTgFfZJ8ux4rx7breKxz4P0nND2NLBrPEhjCMOkonrIIcYG
 SFG9BQLG0m8ytM=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=niXVxbta;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 25.03.22 16:11, 'johannes lex' via Jailhouse wrote:
> Hello everybody,
>
> i'm investigating the jailhouse hypervisor for a research project of an
> automotive company.
>
> As a first step, i want to set up the Jetson TX2 Board and add an inmate
> which toggels one GPIO Pin. I used the VM from the ERIKA V3
> (https://www.erika-enterprise.com/index.php/download/virtual-machines.htm=
l)
> as a base development platform.
> So far, Jailhouse is running and my configs seem to work.=C2=A0
>
> However, I can't access (not even read) the registers of the GPIO or any
> other peripheral which i assign to my cell, except the already
> configured UART.
> The cell config and assignment of the registers themself seems to work:
> i can, for example, read the register=C2=A00x02210890 from the Linux host
> before creating the cell. After creating the cell, a read attempt from
> the Linux host leads to a system crash.
> Unfortunately, i can't read that register from the inmate as well :/
>
> Do you have a clue why i can't read the register in my setup? I've
> attached my configs and the source code for the bare metal application
> of the inmate.
>
> Or do you have any examples in which you access the GPIOs (or other
> peripherals) of the Jetson TX2 from an inmate which you could share?

Already checked your configs for undesired overlaps (jailhouse config
check)?

Looking at the jetson-tx2-demo.c config you shared, the GPIO range is
exclusively assigned from the root cell to the non-root demo. So, any
further accesses from the Linux root cell should indeed trigger a
violation. But accesses from the demo cell must be possible. However,
I'm not seeing any violation reports regarding that cell.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/27e635ef-500f-6f19-a461-9a5e88d12c8d%40web.de.
