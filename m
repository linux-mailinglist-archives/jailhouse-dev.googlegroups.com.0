Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBTPSU2CAMGQEBTXNT6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id A560F36DF95
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Apr 2021 21:36:45 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id 91-20020adf94640000b029010b019075afsf5992404wrq.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Apr 2021 12:36:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619638605; cv=pass;
        d=google.com; s=arc-20160816;
        b=b5W6cfWP92Y4gAKHsLnVeQcHrj+sj7xiFplAYy7GAHq3PiRXhTJSR28IhNI3nv/see
         JgFigc2lcd4s+Lxkvy4qLF6YzmpuzskPHaKaugXHdAtJs9l/hD0AGtq6l/b4SYpqGphx
         cevd7Am3BPXiZ/uEWK85ZxHK+voPMpmYsTFxtwX7XWdiZWzKn5vrnz+sjn4xNEo6OfGz
         OU5Ld6zu84slLgShgfuxyZx4e4tEJ4irbDIy2BxR2U1R5DF7nfL4s9l1fcV1nm/XDel0
         VJCAAbWirSBUPMQ11hqm2Vwfg0CxHHrpjJ9lQ+XP6fHKdihyqG3WyKMzxv4kLO+8LN6Q
         i2qQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=AK8ACeql9ybFWx6y2lEVTWPzSDtrLRlo2+96pIMefS0=;
        b=EJq1IoVg0fR2PC4FbzxTffwJkjb8ULz+fxJvkiLwBjr4WD2GmATJLYZhV8cC85iHB1
         Zkqy7k7CuR2mqItd3ZPcQ2BsGonp1FwLpq62gGEgc/Kj3TmPuNwq+/uDJ9/+yNl53E4G
         0r1g1xNauvw9lD1wxBqJ8O5Jt/YU/BZ9u8R38b2fXCjxWZy9hFdG6XKTlCx5VSs7wc3F
         gDc/bC4I2QgxL9R7sspO1zspX7Yllz29ZNDkl5ZeTnbhPwgO6K/EnlTwVsjZs/eOSDKJ
         ubzL2d1R6aI166sLo0G1p9vCkkx7X9uyu/WaWKqXTUzh8JaKoH+k42xIpP0zRE87024w
         709A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=iQKwmWi1;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AK8ACeql9ybFWx6y2lEVTWPzSDtrLRlo2+96pIMefS0=;
        b=Q5u+JWQaq5TwqglCJ9WR9QlU+j8mDpLFTf6Zr7/ykWR/RTPHS7ImYkwO5SHpJS0lWl
         wN0bsrhpjkiMMLAcxjPUZTHHbvyiA7NNJ/YykMZx/cEIqLfQku6nqDAWAiCl7Yvf8qiK
         jALhkatDa9t9Jj4TXnX4Cza8VVgg78cxrmcf2g7GL8kEGqL4M+9o7pyRztGYXFMF2m+X
         uUc2tAqxdGx9oJ5tG7gxKT3o/IXL3KiU4Pyw7twMZZUmJ2qndz49PxIjIxbIjlqf5wTf
         W98ypE2CcZUxVbEpnjptl/gD6C8+9S1CM4HHCO/jMcIcttSvmuM8ZE6Rkj6Q59m7R7hV
         rYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AK8ACeql9ybFWx6y2lEVTWPzSDtrLRlo2+96pIMefS0=;
        b=GP11GdO0zOgoScd6T9o3FCQx9ML1NpluXmHNUNh/GPPGUUsJa6VTuAs8A75t8qn/+P
         WOA4BrVcRWfeq72wQrTtFWEep5E4SoWHIhV2FvUvIvKaPBbIHtvLP/xv7o9wvgNOcFYJ
         KyQCTcNSgEDGRfqP4ZusXdHbiE/Cu31TFAYRofxWyMeiIlYZUJc1IGdFuxtB964MmUle
         PzJVACfRXrExMeLmuVmPNWhRMVMiU7y7vF+LOjhU2CFHVKcNlLslmPcr3y1NRfNuc2dC
         4mpE4xE5cHUwoN5H+sVcl4FxETZcafVFUdYd0iSLXR9HBzVsEHhOVDvzsdlOQwg++Itd
         /wYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533PW8XeZWHm+hjFHvSZdf1eotIRcAB1q7V3TLsvj9bjiiaoAMVT
	rz6f8qsM1fh5LdIqWeu+Rdo=
X-Google-Smtp-Source: ABdhPJwpBs19F03K9Ko/Sy2ZnsYlZWDv+AIzT69faeT+fLUirg6NOA4/H5fBicDsHiJBIErXI91Mrw==
X-Received: by 2002:adf:e552:: with SMTP id z18mr17066245wrm.226.1619638605382;
        Wed, 28 Apr 2021 12:36:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fb47:: with SMTP id c7ls678643wrs.0.gmail; Wed, 28 Apr
 2021 12:36:44 -0700 (PDT)
X-Received: by 2002:adf:cf0f:: with SMTP id o15mr11441367wrj.181.1619638604627;
        Wed, 28 Apr 2021 12:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619638604; cv=none;
        d=google.com; s=arc-20160816;
        b=FmcvuTTFvGuqoAcgTQH/55AgJMhwo610gHVbNvOS4XrHLWLjUic1f4lGe8rZQL+OfS
         PSKJKST/g8TnFotB8IlUwi/ND0Qdp7R0m9C2CNx5RKFRQo0nPVWK9MyodG09gPOAt5Zd
         YhFY/GOpdvE1AQeEJYIXjzpClyj/ltENd4qdym+kh0JginmO7bhzupsH+VLialM0grw/
         f74nIRAmYYdaQfytJICK3IuZ/U5CqEZM32MsdWz1joIZtBKnpTT305Hj9TxzMGQDYe92
         /Ti+RUuwLTGy89B8UjAXBUJ3uNtRSBQErXcukfuIemMKnzoWnMOv6zxSd6YpM1DSCMiW
         CntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=rEFd6bJG+gDGGnP+TCP84RkxZyOevuITmHgr+K1cvKE=;
        b=p74P8j2u01giqpISMHm8judY341Pee0W0Dbd0NFQPd1i9ijf98b9vL1aP4fX35hwOa
         YQKUpHMMcsHaohmSRE54rV2UarHg/1rxz/UUJn2UpECxQ+WovOGWo5/jRpliZnOQDpQg
         QtKYhLl9cncLoYEScRJxLkDTisNKev2eHrRWlSOPpRd8Hmxf29aDU7HgJkX44qrd1XRP
         564E0RBT4pGXe7K4gIARZnZbkox4HCoUJJj79E4bstqt/nw1kycpFF8aPfLNY3hNM74n
         UAZSRZbidtZQ4SttkzfepYpKz2ASl2Lq/b9JqmzIcAbOiloZ+9vGtN0xGZdKWCrwTfce
         3pVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=iQKwmWi1;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id p189si268721wmp.1.2021.04.28.12.36.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 12:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMGu2-1lvA3M2py2-00Jfjb; Wed, 28
 Apr 2021 21:36:38 +0200
Subject: Re: HELP about Jailhouse
To: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>,
 jailhouse-dev@googlegroups.com
References: <743a492d.2b32.179176b845e.Coremail.caohp19@lzu.edu.cn>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <fa16458f-8b1b-8a08-f3f9-82a37ead5389@web.de>
Date: Wed, 28 Apr 2021 21:36:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <743a492d.2b32.179176b845e.Coremail.caohp19@lzu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DIpGD9SivUM0rCp/YmBJqTlhUUB9PrHpS1R1TtIvznUFbrNusCV
 pZh+Vtlffk1FVjuea8+RGXc7bmu2/vxdhA7hBN1Yq6c1UFLAzfk1ZBCLm+kCvHjpxv4khLL
 OgWooGxAL4U5/SaIJ2FNGMkKcJSp3132LVJXNYX6n6gmku84vYFSGoFpji7C7fZ6GR5Jqxj
 4WkDR9j62+DwFWhrhbDBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z7ClToG8Boc=:N7olJogBeufpzSNiZi7gZM
 NeLIwJP7ej1H5rYwmud624Z+aM6joVJG0ddZMawynxoeccXRW67eWcL4ltsTpS0Khn0b3XrRB
 SWJi0nDju49qImfK1WwX5uuQS4HKKNurBHSmEscQ5tYzDTMKePmda2oPJY0BtkMyFOWkqgp6m
 oJgGUqv7PGruZnIIGSdY60/nrLl13wJS3Q2TmGYd0T3axtwSQYClOBJwgH2JaB5eT+YUhup9Y
 tYKFLYcotFchxwUoeHDM6cxWHnpDl6tqkNcB5yl4rZTIDuEOyKvdqx9zKA074udvZEFiTN4sV
 tpdRBB6ooKcziA5AURXQAbblDobZB3mJgMt7yNeFA+9/WVkkOT+Fsa9rwoBRon3TI41mCYv6P
 bsVBojlmU+D3XJLJn8JkGdT+zB5WlY74PYKYw2L/ocU4fw5HDIcqPfFMw/xyt/NrBO8/ZaUN7
 Xi6BNHFvlu/Ka7IWhmWHnP64G0QxvzWneBrqmN24ZjZ1CfA73imESwQYYWWQ50apDVb9h3miZ
 PkdIx61ipqvR0hIIYkPDX57vr7WwPvOwfAnx5rZc7NnohOcdbCcz1njetYW2pdj/6wzzreK9o
 /HyVULu/aS8joGjqHKDcgPrySpzfG1kQawx2PK2jz1ziJyw/5iXAt0lXQVtKFrnkWTCmoY1JE
 Pn4uY+vgvjhtaJi8JUMWoU2R7wgrnQboqtyItTv8wYpnPzkDT1woLYKlyfRdoz2TL8Uz1I9tq
 RbEWSWQGzuYTkcG/m1CDdgyZuYWki53vXHhKAJh1098n8/23YKGP54jXJj3YGqeGqBNhYmnXM
 V3pK0IBV7cOTjfjQISV2jhYjC6ssIySl9HNgD/EISvHAcSKJw4US77ufjdaqM2/WZfQfibJ8A
 fr3Biv+MBjAPCKEY2AlMNscHNS7VuZ9B22RyhdMyIOLdaxUmgZRYRyDVmlXELDdaMYFCYqg9U
 Z7pNmlxURkn/zu6wflyGY57+ormDDBgStuyLZsQiLUPZVEMMjBMixXWlhl52OO8MrxrMUEzCy
 owdHl5MOSORi8QQ/7QCClKbuvQ6sws+3A4xbivP6zVdvcADfXuq/9LxcJ4Voh1ktjrKkpnJN2
 rKRrCMSiHnXSqeeseENisF7wprXXnnz4AYl7nrhKTlor4DZ4xLwGNQiXjt+WKnN17RUuEuU8h
 PlNruyAmYwkJgKvwzayGvItAboqEl6pmBL8oJ2yAcVFgwn0lYcFATyNLVa2MG+sTwY7Gk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=iQKwmWi1;       spf=pass
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

On 28.04.21 09:39, =E6=9B=B9=E5=AE=8F=E9=B9=8F wrote:
> Dear sir,
> Last year, I used the rapi-linux-demo.cell to launch a second cell on my =
Raspberry Pi 4 model B. And the memory size of second cell was about 184M.
> However, that is not enough to me to execute some test on it. So I try to=
 change the size of the cell in the rpi-linux-demo.c, but it failed (maybe =
occupied
>  other's memory, I don't know). A good news is, someone fixed this proble=
m. The demo can provide 1G memory size=EF=BC=8C and I git clone the new pro=
ject.
>
> BUT when I executed the operations same with before, I can not build the =
jailhouse
>
> my operations is:
> 1. git clone https://github.com/siemens/jailhouse.git
> 2. sudo make &amp;&amp; make modules_install &amp;&amp; make install
> 3. sudo insmod driver/jailhouse.ko
> 4. sudo jailhouse enable configs/arm64/rpi4.cell
>
> The 4th step is failed, the error is:
> JAILHOUSE_ENABLE: Invalid argument
>
> I don't know why it occurs. Because there are two project on my Raspberry=
 (one is new, the other is cloned in last year ), the old one can run prope=
rly.
> If I can get your generous help, I will appreciate.
>

First thing to check if you modified the configs:

jailhouse config check configs/arm64/rpi4.cell

Also check if Jailhouse issues any error on the kernel console.

Then you may try setting CONFIG_TRACE_ERROR (see [1]) to get a pointer
to root of the problem - if it is found by the hypervisor.

Without seeing all your changes, it's hard to give more concrete
suggestions.

Jan

[1]
https://github.com/siemens/jailhouse/blob/master/Documentation/hypervisor-c=
onfiguration.md

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fa16458f-8b1b-8a08-f3f9-82a37ead5389%40web.de.
