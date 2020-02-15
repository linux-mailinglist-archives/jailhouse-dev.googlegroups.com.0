Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOWLT7ZAKGQETJ2ARAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B28C15FE6E
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:11 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id r1sf5641905wrc.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770171; cv=pass;
        d=google.com; s=arc-20160816;
        b=TyHYxRbipTRaG+K3i+i5SBK1W/mLuePAdQhPkQ51T7bpn5kf+6rpIp/I1NRSaZwBOo
         nyewke5/slQC5UCmKZbD/RAHGYxSJXS/n98zi4CGtlfhk431o9uLlQEgDZKKdBCmzjvX
         3ZeF+gg3TK9th8W2zdew4GH4yB1xt8UzE/Bg+RkCQQYqWh0YCdNd/di/XgGjFF35yvTZ
         oJtf7tPvArJv7LkBGA9fG4uUb2LCD1zg5vHASiismxNEAxdWedbEZ0G0KMoa3yUHdAe0
         dQDMCnQwfBpxsdSddqvT4qSPKVsGyq5AL/MUcJORQYX6Rv6+8C5J+Xr0hbIR9/yJWgpO
         h9Yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=jMIgBwxwpSVfoIuSNUXpZu64x7Gm1pujAM5qIwjx3xI=;
        b=s5/DndhHxSGVYSwA+hInrPJbFuq4RcYCsiwtGLyw34o6iG3W1D9fhkOtk5lYUHYRv9
         0UohwD/f7O1DsOebA1RmrEzw7spSQWQOZT/2veThy0UekrySlAIduMvOjjbsEqeFnAuj
         DeKVxAQuAwHVfRnrvE0eDp23EqE9mF3vEVpLVaAdqaMqKzdkCt12AeIHTlGgAWPr9Ucu
         0X1v5ZAEy3rdniNzgtlqMWxfmXjfdn/s5PnCD3Umb/zciIsoHgSf+Q3GZetkHQx3Gqqu
         zbJsTTE3M7iLnZo2TGaLXoRsBzUlfTohViI0/Q1MUJTPBRSS71g6ksr3naZTjkrIaDyI
         0S+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=quB6BT+c;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jMIgBwxwpSVfoIuSNUXpZu64x7Gm1pujAM5qIwjx3xI=;
        b=Vr+/xPfTCpX2OenlSZ0J4O1lR5C2D+DSMUtedKf8Ui+x2PCmF6a02QobWrcub8Iv79
         1U8KJwUjKU6Ha0Osfdq7bgTU81kXAVRdIAXXEvoWnlDhVNLGYUIxMcBR+JbjIUNuWOtC
         Zy/K6bNZsBF7jbUE0kRYImRpknYmN3dPhEHV9ruVZdqDFSYb7/ahkR2oq99cZhiA1HTR
         g8d7cyKYyX1odlReaYS5fL+WRZey0n+09+rE0wLjQl5/G+d4KG6PrKHdvbsPtuQEgD1n
         7dczRBHMXGSP+c3VMo84IKYzIT66wbOApHCk9BioN+5U6BX2of6otzMDnCZHTWjTXnUF
         iXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jMIgBwxwpSVfoIuSNUXpZu64x7Gm1pujAM5qIwjx3xI=;
        b=nUTULogcH+mYp3CNuF2+0q9EezJYBuzw52ywgoo4/JQQTQhOIOadTdhgCT2jthHkH5
         kYNyF5h1WL87dD+dB/zs81bMTtoip3idJGEON72mH8xjRBY4ZXYWSAu9iHKdry0yQa9B
         BVqwuu18nlSQcuFrBP5lR+YNv59QeKUUOVsmQIO+LCKTZuv1LW5lUEugxLFaHytguDbV
         IVcTRrRsjleAZZ+YrXckUH4rTOw5KPo2gtv6MRZGsO3u/qZrIuZp+GtGAhZS7CbwdDA9
         yNxJ5sUQrousU4pjVS7PWTJiAO4gOzkr9pTU5H+41AO0bKfLbu/4DXj3gAdx+SheaHLl
         5Zww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXJq+DARNRa0xiRMI84GPxFyUpzLfXuF1Wpuz73m92cjgGoISFs
	yrulyFvT+A9KR+to2zKy0Bc=
X-Google-Smtp-Source: APXvYqx0QFSW9v9WoCl8kdgcjhoxP6/vgLp9TfsPXZenNUTD4Rsb1FyLpIEAJe5UgXHu9FU8a9op5A==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr10491916wru.170.1581770171000;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c452:: with SMTP id l18ls3016304wmi.1.canary-gmail; Sat,
 15 Feb 2020 04:36:10 -0800 (PST)
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr11094847wme.21.1581770170459;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770170; cv=none;
        d=google.com; s=arc-20160816;
        b=F5D/CFQbM8Qk7u4u9l5fZurkzIvaer+zUDXF+POXjwMgCYLClnHnVG3tyhdBbcpImQ
         OPsvVVpkcUKE+gyZ1aoeD2l7o6jBsn+FOxGdu3y1jcpfixJRHoi7ioml2S/y35ED+Jc4
         tRbayqxCxUxmCIuwRvimx1Osg+4xIu5atw+vIA2Bc+cOutYP8riVWfxucJVa48gO+zso
         zVluvcuESXBVaXt/9obp9Vo5MFlBpS5378WlGuWHqjppucasNITqctojRdRQy2sXlITy
         WZnYutsez2JuPeWMlKM1prz0adTSpxHGIPPuOI9e/jX/Ej7yYQ1Fr4tQ1mMJeJ5UgseX
         8quA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=6EfTzLZZUxkLYYn6PWqPKORDHGsPamyVsjA7Q/FSJY8=;
        b=CF6+lJ3zKvhnD2qK7V+Q5Kf6DfhhUq27UfFCqZVost3QgrAFY9CUdp5CDcW6WnB215
         2j4K5eXoJU5yVlnTUOV8HUGdBur9na1TiA44iAh0CZqi0tjOUltXrIhRvP6zPPASU/j9
         3fMz6cB93ZDbahJ98ZlXKASlyjKjyQv6rDCr66HvxeOwxfbnNgHR+zM1WmM+uAGE/1dO
         H0yOO6K5MOfxlnukgah+ZzqU/DGUiBSuWeerk33vs8DelUYd5VLwn83IzU9uB5O+GkgO
         m1GZDj4KGV5G6pJXrEIukojvBGZbC8RKyxlqkq8fGhp6OuoIAsYPRMXHl+KicZ0DNgfy
         p5xg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=quB6BT+c;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id d191si287418wmd.2.2020.02.15.04.36.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MMWA2-1j7v1D4AXO-008Kz8 for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:10 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 05/12] x86: Remove no longer needed include from asm/cell.h
Date: Sat, 15 Feb 2020 13:35:57 +0100
Message-Id: <63c63da94657899e809416c1a56493e8ecc9507d.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:xh+MqUjFviSfSLad0nOvlhOkqa65FOa4ulQyIwCgaEgfhZC7OtM
 Tk8suftsAwrVrpi9/2Ez+3NeGgsARrXe5veEzx3aZEAqRSYjq6WmT4mJUkruLmja4yLvpFm
 LdjQECboBEe86QxrKW+LRBo5n+2Fc9XpOYTkFjyuGowhnf1h24lYh9d3FwSjk3QR31nip8/
 I3zmidLp059qdwAscYEYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sGkfzlRvdpk=:yMnzkFbWxGl6E5+9sgTsHs
 VwD2iDDRy6YS9wVXmSsIWAUvbuzCM/pfp8fYxreWpswzE7PqzmyPblzVzQR4b6BSo/pPXhsdY
 PvkUz/bLg9j3Wqu7jumPJZ01IEBpJa9PW3mag8v8i2Hl8cypqzVxbzHZQ5nS1sEe/KvF6F5Ix
 wWKKU+/iJKJurYPIVZ4V95KWvkXDbjdJOPD7ffra1QAFyHUZen47GoquxfFuj5jccP3fzVTtg
 Nsem05SNz16RXbnFs0wAw0A4qetyRdmbU0VOkrUfothKL9dB8fBo4I/X4shvRi/AxdRQfy9UE
 sVy+fs/Jbjl9+auIRm400HCjYn1kQNOfSlBrMA0ubwiLuKvSLmPsAJinDY4ghs7L/M/JoY7mQ
 6PhTdbjo76LAIaIJFI2NN/iWBoqquuHIbAn2X0PXH5KRSbRy1VI86iK8khRcplRaRHhWxG15Z
 sRBJzV7FsO5+KPIA3fPLSvrNxYL5fFLrBXNN1RTdlY6hnJDr1OJ4cYkd8cxDXoDOxlS3NlnJ5
 uNnErxpESdzQ2Eq+Rfz2oKLwDcaWjElP8sQ9Tr5TjS3SWwJhd4tDFoT5SrKQFQ99Xmx0m+yMQ
 d7q2AMNiWwJAPSwjX1VqLEK5QGQSqBskJcx2HXO4HUK42IDAOotBphvPSTJTyxWvf5z80TgG4
 zS1+a1IFCzsoXMnAuQHHfpjQUSi4JGLqKyVlYk16npLqRD8Iijoai5rE2xt/xQmTwpxSy18Nx
 j02RjyfjU3y2YKI2/PVWIfm2o2gk2+ObR4I2WSPIO2Y2+M2oY7avKVWZsrKIvMbGjRlXITmDC
 zhlaDJazN6Vyz2MR0BUv2CDeycCjW4tBahlqhwfG6B0A0GyNPZ+WpH4DeUz9k0llH4v5APGPW
 /7lhpQrjR1fBTaT2cSW8mUPcwq0LlZmFPa4WveYRSfISKiOJG0//wwYv/Uj35StC+Lilr7oti
 D4/51qRGimBuRcHJTSkepAf0fj5D7v86xnGRv3sueRi1JGYYk+A7wpbneR+7S6BYJVsi/Qk+V
 jzsOwgl6ksxmT53YVAcXAJc2J2CutxL6hXhyN0gQvE9pVR3gjuV/n2/eeLtiGpUJWFYijK7/C
 ZG3eWF1uBtmRNzhLc1K+7fKEePg1sqO6z01VaAAVnR2nIWYVM0OobbJ0cuEHBaXjRR/DeuFKm
 MpiUSv2Ud3M6tFHDwU7uHQC9bvAvftZF9EH/0TjyTgiG/EvoXOgSxIsznOFuvGIUi72dSdfpz
 hZtdnFxVvolyXEyJ4
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=quB6BT+c;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This became obsolete with 018f4afa844b.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/include/asm/cell.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/cell.h b/hypervisor/arch/x86/include/asm/cell.h
index 33697498..6c5151a5 100644
--- a/hypervisor/arch/x86/include/asm/cell.h
+++ b/hypervisor/arch/x86/include/asm/cell.h
@@ -17,8 +17,6 @@

 #include <jailhouse/paging.h>

-#include <jailhouse/cell-config.h>
-
 struct cell_ioapic;

 /** x86-specific cell states. */
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/63c63da94657899e809416c1a56493e8ecc9507d.1581770164.git.jan.kiszka%40web.de.
