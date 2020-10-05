Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKPD5L5QKGQE3VMKKNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 3253E28301F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:54 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id t8sf1307730lfp.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876393; cv=pass;
        d=google.com; s=arc-20160816;
        b=C7icbENO90gG9evX85FwN/2BrcakNfMPsG78saZTfm3mfoe7kQBC0oK0MbvqUdNwuu
         FKuuxnoncDi9ALHZbzBFme3izqN0XuNTpmzAHXdXOmA5EM+9WmkOWAiL49HDXgTxV16G
         e1RoXsdxbykoYmh0JpTbZArQv/MNcv01cB+JoNSy3lklKv4P7GnrBLhFuLJEeRUf4gcT
         VpJw4vdUisroSHCe7cyFzs0zTj5kM0MKeiEnPj7eIqY1G1Blj3YFfSG7/afOu2hsn4Gl
         M3Kz74CE+B2lby7Dcfq2hVKe0pRi4nMj2ScmssBQXa6zk8JPOWgCspw82s4v29OuDHVZ
         HURQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=+g19+4RB48ZtqIqnQlRtHurOT2Ti9fThFdUPsdLwEXM=;
        b=T5ev8IoT+fEvJTnG1qDRUDSu4Waw9GrpdlaKHx4G4VdODY3sgvlifZqnCMsDhTKeYZ
         j5+4RgQBT0Xz1uP1oL0HZ+Tiy8Sosmawyyl5M7gdT1Ln/JfOO80nUdzIGRn7NiuPNF1b
         xWjOm4X4bJdL+m9ofiqsX22CvMi9f3tePXFCvitIa9f/yG4Sv/+yr41/XBFmw6DDG/E7
         ZJC3CvLV5bpT9E8tCgMCWgWkLKW6NKCNOS9MpAsyyqA3aY4waXF4ZEsP+g6ZlYjBebR7
         NSp8mEpqBLTSqtnULrpVChuwcVP8RmwiYZyZF2C34Bk/xsYImNXBju7UjkjIbcBXA0OY
         aAiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+g19+4RB48ZtqIqnQlRtHurOT2Ti9fThFdUPsdLwEXM=;
        b=nB+1ITEw8Tf77vEwZkEIz7ldlftOq52wGYcTGmNMEONJnhoAmOCKCVLnrmq2kpFmm6
         Bi3N1HWoSDPrjojyME0OgRhgBiCWHelUYJgdwDRE0poyuzv4dGXm7ek7TWc01NgpxG95
         h0pKoaeq1ueNlwGaQwhMPCAkpSoZ4GqTZbJIwppSnVE0IFbsjEfSBVxPSuWn7l4Kbji5
         yyyK6kU0hXrNNpDlKchC4ibhk6D7cXp01gB0Oj+kG5vtsX+7iewATCN//fhs//74AwOj
         YYP5ZjsK+v+6xzGm4Q+MRbHJ7Gd8vb/RJCe42XXJRKqtKWODqMo5QcMIkkXUQP1gka7O
         fBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+g19+4RB48ZtqIqnQlRtHurOT2Ti9fThFdUPsdLwEXM=;
        b=P46f7s1jehYAsd9CAz4bEDjYV8lkrLYYHAUEVore+8yk6NFoGwuq/HA4KGZU3uRhay
         bmQPH4nuFLK78XVrqw4KSlTdpomyq2sQDFzhUHtTRCmv6vgZ9OD7iD/FDfQc+EQhLahh
         OV1jWazWM0GDX24XgoQnuDGcoA/o+DJCQzfWUla421tNve+Msq/Nush8MUiQg5L5uZd+
         caOegBr9wyHlbQy5O9HOUF7/7sfFlcBT8aPn4CcPpeLmIwB1Bzp7oREG7n8c+BMLKlwT
         Qni+CoLLtZtRCNqTvC1cJB4kA5GCUTYzTFX8uGKyN7KZnbRqNNxcW7yInzSw6L/KhKju
         7K2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53365G+ou6JnfeqAeDgBczD0HId3NhyUfw4l0DY2hRI33dETRZzM
	8DHkOqqpDDye6MnAmlG7Iuo=
X-Google-Smtp-Source: ABdhPJyvMoJvuXFnCylMz8yGiv/6MxnW3pVlr3g44ErghRe6DlcJsQ7DvUVg6Z2DRQSfNd/QQ0GFUA==
X-Received: by 2002:a19:e4c:: with SMTP id 73mr5460508lfo.286.1601876393711;
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:804f:: with SMTP id p15ls208982ljg.2.gmail; Sun, 04 Oct
 2020 22:39:52 -0700 (PDT)
X-Received: by 2002:a2e:9588:: with SMTP id w8mr3492089ljh.298.1601876392352;
        Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876392; cv=none;
        d=google.com; s=arc-20160816;
        b=bLSTQXdW5wD6nUQE+D+IorkOdFXZMIgJNFaAHrr0nm2Yo5ODHQ7PcJMo8Gg0+Mxs2u
         iMjWTMke08MMZlGUcnyqrw9UCeXr7X3bJA2bgM6keaz5h2oyB9k3R3AwCzKcr8Ks2BG+
         cCRM95I5y2TuMgZNZ8799h5v1i+Dtp9AgJyUQcv5eiRJ7Czw8+HRQf29HUmcoJR2zGj1
         Z2HFVxt7Fev8J1qdCg5nO9XSBQ9dz9Y66OOpu9LLlW1v0iCPBk6wyQWhkQtDi6Ho2/RF
         u4wenMM01Gr9p62G40YIKP2BJYeiA2SKOISeFdn0GqyGa70o67g3YPpF0eOaUnu4ku0s
         fNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0TWWFnc1wf94XyqXZ0kTwyZwb2NrG/VCjNAFGQd8Hyg=;
        b=letFK7Cd6w4j3Q03qhBH0qkkav1AVtn3RLQDGHQRnJGFyJYJ3KOGVVyf1hFUhV5x9R
         Ym71PHbdtYNMs8ZaVdW6BCPEAGMqY6gqkFOJeVW3/xkZcMjdS4jOT7CkQBwr73al5GEn
         Iqt/x3A+0NNj6v52ADLlHZHKDX/LZyq4E0IqtkZjEi1nMWu2d1Thd1+yrJrfb57wIsUi
         0XrV1HjCziqG3OLIze2/sc7R74NH0CDo5eYQEnVoYLPzuL36RFYfZfXKrPROzhW2TrzM
         a5/c9DmxPvzAnPPG+rPIu4X8GqRx0QfcDt/UojMH0ReBOwtf6fka7nMOCgUBQjuUhf4G
         GO5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t20si94745lfk.10.2020.10.04.22.39.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955dpl9031109
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:51 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncD025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:51 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 04/19] linux-jailhouse: Drop unused patch
Date: Mon,  5 Oct 2020 07:39:34 +0200
Message-Id: <a88ead0ce75cdb5d6fdb253913087ef367da0c06.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Forgotten by a072ed49cbb2.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...-revC-Give-wifi-some-time-after-powe.patch | 38 -------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 recipes-kernel/linux/files/0001-arm64-dts-zcu100-revC-Give-wifi-some-time-after-powe.patch

diff --git a/recipes-kernel/linux/files/0001-arm64-dts-zcu100-revC-Give-wifi-some-time-after-powe.patch b/recipes-kernel/linux/files/0001-arm64-dts-zcu100-revC-Give-wifi-some-time-after-powe.patch
deleted file mode 100644
index 429c7e5..0000000
--- a/recipes-kernel/linux/files/0001-arm64-dts-zcu100-revC-Give-wifi-some-time-after-powe.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 071a0609be14752b2fbe9cab40f2e8e42995ed96 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Thu, 24 Jan 2019 05:54:41 +0100
-Subject: [PATCH] arm64: dts: zcu100-revC: Give wifi some time after power-on
-
-Somewhere along recent changes to power control of the wl1831, power-on
-became very unreliable on the Ultra96, failing like this:
-
-wl1271_sdio: probe of mmc2:0001:1 failed with error -16
-wl1271_sdio: probe of mmc2:0001:2 failed with error -16
-
-After playing with some dt parameters and comparing to other users of
-this chip, it turned out we need some power-on delay to make things
-stable again. In contrast to those other users which define 200 ms,
-Ultra96 is already happy with 10 ms.
-
-Fixes: 5869ba0653b9 ("arm64: zynqmp: Add support for Xilinx zcu100-revC")
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
-Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
----
- arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
-index 13a0a028df98..e5699d0d91e4 100644
---- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
-+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
-@@ -101,6 +101,7 @@
- 	sdio_pwrseq: sdio-pwrseq {
- 		compatible = "mmc-pwrseq-simple";
- 		reset-gpios = <&gpio 7 GPIO_ACTIVE_LOW>; /* WIFI_EN */
-+		post-power-on-delay-ms = <10>;
- 	};
- };
- 
--- 
-2.16.4
-
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a88ead0ce75cdb5d6fdb253913087ef367da0c06.1601876389.git.jan.kiszka%40siemens.com.
