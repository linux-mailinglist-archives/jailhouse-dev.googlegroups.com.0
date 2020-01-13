Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBEUY6LYAKGQEW3DWOCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA5A1394C1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 16:26:12 +0100 (CET)
Received: by mail-qv1-xf3c.google.com with SMTP id e14sf6526967qvr.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 07:26:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578929171; cv=pass;
        d=google.com; s=arc-20160816;
        b=WivrGUJ7zTrAxOAO9joAXKJnifUMeZIYCv+0cZoMrbwtI+b4DiI/UCmclY0A7nL2zV
         kG76yhQvtDjkmWzCaYAkRDgfLYJKywwT6/M5I6Z7+lauqlMg1vE9emGEPXw+jJKADn4+
         nHHUFCXQsgi1zClqG0is3moEfGPE9Ei78OntK1CbyVk+lGjb2evdJW49qR1Cj53qCgCL
         9c5ln38R7egcOpWaMIkesIZ2znwELlp76aB+iZ5dXneWQk6ZJ1bGO2uAYJknmqdN6eze
         NKxIdBdK68bvzSeBMUJPXu63SXCMlERoffx1pdE9JLf+1A4DEiPkTv9b8eT/j/GRSEJ/
         zLrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=NshocSRcgt74GvMK+u26Nfzq6WF/OYosI/6yEps1Qbo=;
        b=U8PrwXvFXvjiA3qW3kRNuFCSoZU9gOwyQIF8fz0tiSGpveyXDr8e4AiZApp82VkzQS
         c7gSsOBwvULBP7DXmX97c//Q6a2xM948pxk7ycJzfSeUJgaa1R1RG4sdVVBkj2HPCqjv
         fiOZoyMcv3prMEgt79QkZez3VO/HnZHSeUR1B2AEPkhpwfpjxdUzufAglVB1QuwiT6JT
         6kbytSsruyd6qi7OHLqsXf4Du1qDHYQUijyCZNdPjKrsGUN5S7l3fdR755ogmpgtWU4T
         mojOi8TIUpztaiod39688GwCH1K6TBt7qUaZoQ6KZTQ4W0SmZ7d8TRF11ZfoyihqCzRk
         I3gQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lKlYibKg;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=NshocSRcgt74GvMK+u26Nfzq6WF/OYosI/6yEps1Qbo=;
        b=NMUaOxRbZfOHsSQA8rx2z8mTYoAsmEiSgM3yrjtIP9thvoonIbEkEMJF9h6uOAM58A
         cO1B6fhqMb0YRqDUjJmmcKzrQIQ33GP8X2e9KE6p8LQIovFkuVCiVorvkFg8UG9CZihN
         IbuM4BZqlOcD3gbIO77MGCRyMbS/bW2gwdQiBgMlz1e+fFndYid47jlASTRlTVs6UCCe
         /tNQit/AqOfB2S4dv2EvUaPPMzqv1ii+KCF4DDOlqb2CqYBERPJTT1EFeWQ5k4Ro1Btc
         ppSJrPyovJDZhtjzgoVSc06nasxovzXZbpSljuW0Vy/F4O2K6yUZV4Ibfx4edVPb01xP
         wUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NshocSRcgt74GvMK+u26Nfzq6WF/OYosI/6yEps1Qbo=;
        b=hhnp4lYwPCN/hgzyjEVXKqGmvqM5GQBFWeAKwl572g2sPZNr2skjcU24bujyfLo86x
         r5MfJf3V7yUlposprgbIlIuv1PVfLkAVZ1nVhIrvaUqydJl/ScnxfUuL1LKTFbYZEwdW
         E5hBj+603AbPSxYfZ1gIduifeTLNN/9lNIvtIlEPkX8OootTzA057uf2IDem3BIHuxa/
         3hPOQnFeFuPUxxHuH09sf8FtdQbi5vxx+AG29uoovpadHDEHtq7fadJmkNtdzHSO+n8U
         RaEXLgRkknKtEPW//SCPaogB2nVNYSP5JK0e/8SL2yVXJIGyntXr5TuMb8btW+g28QgG
         fczA==
X-Gm-Message-State: APjAAAVUxMV6cV2Y2fDl3HhkBRUXUSEes2X7Ku1VO4M+4qmdblWd5qT8
	0dTAE2HzeGWGweYlmV5/+3o=
X-Google-Smtp-Source: APXvYqyO+Shf+MoH04de8b/BFckbz7HfQg3KQKNhyoVgl3FAIbhIdPvUFKT7pzOzcacx+ud2Fq4yDg==
X-Received: by 2002:a0c:c18f:: with SMTP id n15mr11744426qvh.35.1578929170911;
        Mon, 13 Jan 2020 07:26:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:1a68:: with SMTP id q37ls1138058qtk.6.gmail; Mon, 13 Jan
 2020 07:26:10 -0800 (PST)
X-Received: by 2002:aed:3ea7:: with SMTP id n36mr14656310qtf.258.1578929170397;
        Mon, 13 Jan 2020 07:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578929170; cv=none;
        d=google.com; s=arc-20160816;
        b=u/vyspeIMnCSbx3QUCWnMnxaz3jlYPj2SzkReyrpnyZFy9pcFPbNj3pKIiqxH4qAId
         mXifvy6H8iXcBWKY1GZQ2JSfbbsyX5ovCxAIt3NpJeITRa7L8WwxQzIlSS2jSLkDCeEm
         xo24qOrcV0GNeTx7s1vTQ8y0BHUuzD8aKRUtiymliwUh0F2sG/g9IIEPk3Va8Zikzhc4
         3wBfvtOJRvkcYOY/Y6WgYFgqAyiXgpE0u2Uymz7dtZn3k2CDv5OaLL80xuP68bQ/mD1F
         QkfpvdN+oVcsTxykWR7X3RfosVUHYfwGf5Aiv5UFMZchlhF2v8mUbZkJwIEL4Ex67jfz
         dgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=x9VtasDFGe03LdbbiAMAio1Uag//5qtcR/066mXmQXc=;
        b=TLpmACecP9Utg1TcIXXXQOCWC/4YBQiyEORSm86EiGe0UdRadpMklBo7qM65p9vJpl
         X3XaUh97ermyiw2lA5vSBuwhZ2S6FmucNLScJREW9XY+g9cFUwQjtKlnzpDKO+KNKqid
         KeAZ8nvAt2vIEARxCvRIlU0foFkR2Lg4eIgdBERRl8EGKzJFqVmhmLikpS4svBXEdjhX
         P6VwGhQLE1islF/I6eD5m7lvn66TPhCdij8hEi0CTTIwkRFkNTuzsGQelzPBmln1NS9o
         s7khoohK1ihI0xHACmuuJViTQSD3pK/3W0XRUdZtxufYYpV/CBBLfw9rizXQgoVGR2Qs
         TQ7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lKlYibKg;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id f8si390700qkl.0.2020.01.13.07.26.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 07:26:10 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DFQ9aw003673;
	Mon, 13 Jan 2020 09:26:09 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DFQ9Qe018490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2020 09:26:09 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 09:26:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 09:26:08 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DFQ7fF117370;
	Mon, 13 Jan 2020 09:26:08 -0600
Subject: Re: [PATCH v4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <6b791978-ca65-6aa2-2722-817c8cf8bde5@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <30107905-8108-4068-17c1-f7625ecd7be2@ti.com>
Date: Mon, 13 Jan 2020 20:55:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6b791978-ca65-6aa2-2722-817c8cf8bde5@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------7D524FCBBE8F938D38819101"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=lKlYibKg;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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

--------------7D524FCBBE8F938D38819101
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 13/01/20 7:07 pm, Jan Kiszka wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> Add support for Texas Instrument's Peripheral Virtualization Unit
> * Define a new IOMMU type and extra fields in the platform_data
> * Add new cofig option CONFIG_IOMMU_TI_PVU
> * Integrate with the arm iommu support such that multiple types
>    of IOMMU can be supported.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> [Jan: moved into arm64 completely, fixed whitespace warnings, fixed includes]
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>
> Resending the fixed-up version as there were too many changes. Please
> validate. Is in next as well.
Tested-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> Depends on the iommu split-up patch I sent before.
>
>   hypervisor/arch/arm-common/include/asm/cell.h |   7 +
>   hypervisor/arch/arm64/Kbuild                  |   2 +-
>   hypervisor/arch/arm64/include/asm/ti-pvu.h    | 130 ++++++
>   hypervisor/arch/arm64/iommu.c                 |   6 +-
>   hypervisor/arch/arm64/ti-pvu.c                | 577 ++++++++++++++++++++++++++
>   include/jailhouse/cell-config.h               |   6 +
>   6 files changed, 725 insertions(+), 3 deletions(-)
>   create mode 100644 hypervisor/arch/arm64/include/asm/ti-pvu.h
>   create mode 100644 hypervisor/arch/arm64/ti-pvu.c
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/30107905-8108-4068-17c1-f7625ecd7be2%40ti.com.

--------------7D524FCBBE8F938D38819101
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
    <div class=3D"moz-cite-prefix">On 13/01/20 7:07 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:6b791978-ca65-6aa2-2722-817c8cf8bde5@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwar <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.nd=
@ti.com&gt;</a>

Add support for Texas Instrument's Peripheral Virtualization Unit
* Define a new IOMMU type and extra fields in the platform_data
* Add new cofig option CONFIG_IOMMU_TI_PVU
* Integrate with the arm iommu support such that multiple types
  of IOMMU can be supported.

Signed-off-by: Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
[Jan: moved into arm64 completely, fixed whitespace warnings, fixed include=
s]
Signed-off-by: Jan Kiszka <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:jan.kiszka@siemens.com">&lt;jan.kiszka@siemens.com&gt;</a>
---

Resending the fixed-up version as there were too many changes. Please=20
validate. Is in next as well.</pre>
    </blockquote>
    Tested-by: Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a><br>
    <blockquote type=3D"cite"
      cite=3D"mid:6b791978-ca65-6aa2-2722-817c8cf8bde5@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Depends on the iommu split-up patch I sent before.

 hypervisor/arch/arm-common/include/asm/cell.h |   7 +
 hypervisor/arch/arm64/Kbuild                  |   2 +-
 hypervisor/arch/arm64/include/asm/ti-pvu.h    | 130 ++++++
 hypervisor/arch/arm64/iommu.c                 |   6 +-
 hypervisor/arch/arm64/ti-pvu.c                | 577 ++++++++++++++++++++++=
++++
 include/jailhouse/cell-config.h               |   6 +
 6 files changed, 725 insertions(+), 3 deletions(-)
 create mode 100644 hypervisor/arch/arm64/include/asm/ti-pvu.h
 create mode 100644 hypervisor/arch/arm64/ti-pvu.c


</pre>
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
om/d/msgid/jailhouse-dev/30107905-8108-4068-17c1-f7625ecd7be2%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/30107905-8108-4068-17c1-f7625ecd7be2%40ti.com</a>.<br />

--------------7D524FCBBE8F938D38819101--
