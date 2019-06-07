Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBDMS5HTQKGQEHO3GGNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBBA388E6
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 13:22:53 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id r5sf2666720edd.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 04:22:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559906573; cv=pass;
        d=google.com; s=arc-20160816;
        b=dJy1fr/1n05YETgZJrLx/VhRRvVuq/hl7/zvksOtpwoW1skiwF/n6ZFoYl0P7v/1SH
         ws9hdEHp9fd6fv/MYPt1p0IZaGGzp7guau/YLEVG4X0pwz6Qdu1Ow8sbDoA/2chWu4mb
         wt9UW4POiqo3PFMOOkjmxEUCDaCG2o/HJ+FaISu7WtYYgt/a5H1wW+PjRd5kIIHvCVIa
         OQ/zcC0K0i4ElR9+z1/rxYBBHRWyjz8w/rRuNfIB1eiHlRSz/pEEqbIrBzKkw3+fBWy4
         aiCzpfYfrSFYZDEQ1EdsB4ow8HpOwrS6kJ/ta4LouhLKsDpd6bbmgUO/pHU0AFDVnqGm
         ohxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=gzbyLfu9puiO0CTTlCLMZnqpbFXphLggAa3pBF3yB30=;
        b=tqwb279nyic0aVtpiSwajrJ8CGuRZmt+K1sXDMfzDg2TXvPd+UY/ze3yo0v36Sr35U
         RurXwo9U8pRbu+Kqnswa8I9RrwFQtf53rsl35gVgRD8YkKrjiOz29lBzvqr3NPHEKbwV
         fnFMGz1JdMQ5u5WTP3yMmG+GQA4nKaVDnI5Rf4haKN/h6hOoLP4xdbCkMVL7cM538nLd
         guoJOnP1DWEO4nEGoAYUCCk68VdS+467Xz9H96zElXTyEd69MarXUt7WV6oEG4enORcr
         EAPUgKr8P6HXt1flOoduToTrnpNWOW78X6TmIKLdGKVy1CYJzz7ebFa9JLDZQ8zXBXhu
         7QIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=M5S+f4Ob;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gzbyLfu9puiO0CTTlCLMZnqpbFXphLggAa3pBF3yB30=;
        b=QhgNiYz0O3zCBmN5k5cGvUCsoXm158VW+q1kKgK/jps0zUtDeT/87JcmE8uDb2DsSl
         oRoS1DsqO5tm0XT0910JlxME6TLBAeqDoBTn34g+1dGCxJbEEth9wk1yXgrMo94bg0+p
         qcW+y1jU1fPfjWT9Tq/J71/67JxlQFosPy4N0oWwIlfgutjv5A8oZVRT8diit9juXJ2l
         yyAMPuazbwCj6gYrf0U42YGtQTMtMnTQZdvYThGWIZazD6D3rpPCZlBzQ0jT44jfxAWZ
         2IF/H3ssJ+XAVzXwPLV+1iolqlGsReNP1VZ1jvfa/R0DE86dvAzUjk7UfwXtMPVuo4Bq
         GxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gzbyLfu9puiO0CTTlCLMZnqpbFXphLggAa3pBF3yB30=;
        b=UxpJ6xDRNVrpG0zSUKDcGURLjMwybFwYlAC5uO6FfknXdeiA8NQvzlgPuLRK3GQ4YK
         Dra5Gza68wG+KfcSy/8gqcuNonL8YULsmWBstkuMG+FYyKyvOqs6X+MpV9Jpy/RzqfyT
         jqv8trs36znUrxrhfWxX9gaOrW8nTi58Gt/1J+mjKEUMZLOWhOF3MH1EzWr88zGN+K0m
         Dk0lYC3SXzLu0wXgjfn4vFpwXzyTmWDhvSguyWDXjHA40Ir0MiGRtZVDKdo1ngil6CeE
         xUeez+YAsJ1y+onnjb7qAfDKLaqsKJ+tW8/DaJiSFFLdy5/VKtC8tubZZjFKE57V1Utj
         fuMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVo2gYGBxkn55kkUpFh6OlVyzC4qQN4MhQGbGmvufbfK0j/lvGy
	gNc/5BZ2QnBR77s1MRriZtA=
X-Google-Smtp-Source: APXvYqzxps9TriUS23ggw2AMIpPOtgwA7I76sP6jD096G1WT0/Z03eWIwBQC/3Yii5OtNHxeI7jyoA==
X-Received: by 2002:a17:906:5254:: with SMTP id y20mr14211545ejm.59.1559906573234;
        Fri, 07 Jun 2019 04:22:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7084:: with SMTP id b4ls1027376ejk.6.gmail; Fri, 07
 Jun 2019 04:22:52 -0700 (PDT)
X-Received: by 2002:a17:906:63c1:: with SMTP id u1mr45948291ejk.173.1559906572631;
        Fri, 07 Jun 2019 04:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559906572; cv=none;
        d=google.com; s=arc-20160816;
        b=ypDeLjeK4wiuKnutTa2Zqx0QgxHwTrhC0GtYyHQLcV/RyW6VyFsjfN5gWgOxwy/PDU
         qwuy9fJh2or0fuXO+JbpJbjSO/b8aQJggEE9wWZ0TAUiE5znq9vZ/EfTEdFzO9DQ+GNe
         O3WcloXQVbhTgpXKq3XnyT6JkX6JhU5RQhXQm2Z86HbUlfS5tFdbOs5iUf01fmAl1689
         9OTjBwSGYG/nqM5LD6utQUmRpFYuZZ53POudv/7w3oO1Kqb8P3K+lzfexOVc3aMVXSt5
         y1YXYakbS6CuPILHc17zU2FxqM1Li3LfbM2JFWbXLTSdMAGBgZ9kzPfkILbzSA+6hVre
         yQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=SLkN0R7011nkc3b2Lx/bOEyyI4Gtxli4w3ZN5JATywU=;
        b=Ep6KG+Ol+2YatsshYKk45cLAD/W85V9zcdmyBRzlqEuzw81+fdn44j+Ua2hUIQ+C5U
         CSvuFlAjo7VaE7hKwg9NigZkWo/jPb7tGubi+RwEahSeLCLfhyOIAmEP8ahRuUNPgqYC
         MiXSnBLzqZwi9rOK+It5oMr3m++KI1akgMm+VGbAu6jFP88su0NEPbEG/mssq2hkZo9u
         fzGLYXI5lb6WAiOIJaDsyikYgm+onPmaRBPSTYvLhLt52tCyAxHy2ve3BLgsu8h9GJZo
         qeB4uZK/LNP+OpLrqucEObaGQ3HEUyCa11XrzSafF76yal5Rx1uEvGYcMEyBRSahN+t8
         sCdA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=M5S+f4Ob;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id r27si69471edd.4.2019.06.07.04.22.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 04:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45L0WJ02HwzyS4;
	Fri,  7 Jun 2019 13:22:52 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 7 Jun 2019
 13:22:51 +0200
Subject: Re: [PATCH v2 3/3] x86: mmio: add support for 0x66 operand prefix
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
 <20190606224457.1053-4-ralf.ramsauer@oth-regensburg.de>
 <6294be2a-0ce1-1021-1691-c801456b36a3@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <954cb55c-f616-ddbe-19a7-5fc336c01ad7@oth-regensburg.de>
Date: Fri, 7 Jun 2019 13:22:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6294be2a-0ce1-1021-1691-c801456b36a3@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=M5S+f4Ob;
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



On 6/7/19 1:04 PM, Jan Kiszka wrote:
> On 07.06.19 00:44, Ralf Ramsauer wrote:
>> mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
>> 0x66 0x8b 0x00.
>>
>> 0x66 is the operand-size override prefix which we currently do not
>> support.
>>
>> We should support it, as we can find this opcode, for example, for some
>> mmconfig space access from Linux (e.g., pci_generic_config_read).
>>
>> This also adds appropriate mmio-access tests.
>>
>> Tested in QEMU virtual target.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 hypervisor/arch/x86/include/asm/processor.h |=C2=A0 1 +
>> =C2=A0 hypervisor/arch/x86/mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 47 ++++++=
+++++++++------
>> =C2=A0 inmates/tests/x86/mmio-access-32.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++-
>> =C2=A0 inmates/tests/x86/mmio-access.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++-
>> =C2=A0 4 files changed, 76 insertions(+), 14 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/include/asm/processor.h
>> b/hypervisor/arch/x86/include/asm/processor.h
>> index 70a6c3ff..d8111690 100644
>> --- a/hypervisor/arch/x86/include/asm/processor.h
>> +++ b/hypervisor/arch/x86/include/asm/processor.h
>> @@ -145,6 +145,7 @@
>> =C2=A0 =C2=A0 #define X86_REX_CODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 4
>> =C2=A0 +#define X86_PREFIX_OP_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x66
>> =C2=A0 #define X86_PREFIX_ADDR_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x67
>> =C2=A0 =C2=A0 #define X86_OP_MOVZX_OPC1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0f
>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>> index df8c97a1..b836f43c 100644
>> --- a/hypervisor/arch/x86/mmio.c
>> +++ b/hypervisor/arch/x86/mmio.c
>> @@ -54,6 +54,7 @@ struct parse_context {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_rex_w;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_rex_r;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_addrsz_prefix;
>> +=C2=A0=C2=A0=C2=A0 bool has_opsz_prefix;
>> =C2=A0 };
>> =C2=A0 =C2=A0 static bool ctx_update(struct parse_context *ctx, u64 *pc,
>> unsigned int advance,
>> @@ -74,14 +75,33 @@ static bool ctx_update(struct parse_context *ctx,
>> u64 *pc, unsigned int advance,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> =C2=A0 }
>> =C2=A0 -static unsigned int get_address_width(bool has_addrsz_prefix)
>> +static void parse_widths(struct parse_context *ctx,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_instruction *inst, bool parse_addr_=
width)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 cs_attr =3D vcpu_vendor_get_cs_attr()=
;
>> -=C2=A0=C2=A0=C2=A0 bool long_mode =3D (vcpu_vendor_get_efer() & EFER_LM=
A) &&
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cs_attr & VCPU_CS_L);
>> +=C2=A0=C2=A0=C2=A0 bool cs_db =3D !!(cs_attr & VCPU_CS_DB);
>> +=C2=A0=C2=A0=C2=A0 bool long_mode =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (vcpu_vendor_get_efer() & EF=
ER_LMA) && (cs_attr & VCPU_CS_L);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return long_mode ? (has_addrsz_prefix ? 4 : 8=
) :
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!!(cs_attr & VCPU_CS_DB) ^ =
has_addrsz_prefix) ? 4 : 2;
>> +=C2=A0=C2=A0=C2=A0 /* Op size prefix is ignored if rex.w =3D 1 */
>> +=C2=A0=C2=A0=C2=A0 if (ctx->has_rex_w) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->access_size =3D 8;
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (long_mode)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* CS.d is ignored in long m=
ode */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst=
->access_size =3D ctx->has_opsz_prefix ? 2 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst=
->access_size =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (cs_db ^ ctx->has_opsz_prefix) ? 4 : 2;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (parse_addr_width) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (long_mode)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst=
->inst_len +=3D ctx->has_addrsz_prefix ? 4 : 8;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst=
->inst_len +=3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (cs_db ^ ctx->has_addrsz_prefix) ? 4 : 2;
>> +=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> =C2=A0 =C2=A0 struct mmio_instruction
>> @@ -118,6 +138,11 @@ restart:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto error_noinst;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_addrsz_pr=
efix =3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto restart;
>> +=C2=A0=C2=A0=C2=A0 case X86_PREFIX_OP_SZ:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_update(&ctx, &pc, 1=
, pg_structs))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto=
 error_noinst;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_opsz_prefix =3D true=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto restart;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOVZX_OPC1:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_update(&=
ctx, &pc, 1, pg_structs))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto error_noinst;
>> @@ -134,28 +159,26 @@ restart:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_write =
=3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_TO_MEM:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.has=
_rex_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, fa=
lse);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_write =
=3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOVB_FROM_MEM:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =
=3D 1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_FROM_MEM:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.has=
_rex_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, fa=
lse);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_IMMEDIATE_TO_MEM:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.has=
_rex_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, fa=
lse);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_immediate=
 =3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_write =
=3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_MEM_TO_AX:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.inst_len +=3D get_addre=
ss_width(ctx.has_addrsz_prefix);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.has=
_rex_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, tr=
ue);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.in_reg_num =
=3D 15;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto final;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_AX_TO_MEM:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.inst_len +=3D get_addre=
ss_width(ctx.has_addrsz_prefix);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.has=
_rex_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, tr=
ue);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.out_val =3D =
guest_regs->by_index[15];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_write =
=3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto final;
>> diff --git a/inmates/tests/x86/mmio-access-32.c
>> b/inmates/tests/x86/mmio-access-32.c
>> index be1d470f..9c1db1d8 100644
>> --- a/inmates/tests/x86/mmio-access-32.c
>> +++ b/inmates/tests/x86/mmio-access-32.c
>> @@ -41,6 +41,10 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(mmio_reg, pattern);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, pattern);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 16-bit data, 32-bit add=
ress, OP size
>> prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov (%%eax), %%ax" : "=3Da" (reg32) : =
"a" (mmio_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u16)reg32, (u16)pattern);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 32-bit data, 32-bit=
 address */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movl (%%ebx), %%eax"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) =
: "a" (0), "b" (mmio_reg));
>> @@ -55,6 +59,13 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bit data, 32-bit addr=
ess, OP size
>> prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov (%%eax), %%al"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg32, (u8)pattern);
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), 32-bit data, 32-bit ad=
dress */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%ebx), %%eax"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) =
: "a" (0), "b" (mmio_reg));
>> @@ -87,7 +98,15 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movb %%al, (%%ebx)"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : : "a" (0x42), "=
b" (mmio_reg));
>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffff00) =
| 0x42);
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0=
x42);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data, OP size prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0x2=
3), "b"
>> (mmio_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0=
x23);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (89), 16-bit data, OP size prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342), "=
b" (mmio_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL) |=
 0x2342);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IMMEDIATE_TO_MEM (c7), 32-bit d=
ata, mod=3D0, reg=3D0, rm=3D3 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movl %0, (%%ebx)"
>> diff --git a/inmates/tests/x86/mmio-access.c
>> b/inmates/tests/x86/mmio-access.c
>> index a9d2fcaf..3794555f 100644
>> --- a/inmates/tests/x86/mmio-access.c
>> +++ b/inmates/tests/x86/mmio-access.c
>> @@ -51,6 +51,10 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write64(mmio_reg, pattern);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, pattern);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP si=
ze prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov (%%rax), %%ax" : "=3Da" (reg64) : =
"a" (mmio_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u16)reg64, (u16)pattern);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 64-bit data, mod=3D=
0, reg=3D0, rm=3D3 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movq (%%rbx), %%rax"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) =
: "a" (0), "b" (mmio_reg));
>> @@ -75,6 +79,13 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bit data */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov (%%rax), %%al"
>=20
> The comment should probably clarify that data16 has to be ignored in
> 64-bit mode, right?

Right. In 32-bit mode it remains a 8-bit mov as well.

/* MOV_FROM_MEM(8a), 8-bit data, 0x66 OP size prefix (ignored) */


(second comment below)


>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmio=
_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg64, (u8)pattern);
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), to 64-bit, mod=3D0, re=
g=3D0, rm=3D3 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%rbx), %%rax"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) =
: "a" (0), "b" (mmio_reg));
>> @@ -129,7 +140,15 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movb %%al, (%%rbx)"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : : "a" (0x42), "=
b" (mmio_reg));
>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffffffff=
ffff00) | 0x42);
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0=
x42);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data, OP size prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0x2=
3), "b"

Just noticed: ebx should be rbx, and=E2=80=A6

>> (mmio_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0=
x23);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (89), 16-bit data, OP size prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342), "=
b" (mmio_reg));

=E2=80=A6 same here. Doesn't make a difference, but should be aligned.

  Ralf

>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL) |=
 0x2342);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IMMEDIATE_TO_MEM (c7), 64-bit d=
ata, mod=3D0, reg=3D0, rm=3D3 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movq %0, (%%rbx)"
>>
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/954cb55c-f616-ddbe-19a7-5fc336c01ad7%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
