Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBA76TL2AKGQEHQ4NDUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD719CF82
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Apr 2020 06:43:48 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id h14sf2456827wrr.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Apr 2020 21:43:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585889028; cv=pass;
        d=google.com; s=arc-20160816;
        b=t7+xWnuETPd4HiGri4D+00myP0kJ4GVs3euPvqLZKDAJIPlaUjpc6LWhlbRhfIHt5u
         8Pl03w/lmJ7hcnI5VGnBHFlC+VNGK4gssgDvwJh9LoE2qvVV0n3hMDUA1jKZJmXNVuFV
         l2BHRmnBpUIkyGs8J9tVj4AOiYz2BQbV6DJasUQsOAA764QcGVc0vrlLhiVx7vEA5NHS
         j7OcVVHSt6VO1pA/hxB8b20m3E1uMWooNKOH9c4tYdllLtVXWUO2YT65kgxMeUt81gGF
         WjfCpXRVlEdx6V0DnoT0tIMpdAoenoMnMwslpte+nr4D7u1D3IFCVctHFakeYUlSAVQG
         XH4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=SE4SOOwQvH71szcrb9mqmd+B2bHhjS2l08ihkbMiSDo=;
        b=fXBocCSGkqWKW5lj1Ek45VgAUDPCIJiG2akSZnU7uNKjF7sxg+evAccDb/kVU09V7O
         AcSrdmvZB+WJ1Z+BqCpIs8O2d65GRb5W6yCcb2a0kIqrDMwtP6OKtBRxXP6h/jzFlbWn
         gUn1AExyaROuQ8W/gvK+6efAajM/+6HR+JfVz0uwnazYRSz+M7TB4QX3eZqE00yprvZt
         hw8EuKExfX5l9CuDLSjqOQFovnJ/mGT60dHR2wAtShKdErbAlTLBm0NA15XyfhzlqGNV
         0s2DpnD0exoCPT6eNK65hNUTeZ2L2C8mOYKWwzJjRnVmeGic9i3Lre+XmEMUuuLCuWLQ
         b9sQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=amVxWQiy;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SE4SOOwQvH71szcrb9mqmd+B2bHhjS2l08ihkbMiSDo=;
        b=UIP1bcXyK0kK61sC9IJTL5X5SYoxvwh9n9Y/cjMd3kfL5xax780WRqkjW1TRzU6Qef
         ihvBvPQWYxaWciQk09hO9R9ycyKlkYz+5sIdP0NCkOWfnuLrqUZpWUlOSraKWOyR/33V
         mohtkUorIAditt99m51qW09KRBkmeuTEMeoO/WJZYo+OxfTMoq2tbEb+Ftw6AYHOzFkx
         0qpRsNWdI1KioAANRkpFk75fN3E5z6MgJvFDze4Smc501v9l9YcYKtbmoWPcAdqULQYa
         Kyrg33np3znbEDJ9HYsHeFPb/Dz+oLhUV8yr7NDGqcGZEyMawBjWkT/xWjiU5N6Q6Lqi
         e++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SE4SOOwQvH71szcrb9mqmd+B2bHhjS2l08ihkbMiSDo=;
        b=tk09NFpElALecr5GLGIaDSoNmYBsGM+wiaKzw4Unf2yQVRg7qh9TQKLb/LYllwk0B3
         zTBL1qEYK5lFgd35Pr+pAzvNjjUmRnkqzXWWOCfDMtGdSkAPsjuvUPHFlRPRcgwQgEjQ
         tNZyqilPO3QXoBzSKDk2n4KM5lxJnH7qLk3Oy5ZLDxTYhbYOH1ICCAOhJAO6k9aFP72E
         qb37XJt0HYVB65IUohQwbzsm0tfqxx4z9UgETas3bn7DLBQ3hoOjsdeC4FLxb1WuDUeM
         LPFmfrqdZ1R12UETwAzveACN8xi6vrh8oKanKKQuy1/imVSZvlDVSW9SLEHD/lrqtFtz
         bn9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuY/sX1j5F6b1cczu4vthbaGIOC9VRH7H7+TXwufwbPp3xKY5KsV
	ca5FNzHwkwbk/7lRzkvrCgM=
X-Google-Smtp-Source: APiQypKxjYdVZ+zuF0EGM2unxdE3+E5/XRBYcyzZDGymD60n19ZUvTsnv9fqx3mVMZWm/+epcJpP7w==
X-Received: by 2002:adf:f444:: with SMTP id f4mr5878728wrp.164.1585889027944;
        Thu, 02 Apr 2020 21:43:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:790e:: with SMTP id l14ls493713wme.3.gmail; Thu, 02 Apr
 2020 21:43:47 -0700 (PDT)
X-Received: by 2002:a1c:418b:: with SMTP id o133mr6892172wma.165.1585889027310;
        Thu, 02 Apr 2020 21:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585889027; cv=none;
        d=google.com; s=arc-20160816;
        b=Fqa3vjEGAh09lmV6lJbXot8vL2MuE3wx6vxaPYpJgO1jQMJ5tb/29NmwWSD5USBO5A
         1kbDPKW/o7eygs9yHVq59e/cB3HgX9eI8uXokEJe6v2SSlm0UPJnPJmVmXtPN8PSZPKW
         CSK0O7qvgY21FDIosdnR5pzHP3SHdCco4b79vntquz7/g/xmjYcRfFq+tQa6EJsqIHTN
         F5jbWB/OEoJZCUqrQFoc6gLba79Jmbu0g2fV3x1Ciym6I98HJIJRwI+GvKmyI7i7NynL
         qmBux/7V/Ylsur3Rxz/1BKwobYPPADAURjlkl2uyL6Z0qSQlFXTzzgOpMnpQHPYO4cJY
         pg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ipq2c3G7ppdAsODavNPmmSle4ufxxVflg13MU/vNz6s=;
        b=O3elnuVzWFxFxFbsi4I44cuoT5EnlZoQfCWuityYam7Xh+trDA44GGqVielIvzhxsw
         VWeSD4hPj3ZCFfbjjXEKZJE4eiktPV6MXVe7Oc5BaWZ0eVjrgwOCKUv70uNcbobT/7re
         IfIpjDa0UnNH2/wtKQaeJ0JXxZyQ6i1Xo3+h1FUiaojBdOLgAPNvUBpvGt54SiwBKGL4
         pi69RYjLLg6Ts0XHBEAgO9aVd8/dixY/5Qi83OSH8/x8U+KGV4XRj2gUh7+BKj9EGw9y
         szwyPYn3KeK370Q2kDz1t0wKxiMGgFy75Izi7Lg3BIq1+Muqs2Tjbrse55W8FmjElDcy
         wEbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=amVxWQiy;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id r8si201174wmh.2.2020.04.02.21.43.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 21:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LxO2c-1jHLdA128A-016zbB; Fri, 03
 Apr 2020 06:43:46 +0200
Subject: Re: about communication between root cell and inmate
To: Saroj Sapkota <samirroj2016@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <ec31e02a-64e6-46e3-872a-66f864e87146@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <9febe6ee-e2d1-fdfd-26e5-2a8e824642ab@web.de>
Date: Fri, 3 Apr 2020 06:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ec31e02a-64e6-46e3-872a-66f864e87146@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:L7GmvHf1yC3JXUaS9vhXXoZ8u8pCZqcztnysRhLW5oGIT0ICxyc
 d655c4HDfqEVh7l1+WevYcjmvzZ1a7pbLwf2gi+8GUWvSHh9oh8APTcvdxsWjdKnwM0BT3g
 C78P/h1CJmsCHu/EZZNkODxQC0/Q1RmZhwYraDpegHsko4Ma1CEIP/wkVIcWPAv4nc3s7gH
 r9wv54FkiWsE3Ka6uDr1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YBLtCkgcu/E=:PDmV/Ne6SoWDVieeNB8IYG
 6Tt6i0Tv7walQvEiZkfcnvWHuLwXVT90x/74FXz9cPw9X//f8LUPcjZT4WXXjhovg4b4BXJLJ
 +vZ9FJLjPJn/WKfA/lXUr4HebDrtkyf7+l/MZ9+4SQ/LZdTCAlKFbPSLxlVq+B5kPww64jhqM
 X7X38NoX67E0+YIncvR43h5gZZuXh9X0qUrbBgeLPCcVLEAy/NUiSBwP9y9d02V7uPxOny7S3
 gHYwRuOvI2k/OvOVyV/KE+lliXiKoy1Z1Kyi2YASRvIQ+RfF3jtXCFgnG9GPyrmTv7kRlbZUv
 XEwFk7r69hpVZsLtKSBtnzu3UHQDu8n+xSisTrnYOXN3XTCfQiRDjrRqNdQvi9qOly/E8AwZX
 Acgcs+APLqYiM1AaiMNNg+o9Z+sqEqRRWzeGsj/S0Yw8fwuv2tzjWVL3iswEjSp7MLwyH6qAr
 xeZOSF9O4OoT9jqsJHQuVjb24aDfnDT+T0MQeY9W/fq7I/sqg0+0ObMquz21+4hhKwr/Injf1
 RHfmKKkggPr6Q+KKsZ8YxiZmaOl44SwAm6RzK45K75jR3xiZLpQ2JDAKcgyheoIQ/nt7OkLn3
 cA/dFc4k7dUmgg9452YB+/5Ct5uYe3u58FFfq+uQdGcqJSghmpgHTFkYMKqDYGjrijFRO5Ky6
 WBiQJYYW1OWFN1gQXSgCTMCpgqc//zN5gg/oco+blm2TDCezIHcKAx/nvy2ZnTLDERAYvGtP7
 vKkCtBGUq71C9OtAKR224AZzGOON+bjPzw3cQC0r6iz99TZ3yGRXRnNFP1Nbb26q8+865Lj7Y
 DQBkGNII5ZsZDcA5b+n0IPA/SFYqAAheeyrBM1rS/VArdm26qw53wmrlhH0vWTUAAAgxhCDBL
 Iu4+Sq8cjXDLMNyRQhf0cRL97edQtWjMDU30jAM/2HytWLGboWAgIW3JQ1cxb0sADVsrBqay/
 gjfTr6rRWLKzqWH279QInokOXohl5sFhDXKY1w9B3vrxXIqIIDRceMdoHc/wDit0TF0cyf15V
 8mGQ3ViMk/HKJU1hqe3W7VO7JFuLX6tyJNOdE/U5A3Q3Vh7D/YjkX36CylcW0InJAbqZfAKzn
 rJax7BQKGocsXVvedcvtonZDo5axFmyxRwp/PmWtStJgYEMaiZryvP72JNmO6updVmMwrWkLx
 bFaeZB0GQZs8kAegyIpqrb6/8xtvuXZ51XUhyrpDDEQD8fAi+LTDg2iZ/Rvhl6vMLfsKFEgUR
 bx9+oHaUb2uXrjI4k
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=amVxWQiy;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 02.04.20 22:42, Saroj Sapkota wrote:
> I tried to run Inmate on jetson tx1 with given sample configuration
> (jetson-tx1-demo) and ivshmem-demo I get the following output only.
> MEM: shmem is at 0x000000017bd00000
> IVSHMEM: bar0 is at 0x0000000000000000001
> IVSHMEM: Hello from bare-metal ivshmem-demo inmate!!!
> IVSHMEM: Enabled IRQ:0xdb
> IVSHMEM: Enabling IVSHMEM_IRQs
> IVSHMEM: Done setting up...
> IVSHMEM: waiting for interrupts
> Why there is no interrupts coming or I how can I send interrupts from
> root cell to inmate and inmate to root cell?
> I have to send data from Inmate to rootcell, how can I do that?
> please help me on this.

Please use a recent Jailhouse version for this. It comes with IVSHMEM
version 2 and a completely rewritten ivshmem-demo. The jetson-tx1
configs are not enabled for that yet, but you can derive the pattern
from the qemu-arm64, e.g.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9febe6ee-e2d1-fdfd-26e5-2a8e824642ab%40web.de.
