Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBGME4HYAKGQEBXO26SA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 0344C136978
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jan 2020 10:21:31 +0100 (CET)
Received: by mail-ot1-x340.google.com with SMTP id r19sf644211otd.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jan 2020 01:21:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578648089; cv=pass;
        d=google.com; s=arc-20160816;
        b=uYsMo5nz/JfjilpwC8RKe+vQF16SLYkJWUWoCbv0uKNy0hACOe06KucUvOIxa0OrHi
         ghlJzZAjbK4woLo594NtCZUOQYXCgKgGl1+lvDn0ZaJ2QfJcOZ9DFb4J2IYUn+v4jPgX
         83YgsrufLKAqUPOKbhSDkzc8CQQ81+I3Fu9ITKrValqiF+yZ7LX+7IVAHwe5lILyuc/a
         16nhOFSYSuNOPTN0j411hchDkuVuZYgBvVzg3F/Skq6MhFReS+rlRVvqzs+is49dKDhn
         eSUqmklZGSD+ru4dZ20qOZYwdZV099GVApsXi4tZJwRs5vY5gFEy/SVn5FK8yHX2y0LE
         p+BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=TIq881bOCvcL2Uv8lNKlNgb1WCncBR7WJh4Gr+qGv2E=;
        b=Tpji1vL7ceOdafy1zxIoWhOd8tQ+oVFOgxJ0y92LmPZQCZAg7dAC/ZL75p6O1Chtf0
         fKK6oLRlUXQgCZNFNo9IXW38TnK8jY0VQbLx2mqRe+fxOyk4bMpOGF6RSfeIdKuNmBoe
         t62K9oSSlmGQvq1mqcZ57XU6rynMPLElwTwBDEMzPZplAdv9JXybR3IIqQ7kIYXezhtv
         SXN55oPdUqFjejBuNZbk1eNY69TzjTRMbiLWwHlqMg9e6MCX+DpWWAS0edJVx9WlTii/
         k5kmRCx3Uqy7F4RueBbqP5dvQg8uMptqsYIHm+Ijafa+LqkXl5gmVV1m+S5H9oE07Xd8
         Z3BQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oPboBGzb;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=TIq881bOCvcL2Uv8lNKlNgb1WCncBR7WJh4Gr+qGv2E=;
        b=Fth+dyzkaKl7IhR1U4d1svmnQf5UurHOuaYGPjz3iTjXoC7I0C5Kp+Ffqrfbdy3O6A
         3L1gdavPD8yGOrEK8/G9R57Ph9e/D+aqRH03YaaTrgyVnDPELfEOGemRRcGOpbCge4eT
         0iUYjmaOhUTfAVAAyEhm2N2gwEGOD3bclsG3fXdifTXL0l4Gj85iHMmh3YyWteBzGMdq
         kLh9qa7xFboW4Zil6rLNmx7l67YKIbXanT/genx8nBxIhPBlJxDTrFTg1/nMMXqjjY4C
         plIYerjS0votfnUbdHAgFu/7iWiD0YExF2N/5lcxJALQoZFJnCt36PU2z0CRJleMqdOA
         IHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TIq881bOCvcL2Uv8lNKlNgb1WCncBR7WJh4Gr+qGv2E=;
        b=qkVWQjh5y92P6tXDD7E57lsHjzeExvAAb6LGxuVIeKPrkaZUXiYDyazgZTY9t/zHlA
         dgJYBygIeeziRto10Mt0//rYDmUny0yca/QWW+bwt5+tEzM2mvdPG696un0pM47fveuf
         5y1uW7TY35PuL7LjtupH4hHfyghSlPqgWIj2X2zcctAtX9fe1YsKtSs2HVcAh+MUagm4
         ZGm8SgfXwdAh/t8BM67rF1f3hXc4yenzJ3iyc6f0bsuLyM1cg6TrRuFezeRD/l2bUCY0
         TnWPhPWlovLc7P9jWBHT0zcmN917H56xy3Z5OyTSKjBfqWyJECOCVSDi+8lbwKWSgju7
         eIyA==
X-Gm-Message-State: APjAAAXnA3PyNmx0Snk7gbbcuF/qfvrScHPgckTy8Jb7HfYPJxVbLRL4
	Bjfkxtj4xQ0PydSmjbbOHIA=
X-Google-Smtp-Source: APXvYqw5zcwtgdFfGICF6Gm7NqKTeXo+1VxSXinxhjxqp658IuN5Ac4IgBVvKQ02I+wcI7K8I7+s0Q==
X-Received: by 2002:a9d:7d81:: with SMTP id j1mr1797372otn.267.1578648089740;
        Fri, 10 Jan 2020 01:21:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4a91:: with SMTP id i17ls906716otf.15.gmail; Fri, 10 Jan
 2020 01:21:29 -0800 (PST)
X-Received: by 2002:a05:6830:1f19:: with SMTP id u25mr1854602otg.170.1578648089149;
        Fri, 10 Jan 2020 01:21:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578648089; cv=none;
        d=google.com; s=arc-20160816;
        b=IjTvufGs8pOtyV9RUx+ikliuqDVDSOWdMCk5ucuQqUEMvCPSYW04VUnXOSQEalng+I
         nrSR7F7RYJuRTm0hsif5KebCfX4XsJ/TAFVno1KkaxmVBVswH89Vu897cY7kBKyKHOD9
         u0OrjlnxL1eU9cZg2h+FeBN1pYOcbozaDkImqWfeqkbBlR1Z+9VCTmVD5zpzi//mIII1
         t0k6ij1pLrRWBaySUCxEDFP2CZ/MJXDn8UyYhJGR4/UZKeCoDcxqGbG49Hm/8DMOX9G/
         bn1SfT/dK0aTJLZhoJp2Eew3wUQIYZSUxCvli0EXZq5p9dfhqKaQXLhJsYDDsde3tb35
         Lneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=63yk/n82gGaPxtbdW49WURE5TskKVutrrImfuLlNSYo=;
        b=lHpRC5GAHcumYF97yH5iA85l6SWsa6a1bw8EaB0fZM3U/V+ly/1DxkT5ng7bqWzUf+
         YHYuYsVI08+oe+ywYxtCM1wJternKDy/GpM/2G6P8IzljPNM2Q3s9y4xHJo4bm2RGx9m
         6s8biutP7PPemKVuGp3WgOWlQ1of8r8H+5AtJafUk/R47h+BTJsJXDOFYWcektNdL7D0
         /+guqw1ZLqgrjkLPPiBNU+0yQL+NT06DSPkOPyMtuowOhRHUl1fu8P1XshmLsz7sXHqP
         DzOU/7ft+nC6Ek+mJvbZr6XGpGbHJdV81vdthVuZi5pBTCXeqIXhe0/GOenVdBBXJh7f
         pBkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oPboBGzb;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id d16si66638oij.1.2020.01.10.01.21.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jan 2020 01:21:29 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00A9LSbY010667;
	Fri, 10 Jan 2020 03:21:28 -0600
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00A9LSLG002920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2020 03:21:28 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 10
 Jan 2020 03:21:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 10 Jan 2020 03:21:28 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00A9LQ9o006198;
	Fri, 10 Jan 2020 03:21:27 -0600
Subject: Re: [PATCH v2 0/5] Add support for Texas Instrument's Peripheral
 Virtualization Unit
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>
References: <20200108111825.14280-1-nikhil.nd@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <b562f103-dbab-bd55-728b-18f51ba2c710@ti.com>
Date: Fri, 10 Jan 2020 14:50:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108111825.14280-1-nikhil.nd@ti.com>
Content-Type: multipart/alternative;
	boundary="------------3BF622E9F9EA37C330AECD9F"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=oPboBGzb;       spf=pass
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

--------------3BF622E9F9EA37C330AECD9F
Content-Type: text/plain; charset="UTF-8"; format=flowed

ping

Nikhil D

On 08/01/20 4:48 pm, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> This series adds support for TI PVU as an iommu unit.
> PVU is a 2nd stage only IOMMU which provides realtime address translation.
>
> J721e has 3 instances of PVU and all the DMA traffic can be routed via PVU
> when running inside a virtual machine.
>
> Changes from v1:
> * New patch1 for avoiding warning when unmap is called from cell_destroy
> * Split the patch affecting amd fields into separate one
> * SMMU fixes are sent in another series
>
> Nikhil Devshatwar (5):
>    core: Update cell_state while destroying the cell
>    configs: Introduce tipvu IOMMU specific fields in platform_data
>    arm64: ti-pvu: Add support for ti-pvu iommu unit
>    configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data
>    configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU
>
>   configs/arm64/k3-j721e-evm-linux-demo.c       |   7 +
>   configs/arm64/k3-j721e-evm.c                  |  36 ++
>   hypervisor/arch/arm-common/include/asm/cell.h |   7 +
>   .../arch/arm-common/include/asm/iommu.h       |   1 +
>   .../arch/arm-common/include/asm/ti-pvu.h      | 129 ++++
>   hypervisor/arch/arm-common/iommu.c            |   5 +-
>   hypervisor/arch/arm64/Kbuild                  |   3 +-
>   hypervisor/arch/arm64/ti-pvu.c                | 581 ++++++++++++++++++
>   hypervisor/control.c                          |   2 +
>   include/jailhouse/cell-config.h               |  17 +-
>   10 files changed, 781 insertions(+), 7 deletions(-)
>   create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
>   create mode 100644 hypervisor/arch/arm64/ti-pvu.c
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b562f103-dbab-bd55-728b-18f51ba2c710%40ti.com.

--------------3BF622E9F9EA37C330AECD9F
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <font face=3D"Verdana">ping<br>
      <br>
      Nikhil D<br>
    </font><br>
    <div class=3D"moz-cite-prefix">On 08/01/20 4:48 pm, <a class=3D"moz-txt=
-link-abbreviated" href=3D"mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a>
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20200108111825.14280-1-nikhil.nd@ti.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwar <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.nd=
@ti.com&gt;</a>

This series adds support for TI PVU as an iommu unit.
PVU is a 2nd stage only IOMMU which provides realtime address translation.

J721e has 3 instances of PVU and all the DMA traffic can be routed via PVU
when running inside a virtual machine.

Changes from v1:
* New patch1 for avoiding warning when unmap is called from cell_destroy
* Split the patch affecting amd fields into separate one
* SMMU fixes are sent in another series

Nikhil Devshatwar (5):
  core: Update cell_state while destroying the cell
  configs: Introduce tipvu IOMMU specific fields in platform_data
  arm64: ti-pvu: Add support for ti-pvu iommu unit
  configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data
  configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU

 configs/arm64/k3-j721e-evm-linux-demo.c       |   7 +
 configs/arm64/k3-j721e-evm.c                  |  36 ++
 hypervisor/arch/arm-common/include/asm/cell.h |   7 +
 .../arch/arm-common/include/asm/iommu.h       |   1 +
 .../arch/arm-common/include/asm/ti-pvu.h      | 129 ++++
 hypervisor/arch/arm-common/iommu.c            |   5 +-
 hypervisor/arch/arm64/Kbuild                  |   3 +-
 hypervisor/arch/arm64/ti-pvu.c                | 581 ++++++++++++++++++
 hypervisor/control.c                          |   2 +
 include/jailhouse/cell-config.h               |  17 +-
 10 files changed, 781 insertions(+), 7 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
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
om/d/msgid/jailhouse-dev/b562f103-dbab-bd55-728b-18f51ba2c710%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/b562f103-dbab-bd55-728b-18f51ba2c710%40ti.com</a>.<br />

--------------3BF622E9F9EA37C330AECD9F--
