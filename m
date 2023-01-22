Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAM5W2PAMGQE4HZH37Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A36771E1
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:06 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id z22-20020a05600c0a1600b003db00dc4b69sf8239872wmp.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415746; cv=pass;
        d=google.com; s=arc-20160816;
        b=D7nm9efs/UouPXK4h4PMTitrhQhEVLtsnVUQMlnoisrA0X9aIjOgw5RT8si3RTSxVm
         m2517Jh4Wt7+5MGNYfrajCd4Xi7VS45vVESJLoAY5u/iZ40dKm+VBHUaA07xE/G26hAu
         +ld+tQSQxFFv3LI+qtZCILFNZWKMEU9Zm1I9BbNgJu8zlH9VPuWysqfQzdZP5zvDoaPS
         oyfFwZEPkQkcwayswTkMKIc8JDoU7qJMlbIJI5d1+8qKYSbo29H2AG3p3wTuPlvzJf/+
         faRzzvBIUSdLGtERe19GPY23wzuUFNPgksfBUdTcPLePSz0ea4qt2ezSZvVpk5dlQzDZ
         Pvtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=BNumL+YlCB8gqwpJYTIDYDjeb4NeWXO7yxdevDahx5g=;
        b=cCO0IFGGHK31Y367L6CKq6yu2yOe+hHu6BvqxP4eLFTIe9k71hDm3IL03DlW0rXEMA
         +rDF1I7dxlRJ+hO3WRlhGWN5FbAO+pcjz/Kyto092fMETJB75JFY/mlPoR5L+295V0LQ
         z2Rt8keTKkHQQT8z31u8Ri3BenIazEm1rOpwgdmMDKAA/a0dFKRwXUWD9miYxY6ZjTou
         MahSB+vXbq+zwqPROsxhi1+c45/gb1CT626r8sw1fa/xZc1ABd78wvpurYyul6aLc7Mz
         nxxX0pjIdiWo+MNeQZH5o7GBU5bbpxT+0JD/hTF4nMhtCXQfoB3DHs+zc9wcE311FPqz
         gpMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=kaLR0ZnU;
       spf=pass (google.com: domain of fm-294854-20230122192904efc45144be1bf12966-bjb_j_@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192904efc45144be1bf12966-BjB_J_@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNumL+YlCB8gqwpJYTIDYDjeb4NeWXO7yxdevDahx5g=;
        b=F9EgOAkndIiyi+dIFyBtMPXApiG6qUCWmMJ4+okUJk3Npp+V2tFtw7rl7nJOEzPz5u
         VmJggCboQAjH9PuO0xa0TJfOLWZCPKiG3tflKILVJ4pMV/G45mn5KOwQ+ID7Xtgol37Y
         0sa2ynyYYxPPDlD8E0/aaf9xWEUhH9QQeDgwzbdluBLoeDAHOOMoi5Rrpd3yDmnDJFrR
         Bq4EVuPOIvmh7hQ0SMq5x9yydjaPuc64WPscR5/Qq0JvxgzBlov+kohCfQA2cKTr7wjR
         jBtLRWwC8cYKdS4tGlkYFI3IP+T9mYz/83y3jBqoanMKKKnGowi158dhjdYulY+VWxRo
         Wufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNumL+YlCB8gqwpJYTIDYDjeb4NeWXO7yxdevDahx5g=;
        b=Ku6+UUvFRLjPa0QsfSnInqLHIDc1mAqoPiRnjpxj/cmvbXr1CEbXX3Mm7JXC2wEqr7
         RD94jXWyjF+dvcGEo8queZSaU1GINyMzaxvi0jku6u8rXOa/UNj4SLit0NnVo2bzOX1y
         Z/zbAp3GsfKznViTmK3KMx/KFAD10LpUAL1KGN6J0CDciXvflyJZe2yOQVDJTffONCWM
         iFJhVDqc3OauVISuwU/Ysv/C3Ck8cAE2iCiVJPv3JFbQOCh3n47i+rQ3kMxHUKNk06xM
         mANLgr3//bsaPmpqW1ZoeqwbEldO/PFwq9A5y92SRVT6Q4MbEFEIj3JnkFKt+9PAnmra
         zb4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpdXSgg1IskYns3D2guLiBeGh24g45qhiH6uxqZ3Y7p9qlqeIDC
	RGfoI/OpSLsCnAKWOy3XAIk=
X-Google-Smtp-Source: AMrXdXvG3x5LXOwF7y436Tik8xtWAw+4Engc8DaMAsW+M48PaCADQbuzKFWbhly0pe8FWcasfSpNhA==
X-Received: by 2002:a05:600c:19c8:b0:3da:f464:6618 with SMTP id u8-20020a05600c19c800b003daf4646618mr2105837wmq.196.1674415745986;
        Sun, 22 Jan 2023 11:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:e909:0:b0:3d9:c8dd:fd3f with SMTP id q9-20020a1ce909000000b003d9c8ddfd3fls5350079wmc.0.-pod-control-gmail;
 Sun, 22 Jan 2023 11:29:04 -0800 (PST)
X-Received: by 2002:a05:600c:1d05:b0:3d2:3be4:2d9a with SMTP id l5-20020a05600c1d0500b003d23be42d9amr20494443wms.20.1674415744647;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415744; cv=none;
        d=google.com; s=arc-20160816;
        b=BcsWB7waOsC/tf0jouN0ZNtmQ9uyX98E/jUCgdYYvlP5qEMxNzcY20j+JKi8qrTmKW
         ZFLwcroiKSKg+QgaJdf5q87FUFVzjGTe0VfPb3OehwmvgdSuGrVwAWC9pq180pXUdVXQ
         UtDbZPsKFojuj+mTRB8MdI48Q/j7C/cJAPRdYW/3Db3Z2rdTNKi0Vft3nG0TdV4ivszX
         w5oqetgoy+CnvffAEWRORVwnGNMT3x29NI0UYvJLxGLQoO6Pl722YIaMiD7vCTY2cqI8
         LkWhrBOJujfc+IBi75uO/LDXyXetqD27GkT6gx4I5TLOBtRe4omuJrXGkjYjAnbj1Ghk
         1B6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=3H14qniHFA0SsSavRESV9Q4caynHCqiG+766Hxpej2M=;
        b=d6fSuQ+AxB6hOuSbGsAjEfbVBLQjV04PfkqPH8Gm11tG9mFXPkAHBR4eyYPhPcM4H7
         6/PGi6pBf1WFAQ6H6tzxoxtTeczXnfxuyXneNdCKAr8DbCveOJuHXITwe9lX3SFj52AK
         B4SFDvweVdUALd9tzQPhIhI/4+KM3Ts3sc7BRcw5qw6yzz/WA2iKOgzBvANxxwZHQisC
         L+OV5UO014qvZibdNs/H9QLKru9Ap1ocndBYocyJ6fZrbCDORQlU3NCxJtimcd/ezI7g
         wXKQWdaiKEc7UblIC0c2aWciSMAjvqQl0CRNgJBKreitvlQ+vaiaFhCyh3GyRFD15puF
         T0Jw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=kaLR0ZnU;
       spf=pass (google.com: domain of fm-294854-20230122192904efc45144be1bf12966-bjb_j_@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192904efc45144be1bf12966-BjB_J_@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net. [185.136.65.225])
        by gmr-mx.google.com with ESMTPS id r6-20020a1c2b06000000b003db0037852esi637170wmr.0.2023.01.22.11.29.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192904efc45144be1bf12966-bjb_j_@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) client-ip=185.136.65.225;
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20230122192904efc45144be1bf12966
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 14/14] ci: Update to actions/checkout@v3 and actions/cache@v3
Date: Sun, 22 Jan 2023 20:29:01 +0100
Message-Id: <90300437f01918e1055cf4674b506ae0e10a80ca.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=kaLR0ZnU;       spf=pass
 (google.com: domain of fm-294854-20230122192904efc45144be1bf12966-bjb_j_@rts-flowmailer.siemens.com
 designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192904efc45144be1bf12966-BjB_J_@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Silences some NodeJS 12 action deprecation warnings.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .github/workflows/main.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.github/workflows/main.yaml b/.github/workflows/main.yaml
index 1dbbc648..eea15f37 100644
--- a/.github/workflows/main.yaml
+++ b/.github/workflows/main.yaml
@@ -26,7 +26,7 @@ jobs:
     runs-on: ubuntu-20.04
     steps:
       - name: Checkout
-        uses: actions/checkout@v2
+        uses: actions/checkout@v3
       - name: Install dependencies
         run: |
           sudo apt-get update
@@ -42,7 +42,7 @@ jobs:
           tar -xf coverity_tool.tar.gz
           ln -s cov-analysis-linux64-* cov-analysis-linux64
       - name: Cache kernel build environment
-        uses: actions/cache@v2
+        uses: actions/cache@v3
         id: cache-kernel
         with:
           key: kernel-build
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/90300437f01918e1055cf4674b506ae0e10a80ca.1674415741.git.jan.kiszka%40siemens.com.
