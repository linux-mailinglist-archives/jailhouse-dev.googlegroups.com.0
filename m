Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJVR5TUQKGQEYAUZI3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id B217376C6D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 17:13:42 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id g8sf25812761wrw.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 08:13:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564154022; cv=pass;
        d=google.com; s=arc-20160816;
        b=lekUaWy3UJUt/L8OMo9zYKMsvw8seRCzpv3Rm+rDHJ/WfKyX/4sP4PPcCKd4EZWDkO
         /Bx7v36jF5j14zntSnMg2jzXjVATmPFN7U279YPIkhNwqFwWhkkm5hyPFCIL5sx5/NDV
         dHYkpvwy/xrc6TRX0wxP31Rs7KGGzZG890biM7rtzdxnCeN6N4A8lMRCryZj0p2DB+1d
         t0mL1R7o/9FobxuyTPxtY3aagxmBpQ17wcz7/mNac74Eoautwrn1LQhoIPulf90SjuoU
         Bu8wGIiJzXMbFwWsM5gqjU/iunfixhmjNtip0rYLEC5HQ2ibb4yL/9HkZjXirj0o45xH
         /AMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=1rXZA8+Dje4QhsthCx2K8vN/wPaWvvebc74WUGDhx1o=;
        b=i9UFKKKnqA2uUlRq61RPhpRsimNo2UjhxbGNJ2j+jlhrc0gQat/E033GGdDWFDfpoF
         cD7kY0bej2BTlP01KCmQ1S00bY4cwbWBffvBhGOsFiyT1SvanMNizQDxMaXeN1FScrjF
         0cl6AQT6+5jmYczJlq1GQCjTa13CGr5z0c2W8eGdWZbHFMTqGV/GUnQNn5/4Sd0f7ZHb
         mzb3ZVO32ZiZFNyH/ZQNNQM4PDLMsQ6m6u4xfHQnwTHW6K7wl5W28SY4oRPG322WRfBO
         +IOWVcGsKHRra3bLG5IemFd7pyuCys6jYfzJlk16niFjwBff4AJjkBl9TdMshdIuc12v
         viRA==
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
        bh=1rXZA8+Dje4QhsthCx2K8vN/wPaWvvebc74WUGDhx1o=;
        b=pgCoU8HKvObBmlS5vVWO3R4nF2w7Yz5Yy1OoYdx3yxiWj4HCLz4GgTzQRAyOlusVBn
         yMREN9tC6ApW7peY+vKuYlPLUmt88NmiWzdgjqk3gJBT71vsVpQP/IVKsnJrG+SnDvUQ
         F8BJag5Fto/owRDlIjQr2l19AOGQL9+VjRcnm7HhzE41Qz3mtmF0ABzLB0YPznJb2MWm
         2vMf/ogmvz1RJbTSlOZpL/fccqcKHMA0Ao89mtdPaM9rwXlPuv0a40L5cKbDYBYLLc5R
         hYP2SkIgoqm2ztDraDqf0xQ2RtavfpTfOGONRGkQChYmApuz7KYKluGY4OQGsKI6McRt
         4KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1rXZA8+Dje4QhsthCx2K8vN/wPaWvvebc74WUGDhx1o=;
        b=sSQVhpGbFGlvuOEVZV8muUntR+NIZZ6Iuq7otzSyZMeHukGGhwx8wRiluR1vXM4NAZ
         Hr7wdg6DkLG0qLOxGPHNrDBxtMY90zmzJ16ljZ3WZoAnExKHWUjgCvLaKQeacIKX/1MS
         BIBkfwUCC2A3A2Qu5wWxqPBC97lmCfacq4nby/iLBr9OaYf659qaZnHv4yKWyJ2lLG3V
         tY8ERGyeygFqeZ71pmLMnaCuoUCOGQ5Kit2gWtw37Pk9Zdp6zkNLmyBHrsOYEOqB7oOP
         kUnzfGU+qzKzO6th0GLr44YNpJ5sQ/g6rSiZgmhSfYx5zumIrSaMRfGRbhZho7chJT3B
         r14A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV3ozSqzh4cxeWucXYLrAZfzu0ghYfMop2f+Ly3XXuZBQVR736b
	c5sW/Bl2mYUPcH59K+2dxfE=
X-Google-Smtp-Source: APXvYqz4IQ9r3tP1izknGZgEaGvptRrGnOJhEfmfJK3z5oPwTaq17MoYOe+fwQ8qHIc3gW9YHdXY6g==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr65611498wrm.351.1564154022477;
        Fri, 26 Jul 2019 08:13:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5709:: with SMTP id a9ls16031547wrv.12.gmail; Fri, 26
 Jul 2019 08:13:41 -0700 (PDT)
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr20486323wrt.336.1564154021875;
        Fri, 26 Jul 2019 08:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564154021; cv=none;
        d=google.com; s=arc-20160816;
        b=cyNAiojAHFDJGWoB3gH8ggTZbi2aYWxdKtEF5yuYTvUAa5mlf9cNFYux619rf0vQKS
         UKAbZosOxdJaNZZMpRyU+VGMw08kdf0MncsbhND/YZ1Vzn3ZKOLZeVFZu6jPBhwUIBjO
         TMuWNUCdt188ng9PoxsMHxSUDZVt0IiQHorIhHrwWM2pGt7EzOEM2GobB8sb7tP3kBHM
         vmyRFURKYUEiszU5R+c9Hlg6d2d37Hf0JONS4BbC2PEZrr/z5a9eDJH8zGuBHesOOB+t
         Gyid7kIcPj+wsNikEo7FYNEsbQjJGS2xDfHpnSt4TTqw+KGbI2XZvao7ntPiJF0s3wql
         FAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Wn2hTp6axai0Ew3DLlzMm/K5ygv2lcvg87A4hoB6er8=;
        b=HLTLI4e2WAj2T2t0xu6P+1d9y8UxlVlNk9uczG9mflQuT7t1M0WTS+PVjG9wNt7wES
         oeqILTc3ZtLXwr05g6znqFyOXojpN0D1/q6a9mltjrzGyN3K67iqT+6zfImdRg8C3O2r
         5C5Vgba1j0L5KpZY1n45VJ7jDSr9adwacFFYIEySlDAsQfOzzPO8sVEAvFc3iDSA/cKe
         frDiCfWN8CnDGWQhaik7ZlkP6haTa5V4G86kjcB+C6hYN8ZjazWYOMfTepYz3iM9Ks5Q
         Fg3wW4G+pnvvLnExAIQD6UW6biyfImWlefBEnEmbLans4z+MwLuFO6l82ZbjTNb1zQR3
         rYfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id e12si2587881wma.2.2019.07.26.08.13.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 08:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6QFDfCl028584
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2019 17:13:41 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6QFDeJJ020796;
	Fri, 26 Jul 2019 17:13:40 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <de716a1a-110f-4fac-864c-54043152997e@googlegroups.com>
 <62f33b9f-a7f6-34cb-3740-2fca02468b0f@siemens.com>
 <907a0d23-c664-432b-849f-8d536d14488f@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <421d16ea-f517-a1f0-750d-65b9f856d1e6@siemens.com>
Date: Fri, 26 Jul 2019 17:13:40 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <907a0d23-c664-432b-849f-8d536d14488f@googlegroups.com>
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

On 26.07.19 16:31, Jo=C3=A3o Reis wrote:
> I run make install, and using the scripts from installation directory
>=20

Check where pyjailhouse actually ended up - or if it was installed at all. =
As
you can see from the Makefile, we just do

pip install --upgrade --force-reinstall --root=3D<DESTDIR> .

there. Provided, scripts/include.mk found out that it can set PYTHON_PIP_US=
ABLE
:=3D yes.

Jan

> quinta-feira, 25 de Julho de 2019 =C3=A0s 16:22:41 UTC+1, Jan Kiszka escr=
eveu:
>=20
>     On 25.07.19 15:11, Jo=C3=A3o Reis wrote:
>     > Another question that i have is: when i try to issue jailhouse cell=
 linux, i
>     > need to add to the script (jailhouse-cell-linux) the path of pyjail=
house
>     > (sys.path.insert(0, "/usr/local/libexec/jailhouse"))=C2=A0otherwise=
 it doesn't
>     find
>     > the module pyjailhouse.cell and it gives error.
>     >
>     > In pyjailhouse.md it says the following:
>     >
>     > =C2=A0 =C2=A0 When we install any python script that uses pyjailhou=
se, we
>     > =C2=A0 =C2=A0 remove=C2=A0|sys.path[0] =3D os.path.dirname(...|=C2=
=A0from the installed scripts,
>     > =C2=A0 =C2=A0 leaving python to import pyjailhouse from where pip i=
nstalled it.
>     >
>     > but it seems python doesn't find the path and i need to add the pat=
h
>     everytime i
>     > want to use jailhouse cell linux.=C2=A0=C2=A0
>     >
>=20
>     Did you run "make install", or are you running jailhouse from the cod=
e
>     repository? Both are supposed to work without patching. Anything else=
 not.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/421d16ea-f517-a1f0-750d-65b9f856d1e6%40siemens.com.
