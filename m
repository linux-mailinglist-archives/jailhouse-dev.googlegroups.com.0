Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBLEO3SOQMGQE3O4K7XQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F39B65F27D
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Jan 2023 18:21:49 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id s20-20020adfa294000000b002b81849101esf160870wra.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Jan 2023 09:21:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672939309; cv=pass;
        d=google.com; s=arc-20160816;
        b=oD9XGKPNxjepB2B1xCHt+vKbUnm2gUd+VfOgNMmlSidOhPte4aeCY+4JKuSfprV7H+
         +v1R22s7hH+/mJPNbhAgZKR2J0gMhD/SK5MiEWYTwQGfkXMu8WXcOflH7VT5seq+ffmP
         +TTmgNzN/h5qyeJvCz6KLM9uvSoWLgJ4ERjaUM4K1CyA6La3+Wr417Bv6lE6Vzb+c7ma
         CB/UlhAvl9uT33UnOM0NqD6+PC2G3nCMAZr0Z/b1INl29sMMiDrOyuRpmu+WLPvsgE43
         LQr6xWPlJbYNMIDN2HSzg5fwi/PJKeCBtw3czJW0rXfk+NTvixYh9M7YoW7xEvtMtRWt
         fmfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=swdmrNF2qTqaPz5NqU7Ung8cElhRkLwMCRumiiGV8Ls=;
        b=kmdXpCQf6LZLRDWGwO+dba4B5zAgeDNTQMcJkGUkfxDlOFymiT5CCpsuOjQSDQGmoU
         T9ukDHQidsGifeBYkcapWH+dh+7652Ja4jWvFg31o4006W2CmtBTYTQBfzl6wVllkWTK
         qmMe6AO3NBdPpxLe++jV9G6P3esuJ71WorMj0nHsP0PIwQj1lS94/LuwOPYJNyazykUn
         E98iLd4Yr/aozUZthLtD7zFH/gClXkVljmpWEIk5WY9mIJObHadNUc9pDk09CHhJiPnx
         BdzpWzzklEG8SZjjMpOojVe4cLlrtrSgCuXNA7H1XiUvO7DmlZbju1v76WP7e4NC8WTJ
         +2jA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=InvA1O3u;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::332 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swdmrNF2qTqaPz5NqU7Ung8cElhRkLwMCRumiiGV8Ls=;
        b=SmWFaKA2BvKWEn4Vvu5e8bxtMqO/esQSp5Qt1ezHJXp5p1via5sGq1x5LoYTUFGpaf
         B9BELMmJkaB0ux73SVh1E8jwzVlx6PNjb0n6NctBkE0QC1doFaPWq0unzbC4py1DgxW3
         vLVOmBh2iUVakKsi/H64nlHmAzdlMe0zerh6C1F+FTB1R9JE0CwrA4eKrrIX0k+0tC/n
         SDv48/WxerZLvIi4L5HOx+FeDK67xzkH855jUbrkjajGsKayOdF9ylTPPQBc678Z3z7y
         XGLuXpRSkccEx6D0j5FMycSFjn15r2RqkFiHTv2wq8cwe5+tq2CoWQoSIppiuOp0eZuE
         7wYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=swdmrNF2qTqaPz5NqU7Ung8cElhRkLwMCRumiiGV8Ls=;
        b=Ls0N5zxxv7MA+5pPjvIXgeUoTI2mjgOlSLfOgxrkhEGWEizMwFxytm7QKnGoqvp0Js
         yNgad2kqYnV74U1rn9A1FEk/0vijAimK4RY3JiWW6MsqcAdJWOcffNVf1Mj0cfpTSGMw
         dMJ4obWNPQZuiti4hToESnqmiU4mTbx+8uvUefmhz0bba6/2Xc1kYezf3XDegHuBpUa4
         xYfLJcdgRKhc/DdMopHs0zGjpzSqECG2RbGW72qf2TzYvS0YgMAKtDxpbcPM6WFZKoHq
         SYA5QqiZOpg1ME2O7E/GnNxNnLb63/jtmC53noNESHvgiMirPzTN2fVaMhhC+nt76v0C
         BHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swdmrNF2qTqaPz5NqU7Ung8cElhRkLwMCRumiiGV8Ls=;
        b=AOdKE8BGBVLdzhZRpSzCau+NWa97LZm9I1wf5NcWBA14h3K5UJDWGs9IWzAEs8Ya6p
         bLc0ehr8B1yRNxl31FPqFfHufpy1hUKdqybHmQfTrji/NIagA2jrB58S7wAMPl64QqDE
         Bk0URdoJ3lvFSr1/3xp3WUuc2zcERcEmXnm+K1xsObgOFGsBpqKKB+C6mL7JBZdgexBV
         1ziGxy2ypmTnZMJSDwwuqdAJmzj1IIO4t/hxqrxzw2qRrxIL2OS4onscDQCZJaX0/64X
         FOamb6Xnn46OHnOa6jBs5DA4+033W4BP9oGE5+UnUGoIEy8SKCsCggS+ND0lO+n5vGlI
         VVzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqraK5fv0woXuP7JGNyhocMW2AnP9O29yF3IQbWoS6Kaj62pJv9
	R+Ds3+EnEpnaCPYNNYHC3C0=
X-Google-Smtp-Source: AMrXdXvN9iYvs15vHDHqIqrZrTSa5JewTDEQVk6w3s7CfIuOLCk2s7VKBAR4ZkCGgEKKhIyNW4d0rw==
X-Received: by 2002:a05:600c:3b1f:b0:3d3:3b5b:14ba with SMTP id m31-20020a05600c3b1f00b003d33b5b14bamr2031017wms.109.1672939308976;
        Thu, 05 Jan 2023 09:21:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c9f:b0:3cf:72dc:df8 with SMTP id
 k31-20020a05600c1c9f00b003cf72dc0df8ls20888342wms.0.-pod-canary-gmail; Thu,
 05 Jan 2023 09:21:47 -0800 (PST)
X-Received: by 2002:a05:600c:35c7:b0:3d3:5d0f:6dfc with SMTP id r7-20020a05600c35c700b003d35d0f6dfcmr36385859wmq.30.1672939307699;
        Thu, 05 Jan 2023 09:21:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672939307; cv=none;
        d=google.com; s=arc-20160816;
        b=WJrzei5EijN/4lgzWko0ZGAgw/ryvp3/vK2UnicsHcYL5jHX8dzmY/f+QCjKPnXhau
         JdJSdmFXrQFPgzu1LcaFu9vOu1IQGYb2tAYxrc1H42YTeifO5L9V3V1PlCH+Mkjmy+IA
         yKZrimySgKbXxGVGY9EueJW1m0ZA1xMT4h4uXWjTlpOEhiROPdDi0H6nPOrXN4fkazdv
         3h09CCqPLqGVvF6qjYjyhAy6xXz71nNCRJKCBaPJ1z9IkP017/kXjJYPk6RafjDqwsTJ
         xCHJdbmO1BIksslN8n0v5Gq0BU3Z+bcNl5gFQfSrTXLMMg/nFRkFoPFCwPsWAcHokSGj
         laXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5cWrI896dXHaQY8KMMTz/2PaffjyOa0mbFFiiyrMdME=;
        b=IrEFcJy9/BsqJhbmJupWzMHpBPpifpWk+69nCetfDvhPm6eoKWBqwSRuaU/5igXIVW
         RuC0AZJzdRoZjw9l/S4Bi+j5/9zq8pBaGfN7wNcSPznIOMUDdTHBIGJkQLp8Mtfy45iS
         TOXV6C72OkEsyA46Y/UONYZwhyabxLJOVDL1+uXOwkpDTsY4GUxphZn+cf34DSX8yxgu
         BnfFYV4Tdir9olponDbmPL8y0qYQLrmv2BxzvkEst/VI8BnO2GK27i6cJSvzCAXmRIJg
         +nJWCqJ25ZVg0pJsbS3FG615zwupefvOgGrHwQ6qUdLTB1wwA6oXOq2Fla3eesxn6M1F
         JPpw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=InvA1O3u;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::332 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com. [2a00:1450:4864:20::332])
        by gmr-mx.google.com with ESMTPS id z5-20020a1c4c05000000b003cf1536d24dsi136822wmf.0.2023.01.05.09.21.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:21:47 -0800 (PST)
Received-SPF: pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::332 as permitted sender) client-ip=2a00:1450:4864:20::332;
Received: by mail-wm1-x332.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso1861741wmp.3
        for <jailhouse-dev@googlegroups.com>; Thu, 05 Jan 2023 09:21:47 -0800 (PST)
X-Received: by 2002:a05:600c:1d10:b0:3d8:8a0c:7016 with SMTP id
 l16-20020a05600c1d1000b003d88a0c7016mr2598386wms.97.1672939307306; Thu, 05
 Jan 2023 09:21:47 -0800 (PST)
MIME-Version: 1.0
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com> <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com> <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
 <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com> <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
In-Reply-To: <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
From: Tommi Parkkila <tommi.parkkila@gmail.com>
Date: Thu, 5 Jan 2023 12:21:36 -0500
Message-ID: <CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg@mail.gmail.com>
Subject: Re: STM32MP1 hangs on when entering hypervisor
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="00000000000024914e05f18789af"
X-Original-Sender: Tommi.Parkkila@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=InvA1O3u;       spf=pass
 (google.com: domain of tommi.parkkila@gmail.com designates
 2a00:1450:4864:20::332 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000024914e05f18789af
Content-Type: text/plain; charset="UTF-8"

Oh, I was missing *.cell from the point 2. Now fixed and no complaints.

to 5. tammik. 2023 klo 12.20 Tommi Parkkila (tommi.parkkila@gmail.com)
kirjoitti:

> Jan - Just ran the config check on the host PC and on target.
>
> 1. On host, it identified some memregion overlappings that were due my own
> copy/paste errors. It also complained a missing resource interception for
> architecture x86:
>
>
>
>
>
>
>
>
>
> *In cell 'STM32MP1-Root', region 1  phys_start: 0x00000000f7600000
> virt_start: 0x00000000f7600000  size:       0x0000000009a00000  flags:
>  JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTEoverlaps
> with xAPIC  phys_start: 0x00000000fee00000  virt_start: 0x00000000fee00000
> size:       0x0000000000001000  flags:  *
> I fixed the copy paste mem overlappings, do I need to worry about the
> xAPIC overlapping?
>
> 2. On target, the check complained the configuration is not root cell
> configuration???
>
>
> *root@stm32mp1:~# jailhouse/tools/jailhouse-config-check
> jailhouse/configs/stm32mp157.cReading configuration set:Not a root cell
> configuration: jailhouse/configs/arm/stm32mp157.c*
> The config here is the same as ran on the host PC. What causes it to
> complain the above?
>
> to 5. tammik. 2023 klo 11.55 Jan Kiszka (jan.kiszka@siemens.com)
> kirjoitti:
>
>> On 05.01.23 17:53, Tommi Parkkila wrote:
>> > Jan - Thanks again. I have not tried the config check yet. Actually, it
>> > does not work on hw currently, it does not find pyjailhouse module. I'll
>> > check whats going wrong with it and let you know.
>>
>> You can also run it offline, even directly from the source folder
>> (tools/jailhouse-config-check ...).
>>
>> Jan
>>
>> > -tommi
>> >
>> > to 5. tammik. 2023 klo 10.21 Jan Kiszka (jan.kiszka@siemens.com
>> > <mailto:jan.kiszka@siemens.com>) kirjoitti:
>> >
>> >     On 05.01.23 15:34, Tommi Parkkila wrote:
>> >     > Thanks for your reply, Jan. I managed to get forward from the
>> 'hang'
>> >     > condition. There were several misdefinitions on my root-cell
>> >     > configuration. Now I get the root-cell started sometimes, but more
>> >     often
>> >     > I get two types of issues after enable command. Any help or ideas
>> >     where
>> >     > to continue my debugging would be greatly appreciated. Please,
>> see the
>> >     > issues explained below.
>> >
>> >     Already tried "jailhouse config check"?
>> >
>> >     >
>> >     > Thanks,
>> >     > -tommi
>> >     >
>> >     > +++++++++++++++++++++++++++++++++
>> >     >
>> >     > 1. Terminal hangs
>> >     > -- After the enable command for the root cell, jailhouse gets
>> started
>> >     > but then the terminal goes unresponsive. Below, example log,
>> where I
>> >     > give ls cmd, which then causes terminal to go unresponsive...:
>> >     >
>> >
>> >     Missing interrupts could be one reason. Or something is completely
>> >     broken with memory mapping so that a kernel device driver gets
>> stuck on
>> >     waiting for some register bit to flip, e.g. But most frequent are
>> >     interrupt issues, specifically around GIC resources being improperly
>> >     passed through. The config checker may find that.
>> >
>> >     > /*root@stm32mp1:~# modprobe jailhouse
>> >     > [ 1315.034414] jailhouse: loading out-of-tree module taints
>> kernel.
>> >     > root@stm32mp1:~# jailhouse enable
>> >     > ~/jailhouse/configs/arm/itron_stm32mp157.cell
>> >     >
>> >     > Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on
>> CPU 0
>> >     > Code location: 0xf0000040
>> >     > Page pool usage after early setup: mem 28/1514, remap 0/131072
>> >     > Initializing processors:
>> >     >  CPU 0... OK
>> >     >  CPU 1... OK
>> >     > Initializing unit: irqchip
>> >     > Initializing unit: PCI
>> >     > Page pool usage after late setup: mem 50/1514, remap 5/131072
>> >     > [0] Activating hypervisor
>> >     > [ 1355.352714] The Jailhouse is opening.
>> >     > root@stm32mp1:~# ls*/
>> >     >
>> >     > 2. Issue with setting CPU clock
>> >     > -- The second issue I see is related to i2c bus and system clock.
>> >     > Terminal starts printing error statements infinitely after
>> Jailhouse
>> >     > opening. Below, is a snippet of an example logs.
>> >     >
>> >     > */[   85.322027] The Jailhouse is opening.
>> >     > [   85.322648] stm32f7-i2c 5c002000.i2c: failed to prepare_enable
>> >     clock
>> >     > root@stm32mp1:~# [   85.339233] cpu cpu0: _set_opp_voltage:
>> failed to
>> >     > set voltage (1350000 1350000 1350000 mV): -22
>> >     > [   85.350413] cpufreq: __target_index: Failed to change cpu
>> >     frequency: -22
>> >     > [   85.357706] cpu cpu0: _set_opp_voltage: failed to set voltage
>> >     > (1350000 1350000 1350000 mV): -22
>> >     > [   85.365124] cpufreq: __target_index: Failed to change cpu
>> >     frequency: -22
>> >     > [   85.381985] cpu cpu0: _set_opp_voltage: failed to set voltage
>> >     > (1350000 1350000 1350000 mV): -22
>> >     > /*- - -
>> >     > +++++++++++++++++++++++++++++++++
>> >
>> >     Same possible reasons as above. Or do you know how clock control
>> happens
>> >     on that platform? Is there firmware (TF-A?) involved?
>> >
>> >     Jan
>> >
>> >     --
>> >     Siemens AG, Technology
>> >     Competence Center Embedded Linux
>> >
>>
>> --
>> Siemens AG, Technology
>> Competence Center Embedded Linux
>>
>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg%40mail.gmail.com.

--00000000000024914e05f18789af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh, I was missing *.cell from the point 2. Now fixed=C2=A0=
and no complaints.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">to 5. tammik. 2023 klo 12.20 Tommi Parkkila (<a href=3D"m=
ailto:tommi.parkkila@gmail.com">tommi.parkkila@gmail.com</a>) kirjoitti:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">J=
an - Just ran the config check on the host PC and on target.=C2=A0<div><br>=
</div><div>1. On host, it identified some memregion overlappings that were =
due my own copy/paste errors. It also complained a missing resource interce=
ption for architecture x86:<div><b><i>In cell &#39;STM32MP1-Root&#39;, regi=
on 1<br>=C2=A0 phys_start: 0x00000000f7600000<br>=C2=A0 virt_start: 0x00000=
000f7600000<br>=C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000009a00000<br>=C2=
=A0 flags: =C2=A0 =C2=A0 =C2=A0JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | J=
AILHOUSE_MEM_EXECUTE<br>overlaps with xAPIC<br>=C2=A0 phys_start: 0x0000000=
0fee00000<br>=C2=A0 virt_start: 0x00000000fee00000<br>=C2=A0 size: =C2=A0 =
=C2=A0 =C2=A0 0x0000000000001000<br>=C2=A0 flags:=C2=A0=C2=A0</i></b><br></=
div></div><div>I fixed the copy paste mem=C2=A0overlappings, do I need to w=
orry about the xAPIC overlapping?</div><div><b><i><br></i></b></div><div>2.=
 On target, the check complained the configuration is not root cell configu=
ration???</div><div><b><i>root@stm32mp1:~# jailhouse/tools/jailhouse-config=
-check jailhouse/configs/stm32mp157.c<br>Reading configuration set:<br>Not =
a root cell configuration: jailhouse/configs/arm/stm32mp157.c</i></b><br></=
div><div>The config here is the same as ran on the host PC. What causes it =
to complain the above?</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">to 5. tammik. 2023 klo 11.55 Jan Kiszka (<a h=
ref=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.=
com</a>) kirjoitti:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 05.01.23 17:53, Tommi Parkkila wrote:<br>
&gt; Jan - Thanks again. I have not tried the config check yet. Actually, i=
t<br>
&gt; does not work on hw currently, it does not find pyjailhouse module. I&=
#39;ll<br>
&gt; check whats=C2=A0going wrong with it and=C2=A0let you know.<br>
<br>
You can also run it offline, even directly from the source folder<br>
(tools/jailhouse-config-check ...).<br>
<br>
Jan<br>
<br>
&gt; -tommi<br>
&gt; <br>
&gt; to 5. tammik. 2023 klo 10.21 Jan Kiszka (<a href=3D"mailto:jan.kiszka@=
siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank"=
>jan.kiszka@siemens.com</a>&gt;) kirjoitti:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 05.01.23 15:34, Tommi Parkkila wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks for your reply, Jan. I managed to get f=
orward from the &#39;hang&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; condition. There were several misdefinitions o=
n my root-cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; configuration. Now I get the root-cell started=
 sometimes, but more<br>
&gt;=C2=A0 =C2=A0 =C2=A0often<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I get two types of issues after enable command=
. Any help or ideas<br>
&gt;=C2=A0 =C2=A0 =C2=A0where<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; to continue my debugging would be greatly appr=
eciated. Please, see the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; issues explained below.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Already tried &quot;jailhouse config check&quot;?<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -tommi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. Terminal hangs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -- After the enable command for the root cell,=
 jailhouse gets started<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; but then the terminal goes unresponsive. Below=
, example log, where I<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; give ls cmd, which then causes terminal to go =
unresponsive...:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing interrupts could be one reason. Or somethin=
g is completely<br>
&gt;=C2=A0 =C2=A0 =C2=A0broken with memory mapping so that a kernel device =
driver gets stuck on<br>
&gt;=C2=A0 =C2=A0 =C2=A0waiting for some register bit to flip, e.g. But mos=
t frequent are<br>
&gt;=C2=A0 =C2=A0 =C2=A0interrupt issues, specifically around GIC resources=
 being improperly<br>
&gt;=C2=A0 =C2=A0 =C2=A0passed through. The config checker may find that.<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; /*root@stm32mp1:~# modprobe jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1315.034414] jailhouse: loading out-of-tree =
module taints kernel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; root@stm32mp1:~# jailhouse enable<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ~/jailhouse/configs/arm/itron_stm32mp157.cell<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing Jailhouse hypervisor v0.12 (314-g=
c7a1b697-dirty) on CPU 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Code location: 0xf0000040<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Page pool usage after early setup: mem 28/1514=
, remap 0/131072<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing processors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0CPU 0... OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0CPU 1... OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing unit: irqchip<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing unit: PCI<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Page pool usage after late setup: mem 50/1514,=
 remap 5/131072<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [0] Activating hypervisor<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1355.352714] The Jailhouse is opening.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; root@stm32mp1:~# ls*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. Issue with setting CPU clock<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -- The second issue I see is related to i2c bu=
s and system clock.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Terminal starts printing error statements infi=
nitely after Jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; opening. Below, is a snippet of an example log=
s.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; */[ =C2=A0 85.322027] The Jailhouse is opening=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.322648] stm32f7-i2c 5c002000.i2c: =
failed to prepare_enable<br>
&gt;=C2=A0 =C2=A0 =C2=A0clock<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; root@stm32mp1:~# [ =C2=A0 85.339233] cpu cpu0:=
 _set_opp_voltage: failed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; set voltage (1350000 1350000 1350000 mV): -22<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.350413] cpufreq: __target_index: F=
ailed to change cpu<br>
&gt;=C2=A0 =C2=A0 =C2=A0frequency: -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.357706] cpu cpu0: _set_opp_voltage=
: failed to set voltage<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (1350000 1350000 1350000 mV): -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.365124] cpufreq: __target_index: F=
ailed to change cpu<br>
&gt;=C2=A0 =C2=A0 =C2=A0frequency: -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.381985] cpu cpu0: _set_opp_voltage=
: failed to set voltage<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (1350000 1350000 1350000 mV): -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; /*- - -<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++++++++++++++++++++++++++++++++<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Same possible reasons as above. Or do you know how =
clock control happens<br>
&gt;=C2=A0 =C2=A0 =C2=A0on that platform? Is there firmware (TF-A?) involve=
d?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Siemens AG, Technology<br>
&gt;=C2=A0 =C2=A0 =C2=A0Competence Center Embedded Linux<br>
&gt; <br>
<br>
-- <br>
Siemens AG, Technology<br>
Competence Center Embedded Linux<br>
<br>
</blockquote></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxq=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p=
_JqrBxqg%40mail.gmail.com</a>.<br />

--00000000000024914e05f18789af--
