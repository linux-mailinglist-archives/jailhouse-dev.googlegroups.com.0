Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJ5N2DVAKGQEAMO5BYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EBC8D5AF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 16:11:52 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id r25sf2893386ljg.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 07:11:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565791911; cv=pass;
        d=google.com; s=arc-20160816;
        b=enhk9dnYL/+k9YKZvZXswTdrHCaCVc/g3BEH95N4vueCkR+dUkdzZrMrX5ENZGl14p
         s1UvpobPYe2uu3mGz6cq6EV+FUDvzmsEZZMIQ6PkTv8+UqUY0h7/EWz4gu00E9wQ/yLM
         fbSH0KDAOfaeHO94a2xFW6FJszzghZegAWZFHSHfu3duJIKAWuhZ0fnv846bGVZnoZor
         sNbTex+fRNOvsP3UUcou8Ze25EGDMYY3m9hRKyv/aqsdIwwUJtOw3WDU5IJZnuCuH1h3
         BM62TGLANhyDQPNb8QE45MINU5o1e9GfEkzP9B2QtFbRzz2jQIhTZZv7EIlKlQ6snn7k
         ZQvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=nKCPMhEEJ5EsPewFCqNdWQAt08s1J4j38HkLHG4OKVU=;
        b=lcWL/tCkmOAf37hGwCY6CnzFhrp8JgTFPXHNU/WEJoSUWbPIhdN/HIs5iHWzKdMZdJ
         7B65dE36EVHjLmQzNpoVm0ZBcItf69Rx4gOSOTDoEynPsKPmF3NQwgNwKGk2QUhlqxXB
         x/iYroSx75J2rGP1A96yLu2VHcV+7Drqik0GkmTAzVRb4nZoFVgM6msOeiKisbYCyc1P
         XbGOFbg6Fyafb+w3NGCLbddv+kYhCGHOQVMf7/2DBVWc766gXQLaQy9KZ9rM9jj8eAg7
         8zRmCQQcHAgaF5nqymUWRcqeRAbqQ9JYKFzhnMNi5kKu+d5XwaNb8sRwUzEPBAgtBJ/+
         +lTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=NIBXjtp3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nKCPMhEEJ5EsPewFCqNdWQAt08s1J4j38HkLHG4OKVU=;
        b=Gx5O+gcgvcZJimu2eDUYe/ueuSsVWxogdFImGV9L2JZHvItdzSu3VT1qLpkxtNNZVY
         cDA0zQvv64UsK4lSwFTkMd2hBWhwlcykpeYeOv29iRZsrQoaTeLPFPh6CYZ2ebTNgbFs
         xtbUbyRzjhZsIYg8qZGn5ugmCmKs1YmNIGv8/j8u3GWMasa8m0HgB6Mfryq/KL37KrT5
         URgusWiVszWkk+J/C9BZnlqWlC0dEYRBAKlWe3SkKh5dz5NhPtgYka6v+ckW49nqpWv1
         URGauYvnMYU9c5nliKuwueaj5rCifbe6n/Dr7g52OdQZts2tbtGeo7cehw3jgGWice+c
         dBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nKCPMhEEJ5EsPewFCqNdWQAt08s1J4j38HkLHG4OKVU=;
        b=AqdCH332OzVkPUTN5H6/l5zQXz6ZQy4ZnfEOh5Bk6FrcDWqmk4Ah7xZl8yBNwhrvlS
         dZwaW+tk7nTwb6KcMaexFJtwkyPj9vGKfEIGq0kLQlFEvfFLM1deA3ChuIsXvf9b7rsM
         TrIuR1i8cv6sNmiiMRygJOMBtRHMqg2OCV7mJJC7BPmeA3CDtazW0BvNYknI6NockWXa
         F9UEQ1cdOAU6qAkyMiwuaadu0o71bhdInrPlpCWsT2lfDmWlKEtSXNKaRV5g5+rBZTlc
         Lwq7FmRddaJQpl54UssiwgmG/DFcaWrvO1bZop/3V5UIRK0t1jeYnImXucvpvTgkMc0j
         zbLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW7rWyT3nvI6KuRpgjOFKW3PnR0VjnknJ20w9ATyo2WU+NutIU6
	6Hn9ieg5uy/m1qBSf9DGN70=
X-Google-Smtp-Source: APXvYqxqBbMGSDJ9jz7cCWfVAotLj19+Ev/YLvOKJggC8ZQP3127PXGdmwOaRZkBzlu2sYKvKk8cGQ==
X-Received: by 2002:a2e:85c6:: with SMTP id h6mr7291ljj.186.1565791911831;
        Wed, 14 Aug 2019 07:11:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43ca:: with SMTP id u10ls225472lfl.3.gmail; Wed, 14 Aug
 2019 07:11:51 -0700 (PDT)
X-Received: by 2002:ac2:44ac:: with SMTP id c12mr13340121lfm.33.1565791910952;
        Wed, 14 Aug 2019 07:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565791910; cv=none;
        d=google.com; s=arc-20160816;
        b=naX1l0hb1Mnk4+9aPP5HU5Nj782L0+Y74OjPjIr8kkKtf7aaBhn/4PVcKD5KOecvwd
         fO+mpuBGrKtM+D1wLlhV2o2NtFJQH/nKw/x/mcRltxvF2ID+/cl/X5OVo+1wY6BilJ/w
         zUnRfiWv4mCHIWPYWeMvQlGd9caTyUhE3mOQRhV5CAIZthPQ7VHPOaMUttbjg38cML5Q
         ACwieUY4e6VY+P95Xd26YNBMt8XYSNzS1iUncZQwwLT/1NBL+FFtCmPnvGHIo/XVpcs0
         sJKkPB967q3ZzkxjwvRX7sUk30pczG1/sdwKzHdrewW2kcxRcCc/LzzCZFc2+/AnGzfK
         xnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=PNHmU90YowlKdldR7ZiR/mq+ouSt5OQfS3nW88ItiFI=;
        b=HaP5aq8N6Hy/Qetnrk6eggRgSSmo11K4avqAe8kti0N0if3hJhPbkUbBQx8JUGZMwc
         1DUEoNhHVMZM4eJd79assJPKbGR4MTQYi0CWL1K9YeYMk+VHYZMZ57SCU3v9kb6oaSMC
         zpPFKZRPVK48hM2vaFSDdMJNXYKLuPihnRK1TfNjBtbkqxJwvGmIxSTFo4Qe0h+J312U
         qcqGXFxlY6k9XtifjJFna5EnWH4i5I6oKSYYa+OrT3EussjhWONpJN5wDHgj0byydV+B
         p9pJGkTHr2W+/fgbA0c7pQ/K4RNZfbtXcQJ7x5J318gn3xRuhqT8qLhAYC7YZG76hC+g
         GYBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=NIBXjtp3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id u10si1740224lfk.0.2019.08.14.07.11.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 07:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 467s2s4yXzzyHp;
	Wed, 14 Aug 2019 16:11:49 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 14 Aug
 2019 16:11:49 +0200
Subject: Re: [PATCH] driver: Account for renaming of lapic_timer_frequency in
 5.3
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <274f6f7f-401d-d275-4b53-dd957cd641ba@oth-regensburg.de>
Date: Wed, 14 Aug 2019 16:11:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=NIBXjtp3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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


On 7/25/19 8:01 AM, Jan Kiszka wrote:
> "lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=A4n=
dert sich
> nix."

Doch.

We have a problem if KALLSYMS_ALL=3Dy. Jailhouse will compile, but it
fails loading the driver module with EINVAL, the symbol can not be
resolved, see below.

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
Here, lapic_timer_period won't be replaced with lapic_timer_frequency in
the RESOLVE_EXTERNAL_SYMBOL macro:

        symbol##_sym =3D (void *)kallsyms_lookup_name(#symbol);   \

  Ralf

>  #endif
>  #ifdef CONFIG_ARM
>  	RESOLVE_EXTERNAL_SYMBOL(__boot_cpu_mode);
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/274f6f7f-401d-d275-4b53-dd957cd641ba%40oth-regensburg.de.
