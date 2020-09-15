Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBB6XAQT5QKGQEQDDDC2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE5E26AF79
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 23:22:03 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id u11sf718356lfk.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 14:22:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600204922; cv=pass;
        d=google.com; s=arc-20160816;
        b=C3Kuyxf9+a2eNQOjllKq8xpzRS40rhEdabF/mDX2FUXNkDvfojbYUCrYKimMUPuldM
         g/7Q1BguXNKsHUf3qh7UzG+kP7cgVDQ0vLQqSazRSRcKcA+Z64p8V71Bgg4tb1Wfnxu/
         t6Xkh9niiXE70jQRl5IfKJZvHSXLnQuWCIvcPVaDZwaJDa4jNVOfZgUYpKZp6x4E+3Jq
         HtKZ+EVz+lRpkf0CtHkGxCCFqqaUfYy7NsjkCgmwarIDo5bv6ohSkZmuqzDoqyDOIRuL
         Jac+ewRW0E05p5YngJH4j+oFuDmhXi2dfeulfTIqGEMpBrk8DoIE8WDBhMQA5E52DVch
         0Ing==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:to:cc:in-reply-to:date
         :subject:mime-version:message-id:from:sender:dkim-signature;
        bh=YA5Vg3+m77SrDfZqRyFZ6vqCMABNt/RAlp0eP8yj2NI=;
        b=D+IbF9Js4mmwxJP29c7STcTpG7znJc7fOEsQl9VYM4j4X3U1L4Qhn4vw3M0170MlkE
         IsVjc4DWblFOk7C/BQXlQYjy6wLg/eCKJZZLUvwWTwdWBuAdZ+lj/6pZWxN2ch9UMZ5W
         9IkkFrHwe4sydm+MsQrRtGnM6w8QePrjfKf+wMD1hG92RMKulvdcBl6bPGYaKK5BCQIy
         CJpe0/hCYxSzmP3Lp466Q/J5hPNGI4WtzDT1Tz13o4h9rsA21GMnhcQp/9WIXrUPfpZt
         4b6k0B2YdaH0l6CgeNXV1hyhMF/jhoC1492MFBXr5+lSH5/MzqAmhhzP4/1AfO8U2AJ8
         bfDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=HnEl5Ja8;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YA5Vg3+m77SrDfZqRyFZ6vqCMABNt/RAlp0eP8yj2NI=;
        b=DGLxB/8C0por9XgDXXSDdcZ+Fof071xpBp8xsVSasiTEdQZK1t7WR6smFyscW3toKP
         THsl8LfH8K7OJKEGM62ybF9Q99V8ON7LkEHU6VkTNhYXjaJD5M2GVhxvxuUnz8+TmuUr
         /1i38uD+dd4UV51BZmxh70BpG678G6Yd6Sea28nwFx96HZiuw79WAms+D2tEWv+Vj1zv
         8nYhrueJ1XIlLqYkCOB0JQBU5pVYgz0hyMW6a5KFBm9zujqFtmX3HOeMs3pIopOIvInZ
         AbZf8AG2IeMjomQynahnzZLe0ZO4o8wQudYFFIo6VikHarB1wXQ9uMDQenv77WYrRuaQ
         4zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YA5Vg3+m77SrDfZqRyFZ6vqCMABNt/RAlp0eP8yj2NI=;
        b=G/ijBwqfiLRqwMnWcheNUrXIlJwTOGYmF2Mn204piQZO1bN2SSjno+A8+jVz2GJ1Am
         CWgzLgXRT+mQWOtb/W/aSAy347QzGhkqidn1PrWLscD7ccrDN3S7yqQF7KBZYIhXF49m
         L+a7RAluY/QXKCvs8jOzhQxt27z1yn/EUjrfZSmFwC4jkuvK4lhq7HIkpBtCEn7aTHTm
         21fTjbxXRHm9gAI+NUJb7BoZTuQawbhKdVEzKe0aA/2Tmx6qMurqFEmR44lLZdgUpKA6
         7E07CaF5uRLmZ67j+W9Ihy4FbnTOaZMwrIpgXEJyw9JcZxyYdueEYRql2H5Yy8GaWYB7
         9DyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531vUANSM5qFIgEwGqes5IJv9zm8k8iPf8/Xfso5Ti0Ru7TlqsR6
	zkErWIFoWYctIwHPufjzgvM=
X-Google-Smtp-Source: ABdhPJxq6pAXQBaALVhoNOlARCsrN6JNGJuo+I+MZqrTgYo5B6AkGvIooqVGPlxg354yvY9HhiAp1Q==
X-Received: by 2002:ac2:4a73:: with SMTP id q19mr7451289lfp.569.1600204922710;
        Tue, 15 Sep 2020 14:22:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls16351lfn.2.gmail; Tue, 15 Sep
 2020 14:22:01 -0700 (PDT)
X-Received: by 2002:ac2:5e2b:: with SMTP id o11mr7422679lfg.24.1600204921204;
        Tue, 15 Sep 2020 14:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600204921; cv=none;
        d=google.com; s=arc-20160816;
        b=PfmpbQbRi7CqnH4UdWAA9Vk85APNUz5Enq0q3zaYTfWEuW4fKUJ86hmvLRJsf3xE56
         rP9WgCuTUvJRCP7Umr2wjHG26twVNKfK35K3mSyvg51iGwxUn8vhEiJB1QDt8g0912nX
         H537a373A4On7+FrLpmbYBabUlLxcHW+pfuOR/7n2SuK0drw2pB7YEU4eV6jXrxltQu6
         pX5QMInEn602X1+ctC+1SW2GMfdUkvRphP3IypMPxHtnX76u4LQ6BlWv5PQwQ5ADGikj
         1wV1bV37hw2H3lSN+m9T4eGDu+7yjBz0hLprBxBjAL7YhlzeNxKp8jifIWrGo4gO5F5S
         pIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:dkim-signature;
        bh=s+J6ocOwaZaj0mWhSOZh6SbB+wtXLmF1pmUji3/Vc1k=;
        b=FgXtUxndqB0QwGiHyt3vBrzw7ZeJUz+QkUK32GJoudQ6GeuClY9GbfAc2I/f+2RjhU
         61U7r82ByMOP4YMBoaFj+rCkig36gCrf6lse3z1VVctb05xEefyn3GfWrQlLn/syDQby
         qcwQynxUMUXcB9nUf+52GumbpB0vqLUkdb0FW4bof+Uq1PM9q11zFVlgxWuGC9+2XAzW
         bglXhKD2c5m5q1m66lLfBC2HQPeTBwhWuc+nY3B05ViiKDUe1hBUvY42OtEjChiBD7Zu
         qRvi851mbQhg0BAIK7dOsG1YaBENRItJ7ZjtjUvwK5x8LN+OkeMlZxIueR8ULmXbtu1W
         r5Hw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=HnEl5Ja8;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by gmr-mx.google.com with ESMTPS id h22si477574ljh.7.2020.09.15.14.22.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 14:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUqF-1kD3KS3wI3-00CyO8; Tue, 15
 Sep 2020 23:22:00 +0200
Received: from [192.168.2.64] (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 4DD1F202544E;
	Tue, 15 Sep 2020 23:21:59 +0200 (CEST)
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Message-Id: <4FFCB12D-ED2B-4B04-BC8F-1BE1CB12B6E4@gmx.de>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_85AA0D37-011A-4CC2-B272-2896DAB9529C"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: arm64-zero-exits trouble
Date: Tue, 15 Sep 2020 23:21:58 +0200
In-Reply-To: <ce5abf20-0ec9-8c39-40ef-60215b95c9fb@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <9F8CA946-F83A-41A8-A12E-B6FF06FA9B37@gmx.de>
 <33c9ad9c-41fc-2ebf-7f4d-cad19bab8135@siemens.com>
 <2526A9F3-F82A-44C5-858A-C4E6A1911658@gmx.de>
 <ce5abf20-0ec9-8c39-40ef-60215b95c9fb@siemens.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:iXG1UrvzQiZS0O85yVpT4Anyzg78+FlK+3sBL2LGc6A5J37FK6q
 BDmCmpChkbzZmMhRaZG1240/1YD192d18+IHME9xxqb523QCTqFtfREKiSf1lYGZg7l4X+8
 U9Tz/QlaBlWKskhRRV2pv/hPOCIw6d5irVcVSwMEt4zjYjtoGBuMHDuS6R55lsktVGlzlQI
 jvHH6sJ6WHLC5I5MkTNkw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n3GYoD1lyNY=:jVWTWn9BW9rF058t5+HiJT
 ihLWWSuSrZTJIuIhIImU+eYX06sTCCtgTf+OvrG4emWQIACp+BFybWYQ4JpV1Il5HcnhxAr8z
 Xfp3Q/rblfSXbPpBezdSBTkTYWWb9lOuV4tx333QFvV05ONkRZ1zc61Wlum/XpPZyZumnaS0g
 DV08wLZeHb9pOGwEW8ShaYLXQV6OLPzz2uGSm/2qZ6h/wQtLOQmjU9/FOPIodWebejGspFFnV
 a2rEH1p+tcBQ7f0JL5Mnm+Bw7GdgsTzCxLsINDUnZTNkd6z/yatedNwhjDjclp65uZODwiOkT
 70vwHBmgm6x2nU3CP8fRO3HhmOfywdf3e2acYOlGL9CqrbdAp8cbdl5NZx8IyjIpmYg27OGag
 /cK3U4s5aTSC+XAiZkgsnV6ocg4W4plDVaM0EhjW2ebksnhdECxCEWn/QX3mP4QcLN9PDmvg4
 IRINZWcDY2zJHg76r/EXMCegvq99yeCTC0xhREt4LiZJREHGA7V/xnG+dzWd4ettwjt0Q1EHf
 ffOHW5Ks1FFMWR68VgfCXYwg28IwQ2gYlsaZLnSucFTygXpEJdqa3hadMSDpDEZqX54nTAIn8
 +KM/bTlfYl8M563cSWw2s+CJ7rpF0hjrgeAZeywIvDwhGxuR4Zqpy6RJik2s/DR7mJcgVsJXz
 RcJg4AMwQVw3Y8ejBVXOHKQXIwD9Y7NDqx8nczVFY8klfqa4xZ0hvzKTiIZOWLpV4u7RpRjlh
 z7ikR9/NMDO5d2zUYZr//Hs6Gw8IiheZ7P5TKg2Ybkqzy/5lnPd113LT2XzUmmLNBfSykxmGg
 bN3odvPTvHnyHuR1iyY1Qz3rLLJBnN2CfKeUxtmZYggrfdiATVdYK1f2reiGOb6hLQx3F+eP2
 u02YRdUg81s4fDTgtSQZ/fD6g99u9V5OJFGm/vxJxHiyDJvaD6TV5EskuXvGzW03x5Z9jCxV1
 taUIrULHfv7O/CQQUegzQ8RVteOfnF/QH1jJAsreftyFDBDRSlFNA3oCEZYOapnOSa2KWsWE1
 XH85QC66GzXPE8Ux65wSABpYJ+bhjVSqKkgKv2xy7W4Rb0BSU9ImpNUE2KudK7z1klVb1YDyj
 8SMuzebRPCeTOhe+LscJHJFvGhAIL5ubGqBinAMQVO8QXx0RwLYyzuZvo0GEZbbxNYO1Vl9+k
 IsWXUuQ1wGfurPYPzAByiQfrLRVmdHKojuDMQy0R6klFiaZf5f5NvmEb21jVMY0OM6h9CEpLg
 nFa+iDKmQ0qIfEmhsM4/2XbyImkpkNp5/TWKhbQ==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=HnEl5Ja8;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as
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


--Apple-Mail=_85AA0D37-011A-4CC2-B272-2896DAB9529C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"



> On 15 Sep 2020, at 17:23, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 15.09.20 16:09, Oliver Schwartz wrote:
>>> On 15 Sep 2020, at 14:02, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>=20
>>> On 15.09.20 13:49, Oliver Schwartz wrote:
>>>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mailto:=
jan.kiszka@siemens.com>> wrote:
>>>>>=20
>>>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got=
 stuck.
>>>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=
=80=99ve brought ATF up to date and patched it with Jans patch to enable SD=
EI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (wit=
h VM exits for interrupts, of course). Jailhouse source is the tip of branc=
h arm64-zero-exits.
>>>>>> If I enable SDEI in ATF, jailhouse works most of the time, except fo=
r when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 re=
sults in:
>>>>>>> Initializing processors:
>>>>>>>  CPU 1... OK
>>>>>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor=
/arch/arm64/setup.c:73: returning error -EIO
>>>>>=20
>>>>> Weird - that the SDEI event enable call.
>>>> Yes, that=E2=80=99s a bit scary. The code involved in ATF is limited -=
 I=E2=80=99m pretty sure that I=E2=80=99m up-to-date with upstream there.
>>>>>>> FAILED
>>>>>>> JAILHOUSE_ENABLE: Input/output error
>>>>>> I=E2=80=99ve seen this error only when I enable jailhouse through so=
me init script during the boot process, when the system is also busy otherw=
ise. When starting jailhouse on an idle system I haven=E2=80=99t seen this.
>>>>>=20
>>>>> Possibly a regression of my recent refactoring which I didn't manage =
to test yet. Could you try if
>>>>>=20
>>>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea1=
1b08aa65a456255f
>>>>>=20
>>>>> was any better?
>>>> No, I don=E2=80=99t see any difference with that version.
>>>=20
>>> Good and bad news at the same time, unfortunately ruling out a quick so=
lution.
>>>=20
>>>>>=20
>>>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=
=99:
>>>>>>> Initializing processors:
>>>>>>>  CPU 1... OK
>>>>>>>  CPU 0... OK
>>>>>>>  CPU 2... OK
>>>>>>>  CPU 3... OK
>>>>>>> Initializing unit: irqchip
>>>>>>> Using SDEI-based management interrupt
>>>>>>> Initializing unit: ARM SMMU v3
>>>>>>> Initializing unit: PVU IOMMU
>>>>>>> Initializing unit: PCI
>>>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>>>> Activating hypervisor
>>>>>>> [    5.847540] The Jailhouse is opening.
>>>>>> Using a JTAG debugger I see that one or more cores are stuck in hype=
rvisor/arch/arm-common/psci.c, line 105.
>>>>>> It may also succeed in stopping one or more CPUs and then hang (agai=
n with one or more cores stuck in psci.c, line 105):
>>>>>>> [    5.810220] The Jailhouse is opening.
>>>>>>> [    5.860054] CPU1: shutdown
>>>>>>> [    5.862677] psci: CPU1 killed.
>>>>>> Has anyone else observed this? Any ideas on what may cause this? My =
gut feeling is that there=E2=80=99s a race condition somewhere, but it feel=
s like looking for a needle in a haistack.
>>>>>> Finally, if =E2=80=98jailhouse enable=E2=80=99 succeeds, a subsequen=
t =E2=80=98jailhouse disable=E2=80=99 followed by another =E2=80=98jailhous=
e enable=E2=80=99 always hangs the system (cores stuck in psci.c).
>>>>>> Otherwise, once =E2=80=98jailhouse enable=E2=80=99 succeeds the syst=
em is working fine and I can start, stop load and unload my guest inmate at=
 will.
>>>>>> To make matters a bit more complicated: My system is based on Xilinx=
 Petalinux 2018.2. For various reasons I=E2=80=99m stuck with the ATF versi=
on that comes with Petalinux (https://github.com/Xilinx/arm-trusted-firmwar=
e/tree/xilinx-v2018.2), which is a bit dated. To get SDEI to work I had to =
backport a number of patches from later releases. I am quite confident that=
 SDEI and EHF handling are now up-to-date with the master branch from Arms =
ATF repository, but there remains a chance that I missed something and the =
issues above result from something in ATF.
>>>>>=20
>>>>> OK, obviously that different ATF is another critical point, also in t=
he light of SDEI_EVENT_ENABLE failing.
>>>> Sure. If you or others haven=E2=80=99t ever seen the above behaviour t=
hen the issue is most likely on this side and I have to do another comparis=
on of my ATF sources to upstream.
>>>=20
>>> Theoretically, it might also be a hidden issue in the ATF patch itself,=
 just exposed by your different setup.
>>>=20
>>>>> Can't you get your board running with the upstream ATF version, just =
for the Jailhouse test? Then we would know better where to dig.
>>>> That was my first approach, but I didn=E2=80=99t get very far. With up=
stream ATF from Arm my (Xilinx enhanced) kernel doesn=E2=80=99t boot. Excha=
nging the kernel opens another can of worms, but I=E2=80=99ll see what I ca=
n do.
>>>> I managed to boot with ATF from master in the Xilinx repository. I als=
o had to update the PMU Firmware to make this work. The resulting system wa=
s acting strange in a number of ways. Jailhouse showed the same occasional =
hangs during intial CPU shutdown, but given the overall unstable system I a=
bandoned any further investigations and resorted to patching the working AT=
F.
>>>=20
>>> OK, sounds frightening, indeed. The overall degree of adjustments you h=
ave to apply to even get booting systems is, well, demotivating with that p=
latform.
>>>=20
>>> Anyway, pick the most reproducible effect, probably that failing EVENT_=
ENABLE, and try to debug that in depth in the hope to find a single magic r=
oot cause. Nasty things come with multi-cause problems, though, and I've se=
en too many already.
>> True, unfortunately.
>> Some update on the EVENT_ENABLE: I=E2=80=99ve enabled logging in the SDE=
I part of ATF. A successful init looks like this:
>>> Initializing Jailhouse hypervisor v0.12 (105-g5352a61b-dirty) on CPU 3
>>> Code location: 0x0000ffffc0200800
>>> Page pool usage after early setup: mem 39/992, remap 0/131072
>>> Initializing processors:
>>>  CPU 3... INFO:    SDEI: > VER
>>> INFO:    SDEI: < VER:1000000000000
>>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>>> INFO:    SDEI: < REG:0
>>> INFO:    SDEI: > ENABLE(n:0)
>>> INFO:    SDEI:  event state 0x1 =3D> 0x3
>>> INFO:    SDEI: < ENABLE:0
>>> INFO:    SDEI: > UNMASK:80000003
>>> INFO:    SDEI: < UNMASK:0
>>> OK
>>>  CPU 1... INFO:    SDEI: > VER
>>> INFO:    SDEI: < VER:1000000000000
>>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>>> INFO:    SDEI: < REG:0
>>> INFO:    SDEI: > ENABLE(n:0)
>>> INFO:    SDEI:  event state 0x1 =3D> 0x3
>>> INFO:    SDEI: < ENABLE:0
>>> INFO:    SDEI: > UNMASK:80000001
>>> INFO:    SDEI: < UNMASK:0
>>> OK
>>>  CPU 0... INFO:    SDEI: > VER
>>> INFO:    SDEI: < VER:1000000000000
>>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>>> INFO:    SDEI: < REG:0
>>> INFO:    SDEI: > ENABLE(n:0)
>>> INFO:    SDEI:  event state 0x1 =3D> 0x3
>>> INFO:    SDEI: < ENABLE:0
>>> INFO:    SDEI: > UNMASK:80000000
>>> INFO:    SDEI: < UNMASK:0
>>> OK
>>>  CPU 2... INFO:    SDEI: > VER
>>> INFO:    SDEI: < VER:1000000000000
>>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>>> INFO:    SDEI: < REG:0
>>> INFO:    SDEI: > ENABLE(n:0)
>>> INFO:    SDEI:  event state 0x1 =3D> 0x3
>>> INFO:    SDEI: < ENABLE:0
>>> INFO:    SDEI: > UNMASK:80000002
>>> INFO:    SDEI: < UNMASK:0
>>> OK
>>> Initializing unit: irqchip
>>> Using SDEI-based management interrupt
>> In case of an error in setup.c, I get this:
>>> Initializing Jailhouse hypervisor v0.12 (105-g5352a61b-dirty) on CPU 0
>>> Code location: 0x0000ffffc0200800
>>> Page pool usage after early setup: mem 39/992, remap 0/131072
>>> Initializing processors:
>>>  CPU 0... INFO:    SDEI: > VER
>>> INFO:    SDEI: < VER:1000000000000
>>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>>> INFO:    SDEI: < REG:0
>>> INFO:    SDEI: > ENABLE(n:536872211)
>>> INFO:    SDEI: < ENABLE:-2
>>> /home/oliver/hil_sw/petalinux/rtbox2/build/tmp/work/plnx_zynqmp-xilinx-=
linux/jailhouse/0.12-gitAUTOINC+5352a61ba5-r0/git/hypervisor/arch/arm64/set=
up.c:74: returning error err
>>> FAILED
>>> 10ININFNNFFFOOOO:: : :             SDS SDSDEEDIEE:I:I I>:   >:MA>   > S=
MMMKAAA:SSSK8KK:80:0:080008000000000000300
>>> N00I02
>>> O0FI
>>> F NO
>>>  S    :F SOI D NF:E  IS O:D: E   I< : S  D S<EM IAD: MSEA<IKSK ::M 0:A<=
0
>>> K
>>> SO:INM0NAFF
>>> O KOI:::N 0  F
>>> 0nG) I  NS SFDDO: E E IISD :E:    I>>:S  DUN EU>INR: E URG>E( NGnUR:(NE=
nRG0:E()
>>> (:nNF
>>>      :00OI): )
>>>   eE FIOSN:DFEO I: :     S< D  UESNDIER:E IG:< : U- N3evR
>>>   nGt:- s3t
>>> ate 0x1 =3D> 0x0
>>> 3INNFFOO::        SSDDEEII::  <<  UUNNRREEGG::-0
>>>  JAILHOUSE_ENABLE: No such file or directory
>>> JAILHOUSE_CELL_CREATE: Invalid argument
>> The interesting part is this:
>>> INFO:    SDEI: > ENABLE(n:536872211)
>> The argument seen by ATF for the ENABLE call is 536872211, but in setup.=
c it=E2=80=99s hardcoded to 0. The problem doesn=E2=80=99t seem to be with =
the ATF version, but with the SMC calling per se, which is very scary.
>> The garbled output also made me think if there maybe is a concurrency is=
sue in ATF.
>=20
> Something is interrupting this synchronous call, mangling registers and t=
hen returning as if nothing happened - I would say=E2=80=A6


Found it. The manging with the registers is caused by the SMC calls themsel=
ves.=20

Looking at the disassembly of setup.c I noticed that x1 was not reset to ze=
ro between the call to smc_arg5 (event_register) and smc_arg1 (event_handle=
). I believe this is because of the combination of =E2=80=98inline=E2=80=99=
 declaration and register arguments for the smc calls, which makes the comp=
iler assume that the input registers are constant and maintain their values=
 during the smc call. To fix this, the relevant registers (x0 to x3, if use=
d) must also be declared as output arguments in the asm instruction in smc.=
h. With this change, the SMC calls always succeed on my system. I=E2=80=99l=
l send a patch tomorrow.

The bad news is that it doesn=E2=80=99t solve the other problem where the c=
ores hang on initial shutdown.

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4FFCB12D-ED2B-4B04-BC8F-1BE1CB12B6E4%40gmx.de.

--Apple-Mail=_85AA0D37-011A-4CC2-B272-2896DAB9529C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 15 Sep 202=
0, at 17:23, Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" class=
=3D"">jan.kiszka@siemens.com</a>&gt; wrote:</div><br class=3D"Apple-interch=
ange-newline"><div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; dis=
play: inline !important;" class=3D"">On 15.09.20 16:09, Oliver Schwartz wro=
te:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans:=
 auto; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><block=
quote type=3D"cite" class=3D"">On 15 Sep 2020, at 14:02, Jan Kiszka &lt;<a =
href=3D"mailto:jan.kiszka@siemens.com" class=3D"">jan.kiszka@siemens.com</a=
>&gt; wrote:<br class=3D""><br class=3D"">On 15.09.20 13:49, Oliver Schwart=
z wrote:<br class=3D""><blockquote type=3D"cite" class=3D""><blockquote typ=
e=3D"cite" class=3D"">On 15 Sep 2020, at 11:00, Jan Kiszka &lt;<a href=3D"m=
ailto:jan.kiszka@siemens.com" class=3D"">jan.kiszka@siemens.com</a> &lt;<a =
href=3D"mailto:jan.kiszka@siemens.com" class=3D"">mailto:jan.kiszka@siemens=
.com</a>&gt;&gt; wrote:<br class=3D""><br class=3D"">On 15.09.20 09:07, Oli=
ver Schwartz wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">I=E2=
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
kquote></blockquote><br class=3D"">Weird - that the SDEI event enable call.=
<br class=3D""></blockquote>Yes, that=E2=80=99s a bit scary. The code invol=
ved in ATF is limited - I=E2=80=99m pretty sure that I=E2=80=99m up-to-date=
 with upstream there.<br class=3D""><blockquote type=3D"cite" class=3D""><b=
lockquote type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D"">FAI=
LED<br class=3D"">JAILHOUSE_ENABLE: Input/output error<br class=3D""></bloc=
kquote>I=E2=80=99ve seen this error only when I enable jailhouse through so=
me init script during the boot process, when the system is also busy otherw=
ise. When starting jailhouse on an idle system I haven=E2=80=99t seen this.=
<br class=3D""></blockquote><br class=3D"">Possibly a regression of my rece=
nt refactoring which I didn't manage to test yet. Could you try if<br class=
=3D""><br class=3D""><a href=3D"https://github.com/siemens/jailhouse/commit=
s/e0ef829c85895dc6387d5ea11b08aa65a456255f" class=3D"">https://github.com/s=
iemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b08aa65a456255f</a><br cl=
ass=3D""><br class=3D"">was any better?<br class=3D""></blockquote>No, I do=
n=E2=80=99t see any difference with that version.<br class=3D""></blockquot=
e><br class=3D"">Good and bad news at the same time, unfortunately ruling o=
ut a quick solution.<br class=3D""><br class=3D""><blockquote type=3D"cite"=
 class=3D""><blockquote type=3D"cite" class=3D""><br class=3D""><blockquote=
 type=3D"cite" class=3D"">Sometimes it may hang later during =E2=80=98jailh=
ouse enable=E2=80=99:<br class=3D""><blockquote type=3D"cite" class=3D"">In=
itializing processors:<br class=3D"">&nbsp;CPU 1... OK<br class=3D"">&nbsp;=
CPU 0... OK<br class=3D"">&nbsp;CPU 2... OK<br class=3D"">&nbsp;CPU 3... OK=
<br class=3D"">Initializing unit: irqchip<br class=3D"">Using SDEI-based ma=
nagement interrupt<br class=3D"">Initializing unit: ARM SMMU v3<br class=3D=
"">Initializing unit: PVU IOMMU<br class=3D"">Initializing unit: PCI<br cla=
ss=3D"">Adding virtual PCI device 00:00.0 to cell "root"<br class=3D"">Page=
 pool usage after late setup: mem 67/992, remap 5/131072<br class=3D"">Acti=
vating hypervisor<br class=3D"">[ &nbsp;&nbsp;&nbsp;5.847540] The Jailhouse=
 is opening.<br class=3D""></blockquote>Using a JTAG debugger I see that on=
e or more cores are stuck in hypervisor/arch/arm-common/psci.c, line 105.<b=
r class=3D"">It may also succeed in stopping one or more CPUs and then hang=
 (again with one or more cores stuck in psci.c, line 105):<br class=3D""><b=
lockquote type=3D"cite" class=3D"">[ &nbsp;&nbsp;&nbsp;5.810220] The Jailho=
use is opening.<br class=3D"">[ &nbsp;&nbsp;&nbsp;5.860054] CPU1: shutdown<=
br class=3D"">[ &nbsp;&nbsp;&nbsp;5.862677] psci: CPU1 killed.<br class=3D"=
"></blockquote>Has anyone else observed this? Any ideas on what may cause t=
his? My gut feeling is that there=E2=80=99s a race condition somewhere, but=
 it feels like looking for a needle in a haistack.<br class=3D"">Finally, i=
f =E2=80=98jailhouse enable=E2=80=99 succeeds, a subsequent =E2=80=98jailho=
use disable=E2=80=99 followed by another =E2=80=98jailhouse enable=E2=80=99=
 always hangs the system (cores stuck in psci.c).<br class=3D"">Otherwise, =
once =E2=80=98jailhouse enable=E2=80=99 succeeds the system is working fine=
 and I can start, stop load and unload my guest inmate at will.<br class=3D=
"">To make matters a bit more complicated: My system is based on Xilinx Pet=
alinux 2018.2. For various reasons I=E2=80=99m stuck with the ATF version t=
hat comes with Petalinux (<a href=3D"https://github.com/Xilinx/arm-trusted-=
firmware/tree/xilinx-v2018.2" class=3D"">https://github.com/Xilinx/arm-trus=
ted-firmware/tree/xilinx-v2018.2</a>), which is a bit dated. To get SDEI to=
 work I had to backport a number of patches from later releases. I am quite=
 confident that SDEI and EHF handling are now up-to-date with the master br=
anch from Arms ATF repository, but there remains a chance that I missed som=
ething and the issues above result from something in ATF.<br class=3D""></b=
lockquote><br class=3D"">OK, obviously that different ATF is another critic=
al point, also in the light of SDEI_EVENT_ENABLE failing.<br class=3D""></b=
lockquote>Sure. If you or others haven=E2=80=99t ever seen the above behavi=
our then the issue is most likely on this side and I have to do another com=
parison of my ATF sources to upstream.<br class=3D""></blockquote><br class=
=3D"">Theoretically, it might also be a hidden issue in the ATF patch itsel=
f, just exposed by your different setup.<br class=3D""><br class=3D""><bloc=
kquote type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D"">Can't =
you get your board running with the upstream ATF version, just for the Jail=
house test? Then we would know better where to dig.<br class=3D""></blockqu=
ote>That was my first approach, but I didn=E2=80=99t get very far. With ups=
tream ATF from Arm my (Xilinx enhanced) kernel doesn=E2=80=99t boot. Exchan=
ging the kernel opens another can of worms, but I=E2=80=99ll see what I can=
 do.<br class=3D"">I managed to boot with ATF from master in the Xilinx rep=
ository. I also had to update the PMU Firmware to make this work. The resul=
ting system was acting strange in a number of ways. Jailhouse showed the sa=
me occasional hangs during intial CPU shutdown, but given the overall unsta=
ble system I abandoned any further investigations and resorted to patching =
the working ATF.<br class=3D""></blockquote><br class=3D"">OK, sounds frigh=
tening, indeed. The overall degree of adjustments you have to apply to even=
 get booting systems is, well, demotivating with that platform.<br class=3D=
""><br class=3D"">Anyway, pick the most reproducible effect, probably that =
failing EVENT_ENABLE, and try to debug that in depth in the hope to find a =
single magic root cause. Nasty things come with multi-cause problems, thoug=
h, and I've seen too many already.<br class=3D""></blockquote>True, unfortu=
nately.<br class=3D"">Some update on the EVENT_ENABLE: I=E2=80=99ve enabled=
 logging in the SDEI part of ATF. A successful init looks like this:<br cla=
ss=3D""><blockquote type=3D"cite" class=3D"">Initializing Jailhouse hypervi=
sor v0.12 (105-g5352a61b-dirty) on CPU 3<br class=3D"">Code location: 0x000=
0ffffc0200800<br class=3D"">Page pool usage after early setup: mem 39/992, =
remap 0/131072<br class=3D"">Initializing processors:<br class=3D"">&nbsp;C=
PU 3... INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; VER<br class=3D"">INFO: &nbsp;&n=
bsp;&nbsp;SDEI: &lt; VER:1000000000000<br class=3D"">INFO: &nbsp;&nbsp;&nbs=
p;SDEI: &gt; REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)<br class=3D"">I=
NFO: &nbsp;&nbsp;&nbsp;SDEI: &nbsp;event state 0x0 =3D&gt; 0x1<br class=3D"=
">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; REG:0<br class=3D"">INFO: &nbsp;&nbsp;=
&nbsp;SDEI: &gt; ENABLE(n:0)<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &n=
bsp;event state 0x1 =3D&gt; 0x3<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI:=
 &lt; ENABLE:0<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; UNMASK:8000=
0003<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; UNMASK:0<br class=3D"=
">OK<br class=3D"">&nbsp;CPU 1... INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; VER<br=
 class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; VER:1000000000000<br class=
=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; REG(n:0 e:ffffc0206784 a:ff0000010=
000 f:0 m:0)<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &nbsp;event state =
0x0 =3D&gt; 0x1<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; REG:0<br c=
lass=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; ENABLE(n:0)<br class=3D"">INFO=
: &nbsp;&nbsp;&nbsp;SDEI: &nbsp;event state 0x1 =3D&gt; 0x3<br class=3D"">I=
NFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; ENABLE:0<br class=3D"">INFO: &nbsp;&nbsp;=
&nbsp;SDEI: &gt; UNMASK:80000001<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI=
: &lt; UNMASK:0<br class=3D"">OK<br class=3D"">&nbsp;CPU 0... INFO: &nbsp;&=
nbsp;&nbsp;SDEI: &gt; VER<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; =
VER:1000000000000<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; REG(n:0 =
e:ffffc0206784 a:ff0000010000 f:0 m:0)<br class=3D"">INFO: &nbsp;&nbsp;&nbs=
p;SDEI: &nbsp;event state 0x0 =3D&gt; 0x1<br class=3D"">INFO: &nbsp;&nbsp;&=
nbsp;SDEI: &lt; REG:0<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; ENAB=
LE(n:0)<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &nbsp;event state 0x1 =
=3D&gt; 0x3<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; ENABLE:0<br cl=
ass=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; UNMASK:80000000<br class=3D"">I=
NFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; UNMASK:0<br class=3D"">OK<br class=3D"">&=
nbsp;CPU 2... INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; VER<br class=3D"">INFO: &n=
bsp;&nbsp;&nbsp;SDEI: &lt; VER:1000000000000<br class=3D"">INFO: &nbsp;&nbs=
p;&nbsp;SDEI: &gt; REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)<br class=
=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &nbsp;event state 0x0 =3D&gt; 0x1<br cl=
ass=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; REG:0<br class=3D"">INFO: &nbsp=
;&nbsp;&nbsp;SDEI: &gt; ENABLE(n:0)<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;S=
DEI: &nbsp;event state 0x1 =3D&gt; 0x3<br class=3D"">INFO: &nbsp;&nbsp;&nbs=
p;SDEI: &lt; ENABLE:0<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; UNMA=
SK:80000002<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; UNMASK:0<br cl=
ass=3D"">OK<br class=3D"">Initializing unit: irqchip<br class=3D"">Using SD=
EI-based management interrupt<br class=3D""></blockquote>In case of an erro=
r in setup.c, I get this:<br class=3D""><blockquote type=3D"cite" class=3D"=
">Initializing Jailhouse hypervisor v0.12 (105-g5352a61b-dirty) on CPU 0<br=
 class=3D"">Code location: 0x0000ffffc0200800<br class=3D"">Page pool usage=
 after early setup: mem 39/992, remap 0/131072<br class=3D"">Initializing p=
rocessors:<br class=3D"">&nbsp;CPU 0... INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; =
VER<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; VER:1000000000000<br c=
lass=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; REG(n:0 e:ffffc0206784 a:ff000=
0010000 f:0 m:0)<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &nbsp;event st=
ate 0x0 =3D&gt; 0x1<br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; REG:0<=
br class=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &gt; ENABLE(n:536872211)<br cla=
ss=3D"">INFO: &nbsp;&nbsp;&nbsp;SDEI: &lt; ENABLE:-2<br class=3D"">/home/ol=
iver/hil_sw/petalinux/rtbox2/build/tmp/work/plnx_zynqmp-xilinx-linux/jailho=
use/0.12-gitAUTOINC+5352a61ba5-r0/git/hypervisor/arch/arm64/setup.c:74: ret=
urning error err<br class=3D"">FAILED<br class=3D"">10ININFNNFFFOOOO:: : : =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SDS=
 SDSDEEDIEE:I:I I&gt;: &nbsp;&nbsp;&gt;:MA&gt; &nbsp;&nbsp;&gt; SMMMKAAA:SS=
SK8KK:80:0:080008000000000000300<br class=3D"">N00I02<br class=3D"">O0FI<br=
 class=3D"">F NO<br class=3D"">&nbsp;S &nbsp;&nbsp;&nbsp;:F SOI D NF:E &nbs=
p;IS O:D: E &nbsp;&nbsp;I&lt; : S &nbsp;D S&lt;EM IAD: MSEA&lt;IKSK ::M 0:A=
&lt;0<br class=3D"">K<br class=3D"">SO:INM0NAFF<br class=3D"">O KOI:::N 0 &=
nbsp;F<br class=3D"">0nG) I &nbsp;NS SFDDO: E E IISD :E: &nbsp;&nbsp;&nbsp;=
I&gt;&gt;:S &nbsp;DUN EU&gt;INR: E URG&gt;E( NGnUR:(NEnRG0:E()<br class=3D"=
">(:nNF<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:00OI): )<br class=3D""=
>&nbsp;&nbsp;eE FIOSN:DFEO I: : &nbsp;&nbsp;&nbsp;&nbsp;S&lt; D &nbsp;UESND=
IER:E IG:&lt; : U- N3evR<br class=3D"">&nbsp;&nbsp;nGt:- s3t<br class=3D"">=
ate 0x1 =3D&gt; 0x0<br class=3D"">3INNFFOO:: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;SSDDEEII:: &nbsp;&lt;&lt; &nbsp;UUNNRREEGG::-0<br class=3D"">&n=
bsp;JAILHOUSE_ENABLE: No such file or directory<br class=3D"">JAILHOUSE_CEL=
L_CREATE: Invalid argument<br class=3D""></blockquote>The interesting part =
is this:<br class=3D""><blockquote type=3D"cite" class=3D"">INFO: &nbsp;&nb=
sp;&nbsp;SDEI: &gt; ENABLE(n:536872211)<br class=3D""></blockquote>The argu=
ment seen by ATF for the ENABLE call is 536872211, but in setup.c it=E2=80=
=99s hardcoded to 0. The problem doesn=E2=80=99t seem to be with the ATF ve=
rsion, but with the SMC calling per se, which is very scary.<br class=3D"">=
The garbled output also made me think if there maybe is a concurrency issue=
 in ATF.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0);=
 font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-=
caps: normal; font-weight: normal; letter-spacing: normal; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">=
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Something is interrupting this synchronous call, mangling registers =
and then returning as if nothing happened - I would say=E2=80=A6</span></di=
v></blockquote></div><div><br class=3D""></div><div>Found it. The manging w=
ith the registers is caused by the SMC calls themselves.&nbsp;</div><div><b=
r class=3D""></div><div>Looking at the disassembly of setup.c I noticed tha=
t x1 was not reset to zero between the call to smc_arg5 (event_register) an=
d smc_arg1 (event_handle). I believe this is because of the combination of =
=E2=80=98inline=E2=80=99 declaration and register arguments for the smc cal=
ls, which makes the compiler assume that the input registers are constant a=
nd maintain their values during the smc call. To fix this, the relevant reg=
isters (x0 to x3, if used) must also be declared as output arguments in the=
 asm instruction in smc.h. With this change, the SMC calls always succeed o=
n my system. I=E2=80=99ll send a patch tomorrow.</div><div><br class=3D""><=
/div><div>The bad news is that it doesn=E2=80=99t solve the other problem w=
here the cores hang on initial shutdown.</div><div><br class=3D""></div><di=
v>Oliver</div><br class=3D""></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4FFCB12D-ED2B-4B04-BC8F-1BE1CB12B6E4%40gmx.de?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/4FFCB12D-ED2B-4B04-BC8F-1BE1CB12B6E4%40gmx.de</a>.<br />

--Apple-Mail=_85AA0D37-011A-4CC2-B272-2896DAB9529C--
