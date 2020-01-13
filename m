Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBRWY6HYAKGQERIZL5VQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A71391D4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 14:10:31 +0100 (CET)
Received: by mail-io1-xd3f.google.com with SMTP id x10sf5732848iob.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 05:10:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578921030; cv=pass;
        d=google.com; s=arc-20160816;
        b=knAR/W7oSrqViyCFhgKTKYTeocu8FGJm63J54zXsF4KYBcMl7Ux/adfs4v81kwGf6a
         2RiOcxJqhdBgk/yes+VWHg93cvhQ0yhj0D7FcDvBr71IoXQxMQBSd6BlwSIZga81n2Iv
         VoSxiqdihCXd3CxLW8b/jM8BjXvt7tvjU+mGgtyGGn1X3L0Nj6GUezaVDN/2baUCmu9O
         cCiHafQtU7pzW/21JkKfmy06ILiMpe8pejomH2cQyut/d1IagyachnasBou3Jhx+CpDT
         lsuYUiV63hvD0emhmxqstmKCHaIoqtOycjkPwG2Hk+wvG8/Ex9Ym2kHk86E4rBDiGmye
         3CqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=IHfJixcoJoY1v0GycaoB3dVDe3ggep0wFTzmSAjuELM=;
        b=bpVaFQxuqNrZ3Dl1tvu6QzhyMst9HSr/AvqNhHG5GwDu7BAtciKJvouTl3UGOIiEGm
         KNA8jZRRny06sOuTHwiF851J4ZELjlQoacPK3EX/iMSf4yPxUid0S5bN1XBUfjJzlOM4
         AuNjZRY7WQG23gdDy08WKqk+hSrLWyTA0ZX6rqpjXXOfuEsB0cJaKoYWU1OCz9Ah9k8R
         vyU6AWlFNq6kGGfNRBbpZljtCOAnP/zI2D/x3pHVWlUL6m4cYbYTgmuQNBFZRBvySqEJ
         sFTkOSLCswZiDpfthEbvyet+ftDCIxf3LfY294lvPl18pl27sNYzbynpPjxuB3zTCJSZ
         M8Ng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hZyzxRI+;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=IHfJixcoJoY1v0GycaoB3dVDe3ggep0wFTzmSAjuELM=;
        b=Ol8vfYWo2XxIyLTS5oUb+gwGKihcTSAmK6ZznRHHmVUJIRNZ1G/GlGLhulNbWxhvMt
         ehxPFrl5X7uqVKOeOVB1V7fYR0NbNYN+2pVLjTDYLKUGUaR3FEGgSC9iIdWOeUd7Rw2N
         t1nsJr/GHFecl/VGt8uzWRDEie+c5VN8N5h9k5caAsA8j/m3GLGqCmTvdsI1Qifgu6Xh
         BFh9CRPiMb7u4GcwLsMhfZYsmgvCOz/c2+WC9y/lwtRWhlvDSVV43qLBUeUj4O6OvMy2
         WmnHKqSgcc16TCjRDVimJ4FcnNlX9GrRZzHQidvaMktpmddgFV3YI+dpL0p+ShthW7Rx
         Umkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IHfJixcoJoY1v0GycaoB3dVDe3ggep0wFTzmSAjuELM=;
        b=EtvVQJ+0zn8M3OuLLAD39awcS91Rp9nK/Me2ShYONVpOZF7HKsKM+h1r2nzwLSMRYd
         3fATA0oJRBUhZzgO/zRbYssdaa4xW76llY8yCJsum3ERKb9R24KL4Sy6BCtMAjza4E0J
         LEmjBYC7mRY1DtkjWZkBvDIAeO9l5m2/16kl3F7+rgu6o+EcB/LtP/SnPnE+Bt6cclXj
         Oq2Q4Ha21nl2N5UutCEQlMUkknM0yCRKQhTULN0KyeIabzniRCkSnXL5c8vYMG0s3apa
         d1aycf7SHJBBeSOYBJQovxXMZ7iuY15vMUZziwDq5swbS0hHdqY40/HB81kgv0SV4B1u
         eOLA==
X-Gm-Message-State: APjAAAVHGaz0JlTPaVKbH2o1NpBAmcUbHDzCtCJ89JEdRsbrNhUAMP4I
	ux2HTSlUcBdkiME4BhFTHnM=
X-Google-Smtp-Source: APXvYqwbtoE3thhl7PtZcqZGrNQPrZcAInALfhgFkjCTTVjOeej3nemqeCxYE5wF1en73isevtY67g==
X-Received: by 2002:a5d:9b17:: with SMTP id y23mr12064356ion.185.1578921030456;
        Mon, 13 Jan 2020 05:10:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:ce86:: with SMTP id r6ls2013072ilo.13.gmail; Mon, 13 Jan
 2020 05:10:29 -0800 (PST)
X-Received: by 2002:a92:b6d1:: with SMTP id m78mr14250392ill.245.1578921029860;
        Mon, 13 Jan 2020 05:10:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578921029; cv=none;
        d=google.com; s=arc-20160816;
        b=fz59O7J5gG7E654mZUWNv6UYtIxRwsvkSEUmfJlvGuuO0eDQBNW4t8RN7PEl3ww6Wx
         5N8NIB3GUJdRhJJjlKxa6Igv2zUA4VuT6GAE7o7/26yzwuQQJh93MvM7EZZ+M3W1U2JA
         5Sg3bfWM71DPxbmpRFFys8LxtuEhEcKkHG2+Uvp5KT557et68iUiGY3sRnxpatKORd9N
         MKkQgLDBcCu40Zp4ny08ABP+RVsDbiVIjstP7QQLUBX2IRxEn7VDYBZcdAbWmZfmBPz+
         fXSkQTFND7wUZE7ckQVQpH62FuWV6+WcoAppZXWffYyemC+YCprHU3R/P+frgv0jrNuP
         EDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jBYP9rgwRTjRw9XdPjSy6wvlNf1vwO7xcbOke/juTBc=;
        b=w4f4dS4fJikVNV/DYuXtDKlHdZPmW8LOD0USXxWjbLEPs7zwAZsrXcrgQgqyREgzhr
         hXH6YQ4cXbg77mUPzzvFSQkoTE8LJf9uylQZhZvwPhL18QPI8hD4MtBZnLzTNMsoawCe
         YisAIq/0NMuSP8eDcYLvxCDqXxys0L8ofmiB7gPRs0Uq9k13lGVOwLCoPrQJmF4UgMUC
         k9GMud1ldnvJ6c1q7aqluefR/B64zEsPinJZxY1N+w/00e26Ugojb0Oht0JAPjRB6/+G
         VLqGVjwBtalvPF9AKGcvMf7qbO3BSBKzpuET5/LR7ohkTv3H6nQ0Z3VBiY1J70/jXuNi
         jl/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hZyzxRI+;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id v82si472079ili.0.2020.01.13.05.10.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 05:10:29 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DDAT1Y115329;
	Mon, 13 Jan 2020 07:10:29 -0600
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DDATkx060843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2020 07:10:29 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 07:10:29 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 07:10:29 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DDARnL088884;
	Mon, 13 Jan 2020 07:10:28 -0600
Subject: Re: [PATCH v3 0/5] Add support for Texas Instrument's Peripheral
 Virtualization Unit
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20200113104647.25884-1-nikhil.nd@ti.com>
 <10174a11-8fcb-5332-0762-bf6a7e429a37@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <6bf7a660-228f-1ba0-c5df-233357a5b148@ti.com>
Date: Mon, 13 Jan 2020 18:39:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <10174a11-8fcb-5332-0762-bf6a7e429a37@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------DB9C489B0D9D964FF75378DE"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=hZyzxRI+;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------DB9C489B0D9D964FF75378DE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 13/01/20 6:08 pm, Jan Kiszka wrote:
> On 13.01.20 11:46, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> This series adds support for TI PVU as an iommu unit.
>> PVU is a 2nd stage only IOMMU which provides realtime address=20
>> translation.
>>
>> J721e has 3 instances of PVU and all the DMA traffic can be routed=20
>> via PVU
>> when running inside a virtual machine.
>>
>> Nikhil Devshatwar (5):
>> =C2=A0=C2=A0 core: Update cell_state while destroying the cell
>> =C2=A0=C2=A0 configs: Move amd specific fields in separate struct
>> =C2=A0=C2=A0 arm64: ti-pvu: Add support for ti-pvu iommu unit
>> =C2=A0=C2=A0 configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in plat=
form_data
>> =C2=A0=C2=A0 configs: arm64: k3-j721e-evm: Add stream ids for devices be=
hind IOMMU
>>
>> =C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
>> =C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
36 ++
>> =C2=A0 hypervisor/arch/arm-common/include/asm/cell.h |=C2=A0=C2=A0 7 +
>> =C2=A0 .../arch/arm-common/include/asm/iommu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 .../arch/arm-common/include/asm/ti-pvu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 129 ++++
>> =C2=A0 hypervisor/arch/arm-common/iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>> =C2=A0 hypervisor/arch/arm64/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 3 +-
>> =C2=A0 hypervisor/arch/arm64/ti-pvu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 580 +++++++++++=
+++++++
>> =C2=A0 hypervisor/arch/x86/amd_iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +-
>> =C2=A0 hypervisor/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +-
>> =C2=A0 11 files changed, 794 insertions(+), 20 deletions(-)
>> =C2=A0 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.=
h
>> =C2=A0 create mode 100644 hypervisor/arch/arm64/ti-pvu.c
>>
>
> Applied to next - with fixups (build fix for patch 2, whitespace=20
> warning for patch 3).
>

Thanks. I didn't search for those fields in the configs. Thanks for=20
fixing it.
Nikhil D

> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6bf7a660-228f-1ba0-c5df-233357a5b148%40ti.com.

--------------DB9C489B0D9D964FF75378DE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 13/01/20 6:08 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:10174a11-8fcb-5332-0762-bf6a7e429a37@siemens.com">On
      13.01.20 11:46, <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:=
nikhil.nd@ti.com">nikhil.nd@ti.com</a> wrote:
      <br>
      <blockquote type=3D"cite">From: Nikhil Devshatwar
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com"=
>&lt;nikhil.nd@ti.com&gt;</a>
        <br>
        <br>
        This series adds support for TI PVU as an iommu unit.
        <br>
        PVU is a 2nd stage only IOMMU which provides realtime address
        translation.
        <br>
        <br>
        J721e has 3 instances of PVU and all the DMA traffic can be
        routed via PVU
        <br>
        when running inside a virtual machine.
        <br>
        <br>
        Nikhil Devshatwar (5):
        <br>
        =C2=A0=C2=A0 core: Update cell_state while destroying the cell
        <br>
        =C2=A0=C2=A0 configs: Move amd specific fields in separate struct
        <br>
        =C2=A0=C2=A0 arm64: ti-pvu: Add support for ti-pvu iommu unit
        <br>
        =C2=A0=C2=A0 configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in
        platform_data
        <br>
        =C2=A0=C2=A0 configs: arm64: k3-j721e-evm: Add stream ids for devic=
es
        behind IOMMU
        <br>
        <br>
        =C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
        <br>
        =C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 36 ++
        <br>
        =C2=A0 hypervisor/arch/arm-common/include/asm/cell.h |=C2=A0=C2=A0 =
7 +
        <br>
        =C2=A0 .../arch/arm-common/include/asm/iommu.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
        <br>
        =C2=A0 .../arch/arm-common/include/asm/ti-pvu.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 129 ++++
        <br>
        =C2=A0 hypervisor/arch/arm-common/iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
        <br>
        =C2=A0 hypervisor/arch/arm64/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
        <br>
        =C2=A0 hypervisor/arch/arm64/ti-pvu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 580
        ++++++++++++++++++
        <br>
        =C2=A0 hypervisor/arch/x86/amd_iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +-
        <br>
        =C2=A0 hypervisor/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
        <br>
        =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +-
        <br>
        =C2=A0 11 files changed, 794 insertions(+), 20 deletions(-)
        <br>
        =C2=A0 create mode 100644
        hypervisor/arch/arm-common/include/asm/ti-pvu.h
        <br>
        =C2=A0 create mode 100644 hypervisor/arch/arm64/ti-pvu.c
        <br>
        <br>
      </blockquote>
      <br>
      Applied to next - with fixups (build fix for patch 2, whitespace
      warning for patch 3).
      <br>
      <br>
    </blockquote>
    <br>
    Thanks. I didn't search for those fields in the configs. Thanks for
    fixing it.<br>
    Nikhil D<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:10174a11-8fcb-5332-0762-bf6a7e429a37@siemens.com">Jan
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6bf7a660-228f-1ba0-c5df-233357a5b148%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/6bf7a660-228f-1ba0-c5df-233357a5b148%40ti.com</a>.<br />

--------------DB9C489B0D9D964FF75378DE--
