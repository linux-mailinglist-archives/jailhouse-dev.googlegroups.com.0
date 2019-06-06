Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYWJ4TTQKGQEBZRDFUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDF2376E2
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2019 16:36:19 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id q5sf587403ljq.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 07:36:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559831778; cv=pass;
        d=google.com; s=arc-20160816;
        b=YWm7YItODUgPEn2PjYLdG3PiWWNIB3wNMffQB7zVL3jYO8s+Y1LDI7xQrLdPNmbGoH
         I2ljoy4ycalXtu2vI1a6zOAYCSnpqoqNsLUHz/6K7xwVl+o6DWFhw6lv3lJBd+0oSs84
         Ic6mozCYdboJi6WvRMJUalEmTXABOlLG2v1o9hv8TY/84O91MbOmuNtecr7TKFbkzNJW
         AoLuQC2iUWXkaNjUclRSlKxveytdz2nWe9jrF9PHkn7ibbv0ZiiuXKA3FCaY0O2kyC1O
         NvoOCATzJ5rYF1JH/ytTqTTWpZXfz04nNzKabAbKaz+540Er+4dvUGuTRDhezEesDX1S
         qBIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=zIz+3yQ4MgF1TUajJ4T1LnKz3PjG2ONGcDi1h9fr8qk=;
        b=IZh2W0c5hQse+8BPRd9kLDXocK2BtKRDLmSxoaf3zRmivrHwnQCemaLms+Gm4GH6i0
         lQaxFl/Qf5kkqdCET0I9KG8X2p89qOJDbX3MnwylNGkwIaEUF1E/MPyy/QXqcRZ9bpld
         du5/yL6fknGBvOug8/+XI+xGKCaoOZTRUHW11BrXHpW71KkmbT5uh5gpRWRlkdfvDFpO
         XSvwX/0m4AilHccKO4XEDhRC3U8KF+yd3c1jSka89CIgWZpIbgpdl1r3sq771mEUUSFK
         f2Qwjp5te2/4Ty0OyR7TGK4Torcm4pq4UAKZsMLKPCp9SfgKCxmjpnTcbLIT4TSmmtrr
         Swjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zIz+3yQ4MgF1TUajJ4T1LnKz3PjG2ONGcDi1h9fr8qk=;
        b=QeBB7zQdVYmrH7lFI57yme4cL81uCnWc0j+V5VbQqK11JL+D1jNoMLBymAQDT+2Kjs
         0/UaYgJLWcaYIG+ZeF4rjlU7A4fM6KuaBZZUMwr1XUzJK29O1gaIytP97Lfy2VG559Nh
         sBsa7tHDTXmdV8MEl0bbtR22UCWqnepLQsL+VVoUzlQzKIPgHrchbCmpSC3j6926MFli
         PWCYS1zDURCTi7X1X8KWmHY05J+sv7cFGrL0viTANGDW8EHMOR4isoTW8YQrOPejQGhu
         BwcWt7Puqj72eA1tpO6Qg36McSfP8enzVE5hD4agFYnStQ4Nu4pmf7/Jm4j+kA8k5+Ot
         gaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zIz+3yQ4MgF1TUajJ4T1LnKz3PjG2ONGcDi1h9fr8qk=;
        b=SrEOrfUDJXPGL0Sj2SZzvc5t8jA9uybx210/ypGF96xFmFalLGoNMJO+fX+Fn21m9s
         jmfq28l6sm/7WE9UevhttP57/RE2OT1SSbX6UlaO+7A53rfHft1wg56WrZXW9rhrPlqT
         PPnJWvjmevvQjnRNn7keOpg+EoNESYSwN1w1OL75LmERRhgaC+egWOC78jRC10ogOrwr
         DDhkrBjWwtUfx5952AIWEBOovvWN72EIqAFnfXj+oNA2JrE8Yx+VqsIg4JCfnKUHe99A
         IM4argXmRZe5TeaH5VHlbydcjGUNSGGVljdUWXoCxhZgdE/22nWnh0j0F9cQ85NpB4lO
         5RWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVzZZc2IbgwHg/T3PizKkY6BQt+uBPEqJGODOCIqYXtePsJPPDN
	zRSoYCEcqmm8vOpKTk/fJYY=
X-Google-Smtp-Source: APXvYqyyeSX3o6NYGrrmhePv8ObW2nQakVLaVUeyCBD/xu/vzaGstjrCD6s43Ycei57wnAkZruRAHA==
X-Received: by 2002:a2e:44ce:: with SMTP id b75mr6752778ljf.95.1559831778490;
        Thu, 06 Jun 2019 07:36:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8998:: with SMTP id c24ls682905lji.15.gmail; Thu, 06 Jun
 2019 07:36:17 -0700 (PDT)
X-Received: by 2002:a2e:9753:: with SMTP id f19mr1185251ljj.113.1559831777779;
        Thu, 06 Jun 2019 07:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559831777; cv=none;
        d=google.com; s=arc-20160816;
        b=uJbzJg/IXbEw8AtiYTkz9NY534JMTeUJfxDRb4f2I2KVZBN52DlBiWQPzw0wqdUYW2
         Vchv8XjqE7dvBc4V2I3mzSZa6Nw8dSvHVuMwnjAcHmP4PkU6oURaAH7Iv1SyyZYOr/lC
         POfNNUmP3Cj8K/+xfo5TT//8Bbb13m3W9n0lechAdN0SII3JOA3TTh1tBKKZM10U31zV
         B6T1E4PLgEBC88GDKOePmfUeTJULt+VZYqwHegwKRasFqQki6PKLK3cnL6oTmJVJUBcm
         AkDCh1U6u1bnoT9QGNTvYnx38Jhn7KdFv6uDn+fFCXtH5e8LYAIh35WnAc8Pzafu+Ug2
         lE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nbKAAk73nQwSR/G+C8EYWNN/ngamiQBPWcIM8+h+PdU=;
        b=ZpSaeACy+yPqNU06Pyav83sK3/uLsOK66mrI6td9y9xZ7o8TTCN2Yxz9bt2VWycJYM
         ImG7TuGoZq7rGDapGyy/zyz/kvKnsIaz903EnQLiY9IEKuLDI6Q3p3j7FEuYcKyhuPnE
         yo176OS5+QXffE0iGvCVyg69a+IMJ0OwgWTjezy+8hHLsGAVml8R+d1OYL0bZ8ISBxqa
         khZxlGC8bLVQ5LX1cgSN3+SudLXVggzX2oXBeESk4hYKvY0lUMyGjW2Ztl9tgLDNKuFh
         uDOZlVunOXa/67wArulEwsRuiCh5Md4fKXlvTp0bBG45DXBjfXWLWpv4QqN6qN2+qZMO
         b1Qw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id i70si100828lfg.1.2019.06.06.07.36.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 07:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x56EaHgY003264
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jun 2019 16:36:17 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x56EaGbj005646;
	Thu, 6 Jun 2019 16:36:16 +0200
Subject: Re: [PATCH] x86: mmio: add support for 0x66 operand prefix
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <20190604210229.23554-1-ralf.ramsauer@oth-regensburg.de>
 <f7338cdd-3f1b-3b1c-d56c-6d783688348f@siemens.com>
 <c72d9659-2d46-5aff-062b-9d7d13dfcef4@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <eb6da892-059f-16f7-2473-74fbff2cc2d8@siemens.com>
Date: Thu, 6 Jun 2019 16:36:16 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c72d9659-2d46-5aff-062b-9d7d13dfcef4@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 06.06.19 15:53, Ralf Ramsauer wrote:
>=20
> On 6/5/19 12:06 AM, Jan Kiszka wrote:
>> On 04.06.19 23:02, Ralf Ramsauer wrote:
>>> mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
>>> 0x66 0x8b 0x00.
>>>
>>> 0x66 is the operand-size override prefix which we currently do not
>>> support.
>>>
>>> We should support it, as we can find this opcode, for example, for some
>>> mmconfig space access from Linux (e.g., pci_generic_config_read).
>>>
>>> This also adds appropriate mmio-access tests.
>>>
>>> Tested in QEMU virtual target.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  =C2=A0 hypervisor/arch/x86/include/asm/processor.h |=C2=A0 1 +
>>>  =C2=A0 hypervisor/arch/x86/mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 +++=
++++++++++++++----
>>>  =C2=A0 inmates/tests/x86/mmio-access-32.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
>>>  =C2=A0 inmates/tests/x86/mmio-access.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
>>>  =C2=A0 4 files changed, 40 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/x86/include/asm/processor.h
>>> b/hypervisor/arch/x86/include/asm/processor.h
>>> index 70a6c3ff..d8111690 100644
>>> --- a/hypervisor/arch/x86/include/asm/processor.h
>>> +++ b/hypervisor/arch/x86/include/asm/processor.h
>>> @@ -145,6 +145,7 @@
>>>  =C2=A0 =C2=A0 #define X86_REX_CODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 4
>>>  =C2=A0 +#define X86_PREFIX_OP_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x66
>>>  =C2=A0 #define X86_PREFIX_ADDR_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x67
>>>  =C2=A0 =C2=A0 #define X86_OP_MOVZX_OPC1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0f
>>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>>> index b234bd79..6d9ad1c5 100644
>>> --- a/hypervisor/arch/x86/mmio.c
>>> +++ b/hypervisor/arch/x86/mmio.c
>>> @@ -79,6 +79,26 @@ static unsigned int get_address_width(bool
>>> has_addrsz_prefix)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!!(cs_attr & V=
CPU_CS_DB) ^ has_addrsz_prefix) ? 4 : 2;
>>>  =C2=A0 }
>>>  =C2=A0 +static unsigned int get_op_width(bool has_rex_w, bool has_opsz=
_prefix)
>>
>> We should move all the flags into parse_context so that we can pass them
>> around more easily.
>=20
> Good point.
>=20
>>
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 u16 cs_attr;
>>> +=C2=A0=C2=A0=C2=A0 bool long_mode;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Op size prefix is ignored if rex.w =3D 1 */
>>> +=C2=A0=C2=A0=C2=A0 if (has_rex_w)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 8;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 cs_attr =3D vcpu_vendor_get_cs_attr();
>>> +=C2=A0=C2=A0=C2=A0 long_mode =3D (vcpu_vendor_get_efer() & EFER_LMA) &=
&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cs=
_attr & VCPU_CS_L);
>>
>> This may mean accessing the same VMCS regs multiple times. I vaguely
>> recall from KVM that it pays off to avoid that and keep the results
>> cached (per vmexit).
>=20
> See comment below=E2=80=A6
>=20
> (BTW: not that it solved this issue, but we could also consider to
> inline VCPU_VENDOR_GET_ accessors)
>=20
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (long_mode)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* CS.d is ignored in long =
mode */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return has_opsz_prefix ? 2 =
: 4;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return (!!(cs_attr & VCPU_CS_DB) ^ has_opsz_prefix)=
 ? 4 : 2;
>>
>> This does the same as get_address_width (minus different output values),
>> but its code format is different. Should be aligned.
>=20
> Yeah. I chose this style, as it took me a while to understand what
>=20
> long_mode ? (has_addrsz_prefix ? 4 : 8) : (!!(cs_attr & VCPU_CS_DB) ^
> has_addrsz_prefix) ? 4 : 2;
>=20
> actually means -- with respect to ?'s operator precedence (which is
> clear in this case, but I got confused). May I propose to rather align
> the line mentioned above? (but let's see -- maybe we can consolidate it
> in any case)

I think you will still have two instances of the same pattern, but with=20
different results. But when folding them into the same function, please use=
 the=20
same format for them. Readability trumps, no question.

>=20
>>
>> In fact, I could imagine a combined helper:
>>
>> void parse_widths(struct parse_context *ctx,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_instruction *inst,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool parse_addr_width)
>>
>> That one would obtain cs_attr and long_mode only once, would do the
>> address width thing only if parse_addr_width is true, and would push its
>> results directly into *inst.
>=20
> ... as an inlined single-user function, right?

The compiler will do the inlining when it makes sense. In this case likely =
not=20
because there will remain multiple call sites.

>=20
> Good idea, that would also save the potential double efer/cs_attr
> access. I'm just curious: It's Intel's vmread that you worry about? At
> least on AMD, guest's efer is directly read from vmcs region.

Yes. Possibly accessing the same VMCS register twice in the same vmexit cyc=
le is=20
no longer as expensive as it used to be, but I doubt it will be faster than=
 not=20
reading it twice (but rather taking it from a register or a cache).

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eb6da892-059f-16f7-2473-74fbff2cc2d8%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
