Return-Path: <jailhouse-dev+bncBDOKTXXSZADRB3VCRCKQMGQEEWJ3P7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x437.google.com (mail-pf1-x437.google.com [IPv6:2607:f8b0:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D635450C8
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Jun 2022 17:27:44 +0200 (CEST)
Received: by mail-pf1-x437.google.com with SMTP id 206-20020a6218d7000000b0051893ee2888sf10686590pfy.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Jun 2022 08:27:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1654788463; cv=pass;
        d=google.com; s=arc-20160816;
        b=swzDBC7+y4KGAmWSncht1bUDhbfh2Pge8RZo2guxxT1+z9SrAplNfCw7dd6I3hWsdI
         LJeoT4l1WwbYpewJrCPuagl6Cw8MBg1Bn/u4m051zcwVNvLD7YgY3GQv/JrZNwAPFC9s
         aWdX4L+5uZFmB7+6VCnkz7+5fqhifAqnNx/OowmbHJgKAYUnJ6AzFXzZMBpThyYflzCo
         O378t6mNht6csYK4YbGZ+lCE7vMNM4x7WWQtHDxgcFEEmEWFgqYn8pbiYudZb0iS58bK
         Dn+UDfnMdzrILHcfbvR0E+oBvyFnioLl44ki6PSmOJ9LfJcDhm9GMozUAcPkVAB8XJiY
         4K3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=CKewtSygY0cfyDClSCjHfGHVTj1g2OpbCbxrfDAhxr8=;
        b=XyW0Vjf+rrSvjg9wl29jMifd8ijHy8T58rNqLa7P0j3WGb/B+bqBz1vUBV9WLnT5Vq
         Ft/0z6QZgMYjAcL+skJFZv/BCalMNMO47P6by7sLd+X2LyqattSdcgsGlYlhfv4dp3RM
         F3HocHGlZzlVrb1RGpYPOO3CS/j8x/6wlnlFzNpG81vn6tiD1HK7/AnUMJsHJMXwGBc5
         3BKlr2V+v417PNPCqAN+NOk6WYGdwifZRbQ8SPLjzPsGS4vVz/4Wdy3cSAfsmf0FYzDb
         UF127H2BcaG63Llyt2P4w0A6jlOh8Ml+1tiR1LNcOwUItYh1gHhzkPiDMF+73YNjWung
         ZQEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=U0cujxO7;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CKewtSygY0cfyDClSCjHfGHVTj1g2OpbCbxrfDAhxr8=;
        b=sAS8D4LQhpmPgB/c7VDjnYtxtGyntv5KoPzz1aXaFMplahjU+Y+l8dHfWcLKI7K1WH
         Jq73RwCiKeD663SGNc4+O5iriZAqfxHMhQu3Zz3IucOWeol5kkSbhhsIO1pZrsziGgG3
         FSqYrtSGO283qCGSxa7YIk3lubjr9wEu1/ipGQXI48BpuZ+727W4EzlAFYrDDnwDk9o9
         HFBP42etKEPgyJ+BOQNQtGWXXiedq/Nlt4n3E7VsizJNl7e0w+MfITL08UKMhnxZvPPV
         e6cHTfUOJySoWIFCS3SaLN7kQ8bc4pTFaizbWkQjoFPWc4DH/CoT2U4AA4YxjR3EHOtj
         xoCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CKewtSygY0cfyDClSCjHfGHVTj1g2OpbCbxrfDAhxr8=;
        b=PbSrxi3FjSPbTLwGBjhlHPpFtOnODXnXa8/kEX3Zeo7gNx8Nj7VX6nXClu11c5D8yb
         ucXdh64FJ8RlBsjrUY6XD53PeVzTQBN79YrvqevGzjLjPGL/GHr4PGXWe5oJt35cuFbk
         OGQTj+vg/eq7np5Zxn9UWKm11+/shScjyTQ4yfkPlOCPDhJmRhdZbTiKh/x6TYWRjDa3
         L40Phnq0Cb+68s/iouo7tUH0OgJyUDzCxgWXd5d31EM/L7u56iq8+zOZmTsGpQia+7sx
         vsA2CItLQwcUEkAXSYK2IwGT0bkJ+y75KgsCk4aqqGlBh9EGV0nc9i9s4NpPmcvn+bzj
         bh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CKewtSygY0cfyDClSCjHfGHVTj1g2OpbCbxrfDAhxr8=;
        b=Czs5SEgmPk3VY4VLFfettcGFL1Q7hn/YeVMhYlGnmSGZA8QS5QHtXYFWdUAy5MddVv
         Lh8u6tBGq9rA4wJfXJRsTBmc/nXunII3GTgZut3qdp8BCsFokocrfO6318bP89xQC4j4
         SVXl9KGRrJnUmq7REQpoMSCjlRivyRYhkDheQe4XfmcFXvXAnlAvl3nHlCIWEPjcbcWE
         VEoVv1a93T7I+oTLDxuEsyHj0u6TBnDoSl8NL/9zGtZr96CuAVYIsOuwrQN5Z859swAk
         UR48BRKcERg1UR99C/Objf9DaF9q3x5h6ry39wWxLrgP3SzpPByFUpbB1VXCyy5n2MUq
         8j2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LvkYrW/wVsTsLG2BoIoEQrApAvko49oOWySu5D1g+zaKD+YwG
	E8D2osrepfAi0eMYl7TsjSQ=
X-Google-Smtp-Source: ABdhPJwPG4Vxd2uSUVn5OoP11LoD2ALqOSjvNxl/D7k1ebg+ECwD/f6P/LQoV2u8AYFG/7674kmd1w==
X-Received: by 2002:a05:6a02:206:b0:399:3c9:f465 with SMTP id bh6-20020a056a02020600b0039903c9f465mr36395203pgb.388.1654788463029;
        Thu, 09 Jun 2022 08:27:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:3ec3:b0:1e8:844a:5f1b with SMTP id
 rm3-20020a17090b3ec300b001e8844a5f1bls1795752pjb.2.canary-gmail; Thu, 09 Jun
 2022 08:27:42 -0700 (PDT)
X-Received: by 2002:a17:902:f652:b0:156:701b:9a2a with SMTP id m18-20020a170902f65200b00156701b9a2amr40370870plg.14.1654788461938;
        Thu, 09 Jun 2022 08:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654788461; cv=none;
        d=google.com; s=arc-20160816;
        b=tSRs0495pC93l2YuXOatZE9mvSKdZrdCIXORW1XEF4JcMhSFp+v6+fDOzQ8B6M9czY
         ZrtB0RgPnvMZ4Flxb/3034gXl8qb/62kD5QBh+V+jKtpOEvIGIP735cP2IAzdRiltiNP
         4rkbO3Rfv/ubRmo0+AH13TrEdtizO0ss8R4mLxonSaAnhDd4hDNmrWvq3b02wLUNRPe7
         JZi4GLbPokZws82sRcXl7Tpem1o0dwayo5tBNPHBtDw6cfm1YLTMEmKxVEWPUlGWWQys
         9TI3em7EJ24JOb3ejUFTthGXhCqRAlm7sHUxbvm/QijC3bkmxv1/+YZa2OWpS8CThc9X
         NBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOlYNkfn2Bk18Bo5xpIBQJjJ2OSQp9SLEHo3ECwNbzM=;
        b=cxhgQ0zwaE198sizLULK0OKAeWKNLxDoRAxblA+KagEey+hCsSfobaY8C0FcdpCXjk
         UEciVHViMs1Tvz156i0naxIigOqKx7D0qXNIOCHvRlc+phWk28nmwNFIGGKIoam80txJ
         CfdGhAdE0OA3LTzcyiZJP2YwCUkZDXjB/q6kIAPptWZwWG0SUWggyQAJsxVBEcyZ/BJb
         FgEH+P9YDyAVhJy/RXZABkzYYG1xbDHRd/N83O14CPtWsyVSdE+mwH4Of9FzuC/Mb2/B
         TlHXWZJoeYngSWsNwIyDmoOqvcgfoKUgZ9D6PKBB9398tMM3pWxqayuHGe/IIqAkqXpJ
         pSzg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=U0cujxO7;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com. [2607:f8b0:4864:20::1042])
        by gmr-mx.google.com with ESMTPS id jz19-20020a17090b14d300b001df76e9c039si120745pjb.3.2022.06.09.08.27.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 08:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1042 as permitted sender) client-ip=2607:f8b0:4864:20::1042;
Received: by mail-pj1-x1042.google.com with SMTP id e9so11107465pju.5
        for <jailhouse-dev@googlegroups.com>; Thu, 09 Jun 2022 08:27:41 -0700 (PDT)
X-Received: by 2002:a17:90b:34f:b0:1ea:264c:e874 with SMTP id
 fh15-20020a17090b034f00b001ea264ce874mr4015684pjb.95.1654788461635; Thu, 09
 Jun 2022 08:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220603131124.2007946-1-gengdongjiu1@gmail.com>
In-Reply-To: <20220603131124.2007946-1-gengdongjiu1@gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Thu, 9 Jun 2022 23:27:29 +0800
Message-ID: <CABSBigRHEKJLuer6JrvPER2oEZJnaiFb2YsHeHRasoNjVX-f4Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: check whether HPFAR is valid before getting IPA
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com, 
	gengdongjiu.gdj@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=U0cujxO7;       spf=pass
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

ping=EF=BC=8Csorry for the noise


Dongjiu Geng <gengdongjiu1@gmail.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=883=E6=
=97=A5=E5=91=A8=E4=BA=94 21:11=E5=86=99=E9=81=93=EF=BC=9A
>
> The HPFAR can be invalid if the stage 2 fault did not happen during a
> stage 1 page table walk (the ESR_EL2.S1PTW bit is clear) and one of the
> two following cases are true:
>   1). The fault was due to a permission fault
>   2). The processor carries errata 834220
>
> Therefore, for all non S1PTW faults where we either have a permission
> fault or the errata workaround is enabled, we resolve the IPA using the
> AT instruction.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> ---
>  hypervisor/arch/arm64/include/asm/paging.h  |  8 ++
>  hypervisor/arch/arm64/include/asm/sysregs.h |  8 ++
>  hypervisor/arch/arm64/include/asm/traps.h   |  2 +
>  hypervisor/arch/arm64/mmio.c                |  7 +-
>  hypervisor/arch/arm64/traps.c               | 89 +++++++++++++++++++--
>  5 files changed, 105 insertions(+), 9 deletions(-)
>
> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch=
/arm64/include/asm/paging.h
> index e600cf58..4f0cb81c 100644
> --- a/hypervisor/arch/arm64/include/asm/paging.h
> +++ b/hypervisor/arch/arm64/include/asm/paging.h
> @@ -198,6 +198,14 @@ unsigned int get_cpu_parange(void);
>                                 | (cpu_parange_encoded << TCR_PS_SHIFT) \
>                                 | VTCR_RES1)
>
> +/* Flags for get fault ipa from gva */
> +#define GV2M_READ              (0u<<0)
> +#define GV2M_WRITE             (1u<<0)
> +
> +/* Indicates address translation aborted */
> +#define PAR_F                  (1UL)
> +#define PADDR_MASK             ((1UL << 48) - 1UL)
> +
>  int arm_paging_cell_init(struct cell *cell);
>  void arm_paging_cell_destroy(struct cell *cell);
>
> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arc=
h/arm64/include/asm/sysregs.h
> index 868ef887..2c683832 100644
> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> @@ -117,6 +117,14 @@
>  #define ESR_IL(esr)            GET_FIELD((esr), 25, 25)
>  /* Instruction specific syndrome */
>  #define ESR_ISS(esr)           GET_FIELD((esr), 24, 0)
> +
> +/* Fault status code of instruction specific syndrome */
> +#define ESR_ISS_FSC(esr)       GET_FIELD((esr), 5, 0)
> +
> +/* Shared ISS fault status code(IFSC/DFSC) for Data/Instruction aborts *=
/
> +#define ESR_ISS_FSC_TYPE       (0x3C)
> +#define ESR_ISS_FSC_PERM       (0x0C)
> +
>  /* Exception classes values */
>  #define ESR_EC_UNKNOWN         0x00
>  #define ESR_EC_WFx             0x01
> diff --git a/hypervisor/arch/arm64/include/asm/traps.h b/hypervisor/arch/=
arm64/include/asm/traps.h
> index a7c07624..0efedef1 100644
> --- a/hypervisor/arch/arm64/include/asm/traps.h
> +++ b/hypervisor/arch/arm64/include/asm/traps.h
> @@ -25,6 +25,8 @@ struct trap_context {
>
>  void arch_handle_trap(union registers *guest_regs);
>  void arch_el2_abt(union registers *regs);
> +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long *ipa,
> +                                unsigned int flag);
>
>  /* now include from arm-common */
>  #include_next <asm/traps.h>
> diff --git a/hypervisor/arch/arm64/mmio.c b/hypervisor/arch/arm64/mmio.c
> index 7fbfef75..70301ab3 100644
> --- a/hypervisor/arch/arm64/mmio.c
> +++ b/hypervisor/arch/arm64/mmio.c
> @@ -43,7 +43,6 @@ enum trap_return arch_handle_dabt(struct trap_context *=
ctx)
>  {
>         enum mmio_result mmio_result;
>         struct mmio_access mmio;
> -       unsigned long hpfar;
>         unsigned long hdfar;
>         /* Decode the syndrome fields */
>         u32 iss         =3D ESR_ISS(ctx->esr);
> @@ -57,10 +56,10 @@ enum trap_return arch_handle_dabt(struct trap_context=
 *ctx)
>         u32 is_write    =3D iss >> 6 & 0x1;
>         u32 size        =3D 1 << sas;
>
> -       arm_read_sysreg(HPFAR_EL2, hpfar);
>         arm_read_sysreg(FAR_EL2, hdfar);
> -       mmio.address =3D hpfar << 8;
> -       mmio.address |=3D hdfar & 0xfff;
> +
> +       if (!arch_get_fault_ipa(ctx, &mmio.address, GV2M_READ))
> +               return TRAP_HANDLED; /* Try again */
>
>         this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_MMIO]++;
>
> diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.=
c
> index 488dd7f8..10441b4b 100644
> --- a/hypervisor/arch/arm64/traps.c
> +++ b/hypervisor/arch/arm64/traps.c
> @@ -33,6 +33,85 @@ void arch_skip_instruction(struct trap_context *ctx)
>         arm_write_sysreg(ELR_EL2, pc);
>  }
>
> +static bool check_workaround_834220(void)
> +{
> +        unsigned long midr;
> +       unsigned int variant, revision, part;
> +
> +       arm_read_sysreg(MIDR_EL1, midr);
> +
> +       variant =3D (midr >> 20) & 0xf;
> +       revision =3D midr & 0xf;
> +       part =3D (midr >> 4) & 0xfff;
> +
> +       /* Cortex-A57 r0p0 - r1p2 */
> +       if (part =3D=3D 0xD07 && variant <=3D 1 && revision <=3D 2)
> +               return true;
> +
> +       return false;
> +}
> +
> +static bool hpfar_is_not_valid(bool s1ptw, u8 fsc)
> +{
> +       /*
> +        * The HPFAR can be invalid if the stage 2 fault did not
> +        * happen during a stage 1 page table walk (the ESR_EL2.S1PTW
> +        * bit is clear) and one of the two following cases are true:
> +        *   1. The fault was due to a permission fault
> +        *   2. The processor carries errata 834220
> +        *
> +        */
> +       return (s1ptw =3D=3D 0U) && (((fsc & ESR_ISS_FSC_TYPE) =3D=3D ESR=
_ISS_FSC_PERM) || check_workaround_834220());
> +}
> +
> +bool arch_get_fault_ipa(struct trap_context *ctx, unsigned long *ipa, un=
signed int flags)
> +{
> +       unsigned long hpfar, hdfar, par, tmp;
> +
> +       u32 s1ptw =3D ESR_ISS(ctx->esr) >> 7 & 0x1;
> +       u8 fsc =3D ESR_ISS_FSC(ctx->esr);
> +
> +       arm_read_sysreg(FAR_EL2, hdfar);
> +
> +       if (hpfar_is_not_valid(s1ptw, fsc)) {
> +
> +               /* Save current PAR_EL1 */
> +               arm_read_sysreg(PAR_EL1, tmp);
> +
> +               /*
> +                *  Performs stage 1 address translation, with permission=
s as if
> +                *  writing to or reading from the given virtual address =
from EL1
> +                */
> +                if ( (flags & GV2M_WRITE) =3D=3D GV2M_WRITE ) {
> +                        asm volatile ("at s1e1w, %0;" : : "r" (hdfar));
> +                } else {
> +                        asm volatile ("at s1e1r, %0;" : : "r" (hdfar));
> +                }
> +
> +               isb();
> +
> +               /* The resulting address can be read from the PAR_EL1 */
> +               arm_read_sysreg(PAR_EL1, par);
> +
> +               /* Recover current PAR_EL1 */
> +               arm_write_sysreg(PAR_EL1, tmp);
> +
> +               /* If PAR_EL1.F =3D 1, address translation aborted */
> +               if ((par & PAR_F) =3D=3D PAR_F) {
> +                       printk("Failed to ipa!\n");
> +                       return false;
> +               } else {
> +                       *ipa =3D (par & PADDR_MASK & PAGE_MASK) | (hdfar =
& (~PAGE_MASK));
> +               }
> +       } else {
> +               arm_read_sysreg(HPFAR_EL2, hpfar);
> +               *ipa =3D hpfar << 8;
> +               *ipa |=3D hdfar & 0xfff;
> +       }
> +
> +       return true;
> +}
> +
>  static enum trap_return handle_hvc(struct trap_context *ctx)
>  {
>         unsigned long *regs =3D ctx->regs;
> @@ -71,7 +150,7 @@ static enum trap_return handle_sysreg(struct trap_cont=
ext *ctx)
>
>  static enum trap_return handle_iabt(struct trap_context *ctx)
>  {
> -       unsigned long hpfar, hdfar;
> +       unsigned long hpfar;
>
>         if (this_cpu_data()->sdei_event) {
>                 this_cpu_data()->sdei_event =3D false;
> @@ -83,11 +162,11 @@ static enum trap_return handle_iabt(struct trap_cont=
ext *ctx)
>                 return TRAP_HANDLED;
>         }
>
> -       arm_read_sysreg(HPFAR_EL2, hpfar);
> -       arm_read_sysreg(FAR_EL2, hdfar);
> +       if (arch_get_fault_ipa(ctx, &hpfar, GV2M_READ))
> +               panic_printk("FATAL: instruction abort at 0x%lx\n", hpfar=
);
> +       else
> +               panic_printk("FATAL: instruction abort and can not get ip=
a\n");
>
> -       panic_printk("FATAL: instruction abort at 0x%lx\n",
> -                    (hpfar << 8) | (hdfar & 0xfff));
>         return TRAP_FORBIDDEN;
>  }
>
> --
> 2.25.1
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigRHEKJLuer6JrvPER2oEZJnaiFb2YsHeHRasoNjVX-f4Q%40mail.gm=
ail.com.
