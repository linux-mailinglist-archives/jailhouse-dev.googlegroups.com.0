Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBOU3TTTQKGQEX7JAGQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-it1-x13f.google.com (mail-it1-x13f.google.com [IPv6:2607:f8b0:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id CC11F28C2D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 23:16:43 +0200 (CEST)
Received: by mail-it1-x13f.google.com with SMTP id o128sf6622241ita.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:16:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558646202; cv=pass;
        d=google.com; s=arc-20160816;
        b=VW8JN5L5o1inWP4mphGRfAfV2GlL+R996iUtH82Se2+hSFwl1rJKR3C0R5aTjRQkQU
         60xdfGnwklsSo5RXLDOe99wroegnqvNTRnxP0oGim5Etjdk53CTS9nwn2EU7Qxjl3W+/
         yh7pg1RzNpk+jOFNRpCstO6tad153IMwFiRwr1uHmQi0krI8BLK3NKokDWLR8atbSyWP
         Q/k36WaIGdLI7HQh5kWijAd6WLm8TCfLgj889hlhOrjr/BaTrXYoMmTKyEc+fvtBQjXF
         ACpYS1BfVUcF2zh5wsKQtmNWK9dr8cVedCtaB0jKERz7mFjQecYJW8Av0WSgd9rWOR5l
         22qA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=EGNoS3g9tKXXd8jluOm5cyUg+czG8e6HPAfny3/LyMY=;
        b=Vz4wI0qdl4mLgRAli2bRho74FTzXlQa18Npat2MZiVfTMiN2tOelGHr8h3slPaH/bk
         gj+hFDtG81+4tQ8UM3L6AfFsCTs/vU7oVlrchc91uVvlfoDaE4JrTU57yhNABI8q+OhJ
         sJTCxXsCBnaiCUWJvlPOL9Mrwh4O9O8cXwhNQdCoPXobGLg2Vj8Fu/B8b9o3bL1xumIk
         aBT5fFkNbkb0KN50gQ2+yjMev6mQOtTRkdbX8+8CGAFGkA/+d67kzX5n0I/ffj3jepEB
         hKt6xZA3zw2UwM6gVwPGgG/4hEUBPN5fiWtgPKKtKq6FFRgEZnQ1UcRRq8s61aD3GRJK
         WwEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ri9cD1mE;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EGNoS3g9tKXXd8jluOm5cyUg+czG8e6HPAfny3/LyMY=;
        b=gKmIn1u1ltElWs1pYMy2Az/e1Y7UsypyAgMT/l0Tg0NvWjK1ZcpPcr6UCFT4CVNsNU
         xZ4DuDD1JCn6dpYG91YecGev9PcmSuNGIHaiPZevSL1V6mzlx0mlne9M1OhJxPxlwlVX
         bOG3JeFtAD8d2JLQ2xuvzhnqvYyKWPncWOmKbk+giHDvvN8Jtf1T1VVxki0JltQQeRp8
         kylgNvMIgVgJuCzfKhcF0hqCAYCeRtAANGittGFMqcCR9laFmQlfuZwZuXNGsWsVW/X4
         RBrmoHx4y2jG/x43Ht3L7Mkee+Z1qtd68M4Vo8OdFxIU4Npd4M2mxPVma/jIVgnW4snc
         Miag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EGNoS3g9tKXXd8jluOm5cyUg+czG8e6HPAfny3/LyMY=;
        b=RNWbO0Sy6o59LiLrRIDW2IocgYca6U/tQM0BAshGAbY/rir1+hEhxVyaiPP+9RebnI
         W2L4rXWDnC9oBaDhSJurZ+zJui7IOaUzFLM2VC9lXBBlkkZGAM0PmtYLqSYrxjsMsKB2
         Ylgcsc3vaRgAK4X1tbLEicEU4/BWAmOBafNj2sTxtSnBqZfUiWnCL/hPZpwmaf+1w1Wk
         8pxzSGpJJkAm51MK5lJDOQrr+bwq+Pa1Y7KeSmBJPuf75hUh3JCdiDw51y0GjePrTHfZ
         AxxpqLYAe09+6gr06nX28hYdSax7HGcHwfC/na1Wy4rKgKYe8+Bmgck6na2tePideT/O
         Dmqw==
X-Gm-Message-State: APjAAAX5Q1Opc5gXD+G0YJPHee26BHODXEEp0cNHBgJXwC2kosoQRAz1
	m5trDR+VOUp1oXyLFsXLm+U=
X-Google-Smtp-Source: APXvYqwh3LF24LrG+MGXLpGTiWCtuSWyV6UTym+Ww93GeRUReMu/SKrz4eOKkwJr2BVy1VMKdD//aA==
X-Received: by 2002:a24:e3cb:: with SMTP id d194mr15808132ith.100.1558646202612;
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:660c:f81:: with SMTP id x1ls2351782itl.1.canary-gmail;
 Thu, 23 May 2019 14:16:42 -0700 (PDT)
X-Received: by 2002:a05:660c:28a:: with SMTP id s10mr1503175itl.173.1558646202240;
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558646202; cv=none;
        d=google.com; s=arc-20160816;
        b=I612Czl5oCPs8c7mcH51WLSGtPgne8M1cLewsLez/nIxlb06RQxx1PARkojJxh+TZN
         3erUfRSTp6wCVHaXg0E2hHhb52kv9y4Yj0GU5mxpS2ClbIOu7KsR3CIOSyStBUoI4JhD
         TZsz+UwrGag4Ape/rdoXBZ4d2RNdmn8d3d/r0ptFnrOJVx3IzEXKcNAljF0gBa8ytzot
         ffhycWt3KJT009kQwD0ocQWDHuXWqyNAX8uHx4/gx5HWrqK9t3wRbfBKHqf77IfJZTGq
         dWHTMaIliutBbawGH8Cj9wY9TdhLkyd84klMuUWGGicWCqtM+ONqYRdLblg4//LnjFAK
         ka4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IH5SfDs+JzdS8/PAE9WDiZEfQmynwC7uD17SwN8Kpsk=;
        b=bEijqXOUzo0F2LbJ69JQIBd6yiXQyWsKeK62rjFcCy+uPRzEeb6rcklIBMy3to2Vvf
         uOSylIjIRxJtjywSMe+vxxVKaauJSErXbBLwZOhAyuSh/omVLl+7+IEAT2DkbR7CTkW/
         mp4nVM5NXHuCvjcs5S2n87I2cMykY6fVErWVgNu2HFvhuRg6kZxUL72KvX/gDeLgqlid
         PUTbUHwzVuNYhQGcKNL6SmdnewpIH0nR6FPGnX1uODXLPevZwh5SoUc5SspxSfQsyN1L
         zYoSgcpFH0Ow1I3n/JjOvNXxYDweOBUXexBJK5s8R2vTVEN1nPHRFUaG5Z+IaEfj7uCR
         pjxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ri9cD1mE;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id b206si19749iof.4.2019.05.23.14.16.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfvq066850;
	Thu, 23 May 2019 16:16:41 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NLGfbL022034
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 May 2019 16:16:41 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 16:16:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 16:16:41 -0500
Received: from NiksLab.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfOc116843;
	Thu, 23 May 2019 16:16:41 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
Subject: [PATCH 5/5] ci, Documentation: Add TI's K3 specific configs
Date: Thu, 23 May 2019 16:16:23 -0500
Message-ID: <20190523211623.9718-6-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523211623.9718-1-nikhil.nd@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ri9cD1mE;       spf=pass
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

From: Lokesh Vutla <lokeshvutla@ti.com>

Before building jailhouse for TI's K3 platforms,
ci/jailhouse-config-k3.h needs to be copied to
include/jailhouse/config.h

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 ci/jailhouse-config-k3.h | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 ci/jailhouse-config-k3.h

diff --git a/ci/jailhouse-config-k3.h b/ci/jailhouse-config-k3.h
new file mode 100644
index 00000000..65e02f08
--- /dev/null
+++ b/ci/jailhouse-config-k3.h
@@ -0,0 +1,2 @@
+#define CONFIG_TRACE_ERROR		1
+#define CONFIG_TI_16550_MDR_QUIRK	1
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190523211623.9718-6-nikhil.nd%40ti.com.
For more options, visit https://groups.google.com/d/optout.
