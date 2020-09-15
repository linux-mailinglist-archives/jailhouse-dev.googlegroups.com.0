Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2O2QL5QKGQEAPK74NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2203126A498
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 14:02:50 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id x14sf1153259edv.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 05:02:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600171370; cv=pass;
        d=google.com; s=arc-20160816;
        b=c6GraqekLLZwGpkipHFKbkgYT5u+7KjzgbXV1p4d29moNzpBbDd0as7XUynZhKav+e
         Yj9yuu65d+769Ml6+XD1oJ6zxCeDEzezAWYvaINfxE2Oiwb65HE4FYNvtFz3njC4z6ur
         lJ0pVDNRPs39mM4v0TeJMcyUN+/PvJkuQJFf7dapahNXsUEsWDmyuYjqUN+4RdjLdQV/
         8kAnf1Mg0c/eiveIsjchkZnZypIJBWdFFc2FV92bkcFdW/uV1rfeXa+G1NJooujq1wX6
         MVakgKoDoB/j1RRPDRTRQvdx4YvNbzbOWySfhnQLk5BJVqsqiv8z5s8W0rGhveBrn73W
         oodQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=+XvLaFT33JcmkBAMLhrh1SNj7I+m4AB4Zl8AVG4C/aE=;
        b=U8tV5dg9PyBsmS4i+dQd1+dNjzEHHyoQPBG0KkS0WSBR7Ar/f12mP0eIvZa/mInWW1
         QtriYFoIgv1UQMS33FLQBCmCApQkmucuwhtzREMxhDBTGUlTHG5CUN0zP7VdGTJQZjs8
         uJipyqTNWTHTH5QoWx8jAUYh3Ir7FY7o+4mP97gjcDRCPZju39xsGoKB2kAzfyY5qmb4
         1GzxlE6pvulvf1alaNhihTNAFJaa2lLAdNADjz+0ocqklbSpDx9Zkc3ox6MmzeZCfLTM
         oOlQeMwi/l0KQKg+lF4TEMLEcYsmElV4CzEQwT9ISKMZIDhAbodl/oDCP2nMmVVD9VMy
         XYjA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+XvLaFT33JcmkBAMLhrh1SNj7I+m4AB4Zl8AVG4C/aE=;
        b=jZhT5uQbmyTOeS++mIEI5cOVBVb8ZKCgheT2YK955Xxw2yHd90PA24JndA7QOyrVB6
         B0DFMM+lk1CNyztACUP1Qe0ouIw5wNYkrOqY9DZp/CTQeYGNAGg5WW0oSQb2m2YZNWc6
         LoaoQlN6yLTpclr0GF9t5snSPJbD3vaEXD0S+CzNI7YnADNYZZe3BRw2m2jB/wrPjkSd
         96r7WE8NO6crTIKHe6wYsRHSkNUrzZENR2ndOUK/k/3vK3IknUD8r6GsFydwgww0fu23
         /9lhyARdpAzi+COSsD5EEv1z8LrXo4pFtNiulnCJT+5rkPqD5aAHcjHiQuP/BvV2nvKT
         YCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+XvLaFT33JcmkBAMLhrh1SNj7I+m4AB4Zl8AVG4C/aE=;
        b=PUJTaJ2hDxp9pzcuhNHMsVrNta/bhsGquypTCCg26Ge4mA2bycWu5rkwhc4LcE+IXk
         pdA1U6Vd/qtQeZrY7MTIiZ15ChcmSpa0n7qohUi+m7ChuTBo4I1cj5YzcBxggJ4JxHMh
         i5ulyaE85yEsH6PanRioylaRw2XeQa0v4Gc1yxUV+Pw777N9lSWI6LehuVeoW9uG1asz
         WTDRVMQAXm0yRD1Qrofxu/ePM+hs8LsMtou3d6ReGx8N49jz6fTilt+douNskqKDGhmz
         IWY/msDRJLaE2NgkSUpIhF2aUWILr6XC8lt8rlt9z1Tn3TB/GHbeJIHsDOYEoXhpFqwn
         5gWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530T9d1sWR8Cgb8zGinl7t4UxfWvfxu6AIy+iCsh0EKkRLfLygwG
	fd8FTPg2ltM/oWpHBJP8iO8=
X-Google-Smtp-Source: ABdhPJw4Yk6t+140rECjQmfPXC2KgoGzQgBFapecTPspbJKkwwzQsnX7nbeRNX/cNdLQ/K4WeY6rcw==
X-Received: by 2002:a17:906:5611:: with SMTP id f17mr20795993ejq.427.1600171369829;
        Tue, 15 Sep 2020 05:02:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c9c2:: with SMTP id i2ls2700969edt.2.gmail; Tue, 15 Sep
 2020 05:02:48 -0700 (PDT)
X-Received: by 2002:a05:6402:3075:: with SMTP id bs21mr22265381edb.236.1600171368555;
        Tue, 15 Sep 2020 05:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600171368; cv=none;
        d=google.com; s=arc-20160816;
        b=AG9Hn5xMIhmauZvCTFkkuw0k+PYLtcnUfL7cfhZcAM2lESMkuvhre+Mx1wdvUgEeEI
         8EZVScUmMPNsJ98C1PML64LRJOGXS+34KIFbzi1pFU/BA4aCtbxXZlOpnf/2tBMdSuCs
         xrgQgcPMAtPwVNALCGfCjrF2xlIG0302RNP/A9SlRbq6rFVUxvJaUQTx29GArMwxYjhE
         9IlZriO9IgkCfww13HsynUqCXdiN5qJ/JBUg9g1eCOOW/uv7bwRv7SOgAyxyV9BuPWab
         EduFbK7zTO6OxYj+GSARvjvPGdnAp5uK+3nfNVNlTHulbgp9o3n2gVgQHIXpZcL2zHtv
         hOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=wXyG8wnHJsevJ04jT1rd6A7Lgrpuf/kVBEanNa/+lq4=;
        b=VvwqI1CFA7YOZSp7kpQIIV7X+MBDf+vf4l+4SE+Odf8CtloPPcJvqF8Xf+EgZLvObe
         pC9s8Csc3wDT5EJ5xUsZa4f8yi88yeHTFnaPVj2hOvOTwWJJMgjIlset/3GOjAuRDKtY
         18wL71ELjKR/B7IuXvs5RzsdwONNvFAdEaBvekrcK4y3UmXvwEkUrelIPXrxsjsjl6wt
         pB9Xlp3HheWso0p2mh0hEV1cCX6qRmDYorerVocL9rfYMBcBQE6bW/Ll7UJCAyhoASWH
         b9LpdgAKLyVp3QZ2Tn3VPRWU9xafXHmxYv0/yhWRq6Zr61dnA3mpQCv1mRShvKjBfgPh
         V36w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f17si444958edx.5.2020.09.15.05.02.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 05:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 08FC2lPF024009
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Sep 2020 14:02:47 +0200
Received: from [139.22.115.152] ([139.22.115.152])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08FC2lAQ030045;
	Tue, 15 Sep 2020 14:02:47 +0200
Subject: Re: arm64-zero-exits trouble
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <9F8CA946-F83A-41A8-A12E-B6FF06FA9B37@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <33c9ad9c-41fc-2ebf-7f4d-cad19bab8135@siemens.com>
Date: Tue, 15 Sep 2020 14:02:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9F8CA946-F83A-41A8-A12E-B6FF06FA9B37@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 15.09.20 13:49, Oliver Schwartz wrote:
>=20
>=20
>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com=20
>> <mailto:jan.kiszka@siemens.com>> wrote:
>>
>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got st=
uck.
>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=80=
=99ve=20
>>> brought ATF up to date and patched it with Jans patch to enable SDEI.=
=20
>>> If I don=E2=80=99t enable SDEI in ATF everything works as expected (wit=
h VM=20
>>> exits for interrupts, of course). Jailhouse source is the tip of=20
>>> branch arm64-zero-exits.
>>> If I enable SDEI in ATF, jailhouse works most of the time, except for=
=20
>>> when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 =
results in:
>>>> Initializing processors:
>>>> =C2=A0CPU 1... OK
>>>> =C2=A0CPU 0...=20
>>>> /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor/arch/arm64/s=
etup.c:73:=20
>>>> returning error -EIO
>>
>> Weird - that the SDEI event enable call.
>=20
> Yes, that=E2=80=99s a bit scary. The code involved in ATF is limited - I=
=E2=80=99m=20
> pretty sure that I=E2=80=99m up-to-date with upstream there.
>=20
>>>> FAILED
>>>> JAILHOUSE_ENABLE: Input/output error
>>> I=E2=80=99ve seen this error only when I enable jailhouse through some =
init=20
>>> script during the boot process, when the system is also busy=20
>>> otherwise. When starting jailhouse on an idle system I haven=E2=80=99t =
seen this.
>>
>> Possibly a regression of my recent refactoring which I didn't manage=20
>> to test yet. Could you try if
>>
>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b0=
8aa65a456255f
>>
>> was any better?
>=20
> No, I don=E2=80=99t see any difference with that version.

Good and bad news at the same time, unfortunately ruling out a quick=20
solution.

>=20
>>
>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99:
>>>> Initializing processors:
>>>> =C2=A0CPU 1... OK
>>>> =C2=A0CPU 0... OK
>>>> =C2=A0CPU 2... OK
>>>> =C2=A0CPU 3... OK
>>>> Initializing unit: irqchip
>>>> Using SDEI-based management interrupt
>>>> Initializing unit: ARM SMMU v3
>>>> Initializing unit: PVU IOMMU
>>>> Initializing unit: PCI
>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>> Activating hypervisor
>>>> [ =C2=A0=C2=A0=C2=A05.847540] The Jailhouse is opening.
>>> Using a JTAG debugger I see that one or more cores are stuck in=20
>>> hypervisor/arch/arm-common/psci.c, line 105.
>>> It may also succeed in stopping one or more CPUs and then hang (again=
=20
>>> with one or more cores stuck in psci.c, line 105):
>>>> [ =C2=A0=C2=A0=C2=A05.810220] The Jailhouse is opening.
>>>> [ =C2=A0=C2=A0=C2=A05.860054] CPU1: shutdown
>>>> [ =C2=A0=C2=A0=C2=A05.862677] psci: CPU1 killed.
>>> Has anyone else observed this? Any ideas on what may cause this? My=20
>>> gut feeling is that there=E2=80=99s a race condition somewhere, but it =
feels=20
>>> like looking for a needle in a haistack.
>>> Finally, if =E2=80=98jailhouse enable=E2=80=99 succeeds, a subsequent =
=E2=80=98jailhouse=20
>>> disable=E2=80=99 followed by another =E2=80=98jailhouse enable=E2=80=99=
 always hangs the=20
>>> system (cores stuck in psci.c).
>>> Otherwise, once =E2=80=98jailhouse enable=E2=80=99 succeeds the system =
is working=20
>>> fine and I can start, stop load and unload my guest inmate at will.
>>> To make matters a bit more complicated: My system is based on Xilinx=20
>>> Petalinux 2018.2. For various reasons I=E2=80=99m stuck with the ATF ve=
rsion=20
>>> that comes with Petalinux=20
>>> (https://github.com/Xilinx/arm-trusted-firmware/tree/xilinx-v2018.2),=
=20
>>> which is a bit dated. To get SDEI to work I had to backport a number=20
>>> of patches from later releases. I am quite confident that SDEI and=20
>>> EHF handling are now up-to-date with the master branch from Arms ATF=20
>>> repository, but there remains a chance that I missed something and=20
>>> the issues above result from something in ATF.
>>
>> OK, obviously that different ATF is another critical point, also in=20
>> the light of SDEI_EVENT_ENABLE failing.=20
>=20
> Sure. If you or others haven=E2=80=99t ever seen the above behaviour then=
 the=20
> issue is most likely on this side and I have to do another comparison of=
=20
> my ATF sources to upstream.

Theoretically, it might also be a hidden issue in the ATF patch itself,=20
just exposed by your different setup.

>=20
>> Can't you get your board running with the upstream ATF version, just=20
>> for the Jailhouse test? Then we would know better where to dig.
>=20
> That was my first approach, but I didn=E2=80=99t get very far. With upstr=
eam ATF=20
> from Arm my (Xilinx enhanced) kernel doesn=E2=80=99t boot. Exchanging the=
 kernel=20
> opens another can of worms, but I=E2=80=99ll see what I can do.
>=20
> I managed to boot with ATF from master in the Xilinx repository. I also=
=20
> had to update the PMU Firmware to make this work. The resulting system=20
> was acting strange in a number of ways. Jailhouse showed the same=20
> occasional hangs during intial CPU shutdown, but given the overall=20
> unstable system I abandoned any further investigations and resorted to=20
> patching the working ATF.

OK, sounds frightening, indeed. The overall degree of adjustments you=20
have to apply to even get booting systems is, well, demotivating with=20
that platform.

Anyway, pick the most reproducible effect, probably that failing=20
EVENT_ENABLE, and try to debug that in depth in the hope to find a=20
single magic root cause. Nasty things come with multi-cause problems,=20
though, and I've seen too many already.

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
jailhouse-dev/33c9ad9c-41fc-2ebf-7f4d-cad19bab8135%40siemens.com.
