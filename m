Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBQ776TXQKGQEDMRPM5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58B1283FA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Dec 2019 22:40:20 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id q21sf2730408wmc.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Dec 2019 13:40:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576878019; cv=pass;
        d=google.com; s=arc-20160816;
        b=qfeMxtbV1HPsIM+g+unfr7Egb5OtZc+c2ZPvJzWmsbfdBH/LTHvogP5TLeGSL0R8Xh
         bzPkD38ZULEuSF/r9PyjvqVzfW6e8vVXmlR0jIPchTXEXt7zMV0/H7GEKoOnMIjRcvCk
         My57wmePy1sGFwFf2QDYtKe5w45Yet14sN9raHpyd8zxWcXv93uANtmWYSg+IXB7pXxz
         1de0hkVJMg74VdLQLM0g7nuVDKq1I7y0YGWTAQiDU3z1l4Yri3Wbtq3QH1A/Dv26rxof
         neUsvYmqM68COhSp/b2NaQ/W3nDkAe3udVn0HQCqiM4+9B99wr8vXMpQBfyJnfqhi+dX
         JIJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=2BK46Hmqg/Qf95VjFHzCZeLE2E/jm9tb0XCNghDErAo=;
        b=RfNxafDkbYLq4ke/CrCegrc04K0oyimt4BQJcEt31dTvXZhkQ0FHinfBD5Xch4R/H8
         sxMAAt0Z0GadsVGzxV9ZEVRh3qBzB0ZCkr2ozZ43+9eMfcpw9J2AVK7XZXPeCLJM7MoV
         V+aYaTZFXEHoIqrZceALPToOcvgdLOmk4smOdDoal5Ix3/0M9S/AVBD/WgD5YDG0ICyH
         jsx3rAbeQexfODYjf1AIKfSsrZsAe5wL8HVhttOKeKBpgsW649qvcatT5vKLb7zLg2IR
         8tHjDsKgtuG9Ads4VFKpgG51IMx+i47hRyW15TbjrS9jxeOGf0DWRhg5k2KlpaEchF6T
         X2ew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2BK46Hmqg/Qf95VjFHzCZeLE2E/jm9tb0XCNghDErAo=;
        b=pgFvuR3q0FOT2BVhaDHUqqZc7KqtS3ly0zZ20tkl7FQRIC40yB8ncb3b13xdrOhjR8
         7EteofvpMyFBHADQur+LnaM2z6+WUA0ejPMCu9JkNUS4iwnrSZXVrvoRtmaBF8Wgnd11
         M/ObsUVPEMF0brZT4sRRnOMQikN67Sup0tETfs11LRo0qijwfJNC2XsYLl/ULhGUYqjN
         0ExhafgZuLN+QFhHVyPHDkwNwY9dgG0ncRjC/DFfNYm+cL1gx8Fa9DKSrdG4fwvMjGLA
         7L2m9Gdz4oi0DnaYhZDLpe4ob0WoYN/in3GGJ74i7MEIwLyay+61wnrbHN0v4t7ZMTX3
         yaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2BK46Hmqg/Qf95VjFHzCZeLE2E/jm9tb0XCNghDErAo=;
        b=JszhvpzHsTuoPnM64pFTJTf51EvTf4bpzGN07Xs9C5rUOHWxwuCLyq3wDh2ArtHy1K
         2gneXcQRbp/Vt4FNIDvpl4kp3+X2tejvgUYkru9r4pRWgvqaVFZGqFDNRxFzwnOdfk98
         6b/r/4L1v7IOGu4GnYC+V/ikwwp47jjCJSBmIiJYYr3jYJPm9i2jvkjVVYdoccE6Sks3
         S3R2B+z/jUQdoi25VNGTkJtiMC3esDAx8Uz9ZJ/U5Kg86omQQxDhwgMq3bZW63tJCtG0
         EDjdXI9/mJpTe6MuFIN3CpUmWoWL+YxUrVhLGVsHFHagUOUqVF+Zu6MyMY5xonojjL99
         v2hw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWeh46OKu3rf9LhbzbHwlxSalFUne4Rotk5ogl7eaFWazBDc7cc
	BQrYVPx7mDqn61RqpgVWzbo=
X-Google-Smtp-Source: APXvYqy4H2cxJextTIZA6moAY44qQtarearCZZeb4PS4FaE7yepUePnR/tpsVPEskmmY7LrE276stQ==
X-Received: by 2002:adf:9104:: with SMTP id j4mr17371802wrj.221.1576878019543;
        Fri, 20 Dec 2019 13:40:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c3d8:: with SMTP id t24ls3463862wmj.5.canary-gmail; Fri,
 20 Dec 2019 13:40:18 -0800 (PST)
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr18820098wmh.71.1576878018843;
        Fri, 20 Dec 2019 13:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576878018; cv=none;
        d=google.com; s=arc-20160816;
        b=yFQvimBDVyT2xXMJNRKERMAmOuaiK7ZfMQG9OjjvS2ppE5uM77AO42xW5NVUHyUWL/
         1Bty4XqdBVyCPAdZVLPTN3St6UYZP6R8DKBwrGxH0Ufc2X2DRdU83EVzkdEy8KS+kdPF
         1rSe6ZDT1eD2VaFeYMKPLQTPmfcaRN8URYT7WRskLAeLDCfgna3g0MmgvRPtl9IgP2YT
         AELowgv/yIsXw4gmDnYaLhElSUMDmi8tElgQ93uby9TapAF9D5q5/xU/+fcs8DfclZn1
         cQNsfUtToJ398SgXEu6sqMonKz99hmHNcHdArrG0IXXRRXUsekiccdn1M5RvYDUO+DoV
         BaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=n1M67h2oSd6jqysUdui1+1CMlPXuCyC3rlckTkjyVlE=;
        b=TdRz91ghN96u9AbFVEGS3mxSUVIxaf+vvk+qCCldYjYn2gr8BwEpQhPGi54xAQIPyd
         mkA7ejicZTIyr8UslvLnjKC5V3OWCIeftUSqwiCONaNyG/NyhDaYim1NfsNng/Tbi9Qp
         jkFX86u4lAB3fErveJNMXlu6ZSf40Azvn0gztBRtDGYQFmCaJB5sUNqJKWJQR/dOnqFq
         fYKkV1EWb5h9zpkG61JXZJNk0Fiws8uezMkhrCs2XwnBlnPfUj1CbJATAtlt/sAWv0Kl
         eP0TUgCkpo/zmch6Eh7UmLIrWLl8flRvDZ63klQxOD9Yoc5/iy9MSshWn/t0FPCCuMv1
         P5ig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id m12si447071wrq.1.2019.12.20.13.40.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Dec 2019 13:40:18 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xBKLeIjH009539
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2019 22:40:18 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.32.179])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xBKLeI8L029637;
	Fri, 20 Dec 2019 22:40:18 +0100
Date: Fri, 20 Dec 2019 22:40:16 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH 2/2] tools: gcov: Adjust Gcov counter count for GCC
 versions >= 7.0
Message-ID: <20191220224016.41134d5d@md1za8fc.ad001.siemens.net>
In-Reply-To: <20191220154126.1136-2-andrej.utz@st.oth-regensburg.de>
References: <20191220154126.1136-1-andrej.utz@st.oth-regensburg.de>
	<20191220154126.1136-2-andrej.utz@st.oth-regensburg.de>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as
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

Hi Andrej,

nice to see that you exercise that feature of jailhouse! The two
commits LGTM.

You modify a section that is enclosed with a "heavily inspired by
linux/kernel/gcov/gcc_4.7.c"-comment so i would suggest to  maybe
include a reference to the kernel commits that you are pulling in here.

I think we can not avoid a "copy" in jailhouse, but the pointers in the
commit messages might help some day.

I remember that a couple of files are excluded from gcov entirely,
because old compilers could not exclude on function-level. That was
relevant for address-space switching code on arm. I believe that more
recent compilers can exclude more fine-grained (on function-level
instead of file). But that would be more patches on top of what you
sent ... another future patch.

regards,
Henning

Am Fri, 20 Dec 2019 16:41:26 +0100
schrieb Andrej Utz <andrej.utz@st.oth-regensburg.de>:

> As in linux/kernel/gcov/gcov.h.
> 
> Otherwise the extract tool will access Gcov data using garbage as an
> index and segfault.
> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>  tools/jailhouse-gcov-extract.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/jailhouse-gcov-extract.c
> b/tools/jailhouse-gcov-extract.c index c126f976..5bb337a5 100644
> --- a/tools/jailhouse-gcov-extract.c
> +++ b/tools/jailhouse-gcov-extract.c
> @@ -43,7 +43,9 @@ typedef long gcov_type;
>  typedef long long gcov_type;
>  #endif
>  
> -#if (__GNUC__ > 5) || (__GNUC__ == 5 && __GNUC_MINOR__ >= 1)
> +#if (__GNUC__ >= 7)
> +#define GCOV_COUNTERS			9
> +#elif (__GNUC__ > 5) || (__GNUC__ == 5 && __GNUC_MINOR__ >= 1)
>  #define GCOV_COUNTERS			10
>  #elif __GNUC__ == 4 && __GNUC_MINOR__ >= 9
>  #define GCOV_COUNTERS			9

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191220224016.41134d5d%40md1za8fc.ad001.siemens.net.
