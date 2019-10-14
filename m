Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ5YSLWQKGQELB3FL6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA5D66C3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:02:47 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id r21sf4479694wme.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:02:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571068967; cv=pass;
        d=google.com; s=arc-20160816;
        b=lr1MsXNmTxMQmYGaG7/rSKJh89NUIzDsg7M/5sVdGuE9lw5a4M3s1uQBFMp/M0DYEX
         T84sJdDt9GIJjGA9hv2W2pgaTOMhIUZQHveN0Agusf4+Kb199lnpky4PCe6ZGCf32db1
         7q0e2zHoIAxkt7SmK5pDX3eu+KwnGUxJxwaAxq959nxo4mYrt0+T6SQbrkACcihOc7zC
         5YP/rB1xY0h/fV4IjwClZXZfKAUr1PlzY/yK1WrOOpCrzcbK5KJBUIBn6S153gUtT+ff
         HPxdcCeAlikx14dTQ+8zPFDxKi3q+4R2L6yZflYnifdqYM8iG9jn2P/WnYTzWyCSD1A3
         YgMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=Jm9BTkmaga4daics3RupExyjqTDR/wtFvtGW/MZxUVU=;
        b=Cm/ORH0cZ6jfqGvfekki2pV3VZ3loLhLvgdm7yP+KSzBR/ligKxYhifchCFrVemLVI
         xcu5TYjOJm/5D63wFGtnhAIuRNRj9QFgyQmT8Oz5a+rAfcd66Yk4QXNCTQjcAhuqRkJu
         Hyf/F+MZwItzNYmEc6yCGer16AiPv7gMe3VHayGrPVowq6nA6Poya6f3bJvXNKAj7CcP
         PSIcEH2zhzTDEe67Hd6WsEOM3TlpUo3Yh2koEvED21tea+hEOoAmu24WGcsIKkyhYNzt
         gV1dk5Y4FoeIE6YahJOtZjO6b4JR1hVueynsAZgrhIk2vBfQk3MGEgeEGrNOwuexfkDe
         9gxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Jm9BTkmaga4daics3RupExyjqTDR/wtFvtGW/MZxUVU=;
        b=mssY/8mBCXmzONtdiDQFxSHUzQVzbkT4xjKSPRLJu6oeicK83M6m63AlzskkbXbHiY
         XMLd+Wykuhl8996iDkWG1yCigPSAZrA12U5vLym2HmL7uJt6djd97EWxXVk7BUwQAA9m
         s6jWFOiOH4CfquWcEi6r5fnzm/GS7oTgO3Tw/jXkyHUokFcYSELRbpC4SYavTd8g3hD4
         mGlqfgfSC5s5zAb/13/h75RzMVF+gZrJFRKSS2HzvB72KIAe7p0NLd/SCiW9pbukxApQ
         F22/e0r63irY7WbEKKsyRYIJl1OxTm9TI+iip1w+XqCbq81xWWeNWpz9aa/18xbtx7+Q
         C5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Jm9BTkmaga4daics3RupExyjqTDR/wtFvtGW/MZxUVU=;
        b=D0SPS+7QL6ilWRiw4KceMWYYFmYq18Xq/weByoAlkPGSoPQTE/negD4f+MMvMRcoum
         jX1tFy7hLB9Ge1BN/bz4QIkzTRW+d6lrtCN3bR7Pssy1DsUNrngf8d4wksnT4uYgF1rD
         x0hCUTtJjDB6uuX65jA1L78nPmDSX1Ayk88bF+xMW/bO0x8NLNBjJqXTXxytgxc7UK5u
         0NV0aEwx/t7qx4ZFzqDrasdjhQjsaSitvGVGw6fl1pFQid/i4xSNa8wNhTXj/3qtNKmM
         zX5LFLbxHCD1ykLT8Dpb+gVQdEcu59RG2szH2GIG//SigUC1A7VP5bww+YxhHck0OFrk
         GQqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWzq1hXOD8UYUHh1/KiI/9eZb9dTYD8K6mFCOKmraRG4rzg++f2
	8mDYfiiCr5CgAcShl95K+J8=
X-Google-Smtp-Source: APXvYqyp2lzxfLCv94LLjhMT/vmd/b+icitEY8P5fHwWlsNFKgvQoCfDUvkahQIxmniPJPPc33qhZg==
X-Received: by 2002:adf:df81:: with SMTP id z1mr27173767wrl.367.1571068967226;
        Mon, 14 Oct 2019 09:02:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9dc8:: with SMTP id g191ls6397944wme.2.gmail; Mon, 14
 Oct 2019 09:02:46 -0700 (PDT)
X-Received: by 2002:a7b:ca4e:: with SMTP id m14mr16206499wml.98.1571068966542;
        Mon, 14 Oct 2019 09:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571068966; cv=none;
        d=google.com; s=arc-20160816;
        b=DsRNGdH5fLG6fN+qeM9aZ45Kwr4E6bVjDXO9EFvJnuNGBLnAoRqZ7fG50qVC4OMIXw
         WFvQPtpCCSwuQbNMYYkb/p0wAn1LMusK5ex9w7D22LQuBExMTSfJ22KQwet3RMI/2pfL
         KyUnzRfwwklPGZx/HEMf/wnQr0D8bLQlsMNwlfhv39NdCModTcgbFR6LpeMeByQ4qdhG
         4jRhT3bT4sAKKNoVzqP2NhsEPGaASVKh/Sq0siVtEOBa5BcP77k4Ww6+wSnD8egsvyP+
         1bcTiFfSxFHxB9AwIYCTJhK+lqqBN63bso4vFre7d9e20jZbRRahF9QA9VNVjImSlsLi
         +N7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=p95Jc+rV6/BZQIqM+sJZBk/eaUrKKKZjBggbxqwquyE=;
        b=DBmrbQniL21i3pmZjK7HUZQc8BGl0WQqrnEhNTwfB5ESk88frLllY8GlAOHRz0eqy3
         3FMCXXbaQJnYVA36DPuvnx5n3zzamZpfSrZGDz4xEC7OYGpeBJlPA71PYLT6pM5isqQU
         OlimuQ9t6lvexFSo+3sAUIh1zct7jt5FreSI2zUfnyT5b3Bq46HjCpL0q3v2D639AVYW
         h+iiNNp2qD8gZ8qoV4BzzHFGh7IqHi6oTyT1zkMpskOTrgoc8e0yK9JB6z1OfBHaMRBq
         PvzxBc5q2PqD5/GsfJihwthkEc1MDc3lyufKb+5Lr4CZC6pBeUgPqT+Ggy+dHVB1qF6Q
         RAaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m1si595077wrs.0.2019.10.14.09.02.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x9EG2kKV017334
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2019 18:02:46 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9EG2k2k004636;
	Mon, 14 Oct 2019 18:02:46 +0200
Subject: Re: [EXTERNAL] Re: [PATCH 3/4] arm: am57xx: introduce support for TI
 am57xx SOC
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Vitaly Andrianov <vitalya@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
 <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
 <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
 <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
 <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
 <5a39b4c6-2738-95d9-352a-2a79669f1c96@siemens.com>
 <d2ecceeb-3da3-c86b-0deb-fe7deb9c2d62@ti.com>
 <e94f17f5-01da-00c1-a6ea-957de5d8bb63@siemens.com>
Message-ID: <fa5bfefa-d575-2e5d-8165-b7502b9e505b@siemens.com>
Date: Mon, 14 Oct 2019 18:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <e94f17f5-01da-00c1-a6ea-957de5d8bb63@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 14.10.19 18:01, Jan Kiszka wrote:
> On 14.10.19 16:31, Vitaly Andrianov wrote:
>> Jan and Ralf,
>>
>> A while back I tried unmodified hypervisor by just adding
>> am572x-evm.cell config.
>> Basically everything worked except cell destroy. I repeated this
>> experiment today.
>> When I issued the cell destroy command I got:
>>
>> root@am57xx-evm:~/jh# Closing cell "AM57XX-EVM-uart-demo"
>> Page pool usage after cell destruction: mem 49/4073, remap 5/131072
>> [=C2=A0 187.112795] CPU1: failed to come online
>> [=C2=A0 187.118622] Jailhouse: failed to bring CPU 1 back online
>> [=C2=A0 187.124806] Destroyed Jailhouse cell "AM57XX-EVM-uart-demo"
>>
>> After that Linux is running on ARM0 core only. Basically I can create
>> another cell for gic-demo.bin, I can run it and shutdown. I cannot just
>> destroy the cell with getting ARM1 running Linux again.
>=20
> Yeah, this is a familiar pattern when things go wrong during cpu-hotplug.
>=20
>>
>> As far as I know when we issue cpu_down() the CPU is calling WFI
>> instruction (Linux kernel page) and waiting for event. When we create a
>> cell the hypervisor switches the page and runs the ARM1 at the same WFI
>> loop at virtual address 0x0. I guess when we destroy the cell,
>> hypervisor shall return ARM1 kernel page and cpu_up() should continue
>> from that point.
>=20
> Yes, basically save-restore of the CPU state, at least /wrt its relevant
> parts.
>=20
>>
>> When I was debugging this issue that time, I saw then after destroy the
>> ARM1 remained executing WFI and hypervisor page. I didn't know why was
>> that, and adding AM57XX unit helped to solve this issue.
>> But may be that is just a hack and you have a idea how to solve the
>> "destroy" issue w/o introducing the AM57XX unit.
>=20
> Well, the code you added, just like my original version, emulated that
> save-restore in so far that it pulls the resume address that Linux was
> likely using during bootup from OMAP_AUX_CORE_BOOT_1, applies that, and
> immediately lets Linux run again. Hopefully, but that needs validation,
> this will cause Linux to directly enter WFI again until cpu_up sends the
> wakeup interrupt.
>=20
> The fragility of this comes from reading OMAP_AUX_CORE_BOOT_1, rather
> than actually saving the state when we take the CPU from the root cell
> and restoring it when we return it.

BTW, that pattern could actually become useful beyond that AM57xx: The
RPi4 has a similar limitation (no PSCI) and will need such a soft
cpu_down as well in order to support Jailhouse one day.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fa5bfefa-d575-2e5d-8165-b7502b9e505b%40siemens.com.
