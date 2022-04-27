Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBXWDUSJQMGQEVXZSDFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D5D511534
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 12:58:40 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id p22-20020a254216000000b0064588c45fbasf1342711yba.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 03:58:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651057119; cv=pass;
        d=google.com; s=arc-20160816;
        b=HOIlU5eoiMq4CcdAOmIRDN4wes5A5UrEKbbzasO8FI5KKY3Yjr29qj4bVI7GHmGi5B
         hqQENYFaHe8CLML53rz4wXNkhLLVLu45MiRswNwF2FbJR92kuKvC5CbwqNKVsO3lPIAw
         L5YtJt4hlZUpbOCM0JiE7HXLLtzPdv9SH7RMmxHZUPKgpN7iqWipeIkab/0AkzBow+8x
         mPpO7X7wsRL+JwGrG5Qj6hZhIzG4Eb63dm2brlubTalTC5S5lF+EYvgQgXIjGkwtthYb
         EhF7abknxcPaZKCV/IE0SUzTp6g3vEY00SBJlxwf998DUoxQ+zfW/dYfWbaP7RYT56iV
         fjxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=4A6eQDyxs+IHsuJYj/NHYVpgKHyuOC/YJPJMyTHCDl4=;
        b=FCIkuDWpvslY6AEi367mrhKs6GGZFbsELNxW0/i1UQGiSSQZxplQeDl8mC11Rc2Pfh
         kMoES0z+1YDB0pafjECzFajPxrw9+vphRbZSH6d12YYLgkKajknjOtQmUPy3frD/Sc/p
         WScSeDMyrmi0TUmJt4RJxB6KInct7GgBLNDMO0ENuh/3+JQglU6vDM23zsQncSc2SggV
         Htln63L8W1Xv9W9KXHDCTN55HH+A88An0CjQASyAjS9xAQBNzIIi5YXRo2OA1VlREKfS
         JJwyYqTdk7N6dYFRf0MrMt/v+jNaYB7mLANZUXexM4XwalwY4JL1X9DCWZPJYmvqIHVj
         70Ag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FJJ+T8BP;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=4A6eQDyxs+IHsuJYj/NHYVpgKHyuOC/YJPJMyTHCDl4=;
        b=ETBS4wvTjCB/g0SIQ82yLx03pxa22k8tbOKC1z55jLWvrpu9tdSiUN/UF6eYwLxQlf
         3oGKSjXgOG0jWJyhi9Rrn2Bfe78La8Teq0tb/HLpElcps9CAOrRP57RklB2xgjYfpSTJ
         SLoaVwiqmtrjl0/6PskzdFb1z6XvBeiKlqk/h5CjW+BFIo53Kx85AquZBrhwymiitDHq
         oGahzgLO9cq0R1h6zNNFSWlbdbCdJ4bgjjVPmpIEsHUIqxDwGNVGunZjfI5J2G1UiZw1
         XxHPd7Dias8VUjPiWwYU/v7jtaREPHd9YSZLImmrrx6BN58UOV7J3wA9okQsCCF46ZRo
         Nz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4A6eQDyxs+IHsuJYj/NHYVpgKHyuOC/YJPJMyTHCDl4=;
        b=X+B4bLMDqr0IFtCsR4l//IPqwdX2mOxtZRNDgX1QOqpJpKwMvOzB/TkpdTh4CYrQqQ
         jENZq9uL++iahz81DgVxAflO6OnxbchhSlLpeTqvuPLCyGVttvlwCUAGqzqLzarr4CTI
         isokjbuGfbq6nkNLIfrsL5PTXyZJN7/nZgbIj46yDelbV4Jou9Y2n0Uegyi0XZoFDheG
         Aj4Xjs7++vFp4xAZ+34NIZ2I9/OuBS6mE0EwcT5aIAwIMAm+MI9+O9ySMg7aFtkTegsk
         NHCsEidr8EEc3Spsj9QmnU0bjJ5bAKVRxkHsHXLCJvTleWa+lx0ZZ0pl6hrVc5LzHGDI
         UCew==
X-Gm-Message-State: AOAM530/9mCMmsiS413Gcb5tM9VOiW8ep34rtw5jhuGerUoSqdc2j0OH
	ieXaVfuguBnF/Xr469PPtMY=
X-Google-Smtp-Source: ABdhPJyp2QzFT8cFFLdPc2dAUlYHleClPjjGKJSVyDmI7Ipfu1zNJQcZyLCMMWnuZQy06vNfOBZuSg==
X-Received: by 2002:a81:5683:0:b0:2f4:cadf:ac2b with SMTP id k125-20020a815683000000b002f4cadfac2bmr27632233ywb.88.1651057118858;
        Wed, 27 Apr 2022 03:58:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:5683:0:b0:63e:7eb8:1a0d with SMTP id k125-20020a255683000000b0063e7eb81a0dls1531887ybb.7.gmail;
 Wed, 27 Apr 2022 03:58:38 -0700 (PDT)
X-Received: by 2002:a05:6902:104:b0:628:bc80:748f with SMTP id o4-20020a056902010400b00628bc80748fmr26115035ybh.575.1651057118022;
        Wed, 27 Apr 2022 03:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651057118; cv=none;
        d=google.com; s=arc-20160816;
        b=RD1BhrNF4QiDE7mYtGKUTF67tMltVqloNncZH9j05pCEliA/PCtzR4OpbQlYp846mZ
         Tskfgy5l3xo+9KWaOlfAWY7psRIE/G4sB/GCtbzBSfQ0FTtFdSa56IPjmeHZR7s5BUmS
         elcl5A5/yadVlXDnxjcjxUERnTJyJGX12u3NQWU22mfsU5Zsdv9lfCcbdTQHNZhpIhZv
         9+DChA8CoHCQ2zwS5sDczKg9MZcdu0dU1tc9eKNMd3fUhm1KiXCHof6sMAqQjJaXpPFw
         vxQYS3TBgHXpw0h8y4JPWVolsXCsWPJa1glX+NsWdYoXVUki3ZXeVboLrlDG1QBkcTIW
         BaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zC84M3GDXEzuuXdcc/woHNlHlhNMPDCY/IYJi/ChjAA=;
        b=DojcoI4ShJBPshN9j+qyyBc/gmu/VetMZ77arO7NjFb3bb4fP5X9nHPhiE+YKp0hoO
         D7LC4hSI/EU3+q7zI4JLAmPTwPNhDR+D9lzcl6fH2MpSDr4Ap3Wamc5g8HyJR+8A+p+s
         PIzcxlGQcpf6Gr8lYz+ZaNuM2+oLTC01bG5AycBRE2GQ/bHpNoUlTpmmyW/PEYfrs6Wm
         uLhM7Mrh21VacPoISK8afPcFlKigw/K4ySiNDns3xtmwKIuSNTLHxeS5XScYjUb4Uchj
         dULHFCNWUmO9uq89uf26inbTwObIgwKwzki2+uA0LYekLpJ4867Nvgo1uNgeWpZyZ/9S
         jahg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FJJ+T8BP;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id h82-20020a256c55000000b00634581eb904si104419ybc.2.2022.04.27.03.58.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Apr 2022 03:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23RAwbDQ123230;
	Wed, 27 Apr 2022 05:58:37 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23RAwbVv008125
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Apr 2022 05:58:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 05:58:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 05:58:36 -0500
Received: from ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id 23RAwVEI030689;
	Wed, 27 Apr 2022 05:58:33 -0500
Date: Wed, 27 Apr 2022 03:58:26 -0700
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH] configs: arm64: add support initial support for AM625
 Starter Kit platform
Message-ID: <Ymkh0iwDmwlRnOpQ@ubuntu>
References: <20220427025419.3485-1-mranostay@ti.com>
 <5473ee5e-1891-dd00-db28-388dad40ee02@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <5473ee5e-1891-dd00-db28-388dad40ee02@siemens.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=FJJ+T8BP;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

On Wed, Apr 27, 2022 at 08:34:11AM +0200, Jan Kiszka wrote:
> On 27.04.22 04:54, 'Matt Ranostay' via Jailhouse wrote:
> > Add support for TI AM625 Starter Kit platform along with eMMC and non-eMMC
> > Linux inmate cell configurations.
> > 
> > Signed-off-by: Matt Ranostay <mranostay@ti.com>
> > ---
> >  configs/arm64/dts/inmate-k3-am625-sk-emmc.dts |  28 ++
> >  configs/arm64/dts/inmate-k3-am625-sk.dts      | 163 +++++++++
> >  configs/arm64/k3-am625-inmate-demo.c          |  72 ++++
> >  configs/arm64/k3-am625-sk-linux-demo.c        | 220 ++++++++++++
> >  configs/arm64/k3-am625-sk.c                   | 317 ++++++++++++++++++
> >  5 files changed, 800 insertions(+)
> >  create mode 100644 configs/arm64/dts/inmate-k3-am625-sk-emmc.dts
> >  create mode 100644 configs/arm64/dts/inmate-k3-am625-sk.dts
> >  create mode 100644 configs/arm64/k3-am625-inmate-demo.c
> 
> Why k3-am625-inmate-demo, rather than k3-am625-sk-inmate-demo? It's
> k3-am625-sk-linux-demo as well. Or is the inmate-demo not specific to
> the Starter Kit while the linux-demo is?
>

No, it is and should have the sk in the file name. That was a oversight on my part.
Should I send another revision, or will you rename it in your merge?

- Matt

> Rest looks good.
> 
> Jan
> 
> -- 
> Siemens AG, Technology
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/Ymkh0iwDmwlRnOpQ%40ubuntu.
