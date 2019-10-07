Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBNPY5PWAKGQESCXHVTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDD4CDDAE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 10:49:58 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id s14sf14626612qtn.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 01:49:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570438197; cv=pass;
        d=google.com; s=arc-20160816;
        b=eXsSXOwCj7fT5h8kOb6LdYj9jPvp3LeHgw/CAknZ/a7i/lKZu6ZZ7DAdXfGPGPSfqa
         7EWfcFegAs9uK69d3bt3iHCIcN2ezlH0l1bHlBYS1NmskccbUsmZO1n2NMYWZrS2lsjH
         nTvt1e5BIK+ytQPYbrzxkvhFbeM11SUtVVAQAohxYeHMoYNwZyDvrwK5ljb7mi1GYHqk
         mZCSdWi8YO60ZeUYmd1rP974OiDrw+QkDFtGZKHmXdz9Jin6r+hl48/aF+mQf7FZr+iV
         tfPOxMcMjAKoWMiyYKeyvPwfcOxRpMqqIJBS8hiYpcb4KtpWssR5Yd3+aZdCygB4x+rW
         Nr3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=cGX6QJ/mCD0gSvSByVezLZ1uB6uPLshj62FHjgLmmL0=;
        b=NS2ff8KCe7Zno8HeZbdWAiwvUbtMB9lFJRpT6Rv0fbHdHfkJTtRQ/BCavYEJmGOJbj
         Ipmz4M+yHHAs7KthiuZN5vu41lSck4zCdcN+VTY2NNnHLbH2k3/nRm4LAYnrtUMDmVxR
         Fw+IS5qSGHOCq1/FoAvNZ3sPVMcI+xBRHOdlm0cAn2b+AXcSaer/YKOtO6y2Wpmz6OXg
         zjaMC7ABcV/Wnpf1ewARqOE0JWpIDPoZBA63weSFfNb0cPae50RUGLLH+2Z00zoMzgX4
         BsIPugLBlVoqMaVqMBnndDKD9IG47kIusyPZXGXN2Sf7+CG6sJWAjVMcoWu2hWUjWqb3
         LnrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Asx1+gC5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cGX6QJ/mCD0gSvSByVezLZ1uB6uPLshj62FHjgLmmL0=;
        b=AHb3hCPQJKvY2kvRxlH3d6spgvx06TAeqTumvH1iq7NYdsTYc4t1UMj2nYJ8+AgKZE
         9NEHBcY6MfGyqQINBytufSmkCIdwFqKooXw1iQnUL7H377uYMmYQx91vwPGEDCw6lXtL
         NUZ69epoHQ/S3RUqnUt9xepMT1M0YgcgOtMQMO6AN0mBlxY+SSTCiSin4IyqzjynDt3c
         gXFLbQ6Lyzr5wnZhuYmThxMmsbYznSDWzRl/tcrs+FDO5tQDcb/EBZ2yhoz2dtjrmhes
         fQ1gbpCU4D1gr/mdT38PVES1MUbTQSxkddRzKZuIS1wYHleYdSiabcVwfUHk+V/C1BRF
         xIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cGX6QJ/mCD0gSvSByVezLZ1uB6uPLshj62FHjgLmmL0=;
        b=ti/2rF3RE+s6OSnaF+fVifTpuCx5l9WXQy8JtxK1jzjzLfFpd/fOhkUEFKiy2SyRQe
         Ht/vEGsQU7Xv0Ge6AAxE74UtKHBKNkEgJh9kpVS2LWGmYr0SdnKPlJTtkiU8ifJ5u6sp
         zVMOoMZmDdNDxJAyKyG1yMO4LLLQPh7txX+Zj8GWDi1ULv0iV8/5HX0nhz0dSh9fHJhc
         oXSuvqkOl3O04nyDRFnXg/YzR2Juht0FmhJQ6r66c6Zm3YnUUpsEoc2rCXnDO8qK8dFc
         kSD7Zdo8t4LdS9qc+/AWS2/IBoKHZ2E02S6HpBXqbxcS5zIhjyXF4zV984/QgWrZKDXq
         TEpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUoBPB8aBQyPv5KpiqrBLzQBC0HZjFqODBCn8tvRNnBWyLyFE4+
	xXCfvW+dzya6fKlUWACH40A=
X-Google-Smtp-Source: APXvYqwVPcJjTtnC8S5IC2DDPSPP0pstJeTQfbZ0SVfk08j1VN+XvtF+CGcgC26+xwS+HiobIrN80g==
X-Received: by 2002:a0c:be84:: with SMTP id n4mr15340802qvi.92.1570438197252;
        Mon, 07 Oct 2019 01:49:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:927b:: with SMTP id 56ls2793526qvz.2.gmail; Mon, 07 Oct
 2019 01:49:56 -0700 (PDT)
X-Received: by 2002:a0c:d0ed:: with SMTP id b42mr11795024qvh.143.1570438196874;
        Mon, 07 Oct 2019 01:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570438196; cv=none;
        d=google.com; s=arc-20160816;
        b=cYn1dvTtnCo2i8pC/5krn3lot1o/LYptKpMDxDMRQRpK4oW5RnQQRieX5ZbaTJrtRs
         0dJEBgM4lf4tQFvG0xknBaBgQ2NUXWvjunmfeNE2lRiLDOHgaGbp3mqPbFRXevng5MYj
         IChrofvJiwnmYze1zvdTATUq1+CvDw93OP4dFGrJyXViDjFmm9KsVUsIek5SLEgzl2vp
         /LpsToGY/A+M5C+nkBYYXNG7CwhcidCDuNlaGBK6Ep31vlE4pSu4qo6yw9hDrtpZQ4Ud
         gPdORU3QpD3kYprEMh0CdhQ75pLpnJ1UC5VGDdkimpziyGSrcpCsdmmYUnhJEfSkN7Li
         4rFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=jERjdQXZJ81EW4RagWwgiM+2jHyVcnbRX1Ue38QiFeVbTKSheL4vEozyh1+8tR7VuC
         Sy/YmG1n++dD3FPwrP2GkJS5nBRxw+QgYl0qqluf1IA3SLDPPiN2xcxXpAkpa46Mgf41
         p90dDYLqKqiJMddBMMRC2TKPHzZvMKsB4LjVikNWrQTzSJddGYfbrFV2kvcemMtkF8XL
         UoXEqeHDQgSjUiIvewVb+SmFGa0ZRLZJFfGjXEdRM0MDMIdZQmTIoCS3xvvtyjDBpIyD
         6mrM/2W9PV/3O6rRc9DwpxVazasK7nGQGxy8pId0qOExv5f/YAWIglbxABCZNvFo95rS
         vqAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Asx1+gC5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id u44si1335367qtb.5.2019.10.07.01.49.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 01:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-d31a065.va3-iad.github.net (github-lowworker-d31a065.va3-iad.github.net [10.48.17.70])
	by smtp.github.com (Postfix) with ESMTP id B2D9B520DC8
	for <jailhouse-dev@googlegroups.com>; Mon,  7 Oct 2019 01:49:56 -0700 (PDT)
Date: Mon, 07 Oct 2019 01:49:56 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/d1ec5f-8ff311@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Asx1+gC5;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/d1ec5f-8ff311%40github.com.
