Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBGM65HTQKGQEJJ7MPZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8938958
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 13:48:42 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id y22sf2776770eds.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 04:48:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559908122; cv=pass;
        d=google.com; s=arc-20160816;
        b=mJNGS/kYuQxqe5WXEUu00SlWz2z6SzZ3aF840lephIXSuXEqGWopdFj4bhf7FJzvPd
         tbnq3OXBtmDciGbLXqtUA8Yuy8v9i31iNDKGlZQ+2yn44F9t0ejoNP0C7Lz5t/8VGQrE
         yY8d/y7FxqRPZ8KDZlayUJU/9CIE7DEiY5eQEhRav+MfQ8z/RgelBNjAOAdZ/BjmFtMA
         hizpBu59Y35Mu4q0eto98VUSyCc9Kw5Dc8Lc9DRPX0Ge1IAG/NtDWMHhgVx8W+Vl5Qgb
         6xE6jdT7C+husinrD1hCxAm5jsZCIoGr73aD04GvPUt2/V6RqZJpM1oKyNi8z+D2QSpb
         6OfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=g02wdH2Bp9+EQDPXJJ0t6Bnk/L/tvDwRPMwrwAJsO+w=;
        b=HjKUHAm527CGHul4v/Vb3zVgjmCsWiG0JO0yuEUr6OJdArj/SPqRDREbGUhkPzWAgA
         v7r1fZ/GTvZrFuabVGev052WVd/00ljKPb1VsT4ZO1/CIDpX60oL0SBHcDoeY4ZRJeqH
         5wmT63KcVVqbANzupm0puL7j1zHQciI66yp5wIjKvv8XwJVajykyKgkCDaqAc1511SxL
         5ZtPgRtOkkWNVh0iRw5FKpdvCMGHOs9z8CfmQjjuHfpZs8FDnvK+sS6UjJ1PNnseX5Ra
         ApiPAsKy/vN7BWKTFVFF5bE6FhsZI2xgcHZMpMmo828l7VpVF9lu6W1zlRtY2kfZ8eEk
         iQfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IfR+mJNX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=g02wdH2Bp9+EQDPXJJ0t6Bnk/L/tvDwRPMwrwAJsO+w=;
        b=mdaEg2xg6PgFmz2ufoWo1KGgmGbeFPnCrssN1RCjI8IAaAbRu5gaMb0O3EkuMESKIj
         fFtYgDwctDygh3/kJ0YjHDtwq7jmrCfvsD1Z15xr+dKWwoMxkYKbDdFDea2W6M0Gig9a
         38vpwsEgibsKu+71QEA1t2eZZUhRXNaAqOROCkJmykIwCt8Kjf8bmfpFnrGcUoZrPqmh
         zj452CiG6fD8fPRPewsVRx5jg1Ly9QB6Cj7H6RMnIYUD2S6VhRaRJDzAgk1Acqtp2lnG
         Z8zztjodblEbhGvde79IYpDBQO8GIRp6NItCN6CpNyTzcZoutoU3F2V45rxJiJl4dty+
         r2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g02wdH2Bp9+EQDPXJJ0t6Bnk/L/tvDwRPMwrwAJsO+w=;
        b=EVJ/uDsg7vbamZRNpGK1UHL8FRqDef3nrimo/Y5+/Br5pwt0B6atwKhfXjDYeRoz6k
         qLXTphikkF24rvg+Nf3gCCs+sSUEyYMoouc1O3mOoOxjkTfW/oDjQqgzGwApi9Rt1pJP
         S4dxLr3TXZd6YDPeOePa18DW8tFqW7bzcLsJsiYCjVb5w2vGUWovrMyY8f+x/hIDBnNY
         1lFqeRn9zCZUVcJKOE8TZ37+JgADZJhyiSMxdGWCgHw1umsaeZce520MpQlWsEyskQu/
         W4spTFYc4oZCGcdssSoNPFNrKo/IKnAzuwEf5FVg1H/StTiSX4sM5Q6jjsXuCVUO3npd
         +Osw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV2MH4f1H54gCwoPf0SBMGwNeBLmRYwAnjnPt5ymO3jOXascC3e
	WpiubH6Yw50VfYT8JEB76XI=
X-Google-Smtp-Source: APXvYqz2apS6NEpCmdoAh7LbIzJ2syqvUWrGldjRp1sPDd8Tm2k5DTZeS/AYNFsTxzzF7cb8aFqIag==
X-Received: by 2002:a50:ad01:: with SMTP id y1mr34526277edc.180.1559908122010;
        Fri, 07 Jun 2019 04:48:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b7af:: with SMTP id h44ls2473925ede.15.gmail; Fri, 07
 Jun 2019 04:48:41 -0700 (PDT)
X-Received: by 2002:a50:b107:: with SMTP id k7mr2236511edd.193.1559908121457;
        Fri, 07 Jun 2019 04:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559908121; cv=none;
        d=google.com; s=arc-20160816;
        b=XrdKaSgCN5bqMoMpquna3hzsVjYmel9/bGyh4h/1d05YbBzPxbOQ0k3fny655vIa95
         Q2MUb+VrjU6pA3bOAnxxkATbokRfBF6sZE2f7kHRAtdjABjTMQbld4ZI0GfkfU+3cT2b
         e4yH0l2BHRfTKAen8+gFho//YAwHCSVQCPqUsLpeW/WZs2JI6c8UzJcewKbp1LOoPOcC
         +uWeQDea+z2mMZfTQJIZqBU93WPQ187EYZdj4a+fYfN/7pL4GCv7z9oBqpvd2yBcTC/6
         uqQ9abl8EYcEgO+HdUIN+hYUzR6E9qOrysizLKgqVsiGEYONAUUJf94OErQgBzjbOHpQ
         ExaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=NJN8faRabR43Q9b7+qjdAWee/PPqbcin7fZ4hZuSamg=;
        b=Htp5pCSxkE3kgfAZs6jEoIdHHUXd5SPkLfDeJz5Frz+oWeV1gHUWBeLYFOtkvr445S
         JiVQvyoSz41kWAseAK3RTqfc4VifXpLRQJZHVwlWwhinoU395TOvHHf/FHybxTnfNrzo
         0CywBKjxRn+y4fiw2U0Sm0SGgcxkq+MX6EWtvJhurm+eHPsJYu5jAJAEtPn4zRHaZP4/
         4flmL6cfGCcE2nY7U+jim51tBia00Gu98mJAAUoowpyfF8/3H614EmmmMph+H07OfIba
         yJMb81FsDoRTiAZzxl5dVY0nvmj43dajjOizwGSkUj4eugt8mxc6+6hrwX01beh2+94+
         CQxA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IfR+mJNX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id t36si58117edb.0.2019.06.07.04.48.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 04:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45L1546N56zyMW;
	Fri,  7 Jun 2019 13:48:40 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 7 Jun 2019
 13:48:40 +0200
Subject: Re: [PATCH v2 3/3] x86: mmio: add support for 0x66 operand prefix
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
 <20190606224457.1053-4-ralf.ramsauer@oth-regensburg.de>
 <6294be2a-0ce1-1021-1691-c801456b36a3@siemens.com>
 <954cb55c-f616-ddbe-19a7-5fc336c01ad7@oth-regensburg.de>
 <705ff8a6-e48c-1257-f16a-3a3dfd1faab5@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <bad98443-d907-352e-f7d1-ab42281bbc9e@oth-regensburg.de>
Date: Fri, 7 Jun 2019 13:48:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <705ff8a6-e48c-1257-f16a-3a3dfd1faab5@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IfR+mJNX;
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



On 6/7/19 1:45 PM, Jan Kiszka wrote:
> On 07.06.19 13:22, Ralf Ramsauer wrote:
>>
>>
>> On 6/7/19 1:04 PM, Jan Kiszka wrote:
>>> On 07.06.19 00:44, Ralf Ramsauer wrote:
>>>> mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
>>>> 0x66 0x8b 0x00.
>>>>
>>>> 0x66 is the operand-size override prefix which we currently do not
>>>> support.
>>>>
>>>> We should support it, as we can find this opcode, for example, for som=
e
>>>> mmconfig space access from Linux (e.g., pci_generic_config_read).
>>>>
>>>> This also adds appropriate mmio-access tests.
>>>>
>>>> Tested in QEMU virtual target.
>>>>
>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> ---
>>>> =C2=A0=C2=A0 hypervisor/arch/x86/include/asm/processor.h |=C2=A0 1 +
>>>> =C2=A0=C2=A0 hypervisor/arch/x86/mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
47
>>>> +++++++++++++++------
>>>> =C2=A0=C2=A0 inmates/tests/x86/mmio-access-32.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++-
>>>> =C2=A0=C2=A0 inmates/tests/x86/mmio-access.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++-
>>>> =C2=A0=C2=A0 4 files changed, 76 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/hypervisor/arch/x86/include/asm/processor.h
>>>> b/hypervisor/arch/x86/include/asm/processor.h
>>>> index 70a6c3ff..d8111690 100644
>>>> --- a/hypervisor/arch/x86/include/asm/processor.h
>>>> +++ b/hypervisor/arch/x86/include/asm/processor.h
>>>> @@ -145,6 +145,7 @@
>>>> =C2=A0=C2=A0 =C2=A0 #define X86_REX_CODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 4
>>>> =C2=A0=C2=A0 +#define X86_PREFIX_OP_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x66
>>>> =C2=A0=C2=A0 #define X86_PREFIX_ADDR_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x67
>>>> =C2=A0=C2=A0 =C2=A0 #define X86_OP_MOVZX_OPC1=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0f
>>>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>>>> index df8c97a1..b836f43c 100644
>>>> --- a/hypervisor/arch/x86/mmio.c
>>>> +++ b/hypervisor/arch/x86/mmio.c
>>>> @@ -54,6 +54,7 @@ struct parse_context {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_rex_w;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_rex_r;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_addrsz_prefix;
>>>> +=C2=A0=C2=A0=C2=A0 bool has_opsz_prefix;
>>>> =C2=A0=C2=A0 };
>>>> =C2=A0=C2=A0 =C2=A0 static bool ctx_update(struct parse_context *ctx, =
u64 *pc,
>>>> unsigned int advance,
>>>> @@ -74,14 +75,33 @@ static bool ctx_update(struct parse_context *ctx,
>>>> u64 *pc, unsigned int advance,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>> =C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0 -static unsigned int get_address_width(bool has_addrsz_pr=
efix)
>>>> +static void parse_widths(struct parse_context *ctx,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_instruction *inst, bool parse_addr_=
width)
>>>> =C2=A0=C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 cs_attr =3D vcpu_vendor_get_c=
s_attr();
>>>> -=C2=A0=C2=A0=C2=A0 bool long_mode =3D (vcpu_vendor_get_efer() & EFER_=
LMA) &&
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cs_attr & VCPU_CS_L);
>>>> +=C2=A0=C2=A0=C2=A0 bool cs_db =3D !!(cs_attr & VCPU_CS_DB);
>>>> +=C2=A0=C2=A0=C2=A0 bool long_mode =3D
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (vcpu_vendor_get_efer() & =
EFER_LMA) && (cs_attr & VCPU_CS_L);
>>>> =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 return long_mode ? (has_addrsz_prefix=
 ? 4 : 8) :
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!!(cs_attr & VCPU_CS_DB) =
^ has_addrsz_prefix) ? 4 : 2;
>>>> +=C2=A0=C2=A0=C2=A0 /* Op size prefix is ignored if rex.w =3D 1 */
>>>> +=C2=A0=C2=A0=C2=A0 if (ctx->has_rex_w) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->access_size =3D 8;
>>>> +=C2=A0=C2=A0=C2=A0 } else {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (long_mode)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* CS.d is ignored in long=
 mode */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
st->access_size =3D ctx->has_opsz_prefix ? 2 : 4;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
st->access_size =3D
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (cs_db ^ ctx->has_opsz_prefix) ? 4 : 2;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (parse_addr_width) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (long_mode)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
st->inst_len +=3D ctx->has_addrsz_prefix ? 4 : 8;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
st->inst_len +=3D
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (cs_db ^ ctx->has_addrsz_prefix) ? 4 : 2;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0 =C2=A0 struct mmio_instruction
>>>> @@ -118,6 +138,11 @@ restart:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto error_noinst;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_a=
ddrsz_prefix =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto rest=
art;
>>>> +=C2=A0=C2=A0=C2=A0 case X86_PREFIX_OP_SZ:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_update(&ctx, &pc,=
 1, pg_structs))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to error_noinst;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_opsz_prefix =3D tr=
ue;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto restart;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOVZX_OPC1:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_=
update(&ctx, &pc, 1, pg_structs))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto error_noinst;
>>>> @@ -134,28 +159,26 @@ restart:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_=
write =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_TO_MEM:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.h=
as_rex_w ? 8 : 4;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, =
false);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_=
write =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOVB_FROM_MEM:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.acce=
ss_size =3D 1;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_FROM_MEM:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.h=
as_rex_w ? 8 : 4;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, =
false);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_IMMEDIATE_TO_MEM:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.h=
as_rex_w ? 8 : 4;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, =
false);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_i=
mmediate =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_=
write =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_MEM_TO_AX:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.inst_len +=3D get_add=
ress_width(ctx.has_addrsz_prefix);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.h=
as_rex_w ? 8 : 4;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, =
true);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.in_r=
eg_num =3D 15;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto fina=
l;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_AX_TO_MEM:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.inst_len +=3D get_add=
ress_width(ctx.has_addrsz_prefix);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.h=
as_rex_w ? 8 : 4;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, =
true);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.out_=
val =3D guest_regs->by_index[15];
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_=
write =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto fina=
l;
>>>> diff --git a/inmates/tests/x86/mmio-access-32.c
>>>> b/inmates/tests/x86/mmio-access-32.c
>>>> index be1d470f..9c1db1d8 100644
>>>> --- a/inmates/tests/x86/mmio-access-32.c
>>>> +++ b/inmates/tests/x86/mmio-access-32.c
>>>> @@ -41,6 +41,10 @@ void inmate_main(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(mmio_reg, pattern);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, patt=
ern);
>>>> =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 16-bit data, 32=
-bit address, OP size
>>>> prefix */
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov (%%eax), %%ax" : "=3Da" (reg32) =
: "a" (mmio_reg));
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u16)reg32, (u16)pattern);
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 32-bit data=
, 32-bit address */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movl (%%ebx), %%eax=
"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" =
(reg32) : "a" (0), "b" (mmio_reg));
>>>> @@ -55,6 +59,13 @@ void inmate_main(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern &
>>>> 0xff));
>>>> =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bit data, 32-=
bit address, OP size
>>>> prefix */
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov (%%eax), %%al"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (mm=
io_reg));
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg32, (u8)pattern);
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), 32-bit data, 3=
2-bit address */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%ebx), %%e=
ax"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" =
(reg32) : "a" (0), "b" (mmio_reg));
>>>> @@ -87,7 +98,15 @@ void inmate_main(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movb %%al, (%%ebx)"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : : "a" (=
0x42), "b" (mmio_reg));
>>>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffff00=
) | 0x42);
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) |=
 0x42);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data, OP size prefix */
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0=
x23), "b"
>>>> (mmio_reg));
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) |=
 0x23);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (89), 16-bit data, OP size prefix */
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342),=
 "b"
>>>> (mmio_reg));
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL)=
 | 0x2342);
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IMMEDIATE_TO_MEM (c7), =
32-bit data, mod=3D0, reg=3D0, rm=3D3 */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movl %0, (%%ebx)"
>>>> diff --git a/inmates/tests/x86/mmio-access.c
>>>> b/inmates/tests/x86/mmio-access.c
>>>> index a9d2fcaf..3794555f 100644
>>>> --- a/inmates/tests/x86/mmio-access.c
>>>> +++ b/inmates/tests/x86/mmio-access.c
>>>> @@ -51,6 +51,10 @@ void inmate_main(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write64(mmio_reg, pattern);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, patt=
ern);
>>>> =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 16-bit data, Ox=
66 OP size prefix */
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov (%%rax), %%ax" : "=3Da" (reg64) =
: "a" (mmio_reg));
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u16)reg64, (u16)pattern);
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 64-bit data=
, mod=3D0, reg=3D0, rm=3D3 */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movq (%%rbx), %%rax=
"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" =
(reg64) : "a" (0), "b" (mmio_reg));
>>>> @@ -75,6 +79,13 @@ void inmate_main(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern &
>>>> 0xff));
>>>> =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bit data */
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov (%%rax), %%al"
>>>
>>> The comment should probably clarify that data16 has to be ignored in
>>> 64-bit mode, right?
>>
>> Right. In 32-bit mode it remains a 8-bit mov as well.
>>
>> /* MOV_FROM_MEM(8a), 8-bit data, 0x66 OP size prefix (ignored) */
>>
>>
>> (second comment below)
>>
>>
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mm=
io_reg));
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg64, (u8)pattern);
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), to 64-bit, mod=
=3D0, reg=3D0, rm=3D3 */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%rbx), %%r=
ax"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" =
(reg64) : "a" (0), "b" (mmio_reg));
>>>> @@ -129,7 +140,15 @@ void inmate_main(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movb %%al, (%%rbx)"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : : "a" (=
0x42), "b" (mmio_reg));
>>>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffffff=
ffffff00) |
>>>> 0x42);
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) |=
 0x42);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data, OP size prefix */
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0=
x23), "b"
>>
>> Just noticed: ebx should be rbx, and=E2=80=A6
>>
>>>> (mmio_reg));
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) |=
 0x23);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (89), 16-bit data, OP size prefix */
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342),=
 "b"
>>>> (mmio_reg));
>>
>> =E2=80=A6 same here. Doesn't make a difference, but should be aligned.
>>
>=20
> OK, integrated all - and decided to drop the duplicate tests. Merged to
> next.

Great, thanks for fixing up things.

  Ralf

>=20
> Thanks,
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bad98443-d907-352e-f7d1-ab42281bbc9e%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
