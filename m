Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBKXB5XUAKGQEV3PEAHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3EB5D233
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:56:44 +0200 (CEST)
Received: by mail-pg1-x537.google.com with SMTP id u4sf6051504pgb.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:56:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562079403; cv=pass;
        d=google.com; s=arc-20160816;
        b=GlS8xgStpZHYs7l/lFh7TJJbg8UipGLw6jBLUIDd3e/fG36oFWFBHhplw5K+uoIa/b
         sC6iNcoXrM4gmX2+ir3WDMI7xl1tY3zynwOZ9nvs+QnGASjNCKLhrDiHzk6KIVF9FT13
         kcu+dUeZAXxXs6D1eLLmSqpaznAO4qV39pozit4guxwX9qtsg6+YzJNLzk4NLki14xWc
         XTIlw1SQX81AS82nxvSluel7/nQ5/GppfWt9cmZbV3albtPog1xrjac3xQhHZu6Cktr/
         QoDLI//f3eRvXOvIV/vyYQ9BBCy82omsaHa3TtRnljWCTQnDFS3MA2deCwdqeMttTkox
         u1PQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=juk6kNWvyORPjVBFqHtx9LrqtczHAQsfVJvsjbU458c=;
        b=kJzZk1tp6u6An8BWQRg9jkqOBmeiOwBpQVYM8BdEYhlYr5+qXNcYBkvEvqHTpt16DA
         L/9XSmH5p2VvCs1pggwOT6R+glIBGo6rJYRWxrNNlKG0jXpz4TsXk+DGpIzHWS595Qdx
         hCQDV5o6Mudy56D/suzXkpg0wtR5zsrJlaiQbdDU1ZPHTkk9Cl+FhYWcAa6FuHNLrnjV
         LuAiqtGRihznH4msh8bS9xf2LbOvhRZHlE24Fv3tATlmBb7LXgdDyUvwBfNbvcqD2M0R
         RvrYaygcuo6I4zYXbpU4eqizZg6i27BqrIxbeFHJgA0+V8mlLipe4KaLHqPT9vYTbHNs
         4cyg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZqyVyIsm;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=juk6kNWvyORPjVBFqHtx9LrqtczHAQsfVJvsjbU458c=;
        b=ORK1NJLQ8uFzphP6IgtjQYmP97bC+Q1hs9VtQuNYyTDYuIv29tSscTo8iV5D1mOfBy
         9+YXcrXhrYEYN5y1e+6x0N3r3AZupC60t9+E/1dXhl1lw1HVKO4w/peifntoWcwdltB+
         wnZPwBjrC9k70VZGljE+kqIMAxNZKe5uBQva1A3r/sRgdGWwsVrEp7/DeAWYe5WQfCOq
         GWFo47tvqy+Y/pFPQxuJdNdmTq/JU96WEZZVK14i9JjNYCLlTih+GZNYa+MMKHkVwexr
         TeKfqbiytjvVM77IX2DRnFLrb+ENI3AcdhmxS8z1EBssj8nkP1DnQD6I9jQI3AauWsdm
         4YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=juk6kNWvyORPjVBFqHtx9LrqtczHAQsfVJvsjbU458c=;
        b=EuUSUq3n4fyXJZ33iIJgVq0dk0VdGP34xDDkyZ9Uu4Rb2w1PZpz8cEFNStOfgMA0qD
         Oes72Gssoe/DExL81WqDGXlivMhOcy8yf97X18UYBUdoGUs/gGtypU09UZeJp8oaHqsv
         LidwEh5nVnT3fOjSEalChrrez9d19HlssXGiUACcZ2UQ7Uo19X+FmbJBsItrBhehRVSp
         Yqq72LYWtbKbzmdVyswo+SZE1u9gD90pZtlDoFo6mzpA8YxOQqgD93ozXpnz6H4UAr+L
         vwkIha2AKgVSZPAdd/o5Pz/jPNCAtFPLfDy85VqiF2xG5ej6ePVmW419gt5S02h9MhWY
         k73A==
X-Gm-Message-State: APjAAAX2oewJQFZhYZ3WiH3S41APUiJ6Yw9HNRbQ8y332prZGTyTjTFy
	4c8Atx5qPLlAdzVTpolnpLY=
X-Google-Smtp-Source: APXvYqyMKSxaQ55uc2OL4Ky+a4K8H9c3fb2DcVOONXPnv9x16hZ+Z3elNHowt5MfXGk1aqVFifMDYQ==
X-Received: by 2002:a17:902:d891:: with SMTP id b17mr35347164plz.48.1562079403068;
        Tue, 02 Jul 2019 07:56:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:52d2:: with SMTP id g201ls2577851pfb.9.gmail; Tue, 02
 Jul 2019 07:56:42 -0700 (PDT)
X-Received: by 2002:a63:fe51:: with SMTP id x17mr32632072pgj.61.1562079402488;
        Tue, 02 Jul 2019 07:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562079402; cv=none;
        d=google.com; s=arc-20160816;
        b=z5hRfmt3sK5mPD6RbDg2zXU+X/IzR0oqBdJyfS8f0be0DKCDb/VvF64D+flDZcFdV5
         YKS415TMadEUJj534MC91/GP3F3h8tY3ZGX8WKerBBrUgPqxzoooIV6MVjU74JW4fx3V
         HgK6x7nRZR9vHNMBcmbg+drJHzEcFiEFnZP1CzTcDfOrjpjMrIJgXMO3q+YU+zbipIwi
         Sgo1/W23LCSGExj13UYKWic/W+gFClpO5MLulRbyOp2ZxDQu+7OHPBXWT10jk/qqGm/l
         E16TqFBQ4jQfofv+eFRc9wwyin57KuYhFLwLkdq2X5X7Dn1VWKfNi3CVfBEWEYIbtjoO
         vcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=a6c+EL/0sFTLE50gO8T+rM3sjOL9he/MZoRjr3ql8Xg=;
        b=EKcnecJKuu/Pb5L4xfjNFopD5/9RoS9BxV2UrBClc88KIVxUGxUoPZf8124o2F9h+1
         iEQVYpu+4XXnhe+azUMTiQIC9jHK9d9e3ThEtHQwubuo69vqUMDZvvLQH7J96JzRYDfB
         uBIm0wBcOSvKZNAe+LvRFHPQ9qUGpZxEXF04ZnAaQ1+H5r0voXB0LkluaCwmTTQJ3rKO
         8iJ06Sapgg2Y8kCphd2EPhEW8KxQXXjta9ev2n/x3jBAW0A//tvXa4obnopM4WTS9LIQ
         aOyGKM3C2aCI8NFpmDCEVB/Imp5aUqoTyuRUCOW6b4VASZhlZ4hj6J+W5xvjaTp70Mil
         SIPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZqyVyIsm;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id cm10si458725plb.0.2019.07.02.07.56.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62Eufim092633;
	Tue, 2 Jul 2019 09:56:41 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62EufE1056158
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 09:56:41 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 09:56:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 09:56:40 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62EuclP053067;
	Tue, 2 Jul 2019 09:56:39 -0500
Subject: Re: [PATCH 6/6] arm64: iommu: smmu-v3: Add support for stage 1 and 2
 translations
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-7-p-yadav1@ti.com>
 <47206b1b-aeec-d71c-6f4c-9b4680282ef7@siemens.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <7e76f0f4-f9b8-12db-1dd7-dc63ee7a2004@ti.com>
Date: Tue, 2 Jul 2019 20:27:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <47206b1b-aeec-d71c-6f4c-9b4680282ef7@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ZqyVyIsm;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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



On 02/07/19 8:12 PM, Jan Kiszka wrote:
> On 02.07.19 16:36, Pratyush Yadav wrote:
>> A System Memory Management Unit(SMMU) performs a task analogous to a
>> CPU's MMU, translating addresses for device requests from system I/O
>> devices before the requests are passed into the system interconnect.
>>
>> Implement a driver for SMMU v3 that maps and unmaps memory for specified
>> stream ids.
>>
>> An emulated SMMU is presented to inmates by trapping access to the MMIO
>> registers to enable stage 1 translations.=C2=A0 Accesses to the SMMU mem=
ory
>> mapped registers are trapped and then routed to the emulated SMMU. This
>> is not emulation in the sense that we fully emulate the device top to
>> bottom. The emulation is used to provide an interface to the SMMU that
>> the hypervisor can control to make sure the inmates are not doing
>> anything they should not. The actual translations are done by hardware.
>>
>> Emulation is needed because both stage 1 and stage 2 parameters are
>> configured in a single data structure, the stream table entry. For this
>> reason, the inmates can't be allowed to directly control the stream
>> table entries, and by extension, the stream table.
>>
>> The guest cells are assigned stream IDs in their configs and only those
>> assigned stream IDs can be used by the cells. There is no checking in
>> place to make sure two cells do not use the same stream IDs. This must
>> be taken care of when creating the cell configs.
>>
>> This driver is implemented based on the following assumptions:
>> - Running on a Little endian 64 bit core compatible with ARM v8
>> =C2=A0=C2=A0 architecture.
>> - SMMU supporting only AARCH64 mode.
>> - SMMU AARCH 64 stage 2 translation configurations are compatible with
>> =C2=A0=C2=A0 ARMv8 VMSA. So re-using the translation tables of CPU for S=
MMU.
>>
>> Work left to do:
>> - Route event notifications to the correct cell and identify which event
>> =C2=A0=C2=A0 needs to go to which cell.
>> - Add support for IRQ and MSI routing.
>> - Add support for PRI queues and ATS.
>> - Identify which cell caused a command queue error and notify it.
>> - Support sub-streams.
>>
>> A lot of the work left is optional features that the SMMU provides like
>> substreams, ATS, PRI. There is little reason to add them unless there is
>> a use case for them.
>=20
> One quick question again, I already had it for the RFC round: Would it be=
 tricky to split up this patch into single-stage only + 2-stage support? Th=
at would allow me to asses the additional complexity we import by adding 2-=
stage support. Or is 2-stage support inherently coupled with the SMMU desig=
n so that such a split-up would neither make sense nor buy us anything?

I considered splitting, but as far as I see, stage 1 and 2 are rather tight=
ly coupled. If you want, I can split it into two parts where part 1 is the =
defines, data structure declarations, and initialization. Part 2 will have =
stage 1 emulation and stage 2.

Let me know if you'd prefer that, and I'll send the series tomorrow. It's g=
etting late and I'm about to leave for today.

> Background is that the majority of use case I see will not need more than=
 one stage. I particular, you have no need for 2-stage support in simple ba=
re-metal or RTOS cells, leaving this only potentially relevant for the root=
 cell (or secondary Linux cells). If the feature is complex and can be disa=
bled, we could skip it, reducing the code size.

Hm, as far as I understand, stage 2 should be always needed because you nee=
d to translate from IPA to PA every time. Stage 1 could be optional if the =
guest OS handles the scattering or gathering of the buffers. But don't you =
always need to translate from IPA to PA (even though in case of Jailhouse t=
hose translations are almost 1:1, and IPA =3D=3D PA)? When would you not ne=
ed stage 2?

Anyway, most of the code is setting up the SMMU and the data structures, an=
d stage 1 emulation. Stage 2 only part is very small. Removing it won't sav=
e you more than 10-15 lines.

> Thanks,
> Jan
>=20

--=20
Regards,
Pratyush Yadav

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7e76f0f4-f9b8-12db-1dd7-dc63ee7a2004%40ti.com.
For more options, visit https://groups.google.com/d/optout.
