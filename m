Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBWG7GEAMGQE6IQCBLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D73F1AFE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 15:56:23 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id j14-20020a19f50e000000b003d2e72caab0sf1996625lfb.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 06:56:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629381383; cv=pass;
        d=google.com; s=arc-20160816;
        b=k3h8NyEnPhoOTUrSMWC85sCM71B1oPMD/3Bc119pMYkyFSCpl2mbCOiamKLnQVLdjm
         yQ4tZyEtWabo6+bGzP3WYpw3dVjoGFTPvpL29vdw1JuxG/r6OOqfNBRYUwcCBFcxklDy
         qGAypYfu9Vpp2zlpXyFt9WcWDwUM70gKLi1jOVU+PSCHtkVydaoYNKnz4cCwVJE6z6Z+
         HbAXrzneupD4gkHTub3yH/DV7RkpNOfv1TiBBNuU7ZXpfF7GahaJV92U+7YmzbOXo8O/
         8n10qQM72hX0E4r2Almh79hR3xYirJG+7hKSLSZRPIiCG64ZqP0rx7OocjJYOrIkMPkw
         uvpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=D8YcXIhJkPdQT5lBDkpJ6NHMWMaRjea7nN//WTTpeQU=;
        b=dbDbVSZ7JuJeh/sS//FoL/3+YnhOSJDWNubVUrevxBNlwJcIsGSIHD3tR444Na3Ddr
         HoTEuIsUnC1gYj5damnrs3gts7SQVPQmtuqjaBs4dihpyrKDAqJti/XWg55YK9tH8fpP
         pi0VLeH/mrvncERRWiqWqpvOFZs+fQxw5yXpH43yFDwyY53NdDecgiDMLvQ1uv4iEuTE
         3gnSPg7mBM9y0xQU7yOUu1p84U8/5HoqjDi74kGRY4uca6JPVS3U+Yv2ddW01SHR4QCe
         gq9/SJXu2Tv7WMCCSlczgIT5TdXhwxoZL6GHqYG7Thu6GNYvoHIjfAEHIsOkAd/2zpCa
         A0UQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D8YcXIhJkPdQT5lBDkpJ6NHMWMaRjea7nN//WTTpeQU=;
        b=fuaqoyLTZMJNjOgO67rqut6xSZMeoNx7TtOk4gwwaCDp+ZXATVuyXspJ4IrNn1ZTdR
         6i3MEZqyhi9Ht9ib9j9xgXKy2+9iMtSJMzJMpa5UVeCnbUhsdqdiEoM216kvkl6fhOtm
         +9LoEksfroz3CzjlZyMGHh9XezIk6+9jp81uu0g6Y0v9++MjuzF9EDm2MW94qBfwOJkh
         aKA6bRV7/OdWPRuwCDd/y1XIDL4V2ZUB28X/4F37GXs7T314EJcM4lntYlDATEoOdkbp
         v7AyF76yNr4UexM5ylRJjoSQIzmBUjD6NIzfMNlErFOyj7Qigow68SPYaGkLePjP0sWx
         RlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D8YcXIhJkPdQT5lBDkpJ6NHMWMaRjea7nN//WTTpeQU=;
        b=YzbNEbfmcjpJbpjaS3hC0AYnawJbJea8mFo57x9y9CSE9mg/QA7hfXqTb2GivPaLsi
         l/j6L+AGJQVV1HY/WDKILVNcdkIyTwogu28O15C9qzCp/ehvRV7hn5XYjUW7MPN5cS2H
         9aU/ykShLO9RWXhDolYM2vVWYTisar1xUmFmJFy2ELMT9giCgvwspiUBVLOCEM+CGBoU
         7X+fwepQIoIGGK4JhEEjvb5Y41eEJnobopLvT1Bew6nMrUqVI5bX7lpe4ASWNBPd5llt
         cgwf/swWJxVA9fvlKaa9jA+SlIx9s1oMH94MhOHILyGGRKe4gCemWpcMNRx2EkG4k+xp
         ocKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533XsawdvkN/AcNAXFWn7q+sZVyqysplTJVJyJmXgOWJ9ub7+ojQ
	RG1qlHCN+zKXS+bmh13A61w=
X-Google-Smtp-Source: ABdhPJxtuo9xxeU6OFa7YcKCPeOaJ/8ziPqhpgGaDPzY1W6LjX4tg2MjzgB03/RABBx2dMDm5TfIYQ==
X-Received: by 2002:a19:6f07:: with SMTP id k7mr10795143lfc.338.1629381382891;
        Thu, 19 Aug 2021 06:56:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4146:: with SMTP id c6ls725266lfi.2.gmail; Thu, 19 Aug
 2021 06:56:21 -0700 (PDT)
X-Received: by 2002:a05:6512:3ba4:: with SMTP id g36mr10870544lfv.80.1629381381683;
        Thu, 19 Aug 2021 06:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629381381; cv=none;
        d=google.com; s=arc-20160816;
        b=dhrmHbtR/2bWBCwZ7mIWF8H48un/P6qxGz8O/7DWBOJX0Qgcc7hLmRssyOadMkmbnT
         324gu9hFqW483CBT1JOqEkAMQC+FkOAOYZsA05pWPpq2jhjaIuMPDU71rtsQvQwkdQIv
         bqGgNZWeef4JCcHBQjH6HKXIJzmYf61ej85QcCfDDQKlzIuL8TaMINLxnSmYV4GKCbwe
         +OFj3CulGgpPmmqkTt15AE0Uwixn5nqY/PpLJwt99zJVSqL5aubvyljzsIAdwUTKHz6x
         7SPGu+WPHbFaKUk2hj8TynMOs2ATHapuuA/hHBOGvVr20uBUhSGME3CX77Oxgd0kqwou
         8lyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=NRgWf/+tJ7fMDdpaqcTL3dL6HTowuR6Majp7RVp+MG8=;
        b=UcPiAY+L2PCH+vvCN1EbGHS3/mL0jJo0YmmwrKum9JY9wpP2IhyckkdHDG212Edsyk
         Xae2dN88X4kT4KIaWsnJhw7VB4CCxGLqsXRCUXsqclk82qKrIVRaiWxFQOzas9F6BC8H
         gpa26adM5pubeukUmfT8gkEGEGVWKCUF0dhI1KXl3/O/cClJRObHjfjoDj/ezGCaq3H3
         JnJydskxvibr9dAGysHyAqxFnCzmbNLbpO3U/p8cO947vmEEi87a4xVGDw4K2BlD+uMw
         mRzbTnDbWhNIoiKcpqsE/+DHY2Sl4PdyVdnSn0+BZq0Gg39knKP0oiSzLmByo0gMRf+N
         fJAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h11si236573lfc.4.2021.08.19.06.56.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Aug 2021 06:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 17JDuJEW019123
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Aug 2021 15:56:19 +0200
Received: from [167.87.0.29] ([167.87.0.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17JDuI2R009236;
	Thu, 19 Aug 2021 15:56:19 +0200
Subject: Re: Root cell configuration for RPi4 with more than 1G of memory
To: Moustafa Nofal <mustafa13e09940@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7g@mail.gmail.com>
 <32ebc4ac-1d9d-8983-4c25-e23856da2fad@siemens.com>
 <CAGdCPwsigcxRcikcfUovOp7=q0g8eqXv3Cois+w_0cZR6R=v_Q@mail.gmail.com>
 <e2aed10a-4d8f-1d0a-852a-bd399ac5e667@web.de>
 <CAGdCPwu4v5S-ss9UzTi4tXJBQFZ1b-J6isA+TM301BdPRPHkxg@mail.gmail.com>
 <89ad4d62-8005-44a0-9153-ace14b658e64n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <798dc279-8f39-b3c6-c0ec-ff10c94c2f86@siemens.com>
Date: Thu, 19 Aug 2021 15:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <89ad4d62-8005-44a0-9153-ace14b658e64n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 19.08.21 13:59, Moustafa Nofal wrote:
> I tried this configuration, but it did not work with me, I attached the
> log file. I have Pi4(4GB version). Initially installed 5.10, it did not
> compile so I back-patched to 5.3 and added CONFIG_HOTPLUG_CPU=3Dy to the
> build configuration, I was able to understand, why it was essential.
> Then I tried different memory reservations using device tree:
> =C2=A0=C2=A0=C2=A0 reserved-memory {
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 #address-cells=3D<2>;
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 #size-cells=3D<1>;
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 ranges;
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 memmap:memmap@0x20000000{
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 reg =3D <0x0 0x2=
0000000 0x10000000>;
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 };
> =C2=A0=C2=A0 =C2=A0};
> The memory is reserved and observable at proc/iomem but the result is
> either crash as in the log file or this:
> [ 1463.849868] jailhouse: request_mem_region failed for hypervisor memory=
.
> [ 1463.849882] jailhouse: Did you reserve the memory with "memmap=3D" or
> "mem=3D"?
> In rpi4.c
> I edited memory regions to begin with 2:
>=20
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 .hypervisor_memory =3D {
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D =
0x2fc00000,
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x00400000,
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 },
> and the same for all memory regions.
>=20
> Something that I do not really understand, is the RAM address. In the
> jailhouse Image, there was a RAM at 0x20000000 and the image works fine.
> But in my case there is nothing at this address.
> Any help would be appreciated and thanks in advance.
>=20

Integrating all the loose ends of these targets is a hairy process (I
stopped counting hours I invested). Therefore, I strongly recommend
starting from jailhouse-images where the RPi4 works fine, at least here,
and then step-wise deviate from that towards whatever alternative
configuration is desired.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/798dc279-8f39-b3c6-c0ec-ff10c94c2f86%40siemens.com.
