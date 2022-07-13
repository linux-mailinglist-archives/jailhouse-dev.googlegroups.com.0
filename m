Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBDOKXOLAMGQEJHXWYZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD3573A29
	for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Jul 2022 17:30:23 +0200 (CEST)
Received: by mail-ot1-x33a.google.com with SMTP id x4-20020a056830114400b0061c3905a28asf4554796otq.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Jul 2022 08:30:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1657726222; cv=pass;
        d=google.com; s=arc-20160816;
        b=JzifvQbWCxPSGXSKOd6OSNNQsxYOqWCNh/KaP+97aSXslboqKroxWHUds5QqCGQOEA
         yTOHgsitWgdh8pJmVtpCrDV4WiaDufB806z5ZjX8dVc3Mz38ReslUrG4NiF79vlsV8D8
         i9G3BDbpUO232Ny/LTRMN4w9NQwE1v+uEMaPySM/TrkriP9k6rXbPwthoitbQ9TzX5PE
         uPt9i+1gBCdNFdbvVksf/XPXyQw+NEh4LB0MU7cPPBIL2jm856wCeQ4b0ygsRSenyA9z
         YamcaXrYWEbcYWmUYoPFKGgsklCONHGKM0/SJOcdKARmh/2JlyBcfzdDwv3tZFyouHjY
         4GPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=BIJB2g6IGsMxIU+8FOjy2RAdTiliUdxt1NASp9kgkVo=;
        b=s9eT5ZCSehlLgIjuGC+AEwMolCZzKN+k30vUrjys8Wt6BIZkDsUKmQNJ+hDfwX41MA
         zc6L0OtiOs5F9AkzrqBHhNKhuf1w5NcxlAR+J6xCF1ux7UWSVMYfqlNDwcsmy6f5SXIS
         HBksDiDT17XcWOfIXm0MfTRVIOWYvezVpjfOQYdLxSIyD191RQM1JOcfQJ8y+XgD9r6K
         QKfQHnZVDI7lU6jkLUTSw2NM08q2p+5gzGb9aO+/TImghEX0a2kaSYIiFOjoBn/a+dCN
         wfEmKGVB3rXwebwPAPx7NLoJK1Y844+5wWfFYzc6UXUryq7onw/J3yc7c7OF7FpLuY2p
         6jVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dz5qKAXz;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BIJB2g6IGsMxIU+8FOjy2RAdTiliUdxt1NASp9kgkVo=;
        b=LcTYlDyfdE/PAZlGtnilgGWyjo+koH6EXaPWbXU8Ljnt+QVuy52GYOXGSNdYyfNsLM
         bfk6hEYY1q3l8T/VWoDPkRc8XY/tTjLpgLi11yKb2s8rC35cgsQj1VIo/2QIcEVT0YRE
         b1OTqqrzLbej3gIX6XZPxKdLgOR6G5H6CZKA4SsAvMY+0GptgMYwhPSK71GmdN17S3HX
         waoRgjadCAawes8OAU/wv76WLKEZH0y2C+5Ox3qRYRfqcOJPiYxAC4/AW6YRWymh8+oo
         PTjaABIHwQMlUmhKM9dZ8cljjUW1SHSFtxgRl05MoaD6iOjjdjat4vXvgn2vSw9HnRF3
         9UPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BIJB2g6IGsMxIU+8FOjy2RAdTiliUdxt1NASp9kgkVo=;
        b=p3Wc4dLL3FoRWOPwhYKYDjDrvA8DDz6+MSvfkhZB/Y+1/5kOk+1hpmNCGh+GGFB+r7
         LeMaBUBqHG2Is7yHgu8D2l3Pov4cafTCAVgDDBoLGlZwXAVYmtv3qDvoYEV0W0Jn14UL
         cXn0opnMHi00bMcjckHOiHiht8lae+bk/T6tD9+0IA2IVHaU6MUBkh6qebwSdSgV2sch
         dcvsLBtbgsDR19b0rNBRy8380wWXqxnM8IIAfoZVipklx4Ix/B2o3ldl6DOvu8mbzsJq
         2VmOwaDO3s9yaGiOLhwUpo7hm6D8XTuoozSdjRkIgzMuVaxBzd61qOWd26fI3sbcgyQX
         f6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BIJB2g6IGsMxIU+8FOjy2RAdTiliUdxt1NASp9kgkVo=;
        b=ccX7Q/4VbVPauQFUIYi05v6IBglKBAeAMQbKUBzZjbDC0ENx5TeE7swXVo8Oan8d+S
         zww2U1qKEMrgQyvnXqTcXYPzdnXO6MLCTidl3uk+ENON6OhlJi7wXwQmsOOrAEBN/CBO
         b/DhOfExaREY3C/NWLfl8wABeat8ASwjcMqswVdsJ5zkw8/nLcdUxqMc192BDKm4LzAR
         KcZTSDZ8FDyZmBA0e+VFCLodyDMhGyshUfU8OAHPo64IZLcHNGU2sBfn1szWK8lA69th
         zVX0wR2Ja+8zmlcfK77j7BSc8GXMi6kkQmPGOI1cheE94VcOCX2ZPVQ5jHWGx7Vh9FP8
         Qskw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+J3JKh1wMDAEF8tEz/KaLI5GkYBd3AWYuIqLldp2exliTM+d1u
	Z/Gm3Mxy3iTVgnVIyxc9g7w=
X-Google-Smtp-Source: AGRyM1tLHd7a1AnFi9g9wSU66Ogz0fHu60PEUwvZgHg8DN+Sk3J33p1XEEh5H10b4Ut0Tc0T8/f/ZQ==
X-Received: by 2002:a05:6870:a91d:b0:10c:55e:3f64 with SMTP id eq29-20020a056870a91d00b0010c055e3f64mr2040322oab.123.1657726221921;
        Wed, 13 Jul 2022 08:30:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:742:0:b0:337:d77f:896 with SMTP id 63-20020aca0742000000b00337d77f0896ls4133oih.7.-pod-prod-gmail;
 Wed, 13 Jul 2022 08:30:21 -0700 (PDT)
X-Received: by 2002:a05:6808:3088:b0:33a:19c0:c95e with SMTP id bl8-20020a056808308800b0033a19c0c95emr4402003oib.41.1657726221131;
        Wed, 13 Jul 2022 08:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657726221; cv=none;
        d=google.com; s=arc-20160816;
        b=Lq28Pb0ATGbx49aXNCzDVIiXCzS96qCp7R98y7zWdH9Vq3bGbtl9DnqmwRyzqVPtnD
         mZnL4UzAqQaQE24S0OIx7Oy5uozyvg7J51efcXvsXRyCJYqM+IFj+tT54yLewpuX3J8q
         yoDTaJPasx91xyaKmPauZgN7A4bpTtS3ToiqlRNImMdF79fK05zeVPVpMesHKaAo8KTY
         uqVwtLk2+zN6FYXxKuSpzzqmWRPbpQ2YdCHOoyu1OeFa9yS5knn2phhCqluVSHAWNabg
         myVPGyPNWiy/pD5y+6xAffbaRbTe4oiCRByHF/wGAcjPXB1lgLTU/6Gyi8yzGKkwSn9M
         nVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=vtQCZnwpbVt34OWhvPK9cf+k3sGGavDFZnO86a2fL0s=;
        b=kFG3P2TvWd+RA4BgQSHwtDHDb42vJLk63HdkdlAD3rb/PFWHkiEBIkSyclOWpm8yh+
         wVXteK/2VUR4SxCZ6XL3TzFHAMpXrm+K8F+Ht0lIjnsr4pNzdx2yfg1Kux9RuZfHbcHv
         CFdjUE/HnNKqWlE+gCBG1Siopfd2zxO2JpeRrOjIpSoBj0WGcVd02yGAY/cQL6Tunzud
         Coxk21956oYXHYkzCLu7nyRlEOpImMYlKH2DOL1NvG+shtTKr5ij0dNz/IxfgpBT8rBQ
         BToHv4lp3Dhh9U9EI6u7qbFz8mAZwziY32449wr9IKGXurDm81VFEoNpabRYnOiy2bmY
         /V/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dz5qKAXz;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com. [2607:f8b0:4864:20::1042])
        by gmr-mx.google.com with ESMTPS id z20-20020a056871015400b00101c9597c72si943839oab.1.2022.07.13.08.30.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 08:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042 as permitted sender) client-ip=2607:f8b0:4864:20::1042;
Received: by mail-pj1-x1042.google.com with SMTP id t5-20020a17090a6a0500b001ef965b262eso4179372pjj.5
        for <jailhouse-dev@googlegroups.com>; Wed, 13 Jul 2022 08:30:21 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:1ef:e95d:de66 with SMTP id
 nl15-20020a17090b384f00b001efe95dde66mr4291735pjb.174.1657726220698; Wed, 13
 Jul 2022 08:30:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac4:934d:0:b0:4a1:b47d:8b72 with HTTP; Wed, 13 Jul 2022
 08:30:18 -0700 (PDT)
In-Reply-To: <CABSBigRqAi4EwdTj=GXjsWGw4j690HBJoUpfQD6G6hp3hzffwQ@mail.gmail.com>
References: <20220603131124.2007946-1-gengdongjiu1@gmail.com>
 <CABSBigRHEKJLuer6JrvPER2oEZJnaiFb2YsHeHRasoNjVX-f4Q@mail.gmail.com>
 <c078ec55-8565-b2a9-581a-32903625c73b@siemens.com> <CABSBigRqAi4EwdTj=GXjsWGw4j690HBJoUpfQD6G6hp3hzffwQ@mail.gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Wed, 13 Jul 2022 23:30:18 +0800
Message-ID: <CABSBigQTreqdPXV6y3hH+AerOK5hr3Y6C2bq1T9CdVeC27z6uQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: check whether HPFAR is valid before getting IPA
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="00000000000085079505e3b176d1"
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=dz5qKAXz;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042
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

--00000000000085079505e3b176d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping....


=E5=9C=A8 2022=E5=B9=B46=E6=9C=8813=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80=EF=
=BC=8CDongjiu Geng <gengdongjiu1@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A

> Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8810=E6=
=97=A5=E5=91=A8=E4=BA=94 13:20=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On 09.06.22 17:27, Dongjiu Geng wrote:
> > > ping=EF=BC=8Csorry for the noise
> > >
> >
> > No need to be sorry, I unfortunately didn't find the time to fully
> > understand this.
>
> Thanks for your time.
>
> >
> > >
> > > Dongjiu Geng <gengdongjiu1@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=
=883=E6=97=A5=E5=91=A8=E4=BA=94 21:11=E5=86=99=E9=81=93=EF=BC=9A
> > >>
> > >> The HPFAR can be invalid if the stage 2 fault did not happen during =
a
> > >> stage 1 page table walk (the ESR_EL2.S1PTW bit is clear) and one of
> the
> > >> two following cases are true:
> > >>   1). The fault was due to a permission fault
> > >>   2). The processor carries errata 834220
> > >>
> > >> Therefore, for all non S1PTW faults where we either have a permissio=
n
> > >> fault or the errata workaround is enabled, we resolve the IPA using
> the
> > >> AT instruction.
> > >>
> > >> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > >> ---
> > >>  hypervisor/arch/arm64/include/asm/paging.h  |  8 ++
> > >>  hypervisor/arch/arm64/include/asm/sysregs.h |  8 ++
> > >>  hypervisor/arch/arm64/include/asm/traps.h   |  2 +
> > >>  hypervisor/arch/arm64/mmio.c                |  7 +-
> > >>  hypervisor/arch/arm64/traps.c               | 89
> +++++++++++++++++++--
> > >>  5 files changed, 105 insertions(+), 9 deletions(-)
> > >>
> > >> diff --git a/hypervisor/arch/arm64/include/asm/paging.h
> b/hypervisor/arch/arm64/include/asm/paging.h
> > >> index e600cf58..4f0cb81c 100644
> > >> --- a/hypervisor/arch/arm64/include/asm/paging.h
> > >> +++ b/hypervisor/arch/arm64/include/asm/paging.h
> > >> @@ -198,6 +198,14 @@ unsigned int get_cpu_parange(void);
> > >>                                 | (cpu_parange_encoded <<
> TCR_PS_SHIFT) \
> > >>                                 | VTCR_RES1)
> > >>
> > >> +/* Flags for get fault ipa from gva */
> > >> +#define GV2M_READ              (0u<<0)
> > >> +#define GV2M_WRITE             (1u<<0)
> > >> +
> > >> +/* Indicates address translation aborted */
> > >> +#define PAR_F                  (1UL)
> > >> +#define PADDR_MASK             ((1UL << 48) - 1UL)
> > >> +
> > >>  int arm_paging_cell_init(struct cell *cell);
> > >>  void arm_paging_cell_destroy(struct cell *cell);
> > >>
> > >> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h
> b/hypervisor/arch/arm64/include/asm/sysregs.h
> > >> index 868ef887..2c683832 100644
> > >> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> > >> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> > >> @@ -117,6 +117,14 @@
> > >>  #define ESR_IL(esr)            GET_FIELD((esr), 25, 25)
> > >>  /* Instruction specific syndrome */
> > >>  #define ESR_ISS(esr)           GET_FIELD((esr), 24, 0)
> > >> +
> > >> +/* Fault status code of instruction specific syndrome */
> > >> +#define ESR_ISS_FSC(esr)       GET_FIELD((esr), 5, 0)
> > >> +
> > >> +/* Shared ISS fault status code(IFSC/DFSC) for Data/Instruction
> aborts */
> > >> +#define ESR_ISS_FSC_TYPE       (0x3C)
> > >> +#define ESR_ISS_FSC_PERM       (0x0C)
> > >> +
> > >>  /* Exception classes values */
> > >>  #define ESR_EC_UNKNOWN         0x00
> > >>  #define ESR_EC_WFx             0x01
> > >> diff --git a/hypervisor/arch/arm64/include/asm/traps.h
> b/hypervisor/arch/arm64/include/asm/traps.h
> > >> index a7c07624..0efedef1 100644
> > >> --- a/hypervisor/arch/arm64/include/asm/traps.h
> > >> +++ b/hypervisor/arch/arm64/include/asm/traps.h
> > >> @@ -25,6 +25,8 @@ struct trap_context {
> > >>
> > >>  void arch_handle_trap(union registers *guest_regs);
> > >>  void arch_el2_abt(union registers *regs);
> > >> +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long *ip=
a,
> > >> +                                unsigned int flag);
> > >>
> > >>  /* now include from arm-common */
> > >>  #include_next <asm/traps.h>
> > >> diff --git a/hypervisor/arch/arm64/mmio.c
> b/hypervisor/arch/arm64/mmio.c
> > >> index 7fbfef75..70301ab3 100644
> > >> --- a/hypervisor/arch/arm64/mmio.c
> > >> +++ b/hypervisor/arch/arm64/mmio.c
> > >> @@ -43,7 +43,6 @@ enum trap_return arch_handle_dabt(struct
> trap_context *ctx)
> > >>  {
> > >>         enum mmio_result mmio_result;
> > >>         struct mmio_access mmio;
> > >> -       unsigned long hpfar;
> > >>         unsigned long hdfar;
> > >>         /* Decode the syndrome fields */
> > >>         u32 iss         =3D ESR_ISS(ctx->esr);
> > >> @@ -57,10 +56,10 @@ enum trap_return arch_handle_dabt(struct
> trap_context *ctx)
> > >>         u32 is_write    =3D iss >> 6 & 0x1;
> > >>         u32 size        =3D 1 << sas;
> > >>
> > >> -       arm_read_sysreg(HPFAR_EL2, hpfar);
> > >>         arm_read_sysreg(FAR_EL2, hdfar);
> > >> -       mmio.address =3D hpfar << 8;
> > >> -       mmio.address |=3D hdfar & 0xfff;
> > >> +
> > >> +       if (!arch_get_fault_ipa(ctx, &mmio.address, GV2M_READ))
> > >> +               return TRAP_HANDLED; /* Try again */
> >
> > So, this means we need to make the guest trap again, and then HPFAR is
> > valid??
>
> Maybe this invalidation is due to someone playing with the Stage-2
> page table of the domain,  and can not get the right IPA, so we try
> again.
>
>
> >
> > >>
> > >>         this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_MMIO]++;
> > >>
> > >> diff --git a/hypervisor/arch/arm64/traps.c
> b/hypervisor/arch/arm64/traps.c
> > >> index 488dd7f8..10441b4b 100644
> > >> --- a/hypervisor/arch/arm64/traps.c
> > >> +++ b/hypervisor/arch/arm64/traps.c
> > >> @@ -33,6 +33,85 @@ void arch_skip_instruction(struct trap_context
> *ctx)
> > >>         arm_write_sysreg(ELR_EL2, pc);
> > >>  }
> > >>
> > >> +static bool check_workaround_834220(void)
> > >> +{
> > >> +        unsigned long midr;
> > >> +       unsigned int variant, revision, part;
> > >> +
> > >> +       arm_read_sysreg(MIDR_EL1, midr);
> > >> +
> > >> +       variant =3D (midr >> 20) & 0xf;
> > >> +       revision =3D midr & 0xf;
> > >> +       part =3D (midr >> 4) & 0xfff;
> > >> +
> > >> +       /* Cortex-A57 r0p0 - r1p2 */
> > >> +       if (part =3D=3D 0xD07 && variant <=3D 1 && revision <=3D 2)
> > >> +               return true;
> > >> +
> > >> +       return false;
> > >> +}
> > >> +
> > >> +static bool hpfar_is_not_valid(bool s1ptw, u8 fsc)
> > >> +{
> > >> +       /*
> > >> +        * The HPFAR can be invalid if the stage 2 fault did not
> > >> +        * happen during a stage 1 page table walk (the ESR_EL2.S1PT=
W
> > >> +        * bit is clear) and one of the two following cases are true=
:
> > >> +        *   1. The fault was due to a permission fault
> > >> +        *   2. The processor carries errata 834220
> > >> +        *
> > >> +        */
> > >> +       return (s1ptw =3D=3D 0U) && (((fsc & ESR_ISS_FSC_TYPE) =3D=
=3D
> ESR_ISS_FSC_PERM) || check_workaround_834220());
> > >> +}
> > >> +
> > >> +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long
> *ipa, unsigned int flags)
> > >> +{
> > >> +       unsigned long hpfar, hdfar, par, tmp;
> > >> +
> > >> +       u32 s1ptw =3D ESR_ISS(ctx->esr) >> 7 & 0x1;
> > >> +       u8 fsc =3D ESR_ISS_FSC(ctx->esr);
> > >> +
> > >> +       arm_read_sysreg(FAR_EL2, hdfar);
> > >> +
> > >> +       if (hpfar_is_not_valid(s1ptw, fsc)) {
> > >> +
> > >> +               /* Save current PAR_EL1 */
> > >> +               arm_read_sysreg(PAR_EL1, tmp);
> > >> +
> > >> +               /*
> > >> +                *  Performs stage 1 address translation, with
> permissions as if
> > >> +                *  writing to or reading from the given virtual
> address from EL1
> > >> +                */
> > >> +                if ( (flags & GV2M_WRITE) =3D=3D GV2M_WRITE ) {
> > >> +                        asm volatile ("at s1e1w, %0;" : : "r"
> (hdfar));
> > >> +                } else {
> > >> +                        asm volatile ("at s1e1r, %0;" : : "r"
> (hdfar));
> > >> +                }
> > >> +
> > >> +               isb();
> > >> +
> > >> +               /* The resulting address can be read from the PAR_EL=
1
> */
> > >> +               arm_read_sysreg(PAR_EL1, par);
> > >> +
> > >> +               /* Recover current PAR_EL1 */
> > >> +               arm_write_sysreg(PAR_EL1, tmp);
> > >> +
> > >> +               /* If PAR_EL1.F =3D 1, address translation aborted *=
/
> > >> +               if ((par & PAR_F) =3D=3D PAR_F) {
> > >> +                       printk("Failed to ipa!\n");
> > >> +                       return false;
> > >> +               } else {
> > >> +                       *ipa =3D (par & PADDR_MASK & PAGE_MASK) |
> (hdfar & (~PAGE_MASK));
> > >> +               }
> > >> +       } else {
> > >> +               arm_read_sysreg(HPFAR_EL2, hpfar);
> > >> +               *ipa =3D hpfar << 8;
> > >> +               *ipa |=3D hdfar & 0xfff;
> > >> +       }
> > >> +
> > >> +       return true;
> > >> +}
> > >> +
> > >>  static enum trap_return handle_hvc(struct trap_context *ctx)
> > >>  {
> > >>         unsigned long *regs =3D ctx->regs;
> > >> @@ -71,7 +150,7 @@ static enum trap_return handle_sysreg(struct
> trap_context *ctx)
> > >>
> > >>  static enum trap_return handle_iabt(struct trap_context *ctx)
> > >>  {
> > >> -       unsigned long hpfar, hdfar;
> > >> +       unsigned long hpfar;
> > >>
> > >>         if (this_cpu_data()->sdei_event) {
> > >>                 this_cpu_data()->sdei_event =3D false;
> > >> @@ -83,11 +162,11 @@ static enum trap_return handle_iabt(struct
> trap_context *ctx)
> > >>                 return TRAP_HANDLED;
> > >>         }
> > >>
> > >> -       arm_read_sysreg(HPFAR_EL2, hpfar);
> > >> -       arm_read_sysreg(FAR_EL2, hdfar);
> > >> +       if (arch_get_fault_ipa(ctx, &hpfar, GV2M_READ))
> > >> +               panic_printk("FATAL: instruction abort at 0x%lx\n",
> hpfar);
> > >> +       else
> > >> +               panic_printk("FATAL: instruction abort and can not
> get ipa\n");
> > >>
> > >> -       panic_printk("FATAL: instruction abort at 0x%lx\n",
> > >> -                    (hpfar << 8) | (hdfar & 0xfff));
> > >>         return TRAP_FORBIDDEN;
> > >>  }
> > >>
> > >> --
> > >> 2.25.1
> > >>
> >
> > How common is this erratum? Is it already affecting real boards? Just t=
o
> > get a feeling for the urgency.
>
> Yes,  it can affect the real boards.
> For example,  if we configure a buffer's  stage2 page table to readonly
> for VM,
> this VM's process writes this buffer, then it will trigger stage2
> permission fault.
> In this case, we can not get the right IPA without this patch.
>
>
> >
> > Thanks,
> > Jan
> >
> > --
> > Siemens AG, Technology
> > Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigQTreqdPXV6y3hH%2BAerOK5hr3Y6C2bq1T9CdVeC27z6uQ%40mail.=
gmail.com.

--00000000000085079505e3b176d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping....<div><br><br>=E5=9C=A8 2022=E5=B9=B46=E6=9C=8813=E6=97=A5=E6=98=9F=
=E6=9C=9F=E4=B8=80=EF=BC=8CDongjiu Geng &lt;<a href=3D"mailto:gengdongjiu1@=
gmail.com">gengdongjiu1@gmail.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@si=
emens.com">jan.kiszka@siemens.com</a>&gt; =E4=BA=8E2022=E5=B9=B46=E6=9C=881=
0=E6=97=A5=E5=91=A8=E4=BA=94 13:20=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; On 09.06.22 17:27, Dongjiu Geng wrote:<br>
&gt; &gt; ping=EF=BC=8Csorry for the noise<br>
&gt; &gt;<br>
&gt;<br>
&gt; No need to be sorry, I unfortunately didn&#39;t find the time to fully=
<br>
&gt; understand this.<br>
<br>
Thanks for your time.<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Dongjiu Geng &lt;<a href=3D"mailto:gengdongjiu1@gmail.com">gengdo=
ngjiu1@gmail.com</a>&gt; =E4=BA=8E2022=E5=B9=B46=E6=9C=883=E6=97=A5=E5=91=
=A8=E4=BA=94 21:11=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The HPFAR can be invalid if the stage 2 fault did not happen =
during a<br>
&gt; &gt;&gt; stage 1 page table walk (the ESR_EL2.S1PTW bit is clear) and =
one of the<br>
&gt; &gt;&gt; two following cases are true:<br>
&gt; &gt;&gt;=C2=A0 =C2=A01). The fault was due to a permission fault<br>
&gt; &gt;&gt;=C2=A0 =C2=A02). The processor carries errata 834220<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Therefore, for all non S1PTW faults where we either have a pe=
rmission<br>
&gt; &gt;&gt; fault or the errata workaround is enabled, we resolve the IPA=
 using the<br>
&gt; &gt;&gt; AT instruction.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Dongjiu Geng &lt;<a href=3D"mailto:gengdongjiu=
1@gmail.com">gengdongjiu1@gmail.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 hypervisor/arch/arm64/include/<wbr>asm/paging.h=C2=A0 |=
=C2=A0 8 ++<br>
&gt; &gt;&gt;=C2=A0 hypervisor/arch/arm64/include/<wbr>asm/sysregs.h |=C2=
=A0 8 ++<br>
&gt; &gt;&gt;=C2=A0 hypervisor/arch/arm64/include/<wbr>asm/traps.h=C2=A0 =
=C2=A0|=C2=A0 2 +<br>
&gt; &gt;&gt;=C2=A0 hypervisor/arch/arm64/mmio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +-<br>
&gt; &gt;&gt;=C2=A0 hypervisor/arch/arm64/traps.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 89 +++++++++++++++++++--<br>
&gt; &gt;&gt;=C2=A0 5 files changed, 105 insertions(+), 9 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/hypervisor/arch/arm64/<wbr>include/asm/paging.h =
b/hypervisor/arch/arm64/<wbr>include/asm/paging.h<br>
&gt; &gt;&gt; index e600cf58..4f0cb81c 100644<br>
&gt; &gt;&gt; --- a/hypervisor/arch/arm64/<wbr>include/asm/paging.h<br>
&gt; &gt;&gt; +++ b/hypervisor/arch/arm64/<wbr>include/asm/paging.h<br>
&gt; &gt;&gt; @@ -198,6 +198,14 @@ unsigned int get_cpu_parange(void);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| (cpu_parange_enco=
ded &lt;&lt; TCR_PS_SHIFT) \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| VTCR_RES1)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +/* Flags for get fault ipa from gva */<br>
&gt; &gt;&gt; +#define GV2M_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0u&lt;&lt;0)<br>
&gt; &gt;&gt; +#define GV2M_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1u&lt;&lt;0)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +/* Indicates address translation aborted */<br>
&gt; &gt;&gt; +#define PAR_F=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1UL)<br>
&gt; &gt;&gt; +#define PADDR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0((1UL &lt;&lt; 48) - 1UL)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 int arm_paging_cell_init(struct cell *cell);<br>
&gt; &gt;&gt;=C2=A0 void arm_paging_cell_destroy(struct cell *cell);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/hypervisor/arch/arm64/<wbr>include/asm/sysregs.h=
 b/hypervisor/arch/arm64/<wbr>include/asm/sysregs.h<br>
&gt; &gt;&gt; index 868ef887..2c683832 100644<br>
&gt; &gt;&gt; --- a/hypervisor/arch/arm64/<wbr>include/asm/sysregs.h<br>
&gt; &gt;&gt; +++ b/hypervisor/arch/arm64/<wbr>include/asm/sysregs.h<br>
&gt; &gt;&gt; @@ -117,6 +117,14 @@<br>
&gt; &gt;&gt;=C2=A0 #define ESR_IL(esr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 GET_FIELD((esr), 25, 25)<br>
&gt; &gt;&gt;=C2=A0 /* Instruction specific syndrome */<br>
&gt; &gt;&gt;=C2=A0 #define ESR_ISS(esr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GET_FIELD((esr), 24, 0)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +/* Fault status code of instruction specific syndrome */<br>
&gt; &gt;&gt; +#define ESR_ISS_FSC(esr)=C2=A0 =C2=A0 =C2=A0 =C2=A0GET_FIELD=
((esr), 5, 0)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +/* Shared ISS fault status code(IFSC/DFSC) for Data/Instruct=
ion aborts */<br>
&gt; &gt;&gt; +#define ESR_ISS_FSC_TYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x3C)<br=
>
&gt; &gt;&gt; +#define ESR_ISS_FSC_PERM=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x0C)<br=
>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 /* Exception classes values */<br>
&gt; &gt;&gt;=C2=A0 #define ESR_EC_UNKNOWN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x00<br>
&gt; &gt;&gt;=C2=A0 #define ESR_EC_WFx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x01<br>
&gt; &gt;&gt; diff --git a/hypervisor/arch/arm64/<wbr>include/asm/traps.h b=
/hypervisor/arch/arm64/<wbr>include/asm/traps.h<br>
&gt; &gt;&gt; index a7c07624..0efedef1 100644<br>
&gt; &gt;&gt; --- a/hypervisor/arch/arm64/<wbr>include/asm/traps.h<br>
&gt; &gt;&gt; +++ b/hypervisor/arch/arm64/<wbr>include/asm/traps.h<br>
&gt; &gt;&gt; @@ -25,6 +25,8 @@ struct trap_context {<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 void arch_handle_trap(union registers *guest_regs);<br>
&gt; &gt;&gt;=C2=A0 void arch_el2_abt(union registers *regs);<br>
&gt; &gt;&gt; +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned l=
ong *ipa,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int flag);<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 /* now include from arm-common */<br>
&gt; &gt;&gt;=C2=A0 #include_next &lt;asm/traps.h&gt;<br>
&gt; &gt;&gt; diff --git a/hypervisor/arch/arm64/mmio.c b/hypervisor/arch/a=
rm64/mmio.c<br>
&gt; &gt;&gt; index 7fbfef75..70301ab3 100644<br>
&gt; &gt;&gt; --- a/hypervisor/arch/arm64/mmio.c<br>
&gt; &gt;&gt; +++ b/hypervisor/arch/arm64/mmio.c<br>
&gt; &gt;&gt; @@ -43,7 +43,6 @@ enum trap_return arch_handle_dabt(struct tr=
ap_context *ctx)<br>
&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum mmio_result mmio_result=
;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mmio_access mmio;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long hpfar;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long hdfar;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Decode the syndrome field=
s */<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 iss=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D ESR_ISS(ctx-&gt;esr);<br>
&gt; &gt;&gt; @@ -57,10 +56,10 @@ enum trap_return arch_handle_dabt(struct =
trap_context *ctx)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 is_write=C2=A0 =C2=A0 =
=3D iss &gt;&gt; 6 &amp; 0x1;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 size=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 1 &lt;&lt; sas;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0arm_read_sysreg(HPFAR_EL2, hpfar)=
;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_read_sysreg(FAR_EL2, hdf=
ar);<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mmio.address =3D hpfar &lt;&lt; 8=
;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mmio.address |=3D hdfar &amp; 0xf=
ff;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!arch_get_fault_ipa(ctx, &amp=
;mmio.address, GV2M_READ))<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n TRAP_HANDLED; /* Try again */<br>
&gt;<br>
&gt; So, this means we need to make the guest trap again, and then HPFAR is=
<br>
&gt; valid??<br>
<br>
Maybe this invalidation is due to someone playing with the Stage-2<br>
page table of the domain,=C2=A0 and can not get the right IPA, so we try<br=
>
again.<br>
<br>
<br>
&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this_cpu_public()-&gt;stats[=
<wbr>JAILHOUSE_CPU_STAT_VMEXITS_<wbr>MMIO]++;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/hypervisor/arch/arm64/traps.<wbr>c b/hypervisor/=
arch/arm64/traps.<wbr>c<br>
&gt; &gt;&gt; index 488dd7f8..10441b4b 100644<br>
&gt; &gt;&gt; --- a/hypervisor/arch/arm64/traps.<wbr>c<br>
&gt; &gt;&gt; +++ b/hypervisor/arch/arm64/traps.<wbr>c<br>
&gt; &gt;&gt; @@ -33,6 +33,85 @@ void arch_skip_instruction(struct trap_con=
text *ctx)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_write_sysreg(ELR_EL2, pc=
);<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +static bool check_workaround_834220(void)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long midr;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int variant, revision, p=
art;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm_read_sysreg(MIDR_EL1, midr);<=
br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0variant =3D (midr &gt;&gt; 20) &a=
mp; 0xf;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0revision =3D midr &amp; 0xf;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0part =3D (midr &gt;&gt; 4) &amp; =
0xfff;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Cortex-A57 r0p0 - r1p2 */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (part =3D=3D 0xD07 &amp;&amp; =
variant &lt;=3D 1 &amp;&amp; revision &lt;=3D 2)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n true;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +static bool hpfar_is_not_valid(bool s1ptw, u8 fsc)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The HPFAR can be invalid if th=
e stage 2 fault did not<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * happen during a stage 1 page t=
able walk (the ESR_EL2.S1PTW<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * bit is clear) and one of the t=
wo following cases are true:<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A01. The fault was d=
ue to a permission fault<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A02. The processor c=
arries errata 834220<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (s1ptw =3D=3D 0U) &amp;&am=
p; (((fsc &amp; ESR_ISS_FSC_TYPE) =3D=3D ESR_ISS_FSC_PERM) || check_workaro=
und_834220());<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned l=
ong *ipa, unsigned int flags)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long hpfar, hdfar, par, =
tmp;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 s1ptw =3D ESR_ISS(ctx-&gt;esr=
) &gt;&gt; 7 &amp; 0x1;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 fsc =3D ESR_ISS_FSC(ctx-&gt;es=
r);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm_read_sysreg(FAR_EL2, hdfar);<=
br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hpfar_is_not_valid(s1ptw, fsc=
)) {<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Sa=
ve current PAR_EL1 */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_r=
ead_sysreg(PAR_EL1, tmp);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br=
>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 Performs stage 1 address translation, with permissions as if<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 writing to or reading from the given virtual address from EL1<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<b=
r>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
 (flags &amp; GV2M_WRITE) =3D=3D GV2M_WRITE ) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 asm volatile (&quot;at s1e1w, %0;&quot; : : &quot;=
r&quot; (hdfar));<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } el=
se {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 asm volatile (&quot;at s1e1r, %0;&quot; : : &quot;=
r&quot; (hdfar));<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isb()=
;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Th=
e resulting address can be read from the PAR_EL1 */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_r=
ead_sysreg(PAR_EL1, par);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Re=
cover current PAR_EL1 */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_w=
rite_sysreg(PAR_EL1, tmp);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If=
 PAR_EL1.F =3D 1, address translation aborted */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((=
par &amp; PAR_F) =3D=3D PAR_F) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0printk(&quot;Failed to ipa!\n&quot;);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} els=
e {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*ipa =3D (par &amp; PADDR_MASK &amp; PAGE_MASK) | (=
hdfar &amp; (~PAGE_MASK));<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_r=
ead_sysreg(HPFAR_EL2, hpfar);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ipa =
=3D hpfar &lt;&lt; 8;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ipa =
|=3D hdfar &amp; 0xfff;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 static enum trap_return handle_hvc(struct trap_context =
*ctx)<br>
&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long *regs =3D ctx-=
&gt;regs;<br>
&gt; &gt;&gt; @@ -71,7 +150,7 @@ static enum trap_return handle_sysreg(stru=
ct trap_context *ctx)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 static enum trap_return handle_iabt(struct trap_context=
 *ctx)<br>
&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long hpfar, hdfar;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long hpfar;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (this_cpu_data()-&gt;sdei=
_event) {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
this_cpu_data()-&gt;sdei_event =3D false;<br>
&gt; &gt;&gt; @@ -83,11 +162,11 @@ static enum trap_return handle_iabt(stru=
ct trap_context *ctx)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return TRAP_HANDLED;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0arm_read_sysreg(HPFAR_EL2, hpfar)=
;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0arm_read_sysreg(FAR_EL2, hdfar);<=
br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (arch_get_fault_ipa(ctx, &amp;=
hpfar, GV2M_READ))<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic=
_printk(&quot;FATAL: instruction abort at 0x%lx\n&quot;, hpfar);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic=
_printk(&quot;FATAL: instruction abort and can not get ipa\n&quot;);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0panic_printk(&quot;FATAL: instruc=
tion abort at 0x%lx\n&quot;,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (hpfar &lt;&lt; 8) | (hdfar &amp; 0xfff));<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TRAP_FORBIDDEN;<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.25.1<br>
&gt; &gt;&gt;<br>
&gt;<br>
&gt; How common is this erratum? Is it already affecting real boards? Just =
to<br>
&gt; get a feeling for the urgency.<br>
<br>
Yes,=C2=A0 it can affect the real boards.<br>
For example,=C2=A0 if we configure a buffer&#39;s=C2=A0 stage2 page table t=
o readonly for VM,<br>
this VM&#39;s process writes this buffer, then it will trigger stage2<br>
permission fault.<br>
In this case, we can not get the right IPA without this patch.<br>
<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Jan<br>
&gt;<br>
&gt; --<br>
&gt; Siemens AG, Technology<br>
&gt; Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CABSBigQTreqdPXV6y3hH%2BAerOK5hr3Y6C2bq1T9CdVeC27z=
6uQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CABSBigQTreqdPXV6y3hH%2BAerOK5hr3Y6C2bq1T=
9CdVeC27z6uQ%40mail.gmail.com</a>.<br />

--00000000000085079505e3b176d1--
