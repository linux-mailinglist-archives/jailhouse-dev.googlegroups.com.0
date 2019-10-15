Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBZVKS3WQKGQE36EKQYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783DD7274
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 11:46:15 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id y25sf11825936edv.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 02:46:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571132775; cv=pass;
        d=google.com; s=arc-20160816;
        b=CL1f6oU3ZeS4EneAxTJOJlC2X0s02Spd8tuGw/qdwWsWV+C8rvUEfErtly6HVssjl8
         rbk535sqb6v+z/jyGNl6tyliKr/uSVdv4pOk8popJIH+/vLfXJJxehozece2aY5vvGZS
         3ZS0+EGmZQMuM2WWEV8olcqfnGNdmsCJh3GH3kwkDCjUlbQVaJn2+tpDhqXeBWdEyg84
         a4V5CNTlz606uDQz6xg0ojcpsT56gn0MLNczw5+3B3paY6HctpmHkAkLY6vrvpXzogbG
         tQyxE0PkZu1c8dv8vARNnP+GpMbUHHJgbjQmxNW0mvrBHJT1vDccYLthE+vjBWN36wyG
         H4uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=4Z8oRMrIrjMJihH393wMtXiuJPVAIV14I/pDEHJVeZ8=;
        b=fHuqEm1t+xpuovpnjspWg2mtx/ee61iIr0OPU1vCpWzpW1AqmyUBqmmnslHU6vbTlx
         d2oWuu2e5Z6mRki8aGf+7VxwhkWTBkUsdnREDK+0WgTlQuhVVwyMhFjGJPV65B9CZyrg
         f1vgz9MToQi9zmtNi3AbkoPlD/JWRgNJlp0Z/4g6/h+GuwNnIAq3T4xYYQ2uOXP8FNoV
         Lwe1guGIGV8SmqLA3CoLe/cH2YR9ERkEWncxoHfNvyBWkE/9KqyWtH7wQL7dKqtsN7Si
         Od3D7MNRQQM9PAaamNPi0E7L/xQRah3JZbp5EPFx9U38bG6KLf7RgUkKUqsFsR3sTk+h
         cSlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=G1qgGNkp;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Z8oRMrIrjMJihH393wMtXiuJPVAIV14I/pDEHJVeZ8=;
        b=n9bcatv+1w7gETGBcEyoyzeV18XEXLdebhpFas2MuqanowPNSn4GElJJQ+bb4dVYgc
         OIg7ruvgoi4+u/BxUGCO5IrDtBJsqFb12QqDjyY5mS6gf2nO7c61hmGrQQSCmNJHyA0F
         6UDhTW4XkqZozCStnhnajo1dIuFO2dA3/CxlLEC3+cjEWsTEzYMXM37yCct3P2PuaoFD
         lOuOnkWUvApU+FMo3NtPOwSjJspv3SL4OsEumgFzZRpxayaj86aPMiwtqQ8Hn8PjdNCP
         nxi3jiEWTSMeeXZP9lMHlYGEBv6b/L2+Q7iT9bXMlpna4vuKlpdGiN4/7JoQkA8p/6t0
         8m1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4Z8oRMrIrjMJihH393wMtXiuJPVAIV14I/pDEHJVeZ8=;
        b=UK9JNDF2PNhcigQJl1syhidrIMgZNoEz7LIuDIIPzbZ3+xXq81q0By3kbLmOGjXpym
         GjKZwrXwaCpMK2B1qpKuyEsckjPatVd8k++Zxtz6qH/O/KNHRxG4L4oH0zlC/wzJTW0k
         2ZJ3BFE9frzku5qtKBMDjQOgzeLL213q5b/1MSBjO9mfLl/b9rdxaMTZr57CwWy7zLAO
         oS48jys0XTceuUoD198blcHiSssxRsAJU1xJHb7Dc7+a+URNda83GhTkv+jISgTwKcsC
         kMN8k5qkO1hTQEvaLb0ophq5mGgdYGZ+XPMIq/OHwrdncaQlgCg/aFO9sohYkENCyZQa
         HrtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWqaBEJwNhwJzYHgtFV3+YqmmRqnax39kIeq36xCjlc7UUXXUGN
	HQWsMM9TVVEsSKSpCxdtDw4=
X-Google-Smtp-Source: APXvYqwXfaUt9hI1ZbrNFM77D47EFfn6C5fgGVNmM2zDaHRDoVt0PUJhPKP9em4U0sNHVHKx/5pSbQ==
X-Received: by 2002:a05:6402:1b8a:: with SMTP id cc10mr32564259edb.202.1571132775163;
        Tue, 15 Oct 2019 02:46:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ace6:: with SMTP id x93ls4065380edc.6.gmail; Tue, 15 Oct
 2019 02:46:14 -0700 (PDT)
X-Received: by 2002:aa7:d3ca:: with SMTP id o10mr32824267edr.279.1571132774492;
        Tue, 15 Oct 2019 02:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571132774; cv=none;
        d=google.com; s=arc-20160816;
        b=cX3p6QXcqvgj0CyqwMw2wc11JHobojwFrD6PgIudxeEkwYMuGp+L0CpSq8b2EZrBCu
         S8Sle/RZ6MjyFA7cOtBHWhwyaLuP5mWe5fbft58ieW2vcCH/+AfPMWC+o74hI9vLSORB
         MEyXA2ZDWlzYUY71h+uGTTXiWewgqd0bFr5sf80yDUtZbPyZwsINcb1p8dx92I387oB/
         hXvwUAdO470KCadDQ4nigWHuG2FerkY+JAj3zQ8lx3TBnrmB2HCq/8NRyQcaNRkbo0fN
         P9rtbwbx0dro0OHJrM3MeNHSD82LrGQ7cCkNQuEdcxy24jkOAMGRFu3AnYep1g1y2ee0
         pMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=KaGpd7LOmP5LYiyo9c9f+YYmSheIyWOllNlxkz9ktgU=;
        b=NXpFh2yINxqIdx+BUVgkvpvav7zkE6/V72tvEPirLae80o9++E6YoHjEntqiZ1wBFE
         RYWBIHxTSJUPrKP9D0rox5ElBgeI9fKV1qIon/b0MOa+detEaNp7KtZIy87OOUV9EWzE
         je6DNCg/DZPZyhTt/75FJS+JHH4JEO7n0FGyuLRmdoWwH841xXtKcmxAjHus6fgph00y
         AJ7CQ05YYmai73Eog6pvXGWsd5/qSF79BkMymv3dg6QajUmSRBqdrDIBfKdSCs9SsBfT
         NWTtm4NVKtnrrIUbFluvLh+2dHkg2vJyz/vtjwmAliZKnh1q4lSl/ijk87lpzIWaDy2C
         SLPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=G1qgGNkp;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by gmr-mx.google.com with ESMTPS id d14si1106876edb.4.2019.10.15.02.46.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 02:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKBm-1iC6C402PC-009TBt; Tue, 15
 Oct 2019 11:46:14 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [PATCH 2/3] configs: Add SMC SiP IDs needed for Petalinux.
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <8a18a3e7-7cde-020a-d40b-ddf0f5d07449@web.de>
Date: Tue, 15 Oct 2019 11:46:13 +0200
Cc: jailhouse-dev@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <1D8490BB-5C2F-49C5-82FD-9623433A2DEC@gmx.de>
References: <C4A932C2-5761-4E9D-A455-988C33A9F8F3@gmx.de>
 <9e1fd041-8152-9c4d-c8e4-2914a1adab1c@siemens.com>
 <A5DDA02F-7F4C-48F3-B28C-C31009AE8297@gmx.de>
 <8a18a3e7-7cde-020a-d40b-ddf0f5d07449@web.de>
To: Jan Kiszka <jan.kiszka@web.de>
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:1LyI5NFrd6oYP4IR4hENL52qTGOmhPcKzVFdNXpQqwLhLn8fMzX
 75JpHQTejkcu7SVv6kZJXHbfDCLEJNw+tH27u/MB+/wAMkUvySa0V+M//Qv4uKpR0GnJJZX
 Fc233rHcURJGDkPsl8c04Dp7VfSbGGELl5+ZLMz9bQXv5H27kHHk2rAweNDXJaXhpO/J4YH
 KBzKBHLzcI7StipDGNpRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YKt9GHTvLT4=:QkgquPfijZphsOzOD2KuY9
 jAJ/9jJZ+Aovwp5eFNqmfwID0Nnea++0lrFv1hEB97eg3us56/nVj6guO3haUbeZmsuYMrKHU
 iTJ8iIjTlnmMCSp3CRMYQJ1U4onUCNJQK75bDI1dYrmu5IgeMGKr6qkkyyZ7/ufBEAd0j5Rg6
 5yUz+9l6pKoA3asnTUQVKa69usRwmsGl7Plh6bxIxaV/Aa/6odHwf8pk79Hb8Q2fGOtIXbjjE
 xRHAdQUzUc1LULt26MFaaDhseIZouCzAwLzq8H39yDqaxTK/P6U6KxNrCcY9DIW6Zra5rduDB
 5c1q30HDTYO13XZiiP/sFbnKZtF2XkudTczhOMPfP5hHHSlOc2pOJ9YbVEzt2Yqmafm7KhlKG
 rjmAm37RmJBMIJiMbUj6MHC/GdlbdpijWbnz6NkNeL3Y1E+ZHe11YEKEUdTJDnNAB3Ycvt6gP
 y0pcdxg1GWEFwwnpAcAKnQwDqfUYZJ3+QCJrLqTFKkUyKcb9GDwVCwoxsgbk1AkLsgbTbG/ew
 Jnik6V0EErvb1d84WXH9/U1KPvOM0rSFsT4xevN6E85b4NIcIjzKFpyulHsCWlSlwblHPyZOA
 cP769vJOP9Oq+A6A8Dbwv92grEWqx+5kIl0AerEhmcOa2HI5BbwMgsHIl+Hbv9MxUX2qUVkcd
 axh5cVaFBswYvXmOt3wCNgKxHzAiJ66r8R5qepFObdTd6n+yjl2tL3P0UrL3/K6eAEA5aITsN
 1S4vhe0reIvrp8Vgrzj1KZezAR/vMbzS4cPRikBZKVxgfMx+fyngSx7A/bNX6dIPWEfx+4BlL
 0yDaMNqSub4/Ws0TCqgM4EEcn6RmmXE+InHGLYrNtFCCjFie9f0Wpzy3u3hJ8g8CH3jzrkKNr
 sT1KUp4sYB9OjD3JEuoVzKXi7Y+f839LKhEV1XoHO0/IRrSSBFscO9GAP5iKlLlDmOt0OfN51
 OupPdStlqLi6RR54xOuN1CHYnUb+M5JAnp895tR92ZFhlt0AmbspskMYkGM1JVfYuqo7ynn2q
 QJPl1g5gxn7RQ0DoopT0mKMzNOWoP3WKtw/ehvQxW49NUnL6xQKqo7yxgC5+po56SuetAwZFQ
 slqUReEM9Sag02so00RUWpO3Oz8fDEdJdM2GpZ7yo/YP61UEikb9iLXf2SR5ghMx0G075+TFG
 Ki/erlowz+Q2sQRe1rbHFLsipvwS54jvJFTgWd5WUgHJVvHkF/iNkb/ROXcbPWD6NXphxsDM0
 EjP06GXp2I8ajdR8Ubz0qht29toTJBO0xSHhgPXlrPfWw4j2xwWCi0od5WPE=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=G1qgGNkp;       spf=pass
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



> On 12 Oct 2019, at 11:41, Jan Kiszka <jan.kiszka@web.de> wrote:
>=20
> On 11.10.19 20:23, Oliver Schwartz wrote:
>>=20
>>=20
>>> Am 11.10.2019 um 16:31 schrieb Jan Kiszka <jan.kiszka@siemens.com>:
>>>=20
>>> On 11.10.19 15:30, Oliver Schwartz wrote:
>>>> This patch adds the SMC SiP IDs that are used by Petalinux to the root=
 cell
>>>> of zynqmp-zcu102.c. The SiP calls are:
>>>> 0x0f: PM_SET_REQUIREMENT
>>>> 0x24: PM_CLOCK_ENABLE
>>>> 0x25: PM_CLOCK_DISABLE
>>>=20
>>> I suspect that this punches pretty large holes into the isolation. Don'=
t we rather need filtering on /which/ clocks a guest is allowed to control?=
 Rather than allowing to power /all/ clocks or none?
>>=20
>> Maybe. I haven=E2=80=99t bothered yet, because in my case it=E2=80=99s o=
nly the root cell that is allowed to issue SMC calls. I agree that security=
-wise it=E2=80=99s more desirable to also filter by clock IDs. On the other=
 hand it makes the configuration considerably more difficult, because you n=
eed to synchronize devices in DTS and jailhouse configuration.
>>=20
>> So you=E2=80=99d make both the call ID and the clock ID a configuration =
parameter?
>=20
> We possibly need two things here:
>=20
> 1. ZynqMP-specific filtering of PM_CLOCK_* firmware calls on clock-level
> 2. ZynqMP-specific forwarding or emulation of PM_SET_REQUIREMENT
>   firmware call

I=E2=80=99m not sure what part of PM_SET_REQUIREMENT can / should be emulat=
ed. Do you have something specific in mind?

> There is no point in generic per-ID SMC call filtering. We will likely
> only be able to moderate few of those calls with a binary filter. As in
> case of the clock calls, we will have to take their parameters into
> account, i.e. interpret them. You pointed out the Xen approach for this
> SoC, and that is pointing out what is needed. If not more.

For what it=E2=80=99s worth, the current Xen implementation doesn=E2=80=99t=
 do any parameter inspection - it may intend to do so in the future, but cu=
rrently all filtering is reduced to checking for the hardware domain (which=
 is Dom0, the root cell in Xen speak). As a result, Dom0 is allowed to do m=
ost SMC calls for any device, whereas all other virtual machines can=E2=80=
=99t do SMC calls - see the implementation of domain_has_node_access() and =
domain_has_reset_access() in [1].

Regards,

Oliver

[1]: https://github.com/Xilinx/xen/blob/master/xen/arch/arm/platforms/xilin=
x-zynqmp-eemi.c


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1D8490BB-5C2F-49C5-82FD-9623433A2DEC%40gmx.de.
