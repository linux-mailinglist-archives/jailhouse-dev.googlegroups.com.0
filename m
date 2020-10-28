Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPMW4X6AKGQERPP7BRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C10F29CF8F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 11:43:10 +0100 (CET)
Received: by mail-ej1-x63e.google.com with SMTP id b19sf2008698eju.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 03:43:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603881790; cv=pass;
        d=google.com; s=arc-20160816;
        b=b+ZkRFDhFf8LxDfr7RpGAOrtFoRSxQzqxhNLNAf/LG65HzzdxYuqgqbX0B/GrRoTUz
         ZlFb5em0DtDVmqY9R1nTpI43FObOMg7PVPnyt/qMaSNvqxN2GxitYXesG193Eo4UTKti
         3UbmKHeBlrqgB/fNGcNJgTKA9d2fzuRONlSF1jqliavoUzPWwDpeGZnlyEcfozds/iNG
         yq1fgE/XqfsQN93md59SMvLuiQX0Ig8C5Bw2DnJgme9rvB3/jxsdv/eJ7HbBK4fxM5qc
         KOTBn0jnvYwnnESJ2gDMqufnyX9SUHziQUl6W1BgBNP8PW1HQATbO+LmGG5ho13Kunn9
         Pvpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:sender:dkim-signature;
        bh=68GRyhB4oKu9dKmAHJQkviQXXtfhCDFt7hFeZbPoDK4=;
        b=hyHVcHnvN2xWZkOZGX+Ao7qTsARjoQ/YaNVwLETIau9vvVn3X7wWAau/Y2QL50YZz7
         yXWlD3ils/E6jrBDsB7TWLTQ+BYYAFwctF4x8tNtPGIbEWBb5v87HSkZulYaXR5dgSHx
         PyoYl0mbzD9OVd3Jt2Orl17fHg3oxxUhIQ0O3CLs5J/qxMi+ljd9WVm1fPP5Ep2+EJ2D
         qR+Am221GwFTwt03aUmhA9KPFfjubi1GGXdwy6rnvd+EelqBeA9zS2p81Kj/nY9XpO9e
         jl++JA8yS2NPGXYNPh4uPZgXEPhtQ012PwQ7XcsaXXCdctaWPDCYM6OP0NR+wIbAEy0b
         yQHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=68GRyhB4oKu9dKmAHJQkviQXXtfhCDFt7hFeZbPoDK4=;
        b=VaMUec6lv+D6zQkHrPENtpGGqTWfiv567M+Ayk2zP5k03gfMZ6HZpFijmsmf7BxFnC
         7LNhnhKVMz/txDDOokf8VHhXsQhWqp8rDLNJZ9eGjFg4sXASQCAE6I4HazQJ5uGeCufD
         r3S034CwzDLfotmILyzU8xSc6rLIkg2yqbjx0lGIIVsQDXI2ZYTQ1GLdyZiCIWqEldpg
         EdU4xCuAYhqYPsL764m0GgneZF9pe5xDcYPXy9Yx476ME73vIqci9SjdZlQ/KBib1ypV
         M1CAFaHP3CFK9Lwg0XTPh6Tkn+wE2rV/hg/Eg1A9mrlm08qbedazHZO7GOWd8WwjrKLf
         q9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=68GRyhB4oKu9dKmAHJQkviQXXtfhCDFt7hFeZbPoDK4=;
        b=TRltrQJLG2HEKdwBJS+Akuea880cBsXEWcC9V9itzlzcWzK/xEU2VGathPo0ULCzLo
         LLviBwi9PWruGn/nnnxgQkLgc8HQtJHLHWyopJSqiQeZlpiTqwTxzxsgromrShJh0wsx
         Ei1qR2wRs7d71dgmRsaYKq4vh9trhbASbZqOX2NYjyK5NsvB1MR9UcczghKW9OyDR6V/
         qY945zonxoyGX6exwf4RGQfz8GCko3HKWukAqOSoDAS+EEXjscYKSbxNJK4/+UKp0PLs
         v64HAl2+r/1gAu9BNtrCYMu/1jg0V3P9qa33ZaDfJrWmNS0rgEn7NLxcB20MPsCT+VkX
         aU6g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531J243mIhgH+INAsq7wignUyew62Tq8rYJzWeRoQUppwEqLwEl2
	gOlZpIHunJuo/MmHM3FGJaQ=
X-Google-Smtp-Source: ABdhPJxdSP0mJ+i+kYp25nVogWc6yELp+TJDwNqEEyiobspy+D5kLC+D0i6x+hiqaEVnpVkkGqVk4A==
X-Received: by 2002:aa7:d9ce:: with SMTP id v14mr7069701eds.203.1603881790007;
        Wed, 28 Oct 2020 03:43:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d3c:: with SMTP id dh28ls5053918edb.0.gmail; Wed,
 28 Oct 2020 03:43:08 -0700 (PDT)
X-Received: by 2002:a50:dac1:: with SMTP id s1mr7044584edj.74.1603881788807;
        Wed, 28 Oct 2020 03:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603881788; cv=none;
        d=google.com; s=arc-20160816;
        b=F/wzAUtLVbGqM3O+NQIvmataDcUagrTjmQRPdTQ+jDCaAMpTt2vApZD2I9bM3rHVEZ
         8zCFIwcd35u7+2kY12OW8vmavIdFxDZOH7ZqZMDktlfg0PcRzzu/FflecVT9PC3ckxqO
         VcZRpFv3UaephCwchGOJcGKdOmh1wgByEQqTdiRpbT0TweyGB7kE+zIOmey62E4EPvl9
         QjY80RMemtZDdyp3es0kN4VOlGZxrwmc8n5XISENGd8KcXpqAkt4+ZBbhcTpjW3vw+fH
         mIzOdQi41RzKcMldMYto//n+yiSN90ju2+4bgCrUo2VO8nwuRCcEZX4udKYf6v2usxKR
         QizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject;
        bh=DrlgtHGNgVEZnRq1uU1crMsmXv+HL4HTYGJYAJFkBqw=;
        b=AuPXY2PAGsYmlW7ASsiXtJwfcBapgP7v9aTac5TZFOaJPMEuukjqfgXGCVKPVJAlXp
         te0Ay30vgPPdMAjhiAR6rYmZwAyfk3GSNvva/6hpk363YIQ25Zl1QoCp9Jj7T3KtjixA
         bDBYSsZYaSyVAgOUintkY8Uujdl+jpnJZ/j0uEBcmpxte7zTaFsmZhBEB1vw9+LWCbEE
         sn7SJIgRBNdPgSxtAXs3NM5jSRSzhuqzIfRMmW64ySIrm4Qw26qb81zbZwpn9AOq2gVi
         F24JiXwYxfseVCpS97w/AVv8Xn0X4Gc4WXSApPQ6KPfmsgBGg8tFmYfYiWlTZw1VytKJ
         H08g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h22si88258ejf.0.2020.10.28.03.43.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 03:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09SAh81r012424
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Oct 2020 11:43:08 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09SAh7Bl006194;
	Wed, 28 Oct 2020 11:43:07 +0100
Subject: Re: Jailhouse hang on NXP ls1046a ARM64 platform
To: Peter pan <peter.panjf@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <58057754-ee40-4583-bd44-db19a6706069n@googlegroups.com>
Cc: Henning Schild <henning.schild@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bf532fea-eca9-1c8b-a814-682e34962332@siemens.com>
Date: Wed, 28 Oct 2020 11:43:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <58057754-ee40-4583-bd44-db19a6706069n@googlegroups.com>
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

On 28.10.20 11:06, Peter pan wrote:
> Hello Jailhouse Community,
>=20
> I am trying to enable Jaihouse on NXP ls1046a platform which has four
> ARM A72 CPU Cores, but now the system hangs after I execute "jailhouse
> enable ls1046a.cell".
>=20
> root@localhost:~/jailhouse/jailhouse# jailhouse enable ls1046a.cell
>=20
> =C2=A0
>=20
> Initializing Jailhouse hypervisor v0.12 (73-gacdc9fcc-dirty) on CPU 2
>=20
> Code location: 0x0000ffffc0200800
>=20
> Page pool usage after early setup: mem 39/992, remap 0/131072
>=20
> Initializing processors:
>=20
> =C2=A0CPU 2... OK
>=20
> =C2=A0CPU 0... OK
>=20
> =C2=A0CPU 1... OK
>=20
> =C2=A0CPU 3... OK
>=20
> Initializing unit: irqchip
>=20
> Initializing unit: ARM SMMU v3
>=20
> Initializing unit: ARM SMMU
>=20
> No SMMU
>=20
> Initializing unit: PVU IOMMU
>=20
> Initializing unit: PCI
>=20
> Adding virtual PCI device 00:00.0 to cell "ls1046"
>=20
> Adding virtual PCI device 00:01.0 to cell "ls1046"
>=20
> Page pool usage after late setup: mem 62/992, remap 5/131072
>=20
> Activating hypervisor
>=20
> WARN: unknown SGI received 5
>=20
> WARN: unknown SGI received 5
>=20
> //Linux hang here.
>=20
> After did some debuging,=C2=A0 I found the issue is with the followng cal=
ling.
>=20
> on_each_cpu(enter_hypervisor, header, 0);
>=20
> The following is definition of on_each_cpu.
>=20
> 611 void on_each_cpu(void (*func) (void *info), void *info, int wait)
>=20
> 612 {
>=20
> 613=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;
>=20
> 614
>=20
> 615=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preempt_disable();
>=20
> 616=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0smp_call_function(func, info, wait);
>=20
> 617=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_save(flags);
>=20
> 618=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func(info);
>=20
> //Can panic here if call panic("return from hypervisor\n");
>=20
> 619=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_restore(flags);=C2=A0=C2=
=A0
>=20
> //System hang and can't panic here if call panic("return from
> hypervisor\n");=C2=A0=C2=A0
>=20
> 620=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preempt_enable();
>=20
> 621 }
>=20
> 622 EXPORT_SYMBOL(on_each_cpu);
>=20
> I found the system hangs just after execute=C2=A0 local_irq_restore(flags=
),
> because the system can panic if I call panic() just before
> local_irq_restore(), but can't panic if add panic() just after
> local_irq_restore().
>=20
> I attached ls1046a.c.=C2=A0
>=20
> I am a=C2=A0newbies of Jailhouse,=C2=A0 how to debug such issue? any comm=
ents or
> suggestion is Welcome, thanks.
>=20

Henning (in CC) did a lot of work on this platform, and IIRC one
particular tricky issue was when the GIC was accidentally passed through
rather than intercept (not mapped). That's probably worth to check again
in your config.

Reminds me that we need to enhance "jailhouse config check" in this
regard...

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
jailhouse-dev/bf532fea-eca9-1c8b-a814-682e34962332%40siemens.com.
