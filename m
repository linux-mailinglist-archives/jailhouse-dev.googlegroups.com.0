Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB2VKTSBQMGQEIR3PIKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD4352AE5
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Apr 2021 15:00:27 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id f3sf4315684wrt.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Apr 2021 06:00:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617368427; cv=pass;
        d=google.com; s=arc-20160816;
        b=y0AAoVLRvJ9Hbo7H2a5B9YO64BTdVg5h0aZlC80xa0LtsBCGdvrZ5Xl8ZdxoPfsK1g
         +90TXfj+87iFxG3AuJ81e3hSE5p+nPZbkJdO12s+xnTT/85Iv68b4H98BFyaue1iIgZw
         COxoxvK8hgOAks0/DPIv8f2g1rQGw2uyPz1gqB3Mx66YfNuJq/TIcybQXF2HyUsRxzHa
         KCtZLVbMGCTRhSAvEV0LniaF0G/KCpLqmzOEACy1AFZfylT/TkSn7wU+r8d9N7NxrfPb
         mux2ShLs0wyB3Knr3j7u4yhsD1taQYIvaMdII6BEyGIlDjVIDQmmVeufN3THMOp2Stj5
         8XCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ApF0GuxdBSB72IE3FPcnd49Rxi2eSXQ1wJXs5AXo8O4=;
        b=A7vhJJfvz4BRvGhynkjnZeiJPG+TC2cXbA3BLQ9aGZnfvDtu/9CR1tMR7gcAS+Y3Xh
         Xti3jzemcrqqvfS4eyTV/0DSpjrNQoGF9y1JmoliB1Tcuw3gTCXuARh/nozAytPo8xsu
         ABZAS+GfycywdkTZWMjyI60noqTkQrvZNbxisp11uJ6w8O/7L5EFerCP5i4uLlrFFfXG
         Y+tRn5Q1P7VLZQ5Xggr3lh95nSmSKX1vGT8JRcAoMTE+iVsGuLrtKlP68Z7VGacpo/Qi
         WSobvLTTnu3PggS1x+aVQVPGyBAKw5HKFqOyI3hHPR62cbJT94LgAjrmM5FRM9nqtPQj
         dn0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TMYlawre;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ApF0GuxdBSB72IE3FPcnd49Rxi2eSXQ1wJXs5AXo8O4=;
        b=k6WvIFNeiJzNaAqzwur/46Q4pRUm7Y/+XmRF5ckoQbRRElY2rnJ2eGUPjfvzalNHw8
         HA4O95kLdDHsqla3B211Dinw72bLEYAqzTQoYFKzTFUzQJKKCOQJgb2q7MfC3ixZHJMn
         /7Lt0pvSqZTt9AofBdIop/HmL7zV/xUZHrV4NuwnNu25jnhY/+CxKeCpjKzJg41HYDxi
         F0TO3kAwqeKQFhlr1w4PjJUHyzf84cd84dyWfwgMVbeQx4SVRCozIIKQN1Zis3not3CI
         6oDvb96s8/52WnuakC5y0bpfipdpAjUEk7rG8nl8/lBy6ztMl0j0VjMF+QMVxYieMXmT
         UepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ApF0GuxdBSB72IE3FPcnd49Rxi2eSXQ1wJXs5AXo8O4=;
        b=TbwbcRjd7RUrRVr15b0ghrgHtabA333g3BKKfCxjO5aMdjwvrwNC9jEzGYjENNuxXX
         9zfU+OeUmmB5u2eNcckWEu2FMELLbEiR8a6NqJzxLMPls4pCKU8RWEaFrWFJ6/0nETTG
         xGor4h3EFpGqsnVVGcRl/ynC5/4IgIiCAntkIMMm9iJv8PuFwhtanr9pJWpSO/Z6i0hG
         X7z6kE7IVdCUrn9n3G6z8sW8sWWugJhye6nVxUlXD0ykE0078KwQFzrZ3phfKO0RvNLH
         csp+Rl+GSfu7duhx3jZwVM65WGiaCXyPRyQIqxNn/LPjn4QL8a4nhSaVI8YoS+vGIF0o
         46Jg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530FKFvrmQlpTCNmYluueb7+XpchO8M3hCXmKd4fmhLJG2rAt+wh
	Rl47Rn+IEVvvlLp9ZnxNrSo=
X-Google-Smtp-Source: ABdhPJwkeKwUraROJDe0HCDY7suVkJIUXN3XnqJKEJ6TBHhZXsjNBLhDGPWmj6euL3Z/oP5ZHhWQvw==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr2172128wrv.353.1617368427329;
        Fri, 02 Apr 2021 06:00:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:58f0:: with SMTP id f16ls4871692wrd.0.gmail; Fri, 02 Apr
 2021 06:00:26 -0700 (PDT)
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr15733781wrm.413.1617368426306;
        Fri, 02 Apr 2021 06:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617368426; cv=none;
        d=google.com; s=arc-20160816;
        b=bmu9O/VqTdk6yNU/63DUmNf99i3WNxX8FfHiDS5uh84qL3Ab7yo3sf2GSUimeyaDbj
         SKJ+HKRVtO12wq/cQPGkzq7doG08FlnFTJ9StCWnLt17fbUHez3AZaWNyOBqyZ58djOV
         zC8vsXyhHdtwJ4pkBxjthKRE/mh7a6tONqOEx2Bkdi7UrmP3L/IsktgsR0eQ4+Akjvz5
         gGDL9oEdK8XbieEnqzDhJrCMQVa4eBIVQ4AHuDIK4xoY4kKaN56Thhu40ZcYibTk1c7F
         1OE4z8z1a4c33vKkwvbbzHzU1vuDXgEkog7Z7eNUB/ryHEKi3Llak5MeHdzlyQ7TtRNY
         l7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=E821m4Sig4BUJ5CD8F4GuYWsSGP/GF8DyslnXFGSnHQ=;
        b=SUgFTJTIZsFZD8BobPwtJI+PI4fIPKzXNRHyUUlNP9tSb5i4E2B/xP1qgN5fXF0QGv
         WHgITcQlIUbbgL2yGV6ZsCd4yR9Zp6uuWw6pqNcO1G1V3CqaJR+EC/GR2sb5OR0zaVlQ
         zwsG9CXOCWrqSIN6gViado4oyPJKkwiaGwxACETONlGzOTNhp4He/zVwRTSvpuCfEUyR
         iH9ffbi3SUiqVP+SbRXaWswIwAgjCOz1Y0uVuXi2HXS+eMuAFtJnA2IhpN1SvkHWtMAl
         w8XDUlIlh2kRXwix/YwYHE5kpNTaXgpcqmnG2mn1UM45x8aZvIdtDF2ffrd/GuW00aCU
         kOAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TMYlawre;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id z202si863701wmc.0.2021.04.02.06.00.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 06:00:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([84.61.93.130]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lo0YS-1m8Es42rea-00g3NT; Fri, 02
 Apr 2021 15:00:25 +0200
Subject: Re: how to partation GPIO into non-root cell in Raspberry Pi 4B ?
To: Smith li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <ef3ebe2e-a55e-4166-8d6c-0fbad03f0b54n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <cc6b6824-8c48-6461-2804-350d70701e67@web.de>
Date: Fri, 2 Apr 2021 15:00:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ef3ebe2e-a55e-4166-8d6c-0fbad03f0b54n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/vMzDRkS04Wgmm9yBy0a/gughXf7jSzN7fWqaEoYK+cY+bHYoVV
 KKxxC38TUo3Y6os+jzCZ2iM2mTtC2Heytn2kv2XNm1PklxmnpNV7TX0297uHQvz9bDdpomD
 +ZMZXXHBZLly3Y0mCNUg4Fy7Sjtn0PULq6boLS9Q2vEvn1zs4uoZ4LVuae5IPyggI6AANcQ
 Yw4llx0Pq3no2vZ5QAx4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ww1tgYa/GTI=:XuMdPZKLRKB6XDWGKt9aEn
 baKebeLIKt05tR4qLYv+8oq7uogX4k1/DuWY1dLY+kUUuCM6DGkbJE5lZ5ujvuldOEGQ+tEA7
 1g/rNjyhSi+PBbB78TdZ6AnlaBbNh1/prLm/lP0IPGkPxCu13AMCjgaQnk/V0kbZjszEdLRyZ
 CZtGibr6kYryxE6zTvQ4eVzC5de8vbFQovwF5H1pkk3wkQV+g0M+FsmZpsTfmznG7uN2FEJJ6
 trcEJFz/ugjoPG5dENxnYh55wj1EbGDeDqKGzcAzDi1GIujBsbZVDsSnCBqketDzwvmi8yINu
 r6dvCzro4rXshF6T/W7ob5baQqSXbz7Yu+c81tav/0kTGKf7bED4o0qGcvzeTSF6tKhqBx0Ie
 GVUOPkyV7X3NZXaG0kaJwiqq8W7W02ykBUzikxFRUrUg+Yv6T4VkgzabYyaRnRQ5+q+71w7WK
 aZ9B3TcjRSAVtVbnkcraytUUpy4U5i7FOO69ZYORrrPK3WjyzFA8OVDAm6t+iK32yK/vzDz1F
 +vnMG6mbTQKltpEHdxcLOPxMVRhl5Wflx2Nk4n0mN7sGZH5SQIEhszZtvmOXdKe5Un9QsHp0J
 scXnxP+qsGUSzzsJh4l+L3j9hNlntOkPpqDQ7mREy3PfLUWrJVLJe2k8cSDPA1qZSveToVYoE
 ddsdXUiBTom4iU8hWSYwrVzqixYUtCNSr2I3xtpLX99Pweif8IGugWOv3m0wHD7ERQjoC9pYr
 PHrhAkKwca25qAxEXpvbRO5X6QHXBD0V+YqFU9NuIBD1zq1jzTrfNtrwPakfFQTyQ5eX8Bv60
 aF71ItFpedMYDGDDzj+Mreayk63GhwnV0+FlR17m7XNbwB09cNLQ44bgE01jZIg7P3gb7TPjg
 uLocQrsDg1JSu4CWlFQq21KbqcC4FajNe7RC5YcHz3oxHbJhznf7tfVliuleSeh0QoKTyU5fu
 mmr+QY49A1+VD9P9oUMn8x/ELwQbwJPfDHTFSFh2XRgdLE8qq0DM5RmiMze3nt5F+lvfO1MRw
 DshJGNDOlL6sRr91ZItBbHuK0CMyH+AgCEHHsYto/LJykkqpnGviXCMubf0hxyz0CChdA+60W
 QqQgKy9lBCvKypWw7o7akDEw8Ru7ko97wjoolhfo25aJ0EsojwgXxa1SVtDWfG+h7IX94pHPP
 v/P3J5yi0qmIj6C3VLM/EgjrvG3QDhBJ4AqaA2uHnXWKD4CX/FWxqMVPurRxo+34ADxLI=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=TMYlawre;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
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

On 29.03.21 12:33, Smith li wrote:
> jailhouse-images=C2=A0 is=C2=A0 a good demo.
> It can run very good in=C2=A0 rpi4.
> But how to=C2=A0 use GPIO=C2=A0 in non-root cell .
> Can some one=C2=A0 help me ?=C2=A0 Thanks very much!

I didn't look into the details of the rpi4 yet but the general approach
is first of all to organize the GPIO usage in a way that you can at
least isolate register accesses per cell. That means, you should assign
all GPIO pins managed by one separately accessible register to one
inmate only. A register (can be 32-bit wide, can be smaller - depends on
the hardware) can then be exclusively assigned to one cell via sub-page
memory regions.

You can find an example of such a split-up in the
configs/arm/orangepi0*.c file. The configuration relies on the root cell
not using the GPIO port assigned to a non-root cell anymore and the
non-root cell knowing the address of that assigned port already. If you
also need to reflect the change in device trees, things may become more
tricky, depending on the DT binding of the given GPIO hardware.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cc6b6824-8c48-6461-2804-350d70701e67%40web.de.
