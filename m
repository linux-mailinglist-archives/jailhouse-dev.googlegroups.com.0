Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2HO4XYQKGQEDWJAXXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id EE856151BAA
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 14:53:44 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id m21sf13026992edp.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 05:53:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580824424; cv=pass;
        d=google.com; s=arc-20160816;
        b=nexgta0lZUnMlrJNDN3cz2Eufs7U5zVkt+GRA32oDojocFCTv362+eP6/S1CpYUh26
         Sw4FMhL5YSlKIHdoSXB0qJvY6LMO+dCgAEWtpvLV+AZQMM4xArv7ZfMkXu+X4fbmgOxY
         PBrcMUWRlvXYeiBuK0EFtitsnEMTxV5WdDl8RqNYBmthkeOWU5AjWSBEv1Rcw5GI4NET
         gqRaU/UvRdS0Pt9wKojCGJXw3UeauZy6hUhGSalYS+ccjdfLSsMSak8Y3PEO7VY2+Ysc
         mu2C1poMBF8DCMlo8MKmYM9HntrxLwM0diYfyCkxVTQ2icoCjaySmuYBQUsOhF5ysjYe
         zcFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Qmnh/qU4HMVBCCPCVCjScSGhpnfP3rKQUycgnR51gPA=;
        b=xRdBr59DOoKuWF5FsvrwskZQIpdE6UG+lD0SOKgSWL7p8sLCSUpUNKAlfcK2xUzirN
         PWcAFB58hMsS5q23q1VeYls8GDilOHX6+4gRqUOTR50YarOV5W0RUt8S92LtbjRc76WA
         nWgFJceF8iP6FKofGxYgXj/opeTn/ScX35UArH5LfBPFeQUgoir+/5WJ5UGLF0MaE1Sq
         MOXAcVEbNf+fLOhsOg8t09HncdrN9OWIIk8Bjt4GYh7AH+D51ZTzVu0JHY+HsYABcQ6g
         LBd+stXOCbg862ckjjbyVHHDeOJvJLLMbXUiYQYynD4uxJcZf4F7VjjlbM2s6ZsHWF22
         jIeg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Qmnh/qU4HMVBCCPCVCjScSGhpnfP3rKQUycgnR51gPA=;
        b=LN53WDOSyC0tNcfnqYRcff/QytthRJ+mUMNKybqauzAW5Rg3wCM6Xp60lz54tQPoVm
         mTZi+/cMZwUNmlE26WtkWAgKKZppohosy97+1tL1GrIUVoGGTZvreMhuzBxZxLLqpRpD
         GMawY4w1ZLcD5ihRLm2q9Q0n2OXkz7rviBT1redzmS3uWO+AHo5aF7lW/j9On2orLqW9
         EnPeR6FsMlVsD9Zq/eYscortLzD1SMjNc+Bx+6Fmgv2uf9CiFN6CUMDuKRFBA1GkdycT
         sobpmNrw0KVHmcreyizKSVgsffNmsaBWxBCLQbm0bqPDoypRWeBvXH9mRdvQwI10GhrU
         nDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Qmnh/qU4HMVBCCPCVCjScSGhpnfP3rKQUycgnR51gPA=;
        b=svP/LIGK2z8ts+GHymlGFiSZCP8XKQY4cvucuEb0u57dOMkuqwubuCdScvXIk2BYnq
         jARYQYyMM76U5MmzXfmtu5vtiPSxw5Kv6sa8DFHsoCQnVcD2oUKXcYfM6e1pmym1xdeV
         tr0Q4mWRNBZSEI71PcLY8CTRvNZNQ0wckmTMMO1gSEr0/y0tKI7KWvMCA9xwUsRRTUn8
         MiARhYU7syUE7bRv/5TwbLdbkf0oRFVT6EBY8B5o1PnQrEFQpgXMMn3qb7xFYZqRKsDq
         bYdNML/FKMUzVfgpFaewzwrxlO93b+kUSj0NmA2irIUVLYuIbVvaZGSzyIH3PGcHLfY7
         KjUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWzCIaMyr6Ar3UQY5ozVbNExRRxYseiYoLitU0DEGUrJCNp7QqM
	nWFEGlNQY+xO+JELJ9RlM38=
X-Google-Smtp-Source: APXvYqwp3hvZuNDM87PqRARCceLGy1QCpoiYIKf/Ef9OV5CEvdYpN69nZuQD842hAmoJ0hbdOFRDZg==
X-Received: by 2002:aa7:cf86:: with SMTP id z6mr244134edx.85.1580824424729;
        Tue, 04 Feb 2020 05:53:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7f99:: with SMTP id f25ls5730804ejr.5.gmail; Tue, 04
 Feb 2020 05:53:43 -0800 (PST)
X-Received: by 2002:a17:906:538c:: with SMTP id g12mr26046470ejo.348.1580824423916;
        Tue, 04 Feb 2020 05:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580824423; cv=none;
        d=google.com; s=arc-20160816;
        b=bvDffwCql2QsMDiPzZ+kc7DKmd4wGPdUbcGLbTy3gP1sr5gCxyKLuYAlnpw3LJsGTT
         jcU5TzwR/LoprMBi8mTJXY2uR5pwvXdYyGJJLpbx2toYzIAF1u99YEG3REijVEVphR3o
         eHRxSAzE/4TFxAVS6Lb0Px2fNwTPHeqBK7oyId+NyVXbGqkrREk/Wew/WL2ekBYTxkeN
         T/Qs8bfMSX/dO3JuYF72fYhHL6UdIlHnbYYLhjNifzao8UKAnDJUSTIcB3SE6xRx/rkQ
         jIXBah/pXVi/Yl5U0Z22Ad7f//OTq+JTCfpOShsiSCk+CVZmx4TyVlMa+aovuHk2Mf4Q
         S1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=KRSdyhMPEv9bYHF8bPopYkNj8y+iCtx1Wm4krk44IE4=;
        b=qYVbAhBAcw7vutoJVnriNG1tF7u3g8ZWk+izX+bum897gLimlQgNcvzjzzekYHKUc8
         zHFZF+xuyAnq8uhgtO71tlZvtpHhhJ6I7tN9Nz5rLkOcdK35TJ0/JYLA2XT/Qo9ewV0J
         1iHNoUYkFezwmuD7Gjv2MWFfZPVh0aWybZwdcTjT5b9RI1bYm2JDyulp7WyPZh5ocJlg
         FtnhzvQdI/WKnWUkah+FZHYmjW853da4kZRsL2za3ogpzLIT4nzxwCO8cs/pfVG+GpYu
         amY0+NAkroWSRwxpS7yFW9tZM55ZPHS3ddDOGshPerMUXN31UVToHCCNPIz2u3kSyTKy
         OJag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id df10si1187632edb.1.2020.02.04.05.53.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 05:53:43 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 014DrgL6025870
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2020 14:53:42 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 014DrgnF018410;
	Tue, 4 Feb 2020 14:53:42 +0100
Subject: Re: [PATCH v3 0/3] Add support for Pine64+ board
To: vijai kumar <vijaikumar.kanagarajan@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
 <45fe22b0-4995-47af-bc3b-725627effb74@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f7f51362-4f04-d9ac-fc2a-adf6bce97487@siemens.com>
Date: Tue, 4 Feb 2020 14:53:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <45fe22b0-4995-47af-bc3b-725627effb74@googlegroups.com>
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

On 04.02.20 11:22, vijai kumar wrote:
> To add, please use mem=3D1792M. Not captured explicitly anywhere in this=
=20
> patch I guess..
>=20

We can add a correspending comment to the header of=20
configs/arm64/pine64-plus.c, like other configs have.

> I have a WIP setup for jailhouse-images. I would clean that up and send=
=20
> it across
> some time over the weekend when I find some time.

Cool! I will look into this series after the release of Jailhouse and=20
jailhouse-images.

Thanks,
Jan

>=20
> Thanks,
> Vijai Kumar K
>=20
> On Tuesday, February 4, 2020 at 3:43:26 PM UTC+5:30, vijai kumar wrote:
>=20
>     Hi Jan,
>=20
>     Sorry. It took sometime to send this v3.
>=20
>     As suggested, I have added the ivshmem-demo and linux-demo
>     as well.
>=20
>     Changes since v2:
>=20
>     - Added support for ivshmem-demo
>     - Added support for linux-demo
>     - Rebased on top of next
>=20
>     Thanks,
>     Vijai Kumar K
>=20
>=20
>     Vijai Kumar K (3):
>      =C2=A0 configs/arm64: Add support for pine64-plus board
>      =C2=A0 configs/arm64: Add inmate demo for pine64-plus board
>      =C2=A0 Add Linux demo for pine64-plus
>=20
>      =C2=A0configs/arm64/dts/inmate-pine64-plus.dts | 114 +++++++
>      =C2=A0configs/arm64/pine64-plus-inmate-demo.c =C2=A0| 131 ++++++++
>      =C2=A0configs/arm64/pine64-plus-linux-demo.c =C2=A0 | 149 +++++++++
>      =C2=A0configs/arm64/pine64-plus.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 376
>     +++++++++++++++++++++++
>      =C2=A04 files changed, 770 insertions(+)
>      =C2=A0create mode 100644 configs/arm64/dts/inmate-pine64-plus.dts
>      =C2=A0create mode 100644 configs/arm64/pine64-plus-inmate-demo.c
>      =C2=A0create mode 100644 configs/arm64/pine64-plus-linux-demo.c
>      =C2=A0create mode 100644 configs/arm64/pine64-plus.c
>=20
>     --=20
>     2.17.1
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/45fe22b0-4995-47af-bc3b-7=
25627effb74%40googlegroups.com=20
> <https://groups.google.com/d/msgid/jailhouse-dev/45fe22b0-4995-47af-bc3b-=
725627effb74%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f7f51362-4f04-d9ac-fc2a-adf6bce97487%40siemens.com.
