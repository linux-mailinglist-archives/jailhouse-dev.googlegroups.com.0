Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOV6QSAQMGQEJ6BAJVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E93130A7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Feb 2021 12:23:38 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id m7sf12923844wro.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Feb 2021 03:23:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612783418; cv=pass;
        d=google.com; s=arc-20160816;
        b=tjGYBVfnCus6PeTanZSNkTnKbwfyWk5TkMLnAMqd1RGmhY/1Ew5AN5ePSrE29D9i9o
         h0gQVDwLrkTvHcUcXRLAxEdl3t6TIbXD4E83LFFiJPaFpQsmJtaZ5hbpfFFZGLKD2Odx
         hBDG56cdfaBvw1xJhzmJ5fpGV875w6qA5ynSmh2G0eH41XHHeVs0rmwoSDfND6pRCnSL
         qWxB82aldO2bqHEheDXNiAA528Q1yTeqfB6kCIF30wwbus4dJIzqSd7GbpXwjRRWtzQs
         IdzEvE6aaOpoq03dLBitn5uBYks+DaAViRaFhhU+gzH/dsgDT72CiHuUO2kIr1DKwt6f
         uFBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Ny4GZY38xrhTiWffJcDWXm8cdbjQtSCK5uNsX1VVZgI=;
        b=Z7HZ1voZglQll8XhHol/FszChy3ESx+2fUBnrzE4zCzvpD5VMdfZIl5ar08FKpxVFc
         JQ7l7uiG+ecNlnukYg5gI1qQAmp7zpiU1qfMxVA2TgE9pEophsSZ2GqkQn7UsSTlTJzK
         nF5yhJJJFbRWoSPRSz4iy3KUocgBtbg+SFPQaEkB2ktNfv2SwYFSbQ8yDM0tb5Dcn4wv
         w0w+ck+K1rKaSs7yXBT+PMjWsDXkuiF/Gf6t566q/nQH6SZNYHFHiVIm5J9HIIliq+iR
         l0VGCLktmC3xeul+2rfDo6nmxBNDomMyq4wDqZJVLVjTJFqnRRvvg9r/l7un0NyJtsg3
         45qQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ny4GZY38xrhTiWffJcDWXm8cdbjQtSCK5uNsX1VVZgI=;
        b=qTwiD87S96pTQMZQoGy4AW3nYqgwcvbrNIfgVXGQSjpwVhKCUnKYwelbBIQ/6kNsiD
         lwjssWU777KuBeXhgRLnpIKNtYxmuX1rOtKPdCxKqWcE31rqaZ7lRC5ojnp4x3kUZ8KA
         ARQYS40ju5PWkFGrH+PTiEPv8xCbrFdcbeiGwDClFH7nEH05bhD6QhVi/f+3LhURrzpw
         Jo7cLmaS+iYDbUaeHnRKlHA3Nic8fPILaeOYYl/G61/J5Ux4tofCa3I6Itp+TCW1CC/s
         76meelnVIxFdUgyle7btnq1xCCUoGyn/8Jd80ULBE4x+JCZ5OOYo4J+BTuAItBt2i/ty
         6W7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ny4GZY38xrhTiWffJcDWXm8cdbjQtSCK5uNsX1VVZgI=;
        b=FxMlgOU3UFaKbpMENmrK3cZEfDMwv77WwaPpaxyun7+BVWN2DnWFNZoJH5ayaOKIk3
         ZQM9mLukm3XcX0Id5pmuN1RMes4Iw/AQQ6qhN3znzHPuHHB4Jrf9knNpQEEuaLbf3GcP
         FRm0XC4sQUevdbPWzSd3+6oRG88kYEKLlSrT7IhoxNQ2pzzRyaI5sfKOejJVhb30e5OE
         gZh6rVTSH2Zl5ilfzwIs1V+sBhMMJsNSHm6unyEoE+Zy4uVQLk+I5+8Fei220WNmQtSQ
         ZiRIhUikhCM/wI1Z397u7VkEuIJpyDUZ92ObQqxqrb4kB3gUtjKlY+So+oh1h/ASqnS1
         0xKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530KCnQgJCJuWIFy7/+xItrAS5NksePIgEjFBzRQt/Awns/5VZGB
	4gKNX1I9TnzGThPomIr98lU=
X-Google-Smtp-Source: ABdhPJzpjbgvt0Ll+qgsRZrWwlrgWas8XwZqaTn8EQM0YSMcZzzx+KBnAj1V4LUzT9d+cB3Rz1sFRA==
X-Received: by 2002:a1c:7507:: with SMTP id o7mr14524140wmc.165.1612783418315;
        Mon, 08 Feb 2021 03:23:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:385:: with SMTP id 127ls7162016wmd.0.canary-gmail; Mon,
 08 Feb 2021 03:23:37 -0800 (PST)
X-Received: by 2002:a1c:9648:: with SMTP id y69mr13974296wmd.40.1612783417293;
        Mon, 08 Feb 2021 03:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612783417; cv=none;
        d=google.com; s=arc-20160816;
        b=1Eu0SOm+AvjqPk91KgGYT0uPpTDX/2R29x0dE16bhIxG6JtSSU3l+2KYsk9sh9SAh8
         wbWCUOOTgGrKTVzuKDVlj3kZDtJuqEcUWEDrSrFOZxbqjjvHycYAxRzzPz82Q5pjRq0e
         31Lk62cYX+8252axrhSGdl4pgDWxlUFv73EwbkHY0Jw1gh9oP7nUyKkmgL36mjPXO2/2
         eCocVG9Pgdsz1e9E+QFZxem9UK0cuhgMU+Rd0X0w4qgZbTA3wKCkyGEuLPzIwzFWkJy1
         8dxz9tZgGa988Ypx0JN1delRA1wJbYt+cFa+VU/iYwojHwVML8Ny4u7mzkLHv+XrWhJY
         c3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3iOJSvP63t3IaMImQdTeX4Kp50R200a7fC98RnA9LMw=;
        b=JPyQRny1/kLR9nlg0Zm1qXeH4jD/Ensa3OphBf1cao1vygv1+UgtvP9ZzDeHy481YL
         Io+nuAIxH7cnuk/4LyU6vy0HrcWoOz/hB1ealVqOQLAMNUaS2h3hAa2azaDYY/aSl64D
         0Mv8vsrDTYrCp96USBEAMqiYhO99qH5Eap7vEwsVp64VM1GhZVJMeFTTkPpmjA2I1k1m
         wQQyHk1/dQ8ZtCHks0HIYJ2PS9F/mD1tIrwXq7iCrVcPPisxKtj8p+APoq4W+42wLR8i
         029Qj4StBvt1n2ITahjIP7/wIE/YCO4bkzKE/E5YvHJvIjwwtjESE1lww5ZE1wyEfInv
         4BYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z16si216797wml.1.2021.02.08.03.23.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Feb 2021 03:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 118BNaeT016492
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Feb 2021 12:23:36 +0100
Received: from [139.22.33.193] ([139.22.33.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 118BNZ1D014790;
	Mon, 8 Feb 2021 12:23:35 +0100
Subject: Re: Overflow in MMIO registration
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <290f756e-4a93-46f8-0eb6-a15206bdc1d7@siemens.com>
Date: Mon, 8 Feb 2021 12:23:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 08.02.21 10:38, Sainz Markel wrote:
> Hi all,
>=20
> =C2=A0
>=20
> I=E2=80=99m trying to create a setup in which every core is isolated (6 i=
solated
> cores). To this end, I=E2=80=99ve created 6 .cell files based on the apic=
-demo
> example. Each .cell file reserves a single core and a memory region. The
> RAM memory region has been assigned by dividing the biggest memory
> region available in sysconfig.cell into 6 same size parts. Each of the
> parts is assigned to a .cell file. The PIO regions have been left
> unaltered as in apic-demo. I am struggling with two problems when trying
> to start Jailhouse with our reqs.
>=20
> =C2=A0
>=20
> *The initialization of Jailhouse env is done correctly with*
>=20
> /jailhouse enable sysconfig.cell/
>=20
> /=C2=A0/
>=20
> *The first issue comes when trying to reserve core 0, which seems to be
> reserved for the Rootcell*
>=20
> /jailhouse cell create core0-cell.cell/
>=20
> *This command throws a */JAILHOUSE_CELL_CREATE: Invalid argument/*error*
>=20

Linux does not permit offlining CPU0 (boot cpu) by default unless
explicitly told to (cpu0_hotplug or CONFIG_BOOTPARAM_HOTPLUG_CPU0).

> =C2=A0
>=20
> *Same thing happens if I try to load an app into the Rootcell by*
>=20
> /jailhouse cell load Rootcell /path/to/inmates/apic-demo.bin/
>=20
> *In this case the error is */JAILHOUSE_CELL_LOAD: Invalid argument**/
>=20
> /=C2=A0/
>=20

The root cell cannot be replaced with a different application. That's an
architectural property of Jailhouse.

> *The other issue happens when trying to assign a .bin file to any cell
> (for example in cell1)*
>=20
> *The creation of the other cells (cores 1-5) works correctly:*
>=20
> /jailhouse cell create core1-cell.cell/
>=20
> /jailhouse cell create core2-cell.cell/
>=20
> /jailhouse cell create core3-cell.cell/
>=20
> /jailhouse cell create core4-cell.cell/
>=20
> /jailhouse cell create core5-cell.cell/
>=20
> /=C2=A0/
>=20
> *I=E2=80=99ve created a file (core1-app.c) which is a clone of apic-demo.=
c and
> compiled it with the Makefile in inmates. When trying to load it*
>=20

Hope you do not let all cells use the same UART console in this
duplication (PIO 0x3f8 etc.).

> /jailhouse cell load core1-cell /path/to/inmates/core1-app.bin/
>=20
> *the result is*
>=20
> /WARNING: Overflow during MMIO region registration!/
>=20

Something may have caused a subpage MMIO region to be created
(page-unaligned memory region). If that region split-up didn't exist in
the root cell already, things will fail. But I suspect that subpage is
rather a symptom, not the cause.

Where there any compiler warnings when building the config? I would also
recommend checking our configs via "jailhouse config check root.cell
cell1.cell cell2.cell ...". Or share what you created.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/290f756e-4a93-46f8-0eb6-a15206bdc1d7%40siemens.com.
