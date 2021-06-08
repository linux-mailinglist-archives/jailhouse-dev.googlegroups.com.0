Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBNOR7WCQMGQEPEBZ7OY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53c.google.com (mail-pg1-x53c.google.com [IPv6:2607:f8b0:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624539F726
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Jun 2021 14:55:19 +0200 (CEST)
Received: by mail-pg1-x53c.google.com with SMTP id k5-20020a63ba050000b029021ab84617c0sf9167036pgf.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 05:55:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623156917; cv=pass;
        d=google.com; s=arc-20160816;
        b=tdlecv1uybW0TM7J/Jkw8n9i3cjvyI1LsULMECdWXCJ+Da8iFLhlCjpOJRzTmB8+H+
         4PNOmrXtO9nD7kDtcL03cDFNLVVDseg59MWECQNoGljoW2+Oxmbq6vbfzMZMc4J2DI1V
         x//ID+I1UiaIjA8eEOuBpRAVHT30YWa6I1sS8aq+4o5EvxnimTg74MShu35vHvZxzZUU
         7TKnRfsrngFRe7FgdE5mWDkDXU73VxeoLDwjej6KJgbAzfTkHLYwBIyvgCXyOWzXDYCw
         SLy+kaz6Q2rDKay/5h9Fhi6UzWKVKoNYhFFhZNeUoGb8rkWx0XkDhDdgrTRPLCD0baU0
         mCNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=xRPuijOXIixfHUrz99MuUoS3Z0FklCAMLp/eD5KaZZs=;
        b=fAEmYNBDWMYO4nenhN3icj2IhTdrwSZKiKGpWi47s0sdo9aLnpHcDU2jZl1WZ/qe0v
         P2JUrdX1QtDQMmTsIROcGLopdj8dvCyUdEhxYGElbfQkRtTRPESJLUoBLvWlnEnteK3d
         /mRoj/cfmSZbk03qh2q/1ldYD9AYf9cD/cpOcm2TZTyJsbgwV+sj46REr+GQThBH59C+
         p8AwrRRi06w2fipe+1RnNgdlF2ggpsHpMW54H8kkGaHxGFZqFP4lbHF5Ag8Fu1WBvXKG
         cRodg2VNHjVesp8mL0ioLcywwuIJgBvF+gofhlQMgeLK3IB1m7/ZoTwX/61Y/HPBdKvx
         TDrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=js67jBA1;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::841 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xRPuijOXIixfHUrz99MuUoS3Z0FklCAMLp/eD5KaZZs=;
        b=BATWMNyIo4BOWSyb2Q+ilbU6sV56vTl+C2g1DSrCEgU9qSQEI3XzAqwypBGCrt6vO4
         JJniHaASKrEsfQ+a7Z3SH/kbWNXN1KF0ELBMzrRbJy+1EqJ4KRhq5rJBhrw3ci0A8VBo
         Ys8RlztzMPgM9Sx3kRpW3GlbkZbrG0Lem5l67tkbRIragk2G3BNFVNFCsvVoiAu3zpUB
         6JRwfAwfUJwHJloo6q9QZFb9tlTyWQUPlSUXtR5ODxt0WuN+gieVcMTm5Nsf5QLavWcr
         asqj3tslzVv2FXAvBph72gUkiGCi3qwhfvY8kqNGRAYIdDxEsLXiqgtGsKxRnHRc9g3+
         sSZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xRPuijOXIixfHUrz99MuUoS3Z0FklCAMLp/eD5KaZZs=;
        b=DzGVTZFYQHLaRKEe2UNYptTDz6oZHhANHH2DdetbyaDDae/QTOxVyjPbwtxalHZ3c8
         IqFdE/GK2oQPWZeH9sAC4bCJwAMlXX88P5P3bC/BL/IsZg+ijvQfK5876WVTfwMN6tYz
         CY/6zrpdvR+xusfrxaTqhVSc4kb7mMCMjrYypFWBd0ZX11XKtw6XI6v+2E58vJQwvLIy
         ZvlIGLPkmBBjBCuD39kcTPmXcV+prVWWkdvo7eGTWQdW5V4RfTBoRaeRGuAs8QJDOiCu
         jOiW4NWRvOadIR6ZdZj2xWRr4NxERjtofNEdjqZ4ptUGWuOrs6FrnKXOO/eUA6eoJ1uw
         IHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xRPuijOXIixfHUrz99MuUoS3Z0FklCAMLp/eD5KaZZs=;
        b=IXtc9veIUKyqkc7DMs0ccbDiWzlSQsc+axrGccX8Wm/MKt39V9w8D/N9IRV3mnOQUP
         8cUIWXeSvQnC7LpiiqNBJWEFyFYSUqctMgwS70HY7zTUYClqGgnr+fiy1F9UsxP7sjIg
         qMXRmsUzYt61StvAcuLGKAV2VZO8mQKKl76nIIVcHwhWY7FoD7mkDjWLAMFKsDlbUOl8
         iQq+SsSDat5bVMUXz9OmaJOE85SfBvG50tWLsTBMAdk4vUqEEatRHnQorV1jYL5tvQLP
         Z1neiWqnt6LaMNCy20tK6f/v2XygWyQLB5kdixBBfOb3KopAcdmA4lxI3ELUVx09DTaJ
         wuzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533MMNzfIGn/FKSIUZe0V1zr016ktsddAGRNK07x25urAmypI8Vl
	VA/xLlZVKE+0l3cHHFPJfLs=
X-Google-Smtp-Source: ABdhPJysKWncplOmQB70lmEnCDnEhM8jiXeq0aC3PIUd5et1b/IK1JiyYLgZX6uZ40CecPsGZhLU7g==
X-Received: by 2002:a17:90b:1d02:: with SMTP id on2mr4784313pjb.128.1623156917496;
        Tue, 08 Jun 2021 05:55:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b611:: with SMTP id b17ls10368367pls.4.gmail; Tue,
 08 Jun 2021 05:55:17 -0700 (PDT)
X-Received: by 2002:a17:90a:6d82:: with SMTP id a2mr16357059pjk.150.1623156916940;
        Tue, 08 Jun 2021 05:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623156916; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMoFGWkL6PMZ1dlhm+07UvnIfnFwGXqoOXjPbYqHSmvxU5f1BTg7VE9gdkh3fdhp1b
         aogLThVZgEW4A8FSNjxh6+pKM8R8S3sqL5ksgo7pwDKH4JO+Zrf+yfNzfgm5Tw3N7+TC
         lBP7CBx5L6p0kCaihYXpvCACg1lVL+VFHVHhYMEvF1/Kf3uCNIvJlzoyQzOifmXMz05T
         +UU7Xi/kD0AOeeqHLM9+zZifVIDP1p96PEhjlcXGi/MwyBBb36JEk2p//FIFuqE4fJAw
         kyvnYTsFJ4oJHOL1YlUGqY9o0DgOUxxpBVIMjnxjW+pDBwuetC98pFNi9EFsX3njXq2X
         97DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2na7raTyAzw+P25mkWctajv/If3wuiXJfdKo9PpsEhc=;
        b=zfyD2PzKtw67zEBWWesb4LEBPZl5Rd1LLdR6b7zDHNXXTf3gtP1FkQ5OhXr+5G3ky3
         s+ZycLgqyozQOBwvrYOQdEZrbDwWwUBQOhpPhd+dGFiwcVfSqou5nGc6fG74RZZN/47X
         Bpk7dIwpKX94EGKUcFPwrqU+n8xS1FqtORg4lYyMEa/znuvP6u7HLKm5n6xrIk32bm0N
         OpiyJOj2jRI514/ujgx3WzgD+Hc5gAXOURnc5pB/ephRmoag1L7gnCJGWxJuYRRxcVp1
         ZHRiLnhB/yp+CiHPLpxLuAzuSGXDxkmJTa6LdunFKl395PcrN66Jo+EPblsIZyQ70pVw
         q4MA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=js67jBA1;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::841 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com. [2607:f8b0:4864:20::841])
        by gmr-mx.google.com with ESMTPS id b3si422892pjz.1.2021.06.08.05.55.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 05:55:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::841 as permitted sender) client-ip=2607:f8b0:4864:20::841;
Received: by mail-qt1-x841.google.com with SMTP id 93so7777685qtc.10
        for <jailhouse-dev@googlegroups.com>; Tue, 08 Jun 2021 05:55:16 -0700 (PDT)
X-Received: by 2002:ac8:5e81:: with SMTP id r1mr17742352qtx.70.1623156916162;
 Tue, 08 Jun 2021 05:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <CABSBigQATXq56FGPcsYaEhbPKAkfgW_q9j3ZcRPA8z-eK9v29g@mail.gmail.com>
 <f220116c-a666-5b73-9fe3-e5e4acd1583d@siemens.com> <CABSBigRR6qC2PU5hUE_HpLzBrn4Qn1=4j=V396ywRm4_u56A6A@mail.gmail.com>
 <a1b7be32-ecba-eeab-493f-3f80c9b00078@siemens.com>
In-Reply-To: <a1b7be32-ecba-eeab-493f-3f80c9b00078@siemens.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 8 Jun 2021 20:55:05 +0800
Message-ID: <CABSBigStz81rW1oBRkMd88e=-aKU+PUU01aA8Z5K1iPpLpYzJA@mail.gmail.com>
Subject: Re: Private Per-CPU Data access issue
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, gengdongjiu.gdj@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=js67jBA1;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::841
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On Tue, 8 Jun 2021 at 19:39, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 08.06.21 13:26, Dongjiu Geng wrote:
> > On Tue, 8 Jun 2021 at 18:53, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 08.06.21 11:20, Dongjiu Geng wrote:
> >>> Hi,
> >>>      From the jailhouse design, the Private Per-CPU data should be no=
t
> >>> accessed by other CPUs except the current CPU.  But from the code[1]
> >>> and my test, it is not. For example, the CPU1 can access the CPU0's
> >>> private data, because hv_paging_structs already map it, and the
> >>> per-cpu page table will link the hv_paging_structs.  is this a bug=EF=
=BC=9F I
> >>> think the Private Per-CPU data should be not accessed by other CPUs
> >>> except the self CPU.
> >>>
> >>> [1]:       err =3D paging_create(&hv_paging_structs,
> >>>                             paging_hvirt2phys(&hypervisor_header),
> >>>                             system_config->hypervisor_memory.size,
> >>>                             (unsigned long)&hypervisor_header,
> >>>                             PAGE_DEFAULT_FLAGS,
> >>>                             PAGING_NON_COHERENT | PAGING_HUGE);
> >>>
> >>
> >> You are referring to
> >> https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d3=
099f6eb9c657/hypervisor/paging.c#L678:
> >> Right, the initial mapping means everything is visible for all CPUs. B=
ut
> >> then comes
> >> https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d3=
099f6eb9c657/hypervisor/setup.c#L100
> >> which setups up an alternative mapping (installed by arch_cpu_init()).
> >> That does not contain the private data structs of the other CPUs. You
> >> should be able to confirm that AFTER initialization, e.g. on a first V=
M
> >> exit after setup.
> >
> > Thanks very much for the answer, could you paste the code where it
> > removes the private data structs of the other CPUs? I do not find that
> > logic.  After enabling jailhouse hypervisor and returning to the first
> > VM0. the CPU0 still can access other CPU's private  data structs, as
> > shown in[1].
> >
> > [1]:
> > @@ -261,8 +262,10 @@ int entry(unsigned int cpu_id, struct per_cpu *cpu=
_data)
> >                 return error;
> >         }
> >
> > -       if (master)
> > +       if (master) {
> > +              printk("10:
> > ----------------------------------------------------------%lx----\n",
> > per_cpu(10)->id_aa64mmfr0);
> >                 printk("Activating hypervisor\n");
> > +       }
> >
>
> Ah, need to correct myself:
>
> https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d3099=
f6eb9c657/hypervisor/arch/arm64/setup.c#L103
>
> So the disabling happens even later, in arch_cpu_activate_vmm. The
> alternative mapping we built up and installed in arch_cpu_init still
> contains full access as you noticed.
>
> Again, please try after the first vmexit.

Understand now, thanks for the explanation.

>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigStz81rW1oBRkMd88e%3D-aKU%2BPUU01aA8Z5K1iPpLpYzJA%40mai=
l.gmail.com.
