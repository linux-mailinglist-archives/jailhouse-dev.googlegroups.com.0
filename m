Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBGOJTSKQMGQEDZZ2WQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079D5484FD
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jun 2022 13:50:55 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id f5-20020ac87f05000000b003052b88f1desf3148166qtk.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jun 2022 04:50:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1655121051; cv=pass;
        d=google.com; s=arc-20160816;
        b=fdEt51Gdnxf7FI88ctxwyqdyFpGXA2cSpKSG2AcD71iId7vaT8HxSKyj9U+P+ZQ3jF
         1lKyf+tkpTR/jH40HhT819iczNlBSh5LMeYn0YXqP+2cMx35xXM71Q3aB1jRD3Z6ekLD
         4qqVMu60S3xgrKVEfdK3PtSycAivnS3Hvjvl+v4TlyGH3z5kdCUefQp9GUFyw5agj1/k
         vIfqhxihk8YiRusQZAZBnLlXaG/QCoCmTr5wFdbaBonNrdCJnocO4sUvDxBTBvrMrzjo
         FcB4LGB3qFWtD6XsF4eSOIGyNTuyp6PrVldoiMiALk/ivT98rfhrov5gzoe2fsP5f08j
         f5Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=yIBohOpJe/EU/q0bznuMTjQRqw0HG8DrRoyYM+2Cy7c=;
        b=yGm/Z2NpqE9ynIzi360q9xOhWACfGGRM9dqqjSpoBXe1YdTCmBn4RceGHc5CHA3ar4
         sihBoEPZcE3msh9aG/e1z11KxtP2NP9ql70RYaTJyNbpUv1rgvQgcwZ2nepc+rf6yLLc
         eIo+C4SPY+hkz+uK3k9RHTkzCEqnksOCKGqP+U3cfxYLHv1twar8595/o0JkGXBIWe/r
         N1bFg9XnIdffmAqEWPnzdE6Kzk5GKg9aPi/QaDc5bGVzi+4UhFWKgvufTJYdPrSkSwpG
         PhrhLRc0CPoJncAMczGzUx1dsRA3WTOjHXkCruoRetILUuzzKM+nLGlvs60y3TbVKIEZ
         UlDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=cvoSsNS7;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1044 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yIBohOpJe/EU/q0bznuMTjQRqw0HG8DrRoyYM+2Cy7c=;
        b=Zws0EEYpX/DULODBJsI9oF11eAQOL61gFAGjhcDXtpSOUK5hD0yRpIZdyXp6ZT4LxU
         FJaTwcnq92rWD1FJyJCCOVxauAj7nabhFs781/4pMj/6vp4HjFgP9EZjO5ECJwQrGHUl
         irR3Kw6T9DTN6FDneClc1WELpGCwuGNrRfSeYEuEZMQy9WL16t9/tOsMlcYZJmEqeYvR
         TqUoVcmv2Bt6CGnA8rzfxHWyGZFWzANt/vKteZCijtRqpdlz/HadXdRYFLdQtzOxZeRj
         l2jhVl0skaHEQRkodve5gKraD1X/inuo/+SxlMRqsLRYHyIOirXYvl7wHqVkhr2A79b8
         kUyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yIBohOpJe/EU/q0bznuMTjQRqw0HG8DrRoyYM+2Cy7c=;
        b=eyUcFBHHN4bVD0Mh6ooyvafqq9bOEGtYHPna9t5gOEQEwng3xszWtW5nGErk3nRmaP
         5o24Truf0k278cKahkNvN9p0w1mP6Qy8Kdpf/Y54/dC2NL7AEI3NqnErQQCGU6w6mzPi
         06+dycA+B4REBtQnIRPIJrp3mAzUpvVHDYm375PqRfBKBFpfddCIZIjWOMLfZc/0tCN6
         ceYuOYQvTsdD9AgmR841MtDzlXJc55Ivn4vfrRkqM0sCaCNTI9izq6f6h5TWzcXELFNn
         as+LqNAoNYCg04EbLB2dRdDWCs04fQQ0KpsXLUWg3QgBOBlQNAHKFlE/wxCUN1S+S1Mj
         i+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yIBohOpJe/EU/q0bznuMTjQRqw0HG8DrRoyYM+2Cy7c=;
        b=moscttPrOo8LAdVkB9ZTMQWZOB5U4GAMLj8vyHVi3QVBnHHNoWVHuUjyAPMC4ISHn7
         wi9kVQDfJnn4MChK0f9rCsHG2Kyftcy0p4aSJlR32LVDxYLnA6qKy1tDyiKeuSc0K9m8
         Xq+VSajs5cTgPC0c4Saj9jjvJ8XubcLt/SfY+F4iEjmc1U363/awvHxCaZVk6a724XgB
         UXnKWP/iN1KkoUvzZCNpA8CsLY4iEbVmZFnlk1UPVgbUSziu4XaIrkw8O1z3MNtEmIAi
         S8Nj4AhqFQJIazEPlNDk7dOXw1ObwokmNugqNj5SR7+DUcxREttoQgTBvRBwTK5Cj3eN
         Lk7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OOpG+1IHPDVZEV4L9mXhCfoZZEm2oqqOzvxPilM1G+xfLeOWY
	MnA+cSgLar+kj+u1gHG+DEA=
X-Google-Smtp-Source: ABdhPJzm6WXFW14pwN+1PM2akr2qL1kNHIausPSByutyQLW2DAz+jj/3w36YTfk8nZQhnRIc44J2Aw==
X-Received: by 2002:a0c:cc86:0:b0:464:6bf5:4719 with SMTP id f6-20020a0ccc86000000b004646bf54719mr43906568qvl.121.1655121049786;
        Mon, 13 Jun 2022 04:50:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:147:b0:304:fd78:d72c with SMTP id
 v7-20020a05622a014700b00304fd78d72cls1290692qtw.0.gmail; Mon, 13 Jun 2022
 04:50:49 -0700 (PDT)
X-Received: by 2002:a05:622a:187:b0:304:fb76:fa52 with SMTP id s7-20020a05622a018700b00304fb76fa52mr25650351qtw.176.1655121049089;
        Mon, 13 Jun 2022 04:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655121049; cv=none;
        d=google.com; s=arc-20160816;
        b=x7XRE2oXfn3S4DhwqDEvpQHEu6eqeL1wQMhyLpXQQm8B4cn1ZjPYlcv5yWBQ1QZtEr
         Lt6Bv84ZQCslLkfdZmFIDtIIobJPVDIU9dyL4TWqQarLuSzIoiQR636X9D8Y/ymcmLaT
         tFfi5zfNe7nIYuA4mPz6cjVS88TiY3KsYos26kPvc69php4S2kPVvf5f5PC3+69MAvy2
         cAOrt0MZp55hB9HvA/Jnl1bSQnGVfr4n8uxwby2/XKVOqRCTebRP3Vrj9ouUEkpAcb+j
         3KU+II7V6heVh1iBIoZ49AVZIlgJeClo0cpBi2YS7eo13/gKTh8BSpTHYAV1fNrwRqMJ
         5rvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRlbJkCHfUt9Z8QCPwz9gK5p19jWYCp/NqkyRlOZKHI=;
        b=JnvWkyn7gtlGpUo6P9PGCWolD8IdzOKQxrKZbbbvs3dyxTIrf37zcl72ERB3kkJaQU
         ARkdGRq6xeuPMoUn3T98yLfSoNTqKQhYIvx4Dgbwb2aAoI2Ekc71UKLoQcZGwJarzgrj
         PtSSfDACvVr6Gc0ZlDnsDzSrYKsmDydrfploE3KJNaKLl2Txl7tOT7KgEMsPjHnA8q9R
         jIWb4MFF0/WOES66NgxMCQaNqryOp5dZX+8ZT4FNpcNmfFY4KygMz//rcnIryk0GK50N
         mAFy9EK0x1FCdmt6eWOTWihgRsFdGP+9UN/6+N6FkThu6IjEot7JFWqCoDIxIRXSba+5
         VkyQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=cvoSsNS7;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1044 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com. [2607:f8b0:4864:20::1044])
        by gmr-mx.google.com with ESMTPS id z5-20020ac875c5000000b003051a3c189asi310144qtq.4.2022.06.13.04.50.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 04:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1044 as permitted sender) client-ip=2607:f8b0:4864:20::1044;
Received: by mail-pj1-x1044.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso5671738pjh.4
        for <jailhouse-dev@googlegroups.com>; Mon, 13 Jun 2022 04:50:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2241:b0:1e8:8ad8:5f22 with SMTP id
 hk1-20020a17090b224100b001e88ad85f22mr15243746pjb.73.1655121048091; Mon, 13
 Jun 2022 04:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220603131124.2007946-1-gengdongjiu1@gmail.com>
 <CABSBigRHEKJLuer6JrvPER2oEZJnaiFb2YsHeHRasoNjVX-f4Q@mail.gmail.com> <c078ec55-8565-b2a9-581a-32903625c73b@siemens.com>
In-Reply-To: <c078ec55-8565-b2a9-581a-32903625c73b@siemens.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 13 Jun 2022 19:50:36 +0800
Message-ID: <CABSBigRqAi4EwdTj=GXjsWGw4j690HBJoUpfQD6G6hp3hzffwQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: check whether HPFAR is valid before getting IPA
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=cvoSsNS7;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1044
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

Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8810=E6=
=97=A5=E5=91=A8=E4=BA=94 13:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On 09.06.22 17:27, Dongjiu Geng wrote:
> > ping=EF=BC=8Csorry for the noise
> >
>
> No need to be sorry, I unfortunately didn't find the time to fully
> understand this.

Thanks for your time.

>
> >
> > Dongjiu Geng <gengdongjiu1@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=883=
=E6=97=A5=E5=91=A8=E4=BA=94 21:11=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> The HPFAR can be invalid if the stage 2 fault did not happen during a
> >> stage 1 page table walk (the ESR_EL2.S1PTW bit is clear) and one of th=
e
> >> two following cases are true:
> >>   1). The fault was due to a permission fault
> >>   2). The processor carries errata 834220
> >>
> >> Therefore, for all non S1PTW faults where we either have a permission
> >> fault or the errata workaround is enabled, we resolve the IPA using th=
e
> >> AT instruction.
> >>
> >> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> >> ---
> >>  hypervisor/arch/arm64/include/asm/paging.h  |  8 ++
> >>  hypervisor/arch/arm64/include/asm/sysregs.h |  8 ++
> >>  hypervisor/arch/arm64/include/asm/traps.h   |  2 +
> >>  hypervisor/arch/arm64/mmio.c                |  7 +-
> >>  hypervisor/arch/arm64/traps.c               | 89 +++++++++++++++++++-=
-
> >>  5 files changed, 105 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/a=
rch/arm64/include/asm/paging.h
> >> index e600cf58..4f0cb81c 100644
> >> --- a/hypervisor/arch/arm64/include/asm/paging.h
> >> +++ b/hypervisor/arch/arm64/include/asm/paging.h
> >> @@ -198,6 +198,14 @@ unsigned int get_cpu_parange(void);
> >>                                 | (cpu_parange_encoded << TCR_PS_SHIFT=
) \
> >>                                 | VTCR_RES1)
> >>
> >> +/* Flags for get fault ipa from gva */
> >> +#define GV2M_READ              (0u<<0)
> >> +#define GV2M_WRITE             (1u<<0)
> >> +
> >> +/* Indicates address translation aborted */
> >> +#define PAR_F                  (1UL)
> >> +#define PADDR_MASK             ((1UL << 48) - 1UL)
> >> +
> >>  int arm_paging_cell_init(struct cell *cell);
> >>  void arm_paging_cell_destroy(struct cell *cell);
> >>
> >> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/=
arch/arm64/include/asm/sysregs.h
> >> index 868ef887..2c683832 100644
> >> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> >> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> >> @@ -117,6 +117,14 @@
> >>  #define ESR_IL(esr)            GET_FIELD((esr), 25, 25)
> >>  /* Instruction specific syndrome */
> >>  #define ESR_ISS(esr)           GET_FIELD((esr), 24, 0)
> >> +
> >> +/* Fault status code of instruction specific syndrome */
> >> +#define ESR_ISS_FSC(esr)       GET_FIELD((esr), 5, 0)
> >> +
> >> +/* Shared ISS fault status code(IFSC/DFSC) for Data/Instruction abort=
s */
> >> +#define ESR_ISS_FSC_TYPE       (0x3C)
> >> +#define ESR_ISS_FSC_PERM       (0x0C)
> >> +
> >>  /* Exception classes values */
> >>  #define ESR_EC_UNKNOWN         0x00
> >>  #define ESR_EC_WFx             0x01
> >> diff --git a/hypervisor/arch/arm64/include/asm/traps.h b/hypervisor/ar=
ch/arm64/include/asm/traps.h
> >> index a7c07624..0efedef1 100644
> >> --- a/hypervisor/arch/arm64/include/asm/traps.h
> >> +++ b/hypervisor/arch/arm64/include/asm/traps.h
> >> @@ -25,6 +25,8 @@ struct trap_context {
> >>
> >>  void arch_handle_trap(union registers *guest_regs);
> >>  void arch_el2_abt(union registers *regs);
> >> +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long *ipa,
> >> +                                unsigned int flag);
> >>
> >>  /* now include from arm-common */
> >>  #include_next <asm/traps.h>
> >> diff --git a/hypervisor/arch/arm64/mmio.c b/hypervisor/arch/arm64/mmio=
.c
> >> index 7fbfef75..70301ab3 100644
> >> --- a/hypervisor/arch/arm64/mmio.c
> >> +++ b/hypervisor/arch/arm64/mmio.c
> >> @@ -43,7 +43,6 @@ enum trap_return arch_handle_dabt(struct trap_contex=
t *ctx)
> >>  {
> >>         enum mmio_result mmio_result;
> >>         struct mmio_access mmio;
> >> -       unsigned long hpfar;
> >>         unsigned long hdfar;
> >>         /* Decode the syndrome fields */
> >>         u32 iss         =3D ESR_ISS(ctx->esr);
> >> @@ -57,10 +56,10 @@ enum trap_return arch_handle_dabt(struct trap_cont=
ext *ctx)
> >>         u32 is_write    =3D iss >> 6 & 0x1;
> >>         u32 size        =3D 1 << sas;
> >>
> >> -       arm_read_sysreg(HPFAR_EL2, hpfar);
> >>         arm_read_sysreg(FAR_EL2, hdfar);
> >> -       mmio.address =3D hpfar << 8;
> >> -       mmio.address |=3D hdfar & 0xfff;
> >> +
> >> +       if (!arch_get_fault_ipa(ctx, &mmio.address, GV2M_READ))
> >> +               return TRAP_HANDLED; /* Try again */
>
> So, this means we need to make the guest trap again, and then HPFAR is
> valid??

Maybe this invalidation is due to someone playing with the Stage-2
page table of the domain,  and can not get the right IPA, so we try
again.


>
> >>
> >>         this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_MMIO]++;
> >>
> >> diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/tra=
ps.c
> >> index 488dd7f8..10441b4b 100644
> >> --- a/hypervisor/arch/arm64/traps.c
> >> +++ b/hypervisor/arch/arm64/traps.c
> >> @@ -33,6 +33,85 @@ void arch_skip_instruction(struct trap_context *ctx=
)
> >>         arm_write_sysreg(ELR_EL2, pc);
> >>  }
> >>
> >> +static bool check_workaround_834220(void)
> >> +{
> >> +        unsigned long midr;
> >> +       unsigned int variant, revision, part;
> >> +
> >> +       arm_read_sysreg(MIDR_EL1, midr);
> >> +
> >> +       variant =3D (midr >> 20) & 0xf;
> >> +       revision =3D midr & 0xf;
> >> +       part =3D (midr >> 4) & 0xfff;
> >> +
> >> +       /* Cortex-A57 r0p0 - r1p2 */
> >> +       if (part =3D=3D 0xD07 && variant <=3D 1 && revision <=3D 2)
> >> +               return true;
> >> +
> >> +       return false;
> >> +}
> >> +
> >> +static bool hpfar_is_not_valid(bool s1ptw, u8 fsc)
> >> +{
> >> +       /*
> >> +        * The HPFAR can be invalid if the stage 2 fault did not
> >> +        * happen during a stage 1 page table walk (the ESR_EL2.S1PTW
> >> +        * bit is clear) and one of the two following cases are true:
> >> +        *   1. The fault was due to a permission fault
> >> +        *   2. The processor carries errata 834220
> >> +        *
> >> +        */
> >> +       return (s1ptw =3D=3D 0U) && (((fsc & ESR_ISS_FSC_TYPE) =3D=3D =
ESR_ISS_FSC_PERM) || check_workaround_834220());
> >> +}
> >> +
> >> +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long *ipa,=
 unsigned int flags)
> >> +{
> >> +       unsigned long hpfar, hdfar, par, tmp;
> >> +
> >> +       u32 s1ptw =3D ESR_ISS(ctx->esr) >> 7 & 0x1;
> >> +       u8 fsc =3D ESR_ISS_FSC(ctx->esr);
> >> +
> >> +       arm_read_sysreg(FAR_EL2, hdfar);
> >> +
> >> +       if (hpfar_is_not_valid(s1ptw, fsc)) {
> >> +
> >> +               /* Save current PAR_EL1 */
> >> +               arm_read_sysreg(PAR_EL1, tmp);
> >> +
> >> +               /*
> >> +                *  Performs stage 1 address translation, with permiss=
ions as if
> >> +                *  writing to or reading from the given virtual addre=
ss from EL1
> >> +                */
> >> +                if ( (flags & GV2M_WRITE) =3D=3D GV2M_WRITE ) {
> >> +                        asm volatile ("at s1e1w, %0;" : : "r" (hdfar)=
);
> >> +                } else {
> >> +                        asm volatile ("at s1e1r, %0;" : : "r" (hdfar)=
);
> >> +                }
> >> +
> >> +               isb();
> >> +
> >> +               /* The resulting address can be read from the PAR_EL1 =
*/
> >> +               arm_read_sysreg(PAR_EL1, par);
> >> +
> >> +               /* Recover current PAR_EL1 */
> >> +               arm_write_sysreg(PAR_EL1, tmp);
> >> +
> >> +               /* If PAR_EL1.F =3D 1, address translation aborted */
> >> +               if ((par & PAR_F) =3D=3D PAR_F) {
> >> +                       printk("Failed to ipa!\n");
> >> +                       return false;
> >> +               } else {
> >> +                       *ipa =3D (par & PADDR_MASK & PAGE_MASK) | (hdf=
ar & (~PAGE_MASK));
> >> +               }
> >> +       } else {
> >> +               arm_read_sysreg(HPFAR_EL2, hpfar);
> >> +               *ipa =3D hpfar << 8;
> >> +               *ipa |=3D hdfar & 0xfff;
> >> +       }
> >> +
> >> +       return true;
> >> +}
> >> +
> >>  static enum trap_return handle_hvc(struct trap_context *ctx)
> >>  {
> >>         unsigned long *regs =3D ctx->regs;
> >> @@ -71,7 +150,7 @@ static enum trap_return handle_sysreg(struct trap_c=
ontext *ctx)
> >>
> >>  static enum trap_return handle_iabt(struct trap_context *ctx)
> >>  {
> >> -       unsigned long hpfar, hdfar;
> >> +       unsigned long hpfar;
> >>
> >>         if (this_cpu_data()->sdei_event) {
> >>                 this_cpu_data()->sdei_event =3D false;
> >> @@ -83,11 +162,11 @@ static enum trap_return handle_iabt(struct trap_c=
ontext *ctx)
> >>                 return TRAP_HANDLED;
> >>         }
> >>
> >> -       arm_read_sysreg(HPFAR_EL2, hpfar);
> >> -       arm_read_sysreg(FAR_EL2, hdfar);
> >> +       if (arch_get_fault_ipa(ctx, &hpfar, GV2M_READ))
> >> +               panic_printk("FATAL: instruction abort at 0x%lx\n", hp=
far);
> >> +       else
> >> +               panic_printk("FATAL: instruction abort and can not get=
 ipa\n");
> >>
> >> -       panic_printk("FATAL: instruction abort at 0x%lx\n",
> >> -                    (hpfar << 8) | (hdfar & 0xfff));
> >>         return TRAP_FORBIDDEN;
> >>  }
> >>
> >> --
> >> 2.25.1
> >>
>
> How common is this erratum? Is it already affecting real boards? Just to
> get a feeling for the urgency.

Yes,  it can affect the real boards.
For example,  if we configure a buffer's  stage2 page table to readonly for=
 VM,
this VM's process writes this buffer, then it will trigger stage2
permission fault.
In this case, we can not get the right IPA without this patch.


>
> Thanks,
> Jan
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigRqAi4EwdTj%3DGXjsWGw4j690HBJoUpfQD6G6hp3hzffwQ%40mail.=
gmail.com.
