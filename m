Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBNE2RT5QKGQEPOBK6VY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7126D465
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 09:16:05 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id c200sf405672wmd.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 00:16:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600326965; cv=pass;
        d=google.com; s=arc-20160816;
        b=psRr7xjE4LVXCmhsUFvGcffzL4Jmc7mr+mul+/LlLdERcNmkrpx2zjDJrQVQeW7kuf
         OBmzOTQ/Bts/pVYjtXVSaRm9F5Vf3dxWqzw00tv6bInlbhkPOOSRbVd5iHJt6Pppkafn
         vfqWRQs4FrqqdzZywB6YWHIhJ9N+ZvtkS90KApvRv6bBYZiRcQDHis9UAfpxKDOLWSfp
         AErSQFnSAfnUEgzR+USLUfPKEsw/bwEwdXF8W/7bxak6tL6xmuz/VBGsDQVaQKO3VWjJ
         mOt6eLILqqRKVXSthp6TDr9votHjjL/hXbLVxkeDB0KFkUN31OWiCVYkRUbo9emtjfIn
         YBPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:to:cc:in-reply-to:date
         :subject:mime-version:message-id:from:sender:dkim-signature;
        bh=2yb+bOXLetNwMiXZaqZZpQLR6XXZYXS+SfIH0FwOIg4=;
        b=y0+VONXnD4/B0WMI5d9mgn4fNQk+SqZZdM5QE2+dYy5shJemcTC9HwTSUNLoglXeSi
         FLujs9B53EgtBCKTtUzLW/TRDvNu62SmWLU76ogUefMQb9AarkXb+F+oCO4TooHYLP61
         x34yV6TlhzAVDNM/rnaCQcoCUOpK2asEILCyGIRgLt3Y/EGKssqZZ4/dAh3hX87D878N
         7kpFNYbNK3XgkR/aXB321qRzAiiCVOBUPFIX4aJtcgE2DDHaXq08fAYWcYS6S2D3IMaC
         kyuPG54V5YCUIgCKcL2Z+cl3o/h9qUa7VqQxcxUAkS78RZbZAG+HfkOrYdKKK3VDuJkD
         95Gg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=LPgadQuz;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2yb+bOXLetNwMiXZaqZZpQLR6XXZYXS+SfIH0FwOIg4=;
        b=DGhgrag4spt/JHjWOIplm6SILSVPV071A4ZZ9r8ZKaiw1wwSP0kuevp2DBTVpt6Jgi
         b+Eypegpbjf0rXcBNx5qYHBwMq/kiMofQp5LS4JNM0/EW5pSinqa74SGKlai0KHSHFFD
         wZcE4joJgh+bfpy1sA4UnOY4uhjnFEbt/yDowrdfYFaww3djXykmtoCtQBkN00ckQlO3
         8cJV3Cmj9hS/K7N5ESW1jKAb0YNMEKizxYfqC8AV89fmLAOGQOfP2vjqcF2dIU36/xHu
         hF7TdFd3nFLZUE0pvPlzI4I+rOhHvdoaAxa4YlRlf39BjdtnVdSUMr71b13hkqq1ZyaN
         AUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2yb+bOXLetNwMiXZaqZZpQLR6XXZYXS+SfIH0FwOIg4=;
        b=LcQ/rLLbyAYJF4mWh4KGJMJL97ut7YNonpVa6EiDz4h3/y//Dpm7JYNE5j3vQyXIfv
         YRPKPxdzZlgV3e+Bm5touek5F3gSh+VtZ0PDPtX/LgZNPA4SukHH7BZGCBSMHn1ED2cK
         ZA3+U3wBTim/bFk+iwepR1Aub+8H7d8y7bonLV77CHFjwTIoYcL1PWEI0eO3Lt4USr7A
         1630PG+Kfm8Fi+0Uo9DUGnDjULsZRS6z7gD6bJiLY7a1qkrH84kJtAMKoOYoMKLM/HFV
         Ls6o4AE4rf65aapqwQ5ZRlXE1sdD7DhWeVv5PW2x6iK9uWLTAZJXe3I7z4pqq1eIkomE
         Ynug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/GuLE8WJa8enh3HfmEbyDnjm9VCnvX9omKEFgLnNhXzTv1SmM
	cr+orGk9Xyy419KbccP8bSM=
X-Google-Smtp-Source: ABdhPJygY5xboci1JTLoMbmf8OeMXmNdBYO1prADy6vAfSywafux5eYAdlB1uO9pbsJrGk+KleCT9g==
X-Received: by 2002:a1c:5641:: with SMTP id k62mr8932634wmb.13.1600326965019;
        Thu, 17 Sep 2020 00:16:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls1110713wrx.3.gmail; Thu, 17
 Sep 2020 00:16:03 -0700 (PDT)
X-Received: by 2002:adf:ee01:: with SMTP id y1mr31737272wrn.2.1600326963830;
        Thu, 17 Sep 2020 00:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600326963; cv=none;
        d=google.com; s=arc-20160816;
        b=Gl1t1fsEphPHYUrBf/Hbutpk72MjuAVeEiJsXqnFkB3erbJAO5l9NC5miabRbONOTO
         fm1xQd1P/N7bzAPhnIuNw+cXBA3+eHyzD2USYpnZ1zbhv1nd4+Pf40Ti5+QwM9rlX3lL
         bl72Z4tMP7qUdN+pqbL0nUXQygq49JVq9KsOpDloX395hz45yRbiE6a5UcU1gghOFYV/
         WiitebD2Sd4V/v2bjC5DQhXoPfibmmpiyazgfVgdQMbsxoh+aYY6MVYOGs7YiHpUVuLP
         b6v8kH+EgPk3cdOLMiemioY04j6NhEA7/M3CX/mg2Dnk7QaZm9fbTFTjD0Zn1t/zJVza
         zQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:dkim-signature;
        bh=EkoPY+m7DDbj6FAJV1gJSS/U7pqp90lI4073UnS+X4w=;
        b=DPbRRWQPlIinnEyI49a/8RsDNu957QqaWPLHtnuHhjQ4fDhdGm2Ol7EQPAnRt6i4Q3
         6eNwXSTka6Qn5Xg1lYU4Hw2+o4YiHgnuo7NTj/a0tBccvjv+9oIzIzmMUILdSuYCbvoh
         0BTzv/E6OIfLSXzRVschEcbnVP0PKxlW18y1ZJzc+M15ZDi+OvB856q9tewZ0s6EH5F7
         wbnK5QpMYF6LBMTAsoz6I70wAaMbv7XPiNzmlh14U2AIxzWqiVW1i4K70aY3wwGXzW0U
         4CQLTxTdHGq8xgvwctlZ0BigBkY3E+wbW46+8jaYHV2Qgbyxmy1vT5uWSWJZlZw9LvZW
         zEgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=LPgadQuz;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by gmr-mx.google.com with ESMTPS id z11si155495wrp.4.2020.09.17.00.16.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3lcJ-1kHz4C0uo7-000xUQ; Thu, 17
 Sep 2020 09:16:03 +0200
Received: from [192.168.2.64] (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 8D098202544E;
	Thu, 17 Sep 2020 09:16:02 +0200 (CEST)
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Message-Id: <0F31A760-66D4-4430-BE71-6126FCF5AD60@gmx.de>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B360396D-BB16-40F6-8BD5-22E38449079E"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: arm64-zero-exits trouble
Date: Thu, 17 Sep 2020 09:16:02 +0200
In-Reply-To: <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:03HiFMNyOk5yl2d2CK+BFwPU34hCjvDgd1n4V3xx/6Y2mknluSQ
 wQj9uYL0dcjcCn2Tq+cvyf6gPVxaHQqMuQUieTiWGmMbfsukDUi6uxEgMZwqO+ioDOPdiya
 8Lk1DTg5uK6MFYbRoCaBsHzH+u6RQm6XbEjDbseR8UYCVxdax9Yp0NxQZ/Uqih717E2Q+bN
 0p4Sa2LdhYdwmehve1HlQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7ULYyMHzg+o=:ft44SQutXDRgI2ch3xVghJ
 uMJSUWDrJTeg4VN+9+akZBtO6pmhM+PZNvkU/gUwJJvex8ZPCXxr0npOKeWAcZbHE4KIEKA3p
 4lNZuog41XjohkYo2YCq07avbXp4rd7q4K80n3w5vby7mJdYcvP8OfQjY5yrT3zR/d4e9xCFc
 r51GH/XYoE5OZq6W3gUfhLs7wfamUoVdE+1+T+sQp8SrfV1BU7wWOiM3itC6doGWVuRgx3jkq
 CxV7pFZ5E9ThJFZkLKL5yCwo5r4v5zT9SQREZr7kXh8f6fxXR6VrRsDD1TUBymcONceWRvENZ
 /1k6UK9GmmTXxluJ9UM1ZO+V+p+52VGMuRZwJKqLGN02vi14DbuaYpxekrTQk5jO+5xyar8fM
 9bnv4f7vp1lX7aoWWAa0f5W3YDAqsNtIj8KP/VawzafEulIuCcbGns2lGqyR92AdUDQFWGEWE
 h/bLIRLpKsdWwqtxsHe0cdo9qLO6olt7nhWZbxw3uU/SGyc6HURc9WHX02DnQJ/bsu4BvlBqb
 P4Y6RtqSbCerBJav/uPenKtzGXx6ivH+43WzqNxaCy1KQM0/vV1AsO89ExjcINMF0RjsqMoeV
 kSiDMKAXYjjizETJNyx1Ky83R4ac1t5GjCkcc56Q1p3/vTXwe27R/+pYpjB1C8a90LjIUZWUk
 YNZ34p3IRd+4UQ/BX/Bw16G+I2cQbWzw4nwr0Xi2D17u8+kgQkubzsAuEQedz8kJY5b8jZxDc
 YCa44npOagnEkhxap4FUNNOUTWpBa0hQ3nyIPIXJoE1sNDpEbKJkC8yBoTcWrVWMVsm9Xjo0J
 LYHLHaiug+VJBvg1UrlNdidphuyQj3QVCHs8F85hAw7vYOG6HdSRB6TkOMcp0AX8ee1MStQQR
 JHtpo4mNu3rQFuxJ15Vp9u6/rerLzlLYAE+5XRnGtI8f0dHIbzybyHtQwWnlzpMmOyP2P1TbE
 5eytI5nXltyVSBBdxL6AC18zzNrGQlXMmrd1FpJz7aW6O6A/Qt8dXE6r4Sisn3J8GUkfx54tb
 ACtzFCMzbImMTKYtP/Ijmdw8M55DWhs3v8ipnYQRtmQhxV2/797lEKOSFY6DjmL1KkIs+cfyO
 aXuPaY3nxYMzBCpi64pgB6DbLIEXZv+XSgYm6mhiVQ+LewayCzOslLpFCtfTeTYkgGDZ4bXEj
 vzJSsKnCJfUQLbzrgYyW+Ha+M1kr9ns8Tzv1nWUL+ckbYR0rK4TnNoOHAxyiqOq4e5kPW066C
 L67s6y0xT/397ZZGHytp9syvJItk/wCy9KSm4cA==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=LPgadQuz;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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


--Apple-Mail=_B360396D-BB16-40F6-8BD5-22E38449079E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"



> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 15.09.20 09:07, Oliver Schwartz wrote:
>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got stu=
ck.
>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=80=
=99ve brought ATF up to date and patched it with Jans patch to enable SDEI.=
 If I don=E2=80=99t enable SDEI in ATF everything works as expected (with V=
M exits for interrupts, of course). Jailhouse source is the tip of branch a=
rm64-zero-exits.
>> If I enable SDEI in ATF, jailhouse works most of the time, except for wh=
en it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 result=
s in:
>>> Initializing processors:
>>>  CPU 1... OK
>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor/arc=
h/arm64/setup.c:73: returning error -EIO
>=20
> Weird - that the SDEI event enable call.
>=20
>>> FAILED
>>> JAILHOUSE_ENABLE: Input/output error
>> I=E2=80=99ve seen this error only when I enable jailhouse through some i=
nit script during the boot process, when the system is also busy otherwise.=
 When starting jailhouse on an idle system I haven=E2=80=99t seen this.
>=20
> Possibly a regression of my recent refactoring which I didn't manage to t=
est yet. Could you try if
>=20
> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b08=
aa65a456255f <https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6=
387d5ea11b08aa65a456255f>
>=20
> was any better?
>=20
>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99:
>>> Initializing processors:
>>>  CPU 1... OK
>>>  CPU 0... OK
>>>  CPU 2... OK
>>>  CPU 3... OK
>>> Initializing unit: irqchip
>>> Using SDEI-based management interrupt
>>> Initializing unit: ARM SMMU v3
>>> Initializing unit: PVU IOMMU
>>> Initializing unit: PCI
>>> Adding virtual PCI device 00:00.0 to cell "root"
>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>> Activating hypervisor
>>> [    5.847540] The Jailhouse is opening.
>> Using a JTAG debugger I see that one or more cores are stuck in hypervis=
or/arch/arm-common/psci.c, line 105.
>> It may also succeed in stopping one or more CPUs and then hang (again wi=
th one or more cores stuck in psci.c, line 105):
>>> [    5.810220] The Jailhouse is opening.
>>> [    5.860054] CPU1: shutdown
>>> [    5.862677] psci: CPU1 killed.

Now, with the first problem solved I=E2=80=99ve digged into the second one.=
 It=E2=80=99s actually a bit worse than in my initial description: If I jus=
t do =E2=80=98jailhouse enable=E2=80=99 the system will always hang a few m=
illiseconds after the command completes - the only exception is when =E2=80=
=98jailhouse create=E2=80=99 is executed immediately afterwards (which crea=
tes an inmate that uses 3 of 4 CPU cores, leaving just one for Linux), whic=
h succeeds roughly on every second try. I didn=E2=80=99t notice this initia=
lly because I usually start jailhouse with a script that does =E2=80=98enab=
le=E2=80=99 and =E2=80=98create=E2=80=99.

The reason for the hangs seems to be the psci emulation in Jailhouse, in pa=
rticular the CPU_SUSPEND calls. These are issued from my (Xilinx-) kernel f=
requently if Linux has more than one core available. With SDEI disabled the=
 core can be woken up again by some interrupt. With SDEI enabled, the core =
waits forever on the wfi intstruction. Because a suspended core never wakes=
 up again the whole system hangs at some point.

Any ideas why no interrupts are seen anymore in psci? My guess is that it=
=E2=80=99s because the inmate (Linux) now has full control over the GIC, so=
 it may disable any interrupts before suspending a core, without Jailhouse =
noticing. If this is the case, it may be necessary to re-enable the IRQs be=
fore executing wfi. But I=E2=80=99m missing the big picture here - what int=
errupt is the core waiting for in the first place? Any other thoughts?

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0F31A760-66D4-4430-BE71-6126FCF5AD60%40gmx.de.

--Apple-Mail=_B360396D-BB16-40F6-8BD5-22E38449079E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 15 Sep 202=
0, at 11:00, Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" class=
=3D"">jan.kiszka@siemens.com</a>&gt; wrote:</div><br class=3D"Apple-interch=
ange-newline"><div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; dis=
play: inline !important;" class=3D"">On 15.09.20 09:07, Oliver Schwartz wro=
te:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans:=
 auto; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">I=E2=
=80=99m currently trying out the arm64-zero-exits branch and got stuck.<br =
class=3D"">System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=
=E2=80=99ve brought ATF up to date and patched it with Jans patch to enable=
 SDEI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (=
with VM exits for interrupts, of course). Jailhouse source is the tip of br=
anch arm64-zero-exits.<br class=3D"">If I enable SDEI in ATF, jailhouse wor=
ks most of the time, except for when it doesn=E2=80=99t. Sometimes, =E2=80=
=98jailhouse enable=E2=80=99 results in:<br class=3D""><blockquote type=3D"=
cite" class=3D"">Initializing processors:<br class=3D"">&nbsp;CPU 1... OK<b=
r class=3D"">&nbsp;CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/=
hypervisor/arch/arm64/setup.c:73: returning error -EIO<br class=3D""></bloc=
kquote></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none; float: none; display: inline !important;" class=3D"">Weird - t=
hat the SDEI event enable call.</span><br style=3D"caret-color: rgb(0, 0, 0=
); font-family: Helvetica; font-size: 12px; font-style: normal; font-varian=
t-caps: normal; font-weight: normal; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"=
"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" style=3D=
"font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-=
caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webki=
t-text-stroke-width: 0px; text-decoration: none;" class=3D""><blockquote ty=
pe=3D"cite" class=3D"">FAILED<br class=3D"">JAILHOUSE_ENABLE: Input/output =
error<br class=3D""></blockquote>I=E2=80=99ve seen this error only when I e=
nable jailhouse through some init script during the boot process, when the =
system is also busy otherwise. When starting jailhouse on an idle system I =
haven=E2=80=99t seen this.<br class=3D""></blockquote><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none; float: none; display: inline=
 !important;" class=3D"">Possibly a regression of my recent refactoring whi=
ch I didn't manage to test yet. Could you try if</span><br style=3D"caret-c=
olor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none;" class=3D""><a href=3D"https:=
//github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b08aa65a456=
255f" style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; or=
phans: auto; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust=
: auto; -webkit-text-stroke-width: 0px;" class=3D"">https://github.com/siem=
ens/jailhouse/commits/e0ef829c85895dc6387d5ea11b08aa65a456255f</a><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-=
family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; text-align: start; text-indent: 0px; text-transform: non=
e; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" class=3D""=
>was any better?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D""><br style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: H=
elvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; letter-spacing: normal; orphans: auto; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; widows: aut=
o; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D"">Sometimes it may hang later d=
uring =E2=80=98jailhouse enable=E2=80=99:<br class=3D""><blockquote type=3D=
"cite" class=3D"">Initializing processors:<br class=3D"">&nbsp;CPU 1... OK<=
br class=3D"">&nbsp;CPU 0... OK<br class=3D"">&nbsp;CPU 2... OK<br class=3D=
"">&nbsp;CPU 3... OK<br class=3D"">Initializing unit: irqchip<br class=3D""=
>Using SDEI-based management interrupt<br class=3D"">Initializing unit: ARM=
 SMMU v3<br class=3D"">Initializing unit: PVU IOMMU<br class=3D"">Initializ=
ing unit: PCI<br class=3D"">Adding virtual PCI device 00:00.0 to cell "root=
"<br class=3D"">Page pool usage after late setup: mem 67/992, remap 5/13107=
2<br class=3D"">Activating hypervisor<br class=3D"">[ &nbsp;&nbsp;&nbsp;5.8=
47540] The Jailhouse is opening.<br class=3D""></blockquote>Using a JTAG de=
bugger I see that one or more cores are stuck in hypervisor/arch/arm-common=
/psci.c, line 105.<br class=3D"">It may also succeed in stopping one or mor=
e CPUs and then hang (again with one or more cores stuck in psci.c, line 10=
5):<br class=3D""><blockquote type=3D"cite" class=3D"">[ &nbsp;&nbsp;&nbsp;=
5.810220] The Jailhouse is opening.<br class=3D"">[ &nbsp;&nbsp;&nbsp;5.860=
054] CPU1: shutdown<br class=3D"">[ &nbsp;&nbsp;&nbsp;5.862677] psci: CPU1 =
killed.<br class=3D""></blockquote></blockquote></div></blockquote><div><br=
 class=3D""></div><div>Now, with the first problem solved I=E2=80=99ve digg=
ed into the second one. It=E2=80=99s actually a bit worse than in my initia=
l description: If I just do =E2=80=98jailhouse enable=E2=80=99 the system w=
ill always hang a few milliseconds after the command completes - the only e=
xception is when =E2=80=98jailhouse create=E2=80=99 is executed immediately=
 afterwards (which creates an inmate that uses 3 of 4 CPU cores, leaving ju=
st one for Linux), which succeeds roughly on every second try. I didn=E2=80=
=99t notice this initially because I usually start jailhouse with a script =
that does =E2=80=98enable=E2=80=99 and =E2=80=98create=E2=80=99.</div><div>=
<br class=3D""></div><div>The reason for the hangs seems to be the psci emu=
lation in Jailhouse, in particular the CPU_SUSPEND calls. These are issued =
from my (Xilinx-) kernel frequently if Linux has more than one core availab=
le. With SDEI disabled the core can be woken up again by some interrupt. Wi=
th SDEI enabled, the core waits forever on the wfi intstruction. Because a =
suspended core never wakes up again the whole system hangs at some point.</=
div><div><br class=3D""></div><div>Any ideas why no interrupts are seen any=
more in psci? My guess is that it=E2=80=99s because the inmate (Linux) now =
has full control over the GIC, so it may disable any interrupts before susp=
ending a core, without Jailhouse noticing. If this is the case, it may be n=
ecessary to re-enable the IRQs before executing wfi. But I=E2=80=99m missin=
g the big picture here - what interrupt is the core waiting for in the firs=
t place? Any other thoughts?</div><div><br class=3D""></div><div>Oliver</di=
v><div><br class=3D""></div></div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0F31A760-66D4-4430-BE71-6126FCF5AD60%40gmx.de?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/0F31A760-66D4-4430-BE71-6126FCF5AD60%40gmx.de</a>.<br />

--Apple-Mail=_B360396D-BB16-40F6-8BD5-22E38449079E--
