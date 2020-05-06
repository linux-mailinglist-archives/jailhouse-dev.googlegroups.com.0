Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHPKZH2QKGQEEFXOM3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FD11C6BB0
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 10:28:14 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id n127sf420526wme.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 01:28:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588753693; cv=pass;
        d=google.com; s=arc-20160816;
        b=QrwSlLKdqYiRdmf0IzvW18EOR5fdgSOC7cg/rxWsbTGu6ldUeZqBKcDe6kZQPF3sn8
         dgOGaFdzmIHHIaw/ONWNgpKUzc9UMtKBiGU0WwJjubudgNUWqbRpA6c8N+vjdUComk1R
         AxJWcGD2nXyk2V9x1EraM94tkWwnBEooxMQK16nZCKr8Le+eSRwFeQpBhqPQ6K6Njy2I
         IsbuYmixbp/UEM3/A1NnA01dG7PxihGWx0jtW8ejXJD2WKO+5aWVqwgFWwHiGSSITTTg
         QWqQMGfrdZec2v/9Cpm41kU0wv0Lj1sRqKWnLtEMQ7OrUollDbKww7vg0RROKCkSpXNF
         4VOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=2doOTq4Et7nmRIiM4xWGPhufPJEGXINYuOsMGdPAH7o=;
        b=dqHXYf6X12ZOCxRzd4kH/On+59TEy5Jvxk5qIBe/Oc5x6XdgAtzsrieuvgaAJ2aV8s
         +EqBcvnAz7olwinqw/h7rwxd+YK6LkBSrhp2oWUgCxIf2HmrFT/ptrARSLZTuYv73Usf
         m+eYAoOg7kc0f15hAL2WS+gIWWundXQrI11yfqH6ukjF7cLzuKcuA/uuf+qq5Ej1a/B0
         YML0CgCCa4mW46qGxyPReGdfTd/R50dBy+NDq8AADHDJ2gfTwXzLQ6geqeNN8ILLqcQk
         BFWlCkG6P6d6GPf8KQKRZSll+wTncDhqjLbFp0FpdhO/Zeysm5t3lU7kKJp9zRspOFdJ
         Bv9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2doOTq4Et7nmRIiM4xWGPhufPJEGXINYuOsMGdPAH7o=;
        b=HSGT66NSISe9nM4hZAF5UENMmd1knXuwqf8u+SyXJE5iKrnCd+BF2n3eTjuKwJ2zLo
         9LrncC3azGMwI/LkYGxnEurITlmmoAx+/Nnr5zBu5QHNP8x7qy4tqvpSX8stxTcr+gyr
         kSPSYoYL5bKKTISsRFPGUE7kSL95Tlkavk5K2F/5xAjebvUYk2hVgRBdSHN0uumo7bt2
         h3rfzreng+Gd5HfStBHDLE5xQEjZyLt6Jf02NL0CMYW8bUNHDu5xtXibwtavzM4QxA4C
         nzlDAEzKd71q0p8kAgwn374PRjmzutjGwy7/uiZqgDF0hY1egqGUsz8rMSqMOZshf5bY
         429Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2doOTq4Et7nmRIiM4xWGPhufPJEGXINYuOsMGdPAH7o=;
        b=Bz8DX/egSoBGSRXa23DL13wgozijpPX5g7rXVGt49o6KeD4TG2yJ3zVjXfh63LOpPV
         MxayxOybgb9oqLfCQXOCV9bx3hYliWgTIym/fdIjLX7/vKHoQRsLr1y2QjURC8UMEFYH
         dvB6pAR5IxxQzZPhgV39+K0hrxH9cPm3bggqYBtdZdVIPojxlR9BEIyW6EPKmiuh3+Xh
         8/wgf95uESQd2t1JAf3egYh77ZVnBWSL63EVbd36yTQnWu0k2AxoYkcqeweb2me9k/gG
         pc4ZQTHVyVHyC8T6K/gPUHU5zW0C0V+7gtcLJ9hK78tZkb4FpTyn35UQkLkuq/AxC3co
         H5IQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZi7FBj274WxWQ5orwYuGfwKRMVlgil2mW0UAyu1qyOoFZZFPhE
	CcBQNZ2VTalsCRjdN0F6gII=
X-Google-Smtp-Source: APiQypK1sjBggLymbVE+vLXtXbVWbSsMZO+T7b6KBB5a5A7C1gf/F1nlpj2NUoT02cl0MSCzsCFeWw==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr3287641wmj.21.1588753693724;
        Wed, 06 May 2020 01:28:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7d12:: with SMTP id y18ls2529838wmc.2.gmail; Wed, 06 May
 2020 01:28:13 -0700 (PDT)
X-Received: by 2002:a1c:1d84:: with SMTP id d126mr3044200wmd.119.1588753693000;
        Wed, 06 May 2020 01:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588753692; cv=none;
        d=google.com; s=arc-20160816;
        b=O1VnMplXDrGFStr4e8KPiFoCxEJoaZOnZfZ2HzNZHkAFGWQlS/RyjdV4pW8i5MPgJn
         5MV5Z4l/l/fCDrhdsOENZIRR3btTVDydTOja3pnhXazIPlUGSk9EbHcxakgezyybOKYp
         /0DsYAcIhEdal/4uKu831Hjw58PYiaVbm10xgtXBTl2BzE2DZW+0GS+0D8zKQtfkeoSB
         QeE1Zpx9FdMRT/dO4P+BHlimQ/RQMrDpNadlPis20IaAZzTYDr3xtqGwHpcSJgcqeSBd
         iX1B9O6yTSDwJ9GpBcLUm6mgXKUM0D/fM5yU4WvXcIFa0t3se5M9LWnrNDHvSnjRiBAd
         yFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=4GnjxAE98ER7zxZ38KjHvRz3LJa2H9aGVo/zajjrH2k=;
        b=0awkPnPwXA8tNltCr3xBCWGdH3AHwRdyHNBAZ8CP0/vnemOakUZV4N67UqANlzqkK9
         72yRWsmrYdhyJ0owJgbwa9aALfZ6mDzFBdiKt84PTATEFrREL342nqS48Yw9nzH3z3UJ
         ujvvvnPjOsKzZbEtCksM44OPCdmQzfzR4FQRts4sNBvSC5/GpLtLQxllFzFDMSRR6vkM
         4vdGaaU5fIGpJTT+qGgLAoBg+ojZgxnElI2jqsbK9lD54RdIhYNrrDH8Q3f+kOGvlxOj
         YjPW00q181ZhfuR7OReImEQHNDH8ejHZfAhB6EK69OJeIopqMQbfvkMj5ny1a4zbOqSX
         Djuw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m4si68659wrn.5.2020.05.06.01.28.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 01:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0468SC4D018864
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 May 2020 10:28:12 +0200
Received: from [167.87.74.79] ([167.87.74.79])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0468SBCE010867;
	Wed, 6 May 2020 10:28:12 +0200
Subject: Re: Macchiatobin enable help
To: =?UTF-8?Q?Fran=c3=a7ois_Ozog?= <francois.ozog@linaro.org>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <CAHFG_=U==gEqKJWV0_Na5eap5zUpwp3beU0A-7-+wY1q-0LFJw@mail.gmail.com>
 <5de9a7f5-20c5-56eb-9052-999060d60990@siemens.com>
 <CAHFG_=V8wf0zMUk5VZHYbAReARFCoJ6m_1kcCDNxkp7-01Vukw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0a169484-296c-9ab5-4ce1-855752fad392@siemens.com>
Date: Wed, 6 May 2020 10:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHFG_=V8wf0zMUk5VZHYbAReARFCoJ6m_1kcCDNxkp7-01Vukw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 06.05.20 10:23, Fran=C3=A7ois Ozog wrote:
> Thanks Jan,
>=20
> actually mem=3D3840M is the only thing required to get the demo running.
> device tree and CMA=3D32M reservations do not bring anything visible.
> I haven't fully investigated but I'll do.

Maybe also that hint in the config was blindly copy&pasted from another=20
one - wouldn't be the first time. Sorry in that case.

Jan

>=20
> FF
>=20
> On Wed, 6 May 2020 at 07:05, Jan Kiszka <jan.kiszka@siemens.com=20
> <mailto:jan.kiszka@siemens.com>> wrote:
>=20
>     On 05.05.20 19:42, Fran=C3=A7ois Ozog wrote:
>      > Hi
>      >
>      > Trying to revive memories to play with Jailhouse on a Macchiatobin=
.
>      >
>      > I've got my FDT reservation as described in
>     configs/arm64/macchiatobin.c:
>      > 100000000-13fffffff : System RAM
>      >=C2=A0 =C2=A0 139800000-13effffff : reserved
>      >=C2=A0 =C2=A0 13f2e3000-13f342fff : reserved
>      >=C2=A0 =C2=A0 13f343000-13f743fff : reserved
>      >=C2=A0 =C2=A0 13f744000-13f7c3fff : reserved
>      >=C2=A0 =C2=A0 13f7c6000-13f7c7fff : reserved
>      >=C2=A0 =C2=A0 13f7c8000-13f7c8fff : reserved
>      >=C2=A0 =C2=A0 13f7c9000-13f7cffff : reserved
>      >=C2=A0 =C2=A0 13f7d0000-13f7d0fff : reserved
>      >=C2=A0 =C2=A0 13f7d1000-13f7d1fff : reserved
>      >=C2=A0 =C2=A0 13f7d2000-13fffffff : reserved
>      > 800000000-83fffffff : reserved
>      >
>      > When I launch:
>      > sudo tools/jailhouse enable configs/arm64/macchiatobin.cell
>      >
>      > The module says:
>      > jailhouse: request_mem_region failed for hypervisor memory.
>      > jailhouse: Did you reserve the memory with "memmap=3D" or "mem=3D"=
?
>      >
>      > hypervisor is at 0x13fc00000 as per the config which seems fine.
>      > The reserved memory as per the config does not exist as it is beyo=
nd
>      > physical RAM. I moved it at 2G (80000000-83ffffff) but still the s=
ame
>      > thing.
>      >
>      > That's certainly an obvious issue but.... if you could help me...
>      >
>=20
>     I don't have that board in reach to check how reservation looks like =
in
>     the good case, but you can get an image that is supposed to work from
>     jailhouse-images. Or pick up patterns from there, like the reservatio=
n
>     via "mem=3D3840M" [1]. Maybe start you system with that setting and
>     compare the reservations.
>=20
>     Jan
>=20
>     [1]
>     https://github.com/siemens/jailhouse-images/blob/master/wic/macchiato=
bin.wks
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
>=20
>=20
> --=20
> =09
> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | /Director Linaro Edge & Fog Compu=
ting Group/
> T: +33.67221.6485
> francois.ozog@linaro.org <mailto:francois.ozog@linaro.org> |=C2=A0Skype:=
=C2=A0ffozog
>=20
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0a169484-296c-9ab5-4ce1-855752fad392%40siemens.com.
