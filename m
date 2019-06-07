Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6EG5HTQKGQE7LOYIGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 078EB3885C
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 12:59:05 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id v188sf460302lfa.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 03:59:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559905144; cv=pass;
        d=google.com; s=arc-20160816;
        b=eZFhsLyvhNjX4F3s9YvuWjiBJo6oFQvSIAuBh9PIgRj/WvqJNFRWfOTYjKPMAdsD/e
         IoVX6DeEr42NCO1K8q//X47TYS/2A07+Q4uDq6hbdK2IZXDv7/6ZPMc+0bAVva8jT8+I
         n9NTr+Y9h2WTyGgsSLdE4sAw7fbDdqm2SvCNIzVhRZRUYgrzg7e+QvljLKBvK6qwF/cH
         /ZF+tP14xQ7i3MY/rXrEaD7Ohm+COKbHWm3ERF85C80aEDJRMejZooxSz9vued2RJ6Mt
         isavcGsK7912BO6pVNz7NNR3183sIC9zTEktVdb7ZABKMsY8uUP8Yf5dHMTj6L2YWU+x
         toEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=yCYj+4cDWmQsH0vDngVBN6R0ZCPTvJC6e5qK0tm+24c=;
        b=gbZ0mf5Sdvjdn/dvBrORrOAwzDaNR2s0+SaI/r0LZZGQlV7HxoU5rfXzb8Vn9xPRH9
         wAPIR+N6ju6Ds9uqB/Y7VnqAR6jBYqNf36YLAM7Qp7DHX9dZYv+NYieViFkQrPu+Eb+v
         nhH7jJTr1lCoGVFAfzRv60yNmcbxf5LE6JCw9Wy2MS4C7f6uoq9f7Dp2aWzJTvIwXY96
         Pd7R9N5AYAdrv4YIZvIFpj4hmeJbQ18QvVmFYXZamCT8TXpMsArSXWkErWn5miRjlDyN
         6lwxX9q+/WIyKjlY06EmsRgrs/hcngjCwWwdwrQTumRJfUU4Ed3D5B73DjBNH1ZLLW9g
         T/Bg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yCYj+4cDWmQsH0vDngVBN6R0ZCPTvJC6e5qK0tm+24c=;
        b=eXXi0SCbeNXuDIrwq0ET1z6uqU913esbjQhTpQPdT9mbtilQXun10BEabPU5vRlLZe
         wMrT8jOIIYbzgd5CyhC3q9Wu+QFUe/wlxKS1mW3GBv6z7htdZ6TQYhZw5ustEXfCzdj6
         b7HBZGwA65PVc2Qzd0pHHyCMUTZlb+idWnmiervgNXg1vRQei6rxrG/ggCiTENdmkakf
         hyJqxIg2Ap5MBKZDGCh6UfiJn/EdMncOgHS+YZueeE8dGOGhNs+3bOUhSCYtILdKOTo/
         PsvJrDX9TGo3x8d9X8zIJ2KJXxIWKZ9JHEr0OkY+jbElkFglWyscMVWK8LlKuh3GjXR9
         KtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yCYj+4cDWmQsH0vDngVBN6R0ZCPTvJC6e5qK0tm+24c=;
        b=XA+KRpa4Of0A3StGMMCpmUQI6LemZ/i2SBipmZ6RZFtx0MBCjtlDkTaLqWtqeBPQvy
         hCx5T71ahR3dwZVEHCk1Ud3zgKVtQRsXHSWQX0ys3oUSy7SpGrMKIqYF9Io85vmax9tk
         7uGbnTNCthsDlKhnSLhm7k02rl1WALR2wbgS3gQXeO6eDJVhwaFUJ9dxbrbM9F+9H2/G
         rrW7jPjvdemIaJtdOMZyimzT41C4AZdS/IrPcLiqf+DDwM2LXtKppZpzDF48qJSn1DTG
         24/KcjgjiIP7p9pjzvWHC9Y1Q386TAbweFWkXoLhp39wHIyXNfgz2oGwug8bMKk8OMcE
         HYjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVkGF/n0VyN9yRTMI8fUTVeLYZi40XtcSY/F42G22JR1Oc7d2XD
	jA21oSXF79xLNlVdFmHYDpc=
X-Google-Smtp-Source: APXvYqxGMUGWkBYmswnEqLyvp5wfA5VxHsCK+A1o5oHHp6kPtqCFf15KHkFHMgBDtL+GfBnZw+qeMw==
X-Received: by 2002:ac2:558a:: with SMTP id v10mr27232834lfg.41.1559905144616;
        Fri, 07 Jun 2019 03:59:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:593b:: with SMTP id v27ls783365lfi.6.gmail; Fri, 07 Jun
 2019 03:59:03 -0700 (PDT)
X-Received: by 2002:a19:5007:: with SMTP id e7mr28284368lfb.76.1559905143875;
        Fri, 07 Jun 2019 03:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559905143; cv=none;
        d=google.com; s=arc-20160816;
        b=lfSm/SxyH7qZKgC9B52Kajo7I/Is/t/spRMWM8SFunhAuQPuixB49MtnoaRtYyMk5x
         RKLffdUqRlpxouM1DhCAolBEPqoXdJOrwYJTLGsmsGIBD2lgoYzmid5++/f+i2mkUvl0
         1J9oS8QB2SAd3r0gvGMpzTyHFoO3f+xEgGmnZJ1HTpSznB2dir9WtCfNrLUYg2OFu5Mz
         lOd2rOyckCnRL3xL4yooPlGPryqrKN7pFnpN20+jD+JNK+XA2PiM+u91V8LiqZ8agrFz
         7gR0Wc0qJGosE3JzANfzAXLD+CXP11hW6nRILDA52Ah44zwfVM4qHYOOYlBBTiiVa3SM
         TTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=8eONvRqhr14WxcMl1GnY87NzaYY2aW0SW+OoJwPybOo=;
        b=anRIs6cMUGHtCeZqg6XgbAXKabkWG7dxIv3u+m4r2dXFUJ5KdfJVz05mlfo0Sv4muX
         MLvtklHzhVjDzl2SMHgDROmjXoKj1/xBHEQj54wCJH/+TnetESsRRlevYV3JjEmNBUkd
         wvJ8dXLgaAnDG3qV60CIkRCgq8lA+Cp8nKMErGbZVfdbKzhqMG8RCdV1DqxQbHUu/75O
         Y//5GPsAe2+3qwpsFNNmhNP0pbEM+5zGvD5F2I/SAtsyQbsK5dbNwe9l2roysKVKpPRv
         7lGnA9iEDwxMlGp75ncbawlNuH3oIFnRTimjz+MSFeDXKjjQJ7fLpufXKnypVIo68GJg
         PUgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id o20si70788lji.2.2019.06.07.03.59.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 03:59:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x57Awx5g001069
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 12:59:03 +0200
Received: from [139.22.33.212] ([139.22.33.212])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x57Awr0O002015;
	Fri, 7 Jun 2019 12:58:54 +0200
Subject: Re: [PATCH v2 1/3] x86: mmio: fix accidental clears of bits in
 registers
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
 <20190606224457.1053-2-ralf.ramsauer@oth-regensburg.de>
 <d9071e5a-ae9c-5915-b81d-eafb57d27789@siemens.com>
 <31132492-0d6d-5e61-ec83-9536d9d38887@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <90aa3d6a-25fd-4c80-64c1-f57877f5805a@siemens.com>
Date: Fri, 7 Jun 2019 12:58:48 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <31132492-0d6d-5e61-ec83-9536d9d38887@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 07.06.19 12:24, Ralf Ramsauer wrote:
> On 6/7/19 10:35 AM, Jan Kiszka wrote:
>> On 07.06.19 00:44, Ralf Ramsauer wrote:
>>> We trap certain MMIO accesses and need to emulate their access.
>>>
>>> On x86, a 32-bit read will clear bits 32-63 of a register.
>>>
>>> Inconsistently, on x86, 16-bit and 8-bit reads must not clear high bits=
.
>>> Jailhouse erroneously cleared those bits. Prevent this by applying a
>>> preserved mask that keeps bits alive.
>>>
>>> Add tests that check correct behaviour.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  =C2=A0 hypervisor/arch/x86/include/asm/mmio.h |=C2=A0 5 +++++
>>>  =C2=A0 hypervisor/arch/x86/mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++-
>>>  =C2=A0 hypervisor/arch/x86/vcpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++--
>>>  =C2=A0 inmates/tests/x86/mmio-access-32.c=C2=A0=C2=A0=C2=A0=C2=A0 | 10=
 +++++++---
>>>  =C2=A0 inmates/tests/x86/mmio-access.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10 +++++++---
>>>  =C2=A0 5 files changed, 28 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/x86/include/asm/mmio.h
>>> b/hypervisor/arch/x86/include/asm/mmio.h
>>> index 756c84a8..4b3b2ea8 100644
>>> --- a/hypervisor/arch/x86/include/asm/mmio.h
>>> +++ b/hypervisor/arch/x86/include/asm/mmio.h
>>> @@ -30,6 +30,11 @@ struct mmio_instruction {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** Output value, already copied either=
 from a register or
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * from an=
 immediate value */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long out_val;
>>> +=C2=A0=C2=A0=C2=A0 /** A read must not clear the upper bits of registe=
rs, if the access
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * width is smaller than 32 bit. This mask des=
cribes the bits
>>> that have
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * to be preserved.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 unsigned long reg_preserve_mask;
>>>  =C2=A0 };
>>>  =C2=A0 =C2=A0 /**
>>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>>> index b234bd79..c04cf449 100644
>>> --- a/hypervisor/arch/x86/mmio.c
>>> +++ b/hypervisor/arch/x86/mmio.c
>>> @@ -85,7 +85,7 @@ x86_mmio_parse(const struct guest_paging_structures
>>> *pg_structs, bool is_write)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct parse_context ctx =3D { .remaini=
ng =3D X86_MAX_INST_LEN,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .count =3D =
1 };
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union registers *guest_regs =3D &this_c=
pu_data()->guest_regs;
>>> -=C2=A0=C2=A0=C2=A0 struct mmio_instruction inst =3D { .inst_len =3D 0 =
};
>>> +=C2=A0=C2=A0=C2=A0 struct mmio_instruction inst =3D { 0 };
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 pc =3D vcpu_vendor_get_rip();
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int n, skip_len =3D 0;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_immediate =3D false;
>>> @@ -168,6 +168,9 @@ restart:
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op[2].raw =3D *ctx.inst;
>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 if (!does_write && inst.access_size < 4)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.reg_preserve_mask =3D =
~BYTE_MASK(inst.access_size);
>>> +
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ensure that we are actually talking =
about mov imm,<mem> */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (op[0].raw =3D=3D X86_OP_MOV_IMMEDIA=
TE_TO_MEM && op[2].modrm.reg
>>> !=3D 0)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_unsu=
pported;
>>> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
>>> index 5a557d0b..a1fb8660 100644
>>> --- a/hypervisor/arch/x86/vcpu.c
>>> +++ b/hypervisor/arch/x86/vcpu.c
>>> @@ -231,6 +231,7 @@ bool vcpu_handle_mmio_access(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_access mmio =3D {.size =3D =
0};
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu_mmio_intercept intercept;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_instruction inst;
>>> +=C2=A0=C2=A0=C2=A0 unsigned long *reg;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_vendor_get_mmio_intercept(&=
intercept);
>>>  =C2=A0 @@ -249,8 +250,10 @@ bool vcpu_handle_mmio_access(void)
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D mmio_handle_access(&m=
mio);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (result =3D=3D MMIO_HANDLED) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!mmio.is_write)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gue=
st_regs->by_index[inst.in_reg_num] =3D mmio.value;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!mmio.is_write) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
=3D &guest_regs->by_index[inst.in_reg_num];
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *re=
g =3D (*reg & inst.reg_preserve_mask) | mmio.value;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_skip_emula=
ted_instruction(inst.inst_len);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> diff --git a/inmates/tests/x86/mmio-access-32.c
>>> b/inmates/tests/x86/mmio-access-32.c
>>> index 2f47f211..be1d470f 100644
>>> --- a/inmates/tests/x86/mmio-access-32.c
>>> +++ b/inmates/tests/x86/mmio-access-32.c
>>> @@ -47,9 +47,13 @@ void inmate_main(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, pattern);
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bit data=
 */
>>> -=C2=A0=C2=A0=C2=A0 asm volatile("movb (%%ebx), %%al"
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (0),=
 "b" (mmio_reg));
>>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, (u8)pattern);
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("movb (%%eax), %%al"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (mmi=
o_reg));
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg32, (u8)pattern);
>>
>> Hmm, that test looks redundant to the following one. Same for other
>> double-checks in this patch and patch 3. Or am I missing something?
>=20
> If the implementation of the simulator is correct, then those tests are
> redundant.
>=20
> Think of cases where the first check passes, and the second check fails.
> Was helpful during development.

Well, don't we print both values when the test fails?

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
jailhouse-dev/90aa3d6a-25fd-4c80-64c1-f57877f5805a%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
