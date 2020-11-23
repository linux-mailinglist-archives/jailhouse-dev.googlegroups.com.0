Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPWN5X6QKGQE3O2NBQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2972C009A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 08:37:34 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id d2sf7079375wmd.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Nov 2020 23:37:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606117054; cv=pass;
        d=google.com; s=arc-20160816;
        b=cPl9tJyKcKPReQutSOMVM4XVyd+L8BOiAb7VNgPGEZs6fDoOTeKUufIk9nega63OMH
         8HhmlksQKZuBX1TyTe6GAOjskGlGpAgPv4UP1oiFMR4fAmqIr3goWkcCP78Jqb12qPWa
         6TfBZuJYl80Gb/SR22Q9QQamE6lcvbBD2OplU5Y20eNmXO2ZFxzUSE6P4vJDZE23xRX7
         dUFL1Slt6zwCpkbA0GncMnqtvQaafKdD1mCb/gN66foRK6GQxDMIrdAx2gV3Ax45KdXR
         okUPs/NOyEI4bnVYpttDsWkcFqvWgIPuKntMSdSimI4+NdDINJYGYcFA2bGC41IQ0c69
         2L+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=HYzAOas+qeNuPEChyQpsJ5Yc19HI46dFi9GdJUWul5k=;
        b=0Z21UyWY93s9/6jho0A75FVZlv4lNAqEIjK+4gPTE8xyOojSwxJfOVfKBGN7MqQOpL
         xwmSgIPwrFE7yF4QtVKscMh8MbGnZBNlsB3K1n+i4X3qqQNo9xVYIEN0uBs/ciKWOAXk
         CrDUl7mbTix8VLwX+EL/x/hs4467c30dRYozHftpCxSaer/kMfpU7rNgEMJXsJYo6ZaN
         se48t+8fI8as2GG+16u9LJ5hvhPnrv0Ss2Z8iK8Dk7qkdUI9DAwbc1rfVjEJO3/GqV0I
         x0ZgkbZQx1PS9Hg1oqSPT1Bej+s+YPvJo3xq/6L+MLyJE9SYSUazXwTxrnsOjxmA+tNF
         4a9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HYzAOas+qeNuPEChyQpsJ5Yc19HI46dFi9GdJUWul5k=;
        b=UcXEl94mFgZkPWlx1k/vVEYsuHcdEGrJNIlQFwO3PgJfuunBtTsxaa8w0EH9Lt8ZhH
         TzoFBtS7CHZCYYh28dGKjqVY6pxPI9T6O8SbxrtEm6VA1D08COj6R1b5+0uIotj2KfVI
         YaqQuEKtLnrg6ZXNVn6y/WmMxpO+uLFqSflLPX3q5CDkwnKDe+onFROgUeQpRDMB6fwV
         Kv9WKnyindgHVpo5SZplZnOsgDOW8E26cXbAMOIfgsYIHpRZPQcZckFNmpc5u2oje6cb
         UOsLw9veZa0JcpdC3zSlZ25sqI03zTK2smDYEy8LbCR+yjhuFPZdncVIlFT6WHhoylcc
         BbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HYzAOas+qeNuPEChyQpsJ5Yc19HI46dFi9GdJUWul5k=;
        b=ezqMtZ9Al+KGyZ5jNueTDf4xV15/+z4gOViFIDnK/fxGat1ARxd8eVjmIB3J8g93bj
         FjIRBnnC5Bb2Rw1Aze9MpgSl3ZcSO1rEtVx8xO6uCVDUBmW4EVQgg4ULwKcJ5LshKIR9
         JFKD0a9jt2WctofGW3cZ4PyTg4jdiIHJ7T/p0Ok1Y8pivOhD0ReRneGHM6UTY3mUKbVy
         qXzCAO6xJAalyp3+S+9K/NMc/NkPQ8uWLAkoO/DFcUi1sxh5SkGPSjZr+av7LlmAU4nf
         ADxghMVRC/oLsc8XajEse28uooQOGJVGluGNV63XAlGqlnY0WH9dq0CWgEfw5laUctey
         pQaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530No0dItSMsVwtUX9XUA1Tth23zYY5Tqo/w0wnTbybB7bpuN413
	nSkJV3/9wP1+iLx62Y6rFGM=
X-Google-Smtp-Source: ABdhPJxFrcE/6yAM8nhOmrLNXinnh4z/jxzQ70wddPiqZO8knGv7DMBkb+kezEcY4r/jGHIyM+POkQ==
X-Received: by 2002:adf:f24b:: with SMTP id b11mr31177306wrp.342.1606117054578;
        Sun, 22 Nov 2020 23:37:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d14:: with SMTP id t20ls2542660wmt.3.canary-gmail; Sun,
 22 Nov 2020 23:37:33 -0800 (PST)
X-Received: by 2002:a05:600c:2512:: with SMTP id d18mr22690967wma.153.1606117053570;
        Sun, 22 Nov 2020 23:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606117053; cv=none;
        d=google.com; s=arc-20160816;
        b=OyNy9p0+gtW3z7PkIeBumW3uQuaNRNSOBf8LByD8mvnGhV9dHK2a6O8yMKfRz60ghD
         F1J92sxQnZDOQxaJvjAn/Gw7rnl8ONXPpFTjftqX0mb8G46zTFl7sKNYBWdnkw/0sv/D
         /LtHj+W6OoyJrUtDJwqXuBdH5yA0VYBMa/FK6wFbQy2Sj/FBmYJdXD92X4fcSDaee4D/
         PZ7KbXEgGKNmv+Q11qzupLzqnro60AbaFyGfPVzO6eQ4335LMn8vYd7PGbaK7QseLR0S
         AlhxLlHgda2ikBF6GUQeYEAcrtnF1LrApKJupLgYQ91Q003M/0XmPcv49KYbILdj80q7
         RM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=RMPhhiGCaaV6qamZ16r9tbgfhlQEaDIyRC9irUsPNDg=;
        b=Uyxf0Xjz4BV/WzJwswe8HFxL6NmCN+pVq0hzp080fwVT0renhNvk0bdJ2nCV5Dbouj
         ThElITYK3DmMvOh50YmvDM5ERMxN/g5p67slxLcynWajfikHGht3TRnEcg4KiQ9LmZUA
         FTD0wN5ceDZy1rYEFbxWQovT3CocBv1JFKCeP9NFo3376xOwy65BGnrKaFHoT3CxoPGx
         dd5qdH65/Oq560/JWHoPOwMtNzRRHwbUfLxtAPakdjTwwkL/zlrrf0mfyDkrImf4pGox
         71uF+jgtiSnvhv9ARh+IbJJCW8GDEFlGxlXs+1SJiSj7J7x3GKUVoeo0Da6XhHlPyyhv
         DFbg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 7si471398wmg.4.2020.11.22.23.37.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 23:37:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AN7bWpF019292
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2020 08:37:32 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AN7bViH001038;
	Mon, 23 Nov 2020 08:37:32 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [linux-kernel][PATCH 2/2] ivshmem-net: Fix and rework carrier
 management
To: Jailhouse <jailhouse-dev@googlegroups.com>,
        Peter pan <peter.panjf@gmail.com>
Message-ID: <62ae1173-ee15-c179-8fcf-735527a96027@siemens.com>
Date: Mon, 23 Nov 2020 08:37:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The carrier of our virtual link is supposed to go on only when both
sides are in RUN state. So far, it only went on when one side entered
RUN by being int READY before and not when RUN was reached via
ivshm_net_open().

Fix this by moving the carrier management into ivshm_net_run and
ivshm_net_do_stop, respectively. Make sure that netif_carrier_on is only
called when the peer in in RUN state already.

Reported-by: Jiafei Pan <Jiafei.Pan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 drivers/net/ivshmem-net.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
index 1b22b1cc5ea3..56c2c87e7498 100644
--- a/drivers/net/ivshmem-net.c
+++ b/drivers/net/ivshmem-net.c
@@ -549,6 +549,9 @@ static void ivshm_net_run(struct net_device *ndev)
 	if (!netif_running(ndev))
 		return;
 
+	if (in->last_peer_state == IVSHM_NET_STATE_RUN)
+		netif_carrier_on(ndev);
+
 	if (test_and_set_bit(IVSHM_NET_FLAG_RUN, &in->flags))
 		return;
 
@@ -567,6 +570,7 @@ static void ivshm_net_do_stop(struct net_device *ndev)
 	if (!test_and_clear_bit(IVSHM_NET_FLAG_RUN, &in->flags))
 		return;
 
+	netif_carrier_off(ndev);
 	netif_stop_queue(ndev);
 	napi_disable(&in->napi);
 }
@@ -616,22 +620,18 @@ static void ivshm_net_state_change(struct work_struct *work)
 		break;
 
 	case IVSHM_NET_STATE_READY:
-		/*
-		 * Link is up and we are running once the remote is in READY or
-		 * RUN.
-		 */
+	case IVSHM_NET_STATE_RUN:
 		if (peer_state >= IVSHM_NET_STATE_READY) {
-			netif_carrier_on(ndev);
+			/*
+			 * Link is up and we are running once the remote is in
+			 * READY or RUN.
+			 */
 			ivshm_net_run(ndev);
-			break;
-		}
-		/* fall through */
-	case IVSHM_NET_STATE_RUN:
-		/*
-		 * If the remote goes to RESET, we need to follow immediately.
-		 */
-		if (peer_state == IVSHM_NET_STATE_RESET) {
-			netif_carrier_off(ndev);
+		} else if (peer_state == IVSHM_NET_STATE_RESET) {
+			/*
+			 * If the remote goes to RESET, we need to follow
+			 * immediately.
+			 */
 			ivshm_net_do_stop(ndev);
 		}
 		break;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/62ae1173-ee15-c179-8fcf-735527a96027%40siemens.com.
