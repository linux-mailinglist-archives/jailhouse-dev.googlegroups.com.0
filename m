Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWF5XD5AKGQEMW5QDSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADCA258C81
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 12:13:45 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id k11sf375756wrw.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Sep 2020 03:13:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598955224; cv=pass;
        d=google.com; s=arc-20160816;
        b=eOO/l91dliFkW6SHCgoxf2zqt1euQMck5KZTnl+Gp3MQrRYWySpJdHLZR2uVQkOkE9
         FwKtjGXPReQN9Y90gR/i4OCjp0rd5wqM9mbghTO2k4pvZmWEMlGAtgloTuoz7aoLWe+D
         w53kO3ljWjsTSSO/irNHquK5BFVkviSRNom2kFrhVOSJ1sFtUIO3X657psI87BJdIs7y
         8aMoErePm0dKqypnjii7B0EcX934QPErtj+ZkOsZ6d6m6c72jMHrOXeusjFaXXSTm/7G
         lCSt2roIXX3DkhiY9Ria6jQGR8723CPD+PAU23K9V/E4VPDOf++eWML2X5kpR2B51C8C
         Z3qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=2zTQBlYbTt/YNqz99leB1Z/+wbl49k37WXSsHhHCuMk=;
        b=nyyeN831dE+o1lZZtklMrR4aIguWmBZLGfpsUd0Km1pqn9nvVIVtglpS+7rxPFh1zZ
         cD3RuKlAOtaGBjAQQEHDyeTQAuYv3tcBKhokcOE2rMPOqKLYcItwJVEsZa6XVi13w/8e
         s2riixZjrcGDWrrlwmlb2gubNTUQ4hI4vZaBO2niHoQBNuEx0BWcI+vrvmuAgH8bSa9a
         qQQM2Awp/Jh59bb2VZdP0L69tqiFHksIdflXEIj0SnSE/WH6+Y3nmPPsWkOCycB6RSwB
         oyq4CIDNzLVs52rMC6WZ0hEcTzfXcPf4zTa0t3yj6LWGWZfs3+253Rqmd8PRO+jPGQwr
         6jpA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2zTQBlYbTt/YNqz99leB1Z/+wbl49k37WXSsHhHCuMk=;
        b=fZ17v/EDnROIUrAgUx8KTs1sLNXpTpYI2yDEjW0PrcMKU6ChEeZCmsfc6JWlUYfqyv
         jgcKV0uvNOgjQwiGn6dDJe5vonNjC6rK3xFIJ9oHclSP79zumOm9kIAC44q26pWg9D7z
         DbVRpKIOdoRRO+jaJRjNuDKS2CD3zJC1QwOQjYBGWp8rwlRAafal1tpdBGfJCmLZ/RNj
         N5A1+SBuf9X3yoghEun6Pixyf47YW7Hwpkd8dkDHP//tbBG3vd3SsQ79d2OtlGizKxYM
         WJL9D/XJSeuGQWQmbWxy/AWNRc/bvZ5MIO5doFOhNSAH2Z1LE1ad5tsO/bdM0TPgQoRz
         +o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2zTQBlYbTt/YNqz99leB1Z/+wbl49k37WXSsHhHCuMk=;
        b=t3H6RzMNFvpXxEvkbmAR4Yd7sHQcnvFcMiI1DZNNDMcBxGDqrQcjlGGFiHgUZMP2tx
         +Jy5eg8XZZDU1HnP8xmaSVNNO1cpzgCRBxXBhN2+H6jZXR5FsFFHrSnRu2THzmaVf12a
         UFg9gDG5GMtQAtgY+9MK4z7KVRnZ6DAs8TcwBibSaPTILBQzdAWxHwkz0cnFVqBCITlk
         OASrA/zHXHxnU/B/tP178/F4oLg8VZSyQXtrPfh0yOCOjQXLc74W4nPr5CcOp3x/GQK6
         A0q78/d43pvN6W4bZX8FVUrxvNrE/XZDqUs9jxiw4keD/wspafqVZRSDLmEZT8i8NBAw
         e2Ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ao4bko/pxNpXeyOdDW3C+mlTY12dRh4vDiDacYijvSEPfVhPR
	udTeD6Oz/T2+1zrgVxAXN4k=
X-Google-Smtp-Source: ABdhPJy5xHst0r28jqZSz3PQHkmuBNifH/R4Clc7nvQrhExAiyAcB/+2rIgG1zC9HcXVASJR7uNIAA==
X-Received: by 2002:a05:6000:110b:: with SMTP id z11mr1110037wrw.426.1598955224820;
        Tue, 01 Sep 2020 03:13:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1b8a:: with SMTP id b132ls491868wmb.2.gmail; Tue, 01 Sep
 2020 03:13:43 -0700 (PDT)
X-Received: by 2002:a1c:105:: with SMTP id 5mr1101677wmb.83.1598955223775;
        Tue, 01 Sep 2020 03:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598955223; cv=none;
        d=google.com; s=arc-20160816;
        b=gJZApfYrXDitZ+9UBkHYPZRomZmT0egz7cP7+BSQXmtG/A/6ND6JAT/XGpE9HYnPKj
         0hyiCqGI47/8G1Bw086ptE2zSwF28jrr23TY18IPMOiS/ip4uWEo72JkXePA+RpB17vW
         EuWcIsemrAhPUf0GXbnI300R0MWgpZv3LCERpiKxRQF3hZLlGs2QTnnAC3d2KLp2OMtK
         /tJdlX4WP5gaJAYlGngzeagwNvZXlDexSu5dGqq0LZmVe0XGOn1W9nogekO+WwQWVZy/
         dgTjU0y4ox+g9Cfea6iBI1L8AkEM1Gu4Uo8oIxB5WqcoBYb0OB42EHHtXdAmcrE7mdbe
         pKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=UnhwkxuwI7YIQyrpEPwudyqB3NsYkBEzwpn8WmkByms=;
        b=UR8a2ceDkfDjrTq8MweKXv0j83v0HcP2k1OS+v7U/2uHxzTeJF8EiqDObVFoyO3oIQ
         W25CiXXMiED6PgHqV743a+KhCYhezdascPb3nJFM26+0nl5j14T4M1gEwnIu76bARg6T
         hn5HQmiR2bMvEweO1jv35aHwutbfWY+PGnm3KxSHdKzOZeIlb6LQD43CMFdMUGHYHn+Q
         5sbcg3PSi5wgZPt6Q2gEuFPk1X/FGoe6p5YyhtEL+cyBccqnsQCSKscurewurJCnyFhE
         mdyC7eDW80Cxs2PuOGIGhK05iopzqQVENTwMr+DUFv7pSGdcNADaDdS6nIeuW/KvSfxE
         pXFw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id n67si36807wme.2.2020.09.01.03.13.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 03:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 081ADgDK022663
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Sep 2020 12:13:42 +0200
Received: from [167.87.3.153] ([167.87.3.153])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 081ADgMa023102;
	Tue, 1 Sep 2020 12:13:42 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
Date: Tue, 1 Sep 2020 12:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 01.09.20 10:38, Jan-Marc Stranz wrote:
> Remarks:
> 
> - my system has an "Intel BayTrail SoC" wih 2 cores
> - I've added "intel_iommu=on" to the kernel command line
> - "dmesg | grep DMAR" brings no result
> - option "Intel Virtualization Technology" is enabled in the BIOS
> - "cat /proc/cpuinfo | grep vmx" or "grep --color vmx /proc/cpuinfo"
> brings that "vmx" is in the "flags"
> - "lscpu" brings "Virtualization: VT-x"
> 

You also need VT-d. Which processor is that exactly? ark.intel.com can
tell you if it had VT-d already, probably not. Look here e.g.:
https://ark.intel.com/content/www/us/en/ark/products/78867/intel-celeron-processor-j1900-2m-cache-up-to-2-42-ghz.html

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f7aa0d56-f1a8-ff95-c565-d1f7edc707a3%40siemens.com.
