Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD7SYT5AKGQEW4D23IY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CCB25C8E6
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 20:42:24 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id b17sf1263006ljp.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 11:42:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599158543; cv=pass;
        d=google.com; s=arc-20160816;
        b=YSNjXgiKRLMdK5SpG1GhtSm5ecFI/EBraWym5Bnsu/QmcRMfy4ZuMfotQabJ+bp/n0
         j70Dg4p+cUAv79GV2q6NbDr6wyzNEV3LMAFT7COEAFK5pSjgj5SOZIvDIXoBlzuGiKK5
         86c52iBjK4+OP4W6sFihF6xi9jrKsp5fPT3JYldDvm5lV4zh2+mie9Bzf19gmcDUR+Rp
         RsdkbpXqDeeO2FJlp2WGLRyqvfzucgi0/LAOkC/ubpxWWOLo+et4Inj926NQDQNX/sDZ
         Hwi4Kj80zTKomKBbkA0cgE5TrCF7OUhX72BU3nvy4PaIJgSxItTzW8MNEp9FwpD6otvX
         AqWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=dDPK2bGRUY06hZO+XazJOMDANRo3xM14swjdk9mKaqU=;
        b=RUGlKuN0Epp8uV1gTw+2Ub7kPZ1tkVOqW03wEk7AUWjfG+27JrvyCLUN66GzjFAWCp
         junjuPQZJ28v0OecSQqzwrpknDKe0PzmYcrjEoyw/D3ja/yVx+i84TD4ydbq/ghdxu6j
         CHYCe490aXp+M0nVBXINtiu44fUJHJLLHCOxJBc4GZXXJraes/GaDFNN12iS5f5GqgaR
         Yy2ChM5mpWJQgrIwHw3kWBThM4I6wKjAKGP5jIuPJP7Q/hR+JnnShPVe4fS65evIvWzH
         Xqcb1FxeUOzl/O+lVyqG7CY5Q+3mMjariMDitsWM9Ma29HXUOQPeLg+SUVUsqdNvytS/
         MaVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dDPK2bGRUY06hZO+XazJOMDANRo3xM14swjdk9mKaqU=;
        b=XbvsVAOUgbsTeUZp7UxtU5lVdC0pZeXH5kYBSeJ66OKFyO/mMlaGUG7ztJ4jfrAOaw
         PV5ApZS+2clDjWN3v1bWWiMyI+HVnMQ/7o7/JQLXq3JykN1p3wnhhcGyspuMLqipTuJP
         rB7hYMUfbB4Ej43b3Wk4bGiEuMOMWsA4W4AIC/Zi1drvb3MRe4VLwA9A8xxi5FOytp/E
         ELW8VAz2hSc4flPmBGS1m7yAeopSk3t4JZdPk8QhMOVoAufmImueAfm+nkatXcP59T3Q
         itfN2/cLCxq5TsZz58DeyzVd5REq+mwYD3BCPQZvyJOnzuS0ng7eHDDIIRhN0L0ApPqy
         AKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dDPK2bGRUY06hZO+XazJOMDANRo3xM14swjdk9mKaqU=;
        b=sEG5+iO0uik2sUzcRpRbj8vm2fYMbq/JnI242eh2jKZDpS0krDS08Y20XZV0RJx5PD
         oelDBUTmj7GvOswsHpO53UXrwzD5Yagom0+v6Yv2+UKYrhxSQYbPygIVSbRdXPPg+mOZ
         ETbQX8DNQX9HMtY+zMZGCOAd2XACpfFlyEdoJYK6ydDW5qAZ+YAxBsUUilt6Td3/Ow66
         L4SGqPFn+tA6rpz3EFpCt67ACzFyYp/YFmRpBNdkHOvf0sAysCM31BslybYCuqTzzosM
         eL5qeAGp5VsthdvBUGPcN15x4UcfM5cv7ok1uDNgPfaJHe7Y9i9hVCJW1TQhMbQPihOH
         7zLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5314+pzyn6kT0U8Mv0RQvVU0SFVLF9Ye/o6iG0T3uzFRlqqtuJtv
	oBc5zZyZXIg7zIyX3J72yJQ=
X-Google-Smtp-Source: ABdhPJxLsa5DoHo1lusQ5Lf8rLgDNtYXV7GantJj0t234SC3E6e7NnJV2dnzL5VpYVu3CTRCGaS6ow==
X-Received: by 2002:a2e:5357:: with SMTP id t23mr961383ljd.394.1599158543502;
        Thu, 03 Sep 2020 11:42:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2c01:: with SMTP id s1ls276227ljs.10.gmail; Thu, 03 Sep
 2020 11:42:22 -0700 (PDT)
X-Received: by 2002:a2e:854b:: with SMTP id u11mr1847954ljj.55.1599158542277;
        Thu, 03 Sep 2020 11:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599158542; cv=none;
        d=google.com; s=arc-20160816;
        b=gKBtRweo+uf+qwaMo/w0jhKdgxgAUfKASjDQbpyCW8TwDVuNUlHTtBJ9yUsooXkvfM
         s8rJjt49fWQF2aMhDBcnBXvWzfNbkb+V7VVd8WQ+JSJYgJnvynMJcLADb7Vj6sl4zlrD
         FzszSNxWxvSLq1ek+Uv1E/20P/uRD5465iKmbVfEINKq89aDUl5tnEkfgm6WsjpLUM4p
         FaxaUKBQdzfjEUUsPoy0mvKM+QMpLodNvqOmXrh62zY/URSBrvzRWfTNe2obkQQUV6Wj
         b+0ZEIrVT8tahwArHkIvB26X7SNSra/pTrWgJ0QW4VVa3TffVF/Koa/ZL1ZyGKKjR7t3
         C+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=UL/3f14Gfg4GtHgubm8xxyo/uFnPW1C/qpKKHAdXvFU=;
        b=t06nCtphXfJqVdU+65O7fn1Nqh4SuczQ0V3sa92U5RgNSWC5uAenwMQu+8aHktv38M
         bHrqSIdd6v1YNyZkTBmB3GY/8W4vsp0lh5Vl06bcN8/zssdFMTmrDAtkbcEDDxcV+BB5
         DdCVfTTZ2PecjWDHLNx57XdHcAbXAi3utPw1ZZKzw3Tuh98Km3D1gf+6i9WDX4rCePLi
         +/FawggeEwvxAR8KP5pR6nrYbyhXHGE9IsdoxuvgtokDAIdQkWv5JiCOZnm8jE7+7Vv3
         q6v8Rs6kF9OnvPV31fsKX1WmYuT6UfuAuVoqxsd8QOeLy5oWsl4ADPb+jMMqzd2x72E7
         TUHw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z6si137810ljz.8.2020.09.03.11.42.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 11:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 083IgKXw029441
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Sep 2020 20:42:20 +0200
Received: from [167.87.132.24] ([167.87.132.24])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 083IgI02010112;
	Thu, 3 Sep 2020 20:42:19 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
Date: Thu, 3 Sep 2020 20:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 03.09.20 19:28, Jan-Marc Stranz wrote:
> Thanks!=C2=A0
>=20
> Is the entry "intel_iommu=3Doff" still needed for x86_64 targets?

Yes, that applies to "running Jailhouse", just not to "checking hardware
compatibility".

Jan

>=20
> Best regards
> Jan.
>=20
>=20
> Jan Kiszka <jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>
> schrieb am Do., 3. Sep. 2020, 19:01:
>=20
>     On 03.09.20 15:07, Jan-Marc Stranz wrote:
>     > Hi Jan!
>     >
>     > I've moved to another target with "Intel Core i7-8559U".
>     > This CPU supports "VT-x" and "VT-d".
>     >
>     > Doing a hardware check I get the following messages:
>     >
>     > Feature=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Availability
>     > ------------------------------=C2=A0 ------------------
>     > Number of CPUs > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok
>     > Long mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ok
>     > Traceback (most recent call last):
>     > =C2=A0 File "/usr/libexec/jailhouse/jailhouse-hardware-check", line=
 147, in
>     > <module>
>     > =C2=A0=C2=A0=C2=A0 iommu, _ =3D sysfs_parser.parse_dmar(pci_devices=
, ioapics,
>     dmar_regions)
>     > =C2=A0 File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_par=
ser.py",
>     > line 377, in parse_dmar
>     > =C2=A0=C2=A0=C2=A0 raise RuntimeError('DMAR region size cannot be i=
dentified.\n'
>     > RuntimeError: DMAR region size cannot be identified.
>     > Target Linux must run with Intel IOMMU enabled.
>     >
>     > I'm using Linux Kernel 5.4.61 with the patches and config options f=
rom
>     > "jailhouse.cfg".
>     >
>     > The kernel command line contains "intel_iommu=3Doff" (as specified =
under
>     > "Software requirements" at https://github.com/siemens/jailhouse).
>     > I've also tried "intel_iommu=3Don" but without success.
>     >
>     > What is the reason for this again?
>=20
>     I could be that your kernel does not support what is needed to check =
the
>     hardware. It may still be fine to run Jailhouse. Do not invest too mu=
ch
>     into the checker - or use a regular distro kernel for the check (whic=
h
>     may also partially fail these days due to CONFIG_STRICT_DEVMEM).
>=20
>     > It's very difficult (at least for me) to get jailhouse up and runni=
ng.
>=20
>     Focus on the configuration, not the checking. In fact, the checker ha=
s a
>     decreasing value because (x86) hardware shipped in 2020 has all featu=
res
>     we need, practically always.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/CAOOGbpg5t1ykh1OaS_rKXMzf=
L2u9F%2BigLuoA3wSg4boAhxtuWQ%40mail.gmail.com
> <https://groups.google.com/d/msgid/jailhouse-dev/CAOOGbpg5t1ykh1OaS_rKXMz=
fL2u9F%2BigLuoA3wSg4boAhxtuWQ%40mail.gmail.com?utm_medium=3Demail&utm_sourc=
e=3Dfooter>.


--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9ff0b838-a854-3ef0-6487-dbda6d488184%40siemens.com.
