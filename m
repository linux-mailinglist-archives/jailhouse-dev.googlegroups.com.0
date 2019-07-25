Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYX54XUQKGQENGTJ22I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 812FD74B09
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 12:05:23 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id e14sf10606962ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 03:05:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564049123; cv=pass;
        d=google.com; s=arc-20160816;
        b=JHalUqy+o33Cj7KLm7pjkfHtceaQ7wXjASThnoAAYG1BEH0+xvzdqgJxcGW2QCnLBE
         qZn1nttH3jDm0fLx9x22cIy2I0pFb8lQekUIn9wLxPctBtY5HhNZilIed+BcgWbJDAE+
         B8FQlUCD3D8hI9xNjCz31DwtXkJYkUtx6zrdZtCXHWJa1qv7oYHlh7GOU6pG6lwSlbOv
         jjRuhICbfsSyJFC8K8jQlxSW34e3r5ELjMLioFEswSh1pR3t/fanFXG7Fwx5Flb51HF9
         vNktBmDXzLunBgEydoeRrjI+RcdDlYXVAhwLRhVM/0VsfAWjP2LQPkPUu8ZLaaXDve+u
         1Ysw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=/jgY2S3on4FSet46i2sysMWGaYhrfvaz90hHWXDkYlc=;
        b=Nw860Ux8edw0RdqNYvCiLDG37MluCB1X1Ww93ZiVrXULFd6QHWkHg7+lrA9O3hNZrR
         uz08/zN7/SxWdZTuhqaoGvvn509/6bo2bRTeb/FtwcAkYhT1dDqtSsCX0lfiMLOTrQb5
         V0QeWSry3DlhhZcAfP843X4V0zpKLD5oNL/9Ao+gM6oAA/mBpeVHGZV0UETU+TCdFf+j
         Lm+MkfYpDVB7wNEY3TU0ZYac4nP7f0hZPXWCI/8r4VtJ7buO8ajfcM/cQ/lUMvrzfBoe
         Jf1pqmzHsoUmY0cdjSFTcKw6Em69ZIvCB3iv3S7nyZCYlo3n82piO9vvp0q1CnqrLgkJ
         qTlA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/jgY2S3on4FSet46i2sysMWGaYhrfvaz90hHWXDkYlc=;
        b=mRPvm7O2ioub0pjlN7NrsM7kYiivjobFXC1WWILhj5KkOi1oRk7b8L7j4KWoRZt69F
         3J6CmfF5b1fyUcfjtrxWE5SuTZDPyJCiEHHD9ElqC/ZkkElZWW3f/uHTgOVCEiXdqSa9
         FadNmEDJ3nOpxM1Rojh13D8qomf59ijMHuw6WKuFS5ug/9hIMZ+odk/XyxQmquIkiUvP
         hNH3wTGdftqFanHn1T3TdCq6F7XqGL2TLLiY2rJC58JFTj6nb7NVABVuxwVEHP75luQH
         14BbsQvn4iyIHGsxhsUHkaQWI9s8DoVgRtB3L0evfMTUwldRrTyH+8Tonm8VD49yanB9
         n0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/jgY2S3on4FSet46i2sysMWGaYhrfvaz90hHWXDkYlc=;
        b=KGk/FJaBd0l7bMY3pLYDNV1pGlfFaBMtnM3hDvJNCiWK+ElG5mBNlOgclU14A+rJrK
         AJWhJ3OfaELgzIlpl+Tzgj+10lHWNdo4YTwgUeEbHIICtSs54r4LaiWd9vqBmw0v8IQ9
         m61PmnZIrlPgp9POpI2qn6MVqXlXSRvcFy9YbCeO+YqImDZ+7hCWspqhJ8ikq9xK6T+X
         2esS6D7NRx8Yj0oAzMsv0iIbG5dexmX1nrrapFeJ9F4sFx/nXj7KvI3CZCIJANCFoO+L
         g+CQU7omq0yJOHKlPwd8Cu5pzu7xOULxxuqm9BxbjSY2tYgLgcbp7koLImbIoyuxCxVS
         zIIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVzL25NwjOUKZjFNLk0tH1GWBHWKf/axdA+/z8n4pTHiXx1rCVj
	W92X32BvqMccPzUvRmSK+5o=
X-Google-Smtp-Source: APXvYqzdOzkr7wOPmBfI8GOXun5dz/DcQ6XH9BSMnqG2LUg4AK2ChSuPlq6fFV0lX0hzzpS8rwDPrg==
X-Received: by 2002:ac2:5336:: with SMTP id f22mr39425432lfh.180.1564049123095;
        Thu, 25 Jul 2019 03:05:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6556:: with SMTP id z83ls5642566ljb.11.gmail; Thu, 25
 Jul 2019 03:05:22 -0700 (PDT)
X-Received: by 2002:a2e:5c09:: with SMTP id q9mr7792233ljb.120.1564049122241;
        Thu, 25 Jul 2019 03:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564049122; cv=none;
        d=google.com; s=arc-20160816;
        b=yaQoDqDGPwclk3pxL/XEDN+awVy6PTQITkwGA8sUnY1dD7jL1HpEb5egPjz4PYhZkM
         B+grDRcNS065I274x4bHrRaVf+yvuD0Hqg5gvz+n44Lng3KqoMaksRwvJGxwdVvWHbCO
         iPHSx7LgiKgNg0HZ7vBmgfeHxx0z9OvuwGrdeZN9wZ6Fy3dCrC7KZiPvLTgOiZ/u+qFZ
         /I/Cbx0E9t2ALmwH12+psDEwybH/AHdHVrEud2rEDLyrLgTaXMUq+dtg9sEdWUZS23tV
         kVLApd/7WKmJarQXPKL29mn/f8LOFxaymA7JbgB0HHZhm5BtUwZm3R8YaBPNI9rJknQW
         m8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=IfOXyMANVUgWvx+A6jGte5jm8nj43PyRN0XU3XnBW3I=;
        b=Hal17n9dTalRhc8X4aa/YPBMOlHvF/0n4Vbs03luZ/FDKM4xa9IwFrBc6HUYKNJ9p0
         78PnINsBpZW1ADDDR2y/vL8Hp+73GQaTD4j3Qb2ONaaxtgzvEKR3ptmaKenPD2RQOusu
         NBCHyJuC6cjVg91cjM0duR+T7GCboL8H8K5g1yMovIIqkSV74Ew3HB6lcfDN+5nlkDgI
         nTXIgoehl+44aifh6tRzZurHpmZLH+jYOqccuml/jg64i8ttrXt2rCn4Xp42GHOqnW5e
         t9dsoIq4lVNUap+lLKng/pesgl9vXyfzlStPvn19P3HjPNXoW/jsmDqGi2ixOU3Lipf6
         zlXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z18si2144142lfh.1.2019.07.25.03.05.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 03:05:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6PA5Lt6027687
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 25 Jul 2019 12:05:21 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6PA5LFa021970
	for <jailhouse-dev@googlegroups.com>; Thu, 25 Jul 2019 12:05:21 +0200
Subject: Re: [PATCH] driver: Account for renaming of lapic_timer_frequency in
 5.3
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
References: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
Message-ID: <a4cf3d06-0298-e569-fd81-1cea0b875ea9@siemens.com>
Date: Thu, 25 Jul 2019 12:05:20 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
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

On 25.07.19 08:01, Jan Kiszka wrote:
> "lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=A4n=
dert sich
> nix."
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  driver/main.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/driver/main.c b/driver/main.c
> index fe752753..b3896609 100644
> --- a/driver/main.c
> +++ b/driver/main.c
> @@ -100,7 +100,10 @@ static struct resource *hypervisor_mem_res;
> =20
>  static typeof(ioremap_page_range) *ioremap_page_range_sym;
>  #ifdef CONFIG_X86
> -static typeof(lapic_timer_frequency) *lapic_timer_frequency_sym;
> +#if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
> +#define lapic_timer_period	lapic_timer_frequency
> +#endif
> +static typeof(lapic_timer_period) *lapic_timer_period_sym;
>  #endif
>  #ifdef CONFIG_ARM
>  static typeof(__boot_cpu_mode) *__boot_cpu_mode_sym;
> @@ -550,7 +553,7 @@ static int jailhouse_cmd_enable(struct jailhouse_syst=
em __user *arg)
>  		config->platform_info.x86.tsc_khz =3D tsc_khz;
>  	if (config->platform_info.x86.apic_khz =3D=3D 0)
>  		config->platform_info.x86.apic_khz =3D
> -			*lapic_timer_frequency_sym / (1000 / HZ);
> +			*lapic_timer_period_sym / (1000 / HZ);
>  #endif
> =20
>  	err =3D jailhouse_cell_prepare_root(&config->root_cell);
> @@ -897,7 +900,7 @@ static int __init jailhouse_init(void)
> =20
>  	RESOLVE_EXTERNAL_SYMBOL(ioremap_page_range);
>  #ifdef CONFIG_X86
> -	RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
> +	RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
>  #endif
>  #ifdef CONFIG_ARM
>  	RESOLVE_EXTERNAL_SYMBOL(__boot_cpu_mode);
>=20

FWIW, there are more issues with 5.3, we do not even build the driver modul=
e.
Reported at
https://lore.kernel.org/lkml/230d2ca1-19cd-b60e-1b1b-6d7413eea9e2@siemens.c=
om/

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
jailhouse-dev/a4cf3d06-0298-e569-fd81-1cea0b875ea9%40siemens.com.
