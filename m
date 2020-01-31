Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBQW5Z7YQKGQEQKPGI2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id F186514E9ED
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Jan 2020 10:09:22 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id y24sf1798035wmj.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Jan 2020 01:09:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580461762; cv=pass;
        d=google.com; s=arc-20160816;
        b=RRRu0G0O8GF+ZN4R+93WgZr7fJ1CuZ+znTQRljOyhhgGSTjFvAZ+VUB9nJQ8berfsm
         WFvpHK1ANag1gJ4+bF0LcoqEsD4VZjtmj+8yw+lxTdjRITZzlGLSsknFuKD7yLy+HL3q
         QvMmdl1op26CdMSrPYoyXgzUcCXdFpABveL2rjxeohiatG5EwSmTBOMehs9arD1Kpk7E
         4FQ/s+bhc9XhNzLf7D8WjWKH+Inoi5Q1lelVDFjKU58GW0mMjTaZcV4fmv2ud+O7BnPr
         d8WRoFy8yMm0U+PVg70gxn2eeTuGqs5hFewSYZ0ujmXFWKnS4QKMtIzx0j1WsYdww6tF
         ZpxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=RctN3I6yqatAJqqHEo50UXvNSMlCfLZ1ktmbLUhiOpI=;
        b=ULhaFfaYMg/IkxQZWemzoYZX7MgaTuanM5pUV2SfED2VZ0ohvLylnYNLT860RBv64q
         nJufwwk8s5zpT+dTWgcDY+vAwqpGa/O4Q9TLIUtU2hBwOzasRsc/EmkYBPnAZvtVSjCM
         daaClErOiSOJoyfy7VVulO+f/3eAwbvaBozx/ctxPLoKWRfxdBHWZKKze20U8fXdhQ4y
         ZNfrXwgnKBYgGlW9OAndQ6EaD0wg77HqP7SHOrlCYjTH/hxyLwib4BJomy9ouBsdJM4/
         gLnRJyglcOytx7ghcG5H/gzby00sXYryL3nuHzHf32tpDvT+8jYvogGccvOouXvLYFt6
         7TfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RctN3I6yqatAJqqHEo50UXvNSMlCfLZ1ktmbLUhiOpI=;
        b=VRL32+Tkf7X6Wb6TO7vz7XF3mabZtsJ4cLs+Ci+njLY+1FGy7VKNuog4eF8eBJ4BBI
         Ri8+FGGjAbPEVF7xUxgNvlUPiuDOPq/Nku40N3nUbCWzSsqUQg32aW8/cyxAr7iYNTBA
         hbe4WzIkyqBAhN7mERwRuXz8r6vosYSGjDAoHnASyygeX7mJJ6ntTpOx7mP00e3kk6WX
         uu5eSgeL3s9DhNqCg2TF/nVmct1gHBSdgFQgVrI+LWRKdQyRw6oXkJeTHtQqNTQSpj6S
         tRl13X4s+vsi4bFkhLhNBD/ny0uwDO5e1e6wek+1NmAlY20fR1+ioB0tCnZrG4HoLX9h
         PI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RctN3I6yqatAJqqHEo50UXvNSMlCfLZ1ktmbLUhiOpI=;
        b=eVM7NeRJ/JgfwWy6c7uVrQHQO2ZGI01oqWLsxOnkTJCwfRw3wyNbjtdD5ECZq0XTHm
         co+14Tz09t+TeB6Aq20wGKkXvJmdHwS/bf8otuB8XhHZSb9uq2q3pPlWeiqF9Z8cB7Sp
         6i9ZQOSqBGyIsfhUi7bb/VURMZ0BFTjuPik6xGktuwyHdj1Pc+RqWMVw4AmMkdejElSH
         h7puzjk5Ia7XUOMxoRByWG+15WHsPGs7rKLP/+nhW6xWx/s98ugM7AwQgmvN5XqK/DUr
         LnsRpMpgEuZFUfLdd4Y+gDl5twgTNI5JesFjk4DDUKvvRbljFgNfkbM7OUxxvcWvklOq
         oZcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUI3Q7nxIT9ir4/1eGnn5plK1uAG3Xm+ogFHw1GGfM3d0mw7Clt
	+x5lj0Y3bufI1A5HXGDzTEY=
X-Google-Smtp-Source: APXvYqwz3pAwPzQV+2a1i1GVT442hg0l7P45yYAJgPg9XQpDoOKyqRd3ZgprDNyOPlzc1g53x+ce4g==
X-Received: by 2002:adf:a285:: with SMTP id s5mr11499885wra.118.1580461762587;
        Fri, 31 Jan 2020 01:09:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6385:: with SMTP id x127ls4559781wmb.2.gmail; Fri, 31
 Jan 2020 01:09:21 -0800 (PST)
X-Received: by 2002:a1c:a515:: with SMTP id o21mr10999663wme.85.1580461761878;
        Fri, 31 Jan 2020 01:09:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580461761; cv=none;
        d=google.com; s=arc-20160816;
        b=iXVEjUDAZNiXljcxaCu1gN4EHdMi2qp/n4J6jXgJ+duAM6BA02/gkipr4QN6TwxPst
         IBGysQT7PbMgzKrTSg/BLVWF6vHWH1um6bR+7N1M4CD1T8zW6mkx1QuxD25/slavL5iy
         xWCHGqBAY0rE1R743UjfAV9Katrpk/D9gxfKcG8YG8UPKpqHHc30jqbjHNjv9IaRxzuZ
         npUfra8nEzvWkutK2Qe5Wey3XQO1FT5NIJsXuHPOWhz3XbulgzxPmqVlFTmWNy6oaTts
         ZpJPF0VHmGCvY7zH6dqLm1IatCp2QAPdubAKtFWcp0MppzUEDXHX0QyR2iWVlhT0PXI7
         whiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=8AVQ6gWgxfDgTl6/pOtM1Vo7uczEG+Dkh9qV92HnTE4=;
        b=MD/2upMxErLGycRwUIrFi7AA3A43riG078BpVIE6Q9a3GxUfkfdbTOyADfirCH2Taa
         Rg2U9yvmOgd2+VXrGHeazQX6yrSjDxuExuRz69elnU79uwDdok81NkoJvtuWtkhywOaF
         AEKX04m1DL8UG/TnWb05aZvNlW3iqf5aEw/G/IwcNUWwKKXrE49taSbtUfw9DR3OQcAg
         OVRdcC1C7lrf/PH+J35jxfREGDv+hIc7lNGFjmgDKoQ4+kZkYa+jpdZBjjQL/mJ5YBbb
         5e/PUnboD0hayYQ7xJmuJl7xC35i9ZJhR9cYiG0yI/TGnEkYGRMtMCEKRhw0mDPLRm3x
         Q/6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id p29si260592wmi.2.2020.01.31.01.09.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2020 01:09:21 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00V99K3X029193
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2020 10:09:20 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.127.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00V99KLl006057;
	Fri, 31 Jan 2020 10:09:20 +0100
Date: Fri, 31 Jan 2020 10:09:17 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Michael Hinton <michael.g.hinton@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
Message-ID: <20200131100917.3ad1b337@md1za8fc.ad001.siemens.net>
In-Reply-To: <40ec476c-8c25-4efe-87c2-50a6ed373206@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
	<20200120144629.201f3081@md1za8fc.ad001.siemens.net>
	<b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
	<20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
	<5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
	<20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
	<40ec476c-8c25-4efe-87c2-50a6ed373206@googlegroups.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

On Thu, 30 Jan 2020 09:41:08 -0800
Michael Hinton <michael.g.hinton@gmail.com> wrote:

> On Monday, January 27, 2020 at 12:16:08 AM UTC-7, Henning Schild
> wrote:
> >
> > Ok, so we are just looking for differences between the inmate and
> > the linux as non-root cell, because the jailhouse/virtualization
> > overhead is acceptable or known. 
> >  
> I think so, yeah.
>  
> 
> > In that case a memory bound workload boils down to the mapping and
> > the tlb misses or CAT. And cpu bound could be an issue with the
> > FPU. If your binary uses FPU instructions but is able to fall back
> > to soft-fpu, you should check which path it takes in the inmate. 
> >  
> Let's see: CAT isn't supported by my chip, so that won't help, 
> unfortunately. But the Linux workload is mostly idle, so I'm not sure
> how much that would have helped anyways.
> 
> My inmates don't use FPU instructions, and it's not even set up, so I
> don't think that will cause a problem.
> 
> I will investigate TLB misses and page mappings and see what I can
> find.

To align the mapping on the hypervisor side, you could just run that
inmate in the same cell configuration you are running that guest-linux
in. For the inmate itself the pagetable is constructed by the mapping
library. The code looks like it tries to do huge pages, make sure the
call map_range just once with your full memory range. Aligned and maybe
more than you actually need. Consider putting a few printfs into the
mapping code to see which path (page-size) it goes.

That way you might get lucky without having to find how to read
tlb-miss counters from the inmate.

Henning

> Thanks,
> Michael 
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200131100917.3ad1b337%40md1za8fc.ad001.siemens.net.
