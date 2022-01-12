Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBLN37OHAMGQE4ADT3WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259048C534
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 14:54:54 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id c5-20020a1c3505000000b00345c92c27c6sf3737138wma.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 05:54:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641995694; cv=pass;
        d=google.com; s=arc-20160816;
        b=r3mRyB27evIGQ1hKL6CnIAvRWOyPNem0REIjSQrzjSdKXQbLL07mai+0Ij3ZYZ5hFm
         ciUFTzIafVkIfm5KL8ftwVdO7BDFIf8+cCC7fhfktihc0X+lZ1Bq9ywd9+TRSeLGQlJo
         Yjkx4Xx1CDBFmxFchgDncChVLFptrpslrYyfGd9LL15dO4An3bmfn51uwUhNzv9noeRF
         FGfZSjIKl/WJwBdJmt6sWDQxmRh3VrQEkud/1WeilSfiDq+yk9AVqv9dh92rBqCLiItz
         n0CzsB6ltrU4YiTsBqVG1JywK9xqJFxuL1HXZaM7LoSLSudjd5weBYeiUJ49BgDeIDPu
         zKuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=zxP4H7PKmyqCKpjbffdC61Anx9stWs0bHTNc8aRnLqY=;
        b=LaksF2HtLbJJeFljMhmgWkiUmjMUkrjxQ7nZjeT9vYf5Mt+etMpjJkXox+VqkEvDbP
         cbt83E+2jsXqXDM9im9KXynhdW7qByNZ2cADjxg+CSPE2QhR9lg8eTbRJ3kuYpqm+d21
         GZVDZKbtxeuQw8yhxh8i9O1qI2siHT+auYCmsLC1cCk6JGCQgk3fu+1j2cr1DQXy5wFj
         tQCTse0NvIE8H/ZbeQiDzZs+4A/gez+uuIgWPmwW88K17BqNmUxIAFhtAn4gjcmoH1uq
         mnXMOUt+2ebAPOLDg9DJlz6/7NaK06WHAEKVjV2xBLpplh9dc69iTPvlW8IdQGuTfIoK
         lWuw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=XpgkqqBK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zxP4H7PKmyqCKpjbffdC61Anx9stWs0bHTNc8aRnLqY=;
        b=rdFoVEDUgQEvT7CSiuOQIBH+nRRDvptGDa+rWN6pOL+uRaSNmrzJBKoHAdEkFoLdGX
         uUsEbQJR/5RK7pwnWqw7ac75kdK+uIsl3cD3+x3OpcMOeOFAo0m/qlVYQpcrQ5iaIkKs
         5DtqaAgB59m9ewXgXvL24VKjhmAv720k2Jyz2TEHwUNHVFhJAp/gEIVSHbeT57O47VRw
         /7OuRkdpKQAHKCcAnA4wpWc/2zuQ7hyZdxdMi01kamrJRRhboxevMZRXSVQBip0kArce
         +GrKfW7/VkuOx9Zi9G47yAfhQCthDSRqgqqFyOIB7kSTTzoFJacfhh3WefeA3Tq9gsmQ
         aVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zxP4H7PKmyqCKpjbffdC61Anx9stWs0bHTNc8aRnLqY=;
        b=Jk3Kbt7Fr9hBP2AMrE11ekCGEwzhmP++M/TtaZWbHesvqhTcZO0I7ODeJg3vdMynpQ
         Ft1aPY9bHqRuOCsi6rfbPVOsXfFSa+dHMe+hzGPmfLeC/4VcqZH8m29ZdR8q8QqwCYci
         olAPYk8vlo2orIl5sr4ZYeIcPRypNF0gKlWyNy93c71xqVGUb5FBJkf6Ap6FXiUS2pUM
         UdcSmIBWDPJ+CSEptRaDZ1qUWJcHOUlGxHDq1jHBcM9ygZRNdZjXUQlF7CGQ7pSfJKxC
         /RoZd8N9yeTi3T7QWRBdUUrqRcUWFtDlmxUwbYs+lIKBkQLC8FaSSXwSjF4yWE/4QjMa
         PVxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530gDeciDiC5AtvuHZxn3WhMLMcV4yj9Ry3+QzkHYq1VQL4DGesn
	E+5ytw6oh3CsmODikKzfmDo=
X-Google-Smtp-Source: ABdhPJwnCkHY/5o/3oovAKqqErLzq3J9Cxmyv1T/Am8tXjfOyFrqJYvrF0rUXrvdI/3hLIPom+5R/g==
X-Received: by 2002:a5d:6f1e:: with SMTP id ay30mr8569015wrb.498.1641995694013;
        Wed, 12 Jan 2022 05:54:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c7cd:: with SMTP id y13ls162466wrg.2.gmail; Wed, 12 Jan
 2022 05:54:53 -0800 (PST)
X-Received: by 2002:a05:6000:1c01:: with SMTP id ba1mr8488345wrb.190.1641995693062;
        Wed, 12 Jan 2022 05:54:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641995693; cv=none;
        d=google.com; s=arc-20160816;
        b=YiE93DUvKStKcpT8q4ddPqFriMAI+WdS5T1SdsRbfwPHLLhDd8/nCmDwB1X7ZOy7N3
         RY9W0EkxNHp2hDfzx5NrBDt0O7/UTVCUI1z3LPdF6xntSQAk6D7Xx/T4sk4z8F8yK4tc
         yZsOl6vmLn3hHEIhfmWk1UPw4c9vZbiZCjy4uGXzgRS3K8JDDd4B1iWBHouNQpdU7Uim
         F32M9y0MiH3q4FQ7JiVb9kjpjYvEU63flsvKoyur5Z6t3/T1gEtFUXcN9/07pWhtm3eX
         CEyzZhGB7f0cLjqsdwstjjlY0oA8iJ5nDhSV1jxiFvKQyd15Zdp14HN/QJ6T9+aHi1Wv
         EMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9Nj6vxIv/VgSXRpGFw9ztUzNVr633SLs9DvLHrriRLQ=;
        b=w/uUe9gl5a39FphQQ+YTtZuYWkiPRMVxRUjP5SiPUxQ//Vo/yTsbprEyVEgN7ar+Rz
         7CHOYwjzWylOtyLyCr5zjGVzJFNgyoJ44kCslEQ+ygDPXQeKxyXyR7oVgOfYHUZF0xst
         Azhfmh0E7fixQfB41pKAjTcfPebskW/tj70hdareDfQM7gPXynN77acgaEG8d6tN7KCX
         oJS/x4XtrgVhzvua2ZMhS5cYwCcL14MgnvqQ5yTajMDRUbGdPL0S3Hs2UqyP4tKDk2ef
         oUe8e8v65hM+AzDogtqtkbQIhPb7AVnAtjo3nIfewLn+m5OBrs3ZqFNU30gje0HyNXIT
         UBbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=XpgkqqBK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id e13si664533wrg.0.2022.01.12.05.54.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jan 2022 05:54:53 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4JYpwD4x7SzxwF;
	Wed, 12 Jan 2022 14:54:52 +0100 (CET)
Received: from [IPV6:2a02:810d:8fc0:44bc::6156] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Wed, 12 Jan 2022 14:54:52 +0100
Message-ID: <b96280bc-3f0c-c959-ed29-e23e7b07108f@oth-regensburg.de>
Date: Wed, 12 Jan 2022 14:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] hypervisor: arm/arm64: fix build error
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, <jailhouse-dev@googlegroups.com>
CC: <peng.fan@nxp.com>
References: <20220112065619.19432-1-peng.fan@oss.nxp.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220112065619.19432-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=XpgkqqBK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 12/01/2022 07:56, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> With gcc 5.15, met the following error
>=20
> hypervisor/arch/arm64/control.c:33:9:
> error: =E2=80=98memset=E2=80=99 offset [0, 255] is out of the bounds [0, =
0] [-Werror=3Darray-bounds]
>     33 |         memset(&this_cpu_data()->guest_regs, 0, sizeof(union reg=
isters));
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~

I see the same error on gcc-11.1.

My local workaround is to add -ffreestanding to hypervisor/Makefile, as=20
this avoids builtin gcc-magic such as undesired inlining of memsets with=20
constant size.

We already use -ffreestanding for inmates, and I guess we should do it=20
for the hypervisor as well.

   Ralf

> cc1: all warnings being treated as errors
>=20
> Fix this by use a volatile pointer to keep GCC from determining its value
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   hypervisor/arch/arm/control.c   | 3 ++-
>   hypervisor/arch/arm64/control.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.=
c
> index 46125e1a..c9c93982 100644
> --- a/hypervisor/arch/arm/control.c
> +++ b/hypervisor/arch/arm/control.c
> @@ -23,9 +23,10 @@
>   void arm_cpu_reset(unsigned long pc, bool aarch32)
>   {
>   	u32 sctlr;
> +	union registers * volatile guest_regs =3D &this_cpu_data()->guest_regs;
>  =20
>   	/* Wipe all banked and usr regs */
> -	memset(&this_cpu_data()->guest_regs, 0, sizeof(union registers));
> +	memset(guest_regs, 0, sizeof(union registers));
>  =20
>   	arm_write_banked_reg(SP_usr, 0);
>   	arm_write_banked_reg(SP_svc, 0);
> diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/cont=
rol.c
> index 5b41b393..2c33c5f7 100644
> --- a/hypervisor/arch/arm64/control.c
> +++ b/hypervisor/arch/arm64/control.c
> @@ -22,6 +22,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
>   {
>   	u64 hcr_el2;
>   	u64 fpexc32_el2;
> +	union registers * volatile guest_regs =3D &this_cpu_data()->guest_regs;
>  =20
>   	/* put the cpu in a reset state */
>   	/* AARCH64_TODO: handle big endian support */
> @@ -30,7 +31,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
>   	arm_write_sysreg(PMCR_EL0, 0);
>  =20
>   	/* wipe any other state to avoid leaking information accross cells */
> -	memset(&this_cpu_data()->guest_regs, 0, sizeof(union registers));
> +	memset(guest_regs, 0, sizeof(union registers));
>  =20
>   	/* AARCH64_TODO: wipe floating point registers */
>  =20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b96280bc-3f0c-c959-ed29-e23e7b07108f%40oth-regensburg.de.
