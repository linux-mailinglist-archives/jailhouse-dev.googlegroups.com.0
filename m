Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4VN7WCQMGQE6NSEHCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103b.google.com (mail-pj1-x103b.google.com [IPv6:2607:f8b0:4864:20::103b])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CDE39F53D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Jun 2021 13:39:31 +0200 (CEST)
Received: by mail-pj1-x103b.google.com with SMTP id nh19-20020a17090b3653b029016dd568ba85sf2054648pjb.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 04:39:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623152370; cv=pass;
        d=google.com; s=arc-20160816;
        b=Iv1dpMYmrBbJQKBr6v7RW72tg2Ppr5jmXCAKx5XXeyPoXQBWivQsfA6td91SHjGRQg
         PlDq3MviKKAwPVD6f0IKves+4B8vSqbcSU6HfQzsIJ2GMYKRfukPGryk1IrMJW6lITpp
         VDIVHn84TtDoYf/7Dj4ZOg3ZhsonTrsypRvpTmmgef2BmfI20d0+2oCMfG66FH0W0gE8
         pEcepUhZlNjdB/fFanL0d17xU6YL7GGIQpqOW44N6xDa878CJc7X1Kwg1gPLJSFpk53O
         okqJJEYer5AfRQToHs1JXDKUQNqnmbt1ft3i176vtNg/k6lARCp5M1J25ypnHA/GG0+m
         yuLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=ecYD8gHFyvZjhEuYCQZl92A3dakhYQLO2rGhgL4XBxo=;
        b=tf10VpYy9qVf/WR9OSFG/CZykKIQZlbcKD+AUrd6MYPoFfyda9creVa3sbEpQ1qLhq
         WWB8DZ/279j+8Iiqi9fMSUoMZD53IFALVQVS/WPU2Hu/y+KKeT7vnpc0xD3L+6ePgB2w
         Fxn1D12NlPgvYCkji3ocy5z0hN92RZmhJdVTfiplWN0uBQZWcffTtxzAOxp7NQ4Lyj0k
         G6kBaHqSeQX2oER1YzVhDdvEQz0ayTtrg0InrRvV2wpmWvY681uoygvCShsIheYsHsXM
         E7Uf0EKWEyxEcq1CK+j3eMC4Q161/dz/0VOmj1iP1v38DYG+xwam7c1NRI+BZ4LwU5kH
         PtBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ecYD8gHFyvZjhEuYCQZl92A3dakhYQLO2rGhgL4XBxo=;
        b=RnVONellRmH2Z0do7xEFEh0HDKWm+6jZJBKYmJf27OgivDCF1nu4Ni1ydZRegZbWmV
         xVbkj0uL43aI+urxpT26Xl9am85OVVRFJWFaP7FPilsZ0jkR1SGTDcU8D+DXyJ7hoqzY
         4XWqwe1Pit3haHdmmtOONY0e8oEHXLDekgJS0K64I4snaVSZJTAaFj0UO+qGcE+pocKJ
         /QY7jh07xzANGjb0a0uzLm16Xfyi7zQV68Jwt848l9YXGEvh9OZ4bkauxntzCBgWs7yz
         LYnnQcF9A//eSL7LJfJDXswN2fq+mMMepi6MPujNJaQk6NcDYms4uDaQwe/XDBMUUGSS
         TPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ecYD8gHFyvZjhEuYCQZl92A3dakhYQLO2rGhgL4XBxo=;
        b=DDP8SmdLnJJMEgYI2iycafLL421BuigLzGsTejMqDurVVnk+kvLpb0F6BGLr0F9XLL
         CA8V5+vsR6PdgMlQ0jmjK9kcupq4mcA5O6zZQNSINarOOmuZFlwVr6hcEeVNh1d1XFF+
         i/qWlql8ztmv7JTzCEq2kkIR1qSZFQQUBjX6VpVUFnFD4jj0sRbdDRcU/vSzyHTt7TV6
         RMmp6iO0T+pruotZ+5B0U6QeKJe/pjuJfll8D8DiHHqXMZ7XVubYeC/rm11rdL3KExSw
         RvVkM7Nye3nl9fvox1wduZGW04RnoEHY8i8y4oocLxnY4PEDyzXltm4rQdQ9WwgT2Kiv
         GW7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531mihV4NzF2H+fT9ZWQ8U4R5y638EPKpaPERnSEGtowPpMTULKI
	vo6UMsRgR/Jh020R0z2NxLw=
X-Google-Smtp-Source: ABdhPJyTMDmTufA0QN1e4i+o7soYmRXYMrzAjuG9dg25Hn1ovYIlblusfR9z0AJ881Krw2k4BLDD9w==
X-Received: by 2002:a17:90a:3484:: with SMTP id p4mr26052987pjb.2.1623152370479;
        Tue, 08 Jun 2021 04:39:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:5013:: with SMTP id e19ls8991597pgb.2.gmail; Tue, 08 Jun
 2021 04:39:29 -0700 (PDT)
X-Received: by 2002:a63:7945:: with SMTP id u66mr21809408pgc.200.1623152369837;
        Tue, 08 Jun 2021 04:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623152369; cv=none;
        d=google.com; s=arc-20160816;
        b=g80BSMXaySQKnIXs4iLNU6ctQ9f+o94/j0z3YSCaED8/yNYJt0O+06OG/dc9le8Njk
         0ciTV7bXn5SCSk/8IN+Ao8asL9qYeCzJMfP4bNN0wFTZvNEH9B9Ud9R3QWU4EKQo1RmV
         Cpt8t2coTKALpWLFMJsK/8YEjrIaRn9tKvx1qfTgXVW90kIMoHkzDDusaKZkWDuIc2Ag
         j2F2YoqUehQ30IyqKo8ODAx4CrMrPuuRtHo9vjaGW2L3DGqmSdtXBKhBKTNO31JdCehy
         L4OgpF+PruqQZs5+S0CebjVX2zGc5cYetSZv70HcIQA1YMq86AEsoEB/i4UD7lHL1zfm
         +yZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=OiqiKKUCBlRq56IMbNS34c7wX4305k/9v7BrH5U5gvI=;
        b=Gxa+NNFvIojvHEsk9yip3Je1q6D2nS8SubPBh9nK4HWVU30+YDQnPV4F8Wbdl0TiGG
         LppD6VkoC7fTF0Rw5Hk9KTOUPF+qf31j/3Sc/NTTe/O4Q2rnz6q7X5hb0B6QU90dXGc0
         U0wXxgYlr3xjjB0yEeeOVsFigVvs0xZAWPQc5PKkuUhZlJ/4BkzvPQKJTnG2U9oYML16
         oFNX0k0TScWcANFOmVeBVfQ4yxLIYsHLvk3gZ0oeTjJ1PM2BRpRl0DKIMmqZz/jx/M7j
         easi6FRzPwzc6owHnX14byvNB/OJWLGl1g0kJ6qrmZ2ApPF3AR3oFX7U95kbvRbb4pFY
         jXPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id mm4si309595pjb.2.2021.06.08.04.39.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 04:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 158BdI93031244
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Jun 2021 13:39:18 +0200
Received: from [167.87.44.81] ([167.87.44.81])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 158BdILV009677;
	Tue, 8 Jun 2021 13:39:18 +0200
Subject: Re: Private Per-CPU Data access issue
To: Dongjiu Geng <gengdongjiu1@gmail.com>
Cc: jailhouse-dev@googlegroups.com, gengdongjiu.gdj@alibaba-inc.com
References: <CABSBigQATXq56FGPcsYaEhbPKAkfgW_q9j3ZcRPA8z-eK9v29g@mail.gmail.com>
 <f220116c-a666-5b73-9fe3-e5e4acd1583d@siemens.com>
 <CABSBigRR6qC2PU5hUE_HpLzBrn4Qn1=4j=V396ywRm4_u56A6A@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a1b7be32-ecba-eeab-493f-3f80c9b00078@siemens.com>
Date: Tue, 8 Jun 2021 13:39:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CABSBigRR6qC2PU5hUE_HpLzBrn4Qn1=4j=V396ywRm4_u56A6A@mail.gmail.com>
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

On 08.06.21 13:26, Dongjiu Geng wrote:
> On Tue, 8 Jun 2021 at 18:53, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 08.06.21 11:20, Dongjiu Geng wrote:
>>> Hi,
>>>      From the jailhouse design, the Private Per-CPU data should be not
>>> accessed by other CPUs except the current CPU.  But from the code[1]
>>> and my test, it is not. For example, the CPU1 can access the CPU0's
>>> private data, because hv_paging_structs already map it, and the
>>> per-cpu page table will link the hv_paging_structs.  is this a bug=EF=
=BC=9F I
>>> think the Private Per-CPU data should be not accessed by other CPUs
>>> except the self CPU.
>>>
>>> [1]:       err =3D paging_create(&hv_paging_structs,
>>>                             paging_hvirt2phys(&hypervisor_header),
>>>                             system_config->hypervisor_memory.size,
>>>                             (unsigned long)&hypervisor_header,
>>>                             PAGE_DEFAULT_FLAGS,
>>>                             PAGING_NON_COHERENT | PAGING_HUGE);
>>>
>>
>> You are referring to
>> https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d309=
9f6eb9c657/hypervisor/paging.c#L678:
>> Right, the initial mapping means everything is visible for all CPUs. But
>> then comes
>> https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d309=
9f6eb9c657/hypervisor/setup.c#L100
>> which setups up an alternative mapping (installed by arch_cpu_init()).
>> That does not contain the private data structs of the other CPUs. You
>> should be able to confirm that AFTER initialization, e.g. on a first VM
>> exit after setup.
>=20
> Thanks very much for the answer, could you paste the code where it
> removes the private data structs of the other CPUs? I do not find that
> logic.  After enabling jailhouse hypervisor and returning to the first
> VM0. the CPU0 still can access other CPU's private  data structs, as
> shown in[1].
>=20
> [1]:
> @@ -261,8 +262,10 @@ int entry(unsigned int cpu_id, struct per_cpu *cpu_d=
ata)
>                 return error;
>         }
>=20
> -       if (master)
> +       if (master) {
> +              printk("10:
> ----------------------------------------------------------%lx----\n",
> per_cpu(10)->id_aa64mmfr0);
>                 printk("Activating hypervisor\n");
> +       }
>=20

Ah, need to correct myself:

https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d3099f6=
eb9c657/hypervisor/arch/arm64/setup.c#L103

So the disabling happens even later, in arch_cpu_activate_vmm. The
alternative mapping we built up and installed in arch_cpu_init still
contains full access as you noticed.

Again, please try after the first vmexit.

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
jailhouse-dev/a1b7be32-ecba-eeab-493f-3f80c9b00078%40siemens.com.
