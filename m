Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBOXHV2LQMGQEFEPI4MI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13f.google.com (mail-il1-x13f.google.com [IPv6:2607:f8b0:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DC589B42
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Aug 2022 13:55:40 +0200 (CEST)
Received: by mail-il1-x13f.google.com with SMTP id q10-20020a056e020c2a00b002dedb497c7fsf5238074ilg.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Aug 2022 04:55:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1659614139; cv=pass;
        d=google.com; s=arc-20160816;
        b=xgX2gJb8QeR6PapO+BFPGAkJWbue1zq1rSZfPgDe0LJTzCBn+bGt4l4lA87FyxcBO9
         N0FRsZM7dsng4PTMa5kjjyPNxcjXGE0I/m+PRxoQnQgp1naVOfy1/s6fF1RK0wVA/+4m
         EidVOL6Ihmix+nVReDg+xiBaGx1IJioKB6RCxG8sra/C1I8cNfZv6nwjrIX+TKNSFJHi
         ImJvEFFIn8GytI+5n9ELwLKZizh2nxQP+TCs4yme4ZW6tFuwMBA4ZoPpbKjlhKaC9LEU
         +pAb3UjqeD3MjdqKnR6oOFcfHmTmqz+eWSUbnCbZarWxoXJuvToDFK6YpjC8ZF4DXqaO
         15yA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=1gb+zxKY5t5PYvZLbxbMDrIBANWamq5KSxLvfug0KDs=;
        b=HVHVQF/lTZt3usx/fcDZk8uyS6TtvRjPmbVF/n0huZpJ2y6TqfPbWORz1EdfPs0fVC
         TMMFJChflUdHb0o+Fuir5E+l1KMQm9/5kSYv49yXzG0Ccu3zmvlnjsI3Ua7oBelwJIGb
         SHhLY+ijAUPSHDUY17ez/TDSOzMVrkhbgLDHXWVXMzac0APh9Kb3YwAkCV/sA0XnBrFQ
         IkcsMcvbZugJ2OfM3cc2ZWCoF6bWBdV72siVDImtpO+w28fwOBRUWVzjgee/EnLkjfcx
         LYrqg9+d4TFjB2/Y1z5pAgYXuLdohMhXPBYjIvkfo3a0M6pFokt/mJQIECQ+9Zcuf2XE
         e+6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=e5Zf7fnv;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::544 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1gb+zxKY5t5PYvZLbxbMDrIBANWamq5KSxLvfug0KDs=;
        b=I6hhBgbJ/st5IHkvbbybArucwy/GqHDfop4gXAqO/hYItj2xEPnY3H+XSlwgZicZUf
         fJ4CtGW92mEP6Xkxxxk4RC7MqfUDNdP5E8PmRJk+XVRbYtPaoW/dcOQEes/7eFL3npUi
         ccmupLnz2MjO5Lk+NaAoayFvAFrDaWIvuu2ONlsz2qScJxo34AVaut1hKINtD0/p+N8p
         GYbaJZPADpAhM92/MOD90Ce0zzaxv15EfCjgFD56Y+m5rYzGbyl5sW+YooMK3I39bSPg
         XjiAueqhWzfU3SfImZiI0sMO4y+g3hEqfFvXnGakfeKAAwPI8iqq+gr/jIdsn0QtFZIA
         UbWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1gb+zxKY5t5PYvZLbxbMDrIBANWamq5KSxLvfug0KDs=;
        b=HZ4dbKdXomrjwoXI/afvXSoirSM/Kogq/ijZdG3v/xHtnaRF8jAGqAtKPw7nfLt5/k
         fh0ybm+0X4yrbyfaIiSLjCB8xLFimM8eLcawgyZyeHyMrW89y6/Gl2WZC2HTVKZlFa49
         0oqRo3HiN58TtBzraMNcAYDpnTTib/kentQALCafL8P487Z8erLn/DZ4nXkcmVUEkVfB
         kpxrf6QwIe5AQTHbnFNKyv5CKX84vqJ22bBotdGt5jjZslZxlqBAIF4cvz7jj0Ym2HT9
         uEzaZQDBA29X4/LOT7+z0K7bjyzQPWQsYi6KbiwFqByEFGJs8bT+JQ0IG68wHifoaufw
         H7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1gb+zxKY5t5PYvZLbxbMDrIBANWamq5KSxLvfug0KDs=;
        b=HRK7bwdqkO9Q6ffketI2/1eywUUIV2F9wddJBiwkJcht8HygnWZ1Im62H9GjNy68hZ
         RF5n1bj/4h+cQKnDnbN8Lqt7/7+0RFPMBl/oCOqggeubliI0Jr8YVPKhmG58DTywm8F9
         sbDaWYTtLaDdcYMwiYacbsYvJlSzidzUTl+BjDNdLMBziGhMO77/BxVXmXF+PSerVbB/
         F4I30HfujWojlYIUQzt/Xofax3hgKuLh3BXuKaWPMb60yFfWa+oi12SsIfSakNHhjy9d
         M9DFvhbHjHFEzNYVQK55CVYtNr2Q2KNI7jQjhgN5ZRAJXNc9S4NlOYOv2xz0M5cUkjxp
         AGYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo3lCrYfKwB3kKkND9xAaQreSD9qF5jVfhb3uOmtut4LTmcti9/U
	aaP44PpyY0tdCASRgj+7hb0=
X-Google-Smtp-Source: AA6agR7NgKRzU2YFp0qa83glh+H5e9kMPhr2+lAuK5HSg/3W4UsEgL2xWQg3BrWj+ndA1nY2smrGgw==
X-Received: by 2002:a05:6638:c53:b0:342:a7e7:6829 with SMTP id g19-20020a0566380c5300b00342a7e76829mr637160jal.112.1659614138880;
        Thu, 04 Aug 2022 04:55:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:7a41:0:b0:67b:ef07:dacf with SMTP id k1-20020a6b7a41000000b0067bef07dacfls138691iop.10.-pod-prod-gmail;
 Thu, 04 Aug 2022 04:55:38 -0700 (PDT)
X-Received: by 2002:a05:6602:2751:b0:67c:9367:ca8d with SMTP id b17-20020a056602275100b0067c9367ca8dmr654111ioe.7.1659614138072;
        Thu, 04 Aug 2022 04:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659614138; cv=none;
        d=google.com; s=arc-20160816;
        b=nhBAW7yAvkEtsVrryRisdyIZr2V3Mz+bTwhIirJUHQqQn/otJ+lDDDgVsyWF1qK90G
         XCyfK+MIk0GG1BWozduSjRjkc53LbOHW7xQXB9BDODlTKtdgHDtLXl2cluWAsrnqxW+l
         HmWFg5PqQrCbEZn+sj6zX3qFZCalqK2M/cCiPSFTQ4AKh58kcn+1aNLn4qJ52DB85h6i
         cLC1271k+CvT/bPXuVdf41kHNQnfCYtBKosBP232TORQyx+NmJehFmeImPj7cY+9K0Ge
         H4aziJdE/IFG7v4lLl0/w9EIg0uCADobOBT+K13YMHAGHNP9NmFRwFUVFgLDVNFOOJ1R
         BzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rK5T5wucfM5EIhzIGwjG/4Fmga7yz3IB9ZkM2/+oFDM=;
        b=Xl746t6sqDHaHA8PGks7vdm0GkKCEz8fNVY5GeA8T81v/x+BFu3jfdsAl6Ptw5yiNa
         lD55SqF+T2hvwJ+T3RMQpI6REuQjRQYC5ZFAWGnsKJUflSl1szbcWbCiRy/kSQKr8lVS
         UNgzzAgQpPCl9q0pid3p+iT1XKrXkhEYclgy4QmPKQiWLLLizUJR7ZxF8qmQxa8wvB88
         zvFXjsZAMxEACiNTBf6tTRnOVPbGIO1srf2EknT7slMUSKzbDf+mnJFDb3yEbqJOodEL
         C+D2zhh60YOykm81uE8cEzbAN7B4SE/RhigCIAdV92u+G7DwnZfjrhtykiSallO8lblJ
         cGnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=e5Zf7fnv;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::544 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com. [2607:f8b0:4864:20::544])
        by gmr-mx.google.com with ESMTPS id b14-20020a056e02184e00b002de7816ab29si51864ilv.5.2022.08.04.04.55.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 04:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::544 as permitted sender) client-ip=2607:f8b0:4864:20::544;
Received: by mail-pg1-x544.google.com with SMTP id d7so14692523pgc.13
        for <jailhouse-dev@googlegroups.com>; Thu, 04 Aug 2022 04:55:38 -0700 (PDT)
X-Received: by 2002:a65:694f:0:b0:41c:cc1f:4440 with SMTP id
 w15-20020a65694f000000b0041ccc1f4440mr1388697pgq.318.1659614137319; Thu, 04
 Aug 2022 04:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220603131124.2007946-1-gengdongjiu1@gmail.com>
In-Reply-To: <20220603131124.2007946-1-gengdongjiu1@gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Thu, 4 Aug 2022 19:55:24 +0800
Message-ID: <CABSBigS+SSKyKKtKZcjref9dZWuc-JCg02mCJf0UTm5kM_vtMw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: check whether HPFAR is valid before getting IPA
To: jan.kiszka@siemens.com, jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=e5Zf7fnv;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::544
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

Hi Jank,
      sorry to disturb you, when you have time, can you look at this
patch? Thank you very much.

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
jailhouse-dev/CABSBigS%2BSSKyKKtKZcjref9dZWuc-JCg02mCJf0UTm5kM_vtMw%40mail.=
gmail.com.
