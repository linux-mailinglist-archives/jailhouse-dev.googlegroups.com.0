Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUGX4PVQKGQEUVZ7UEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C70AFCFA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Sep 2019 14:42:56 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id c2sf12510821edy.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Sep 2019 05:42:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568205776; cv=pass;
        d=google.com; s=arc-20160816;
        b=awiILXl+KSJGPUhoRpuYvG8+RKLx5ARlehq998yitRDuYg4apYn1OiVL1tPL6EL3/3
         9wGjAP7H70jVkkegm9MieCSUwXSTBim3D55ps67CAcxBg6CFISH1xsKbNq+Em3HN/IO4
         ovaZ5MDcTrUbR8JEyB4amlMqS5vgivROM7FYD03Q+wY23GJmDX5ZmkCi/GwOlnocjZDh
         X8RO/eV7Rg1FYqA+xiSzwe9TNKBKTD1ShPqXUuBf0kk2+1IzJ1mG03W+/GOwTS1seufC
         3/231mlX5xfFHNAzHlrBm43RPEQHgJafIpSzyoovkOmvpds7IGy8UMkB7AAIqKffIOm5
         jgng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=cP17npOqViqhEB3JBX21u07XxbuiDEOsF9QxWmoZTIE=;
        b=wWP+mfpGteSG9bfZNjpuTMhAVByIsvUjCF4GO7RUlIGm3oj+l2P5vvVP+bWc4W1VaU
         hQuWajLvKP92/EVkjQzCYnEttdyspFmJ0qYnClELysm7jLrAA/+miapQc9Vcfv1FEZji
         qR34Si4WEAAgI+H/EYQpkNDqt5yaqQjPjEy8c+WBQRPYy57Q1JJ/L6psvlnRGXZUoJZ0
         PdDtCSiSEc7NhZXJFYz0FfGMeijV29T4FzxF/fDCdaqND1oXoBXsmAKVbS2EK9BfJjvr
         txF8tV2yIWwBow050I21YRvhJVwEDmnjGNJNeBnC0+GfiI5bCX5mfq4sIUFUtJtEDJWV
         GrBg==
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
        bh=cP17npOqViqhEB3JBX21u07XxbuiDEOsF9QxWmoZTIE=;
        b=bURTKLHjAijGqUgNjsPZ898MGzgx/jl2I80NBq0chK+mv/uXZx/3yMOxLFtRhy+Djv
         6Xu4nUVzOLuDtvnMTjw63SKbxAxEljZfJsHnL3FnrWFWG9PItlUTBHYpyr3Wwjh3vq+I
         K0Pv4aV+rPICuLqEwU2ArpLuob+497Fexarct7Hg/8DsLen6nMPug183iVSzCowq5iy3
         6saE6Uca1R998WGrIC00u6kTJ7gBBftLBjan+LqlUpF+KzAexrKs5SlH+Cav5V4dSSN5
         +nLvYLS5pfXGdP7WQ0Nf3+tmPYhJodZeiPfKA2h6ASgcHfxK9AcW1NpAac20iEkfzmG/
         faLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cP17npOqViqhEB3JBX21u07XxbuiDEOsF9QxWmoZTIE=;
        b=qGdsX7sz5asuDDnUvOIony0+6em0hS+zsaVhIyKrTaZHvjmvmHlKnjkN+MEX4tdZz+
         tcYfrcKsPDLZzoME2n8ItTjNSrWil/wAJ8CtT3LNEACyfgSpZ5nRZrGmVBCrHmqvZvpX
         lbi30UYxNlRK3Ky16cTZorNhvO78GJg5S/uqbCCjY6wP04mbmvmvmVQTftgRN7Xexug6
         wJXRI4JVpQIVOyUD5UFsoRWv2kiQ5gDJlGDEKTBRWsW/p5yBaIgDIv15JiW5vV0r4u0O
         u3oR/7IzQzWpxQh9vPtyJ/6eX823ol8gXe9q7rbonsshphKZI7xgt389d1RVZoZKiIBV
         BDcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0GzidAb8rX85O+FNb9qPcUXnXhNOU7+opHd9pg8HSyNey1hKj
	OIwS3U+pbwyrqlppx1Y8NaE=
X-Google-Smtp-Source: APXvYqz9EQXOe0YGawsqUy2yFWEte44FMfsz5JBMuX7Jzfjc/U4HnzTcOpdDiD+RpSS1i47S9eZV6g==
X-Received: by 2002:a17:906:d216:: with SMTP id w22mr12321744ejz.14.1568205776476;
        Wed, 11 Sep 2019 05:42:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:265a:: with SMTP id i26ls4629131ejc.16.gmail; Wed,
 11 Sep 2019 05:42:55 -0700 (PDT)
X-Received: by 2002:a17:906:8317:: with SMTP id j23mr29132657ejx.270.1568205775739;
        Wed, 11 Sep 2019 05:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568205775; cv=none;
        d=google.com; s=arc-20160816;
        b=vQSVt1jfysje6Psols/vPAhe/0A0SIXy5PEr6d2p7r64ncxPlwFk/wHiLjiXKPWQFf
         yROF/TagOA6RPhjoVs5Vq4DgvOhI3oyxk7XaKUTHpwjUK32Hxf+UxUCZtR8VguwekkEn
         5QZcTAGQTgcPDKPLNW2T3DuOaoig1otR905dzT/6pDkzPMJT8SNtTI0v1xy4he93Yd3f
         6lp5AJNu30qKc4Oki/a0jJqN82guNWI2lpH1pWlbqS5Id3aIbNqBZLzEpSXI8gzxisMv
         jWApVGeN84N3i7rFcQsRLgj9aMyAuOFit2/gIHdTR/Zc21OFuzGaOI74xkSYZnkGA7Ty
         5sbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=kwvpHXfi3bw4WFnQfgvdnXtKiPL7eKbGVoIub5xafhs=;
        b=VAC0xzGFUuOvPYDnEiEtGQ4hxFSMgKdRDWwIPROUqhxo8f3eyv22jHcJ4TYh1Lfj6g
         SRmx3OxiaewH6Tf3y+NcdntxDM8w33m5aoAMsuHWX9prtKbnvbmzuEwTZtjeleUPtiIt
         gKaN2bZK9G0XTu7a0sqm4EwFHZWRdLk+wgQMXFHHCDUpnKCidD5INjIrpvg9HpPpwiBB
         FaBGxOzhl6SENvIBe7cUmEz3jzILx1qhnko4n9uolK1kqkW0ZTeRTclmaYI03s0RY1AX
         FapLjR/bC31Ci4FzSe99uzt64nFUKE3e3Sit6scgthnQYw56Q0VPU0XzUfVVJPjP9hcc
         rIoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z31si1545846edc.2.2019.09.11.05.42.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 05:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x8BCgt37029096
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2019 14:42:55 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8BCgsOX010655;
	Wed, 11 Sep 2019 14:42:54 +0200
Subject: Re: Compilation error (jailhouse.c) in Yocto build
To: Peter Smith <salerio@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <e5e387e0-eeba-4719-bf73-5e16f65f4d63@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <00e5a697-7301-25f8-494d-04aa43d0b343@siemens.com>
Date: Wed, 11 Sep 2019 14:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e5e387e0-eeba-4719-bf73-5e16f65f4d63@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 11.09.19 13:23, Peter Smith wrote:
> Apologize if this is a stupid question.
>=20
> I am trying to build jailhouse as part of a Yocto (thud) build for the US=
+=20
> MPSoC. I have based my recipe on one found in meta-ti/kernel/jailhouse as=
 it=20
> seemed to be the most up to date recipe I could find.
>=20
> The recipe builds using the following:
>=20
> EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX}=20
> KDIR=3D${STAGING_KERNEL_BUILDDIR}"
>=20
> do_compile() {
> oe_runmake V=3D1
> }
>=20
>=20
> Everything proceeds well until the make process reaches the tools directo=
ry=20
> where I get a compilation errors complaining about a missing <stdio.h> wh=
ich Is=20
> rather odd I thought.
>=20
>=20
> |=20
> /build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhouse/0=
.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse-gcov-extract.c:13:10:=20
> fatal error: stdio.h: No such file or directory
> |=C2=A0 #include <stdio.h>
> |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~
> | compilation terminated.
> |=20
> /build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhouse/0=
.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse.c:14:10:=20
> fatal error: stdio.h: No such file or directory
> |=C2=A0 #include <stdio.h>
> |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~
> | compilation terminated.
>=20
> So my question is, is this expected behavior?
>=20
> Can the tools be built via Yocto?
>=20

Sure, you can. There have been various layers shared in the list before, ch=
eck=20
e.g. this thread:

https://groups.google.com/d/msgid/jailhouse-dev/CABPcKDPEVAW0Y1x8ndpc6LQutq=
8cCsEKu20inFyFhrMRwa%2B--w%40mail.gmail.com?utm_medium=3Demail&utm_source=
=3Dfooter

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
jailhouse-dev/00e5a697-7301-25f8-494d-04aa43d0b343%40siemens.com.
