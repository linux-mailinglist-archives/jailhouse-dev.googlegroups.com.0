Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBLUXU77QKGQEDRHIASQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x140.google.com (mail-il1-x140.google.com [IPv6:2607:f8b0:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id B75112E36FF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Dec 2020 13:12:31 +0100 (CET)
Received: by mail-il1-x140.google.com with SMTP id f19sf10153886ilk.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Dec 2020 04:12:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609157550; cv=pass;
        d=google.com; s=arc-20160816;
        b=GJLPTJpGAA3kUBtqyS59h6eCxCgEqPHLZoRusTkIf78Ahn0tzIS6ceF7Ug6pq8ISEM
         58keAgBGuwp5cq8REfZbwimTc1Pbhmr/CnQ3nTZ1E+HTMqSLH4gl3xe7eZ+ppYUs84k8
         lreedKrmZ8z735QGAaN326F7vmVp7hGuy/OTBLSfKWFx/aSnBwy/k6XxVSsuP2UIqnmH
         lRhcb6ubQBp8/Hkg5hg8wVYyb50k/Kfaau4UBL0ydLMnVl6x5k3W+bBcKPsR8xc3kMG3
         IXbWZO5WOBAs+PWMAqdxit2FgDeTtTa3Bl7vkjpXqy65tZxH8SBKfgT73sT1scUTHDTZ
         h05w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=rQGmd2RCj308hIo3lGlSOjh2iCTNrT7dAuvWtGH9wPs=;
        b=pWLLYEj6pCtRFAM1cUkLVyfg8ZpoDSVNjEcgkWcMhsks7oOp/bLKYdF/2Ype0h9JGl
         tNUtyvpm9ZTDWi8RnmFWJC6/KQcL+Q6Qu8L8lLcVLKgumoghmqyPLHw/8k7a0p9I0rTb
         IcuPBcYhlHZ3aSvRgjDe/Oq4qmawK+gzC5JLGvo/2xt4oKIlpJGBrOHkWaXmm3DabYbg
         RvkJVJPb0+XcDoOWLdnE6bN/wzVXa9P5BFCZE36dTYeC3C+3ixQrSVo5R3890TeYE9gr
         xcFkKZa1Ft6HR3p4TRolMm0vUCgMDjoMK+F7dIUAVsJSoNcYzya2Qwl1FI+JWBxFR8u2
         NnSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Kp0TV7R2;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=rQGmd2RCj308hIo3lGlSOjh2iCTNrT7dAuvWtGH9wPs=;
        b=rSSsN/PaIuLTnb2Yte76bRs6Ntv7TPYmyjBRSBln+FYGDYoWonjv4wAStwYzZ7wfun
         Rk96OxVhEDxAWihhOqafdBAPS0FOdn2lAhT/vPdXjWSDEx2Z0ygfEyZLEjAQb8ps0L0J
         K3VodNf0jtnkZ13t56sc7Mwf0qjTpV+tA9txscifRlg/k+Rf6IIrd0bdHVjO6LNSYyB2
         1192FTATX269G19/oUUcyScqxqkxF22H523cMgIGQ7Ooxy0olelqrf2NKEkpPWPRSLBf
         JVf6wuU9bXc0nW3pDUezyD56+/7op5azAaGi2dGpH6IF+ABbf5pvWa3U9Zp83h9Vhn1U
         HAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rQGmd2RCj308hIo3lGlSOjh2iCTNrT7dAuvWtGH9wPs=;
        b=pEDJQNqAbNXsUd4w2IXH8x6tbLG4sXN1Cv5SkSlQx+YiNXvIS6Julv2dJH1HAG6pzb
         /5UcyE+Yeo9JvIA39sJPNjuotE9rAMsVHyE0s2uDIZJHmufgOaUkeFQUheelVLXA1Knu
         sXT//9xR11VD+rF/avO0ZGNDCZXMlF1QvY7wdXAnoBiw1FYXo1B1nbnVRm8+Ccs3n3b1
         +ldnLO1lR5HVVqxwwHcTmolAVQRcwRG340rTQZQTjZeC6aORaX5jD7mDt4r+fkwG1Bj4
         XjjHsxnHNa0WY2lhlS2JSKciH9oTiPpaLysN4wKbkWCm2srH6kD0oE7IsLGIvDYlIWad
         qgig==
X-Gm-Message-State: AOAM533K4Lco7x0LyZJXkO36pw/NAocXHaVEglTFOEy0R5OQCXIpNq7s
	zmWELAwGy84jrjV7UsmCZC8=
X-Google-Smtp-Source: ABdhPJye/kChy/WnBlJF5DzFbmEPCLbVqtCop3jkjaE1VyU4krE1o0vTayLsv+63rtvZ0lmS+x+i9w==
X-Received: by 2002:a6b:d01a:: with SMTP id x26mr35939526ioa.11.1609157550802;
        Mon, 28 Dec 2020 04:12:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:9914:: with SMTP id x20ls8835142iol.7.gmail; Mon, 28 Dec
 2020 04:12:30 -0800 (PST)
X-Received: by 2002:a5e:da46:: with SMTP id o6mr35975995iop.139.1609157550221;
        Mon, 28 Dec 2020 04:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609157550; cv=none;
        d=google.com; s=arc-20160816;
        b=siFUddxnP7cxBbikloPZp+DqCXz5dC5dpPPCChYFcIxDir922beEUpZ+K9yfXiORSU
         CvX+oEeN/V27oxb4XYQG1PUZIUijwJWYUmeKfyk/HvkdJDAad5opCIRw9Z4nBfbyubRt
         G6/Rn7kcUzprcvzl20kEsuRzcCkiEp5yKnA7iBWXbnHK98L3G0aGuroq3KoDWAuzZ3wc
         CLiKM6y9QevwX1uem61PFCE/jLmpaLsp0e1ZhPnOp4ykX889KhjUGRVfI87z0vJP7TCz
         3672EO5fuEnnQKK3vocT2wIEQIHVn0tj1afVvdMcIbbHIZ8AE/UysvLgFpP0ya+NSX/4
         m4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=pRwO18NAKkGnRPBsMIM3Bqsh+sshl2kdgvYfiZ2AV14=;
        b=MAcQyKG48EDdS/kmjqYQl8HxKB1Ojurgk0JbYoVuPiMskCuFYCJqHlKQXZzNda3CBl
         12ZIiF3f/WpgpleykQTMwZX/I3ILJS2E0FljUe6HY6UhG2Vg0p0RfRLwQ/hx/A25t6ZQ
         gTiLlzajhoHWCjivat/tAW6atE7PQSDTVUbfRogeAoAB6UvBAMkaEbhwa35AeZklQ7S3
         6Vke6URRBnKg0cdrG8DmPO4Erii0VQ7RcOC9qdBqYAUGPQXk+Pr8Nn01zCca8fMUL2cX
         afAY9WSTzGk3kwSrvuRaM/IlKnHo3c3r7XgCDyw1UI8gYTgfOwRwgePoosnJQG+h2pYC
         58Kg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Kp0TV7R2;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id r17si3319310ilg.4.2020.12.28.04.12.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Dec 2020 04:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Received: from github.com (hubbernetes-node-1b47257.ash1-iad.github.net [10.56.110.71])
	by smtp.github.com (Postfix) with ESMTPA id B8B2C840A86
	for <jailhouse-dev@googlegroups.com>; Mon, 28 Dec 2020 04:12:29 -0800 (PST)
Date: Mon, 28 Dec 2020 04:12:29 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/097bed-5498cf@github.com>
Subject: [siemens/jailhouse] 5498cf: configs: arm64: Fix build of k3-j7200-evm
 dts for ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Kp0TV7R2;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.208 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 5498cf9f50136ce16a661677cdc1bd3b35aa03d1
      https://github.com/siemens/jailhouse/commit/5498cf9f50136ce16a661677cdc1bd3b35aa03d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-11-24 (Tue, 24 Nov 2020)

  Changed paths:
    M configs/arm64/dts/inmate-k3-j7200-evm.dts

  Log Message:
  -----------
  configs: arm64: Fix build of k3-j7200-evm dts for older kernels

Went in unnoticed due to a reporting breakage of Travis-CI.

Fixes: 4fbecb507cd2 ("configs: arm64: Add Linux demo for k3j7200-evm board")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/097bed-5498cf%40github.com.
