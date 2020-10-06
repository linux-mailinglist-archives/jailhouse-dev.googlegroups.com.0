Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMHG575QKGQE7R7SEGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A72844DF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:44 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id gh22sf2612329ejb.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958704; cv=pass;
        d=google.com; s=arc-20160816;
        b=gHuJ+DFXqAudHX89ZdvPNqTtF1a/uBQMf9TQNFXaHL2noEdmZz8xMEvUbK2c5xVd7z
         aVB0nfZNn332JiBfPaRHwWM9BvFbSoSJyhJZR7ZGH7MXLdKiVgvqwv0CSgZfDU7jMzA3
         WWmvPbVOlH2URsRjCvvL4zCzIkZH6pLRKi0LUQ+rtu97Ns+ZF0njs1qQgVu0ombGQi72
         +Gb5vmF4WPSwzZAc5CoQQDJjOSZiC+Lg83CpfSjJQb5JnvUPwYp91Xd0Aq0Ww8gYE/sR
         LxE4PM8L5giRmTDrGAH/tQrUTlY7QnkwMWXITjaSXwSVU5SprHdu2aonfqfkKpU8q5ub
         HahA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=xGuPe8tKGHKxF5eITcyYY9rwbtcqi/gRt5gOaaBi16U=;
        b=rgzb3Q1mNSagrdMoh1GAgIBd12EQQrAyZJ7h6cE+wYb794/qUy4AQAHoXjRE7lCnKn
         M8V+N7M7GAcWz8fzXxjJzJ8ioDwZQMaiVJtlakZUysxFhm/7bwB+Glh9uUmV3GzP+PPa
         UMvOqTzFZUZripLzVFMBVxedlNMmdtojBxLKvUbsu+zzGZPsydrDXWyXb/Uz00TPxvK/
         viVxgS3w2RfDquFLEIhxqPWPYRT6tdab4IzffkBIpKdMW41sTlwaFkf/uaiHOYJQCMw2
         oNRMrdDcCeXTQopFD7QtwBabQorTwUKEHnTg0UsC08bOVJ1Mwt9e5pLbGIlLm3yHkZwk
         J3DA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xGuPe8tKGHKxF5eITcyYY9rwbtcqi/gRt5gOaaBi16U=;
        b=C6/lFETeitLTFlkXuE/IbgEwqmBA75H67sE+C6xZHGu9q1KCSS2E2wUhD1quWnjYt4
         HvKvZ+/Ti5XYkVJFk66c09Jp7ZADiKJBw9LOw7CPh6dEVLeswVlsrua0di1TWtAev85p
         QDHyop3b3NcP6gFD9SiclKTPTP/94XQCQV0QDzu+8s0kjuFLrzBNXVMmk5g/G2pWzSOu
         s1KELFFWvvh1A0Jqt+xFOQTwA/HZfIMMGRRcN0gW2fHOmTWQkWlrETVJvAwgmDCUoU1b
         uQ5eqzPnH/i3C3f9QzrdjPZ9Et8bSJz5j0A6z/o1EFbQ3UnwJgFRFxUqq1XrdV2YgbSs
         +QqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xGuPe8tKGHKxF5eITcyYY9rwbtcqi/gRt5gOaaBi16U=;
        b=Xft8OW0ESCE5TR70UrR1cclCBh3w83Qi6xChK1aAZW3BO5OGpaiyDIc1805qznodJ5
         2RNge7/jQz3s1PbtwTuvX3D+DvV/8JxrpGVxi9U4VsyHyCyCNVKCGW5LJ7SQy29cPgRW
         qbqYoQGW66swX9Y6GsGm096esSTBdDUgn8B3S6Lh549xlELwIV5GSYxARAOBP4i+irZH
         iBzmj/so10vn8oha/1fQcEBiRYTWNYTFB9Mi/r8n9KZBh8WqsUQW8LwYeUW9XM6rJMtk
         frwfm/IN0twW2llGe8C6v3+lNIIrUUZIVJRqAXdchVJdankHi++Qk5a/uFro6PG54AJC
         p0nQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5319b4M7n3tB3n7K2WwxmTlzgvqRds+R58VbStlzYWV9WQmW/5Id
	PjRukc64OdUYrj3I6BlJrxI=
X-Google-Smtp-Source: ABdhPJw+oET4fHs9YAfj4Ery5uS1EwrvpDg4fTLrv5vPtJpBYWGDluFIB1kn2EHt0u3u4e5DLn66XQ==
X-Received: by 2002:a17:906:6b98:: with SMTP id l24mr3035701ejr.339.1601958704630;
        Mon, 05 Oct 2020 21:31:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:39d8:: with SMTP id i24ls5346237eje.11.gmail; Mon,
 05 Oct 2020 21:31:43 -0700 (PDT)
X-Received: by 2002:a17:906:a387:: with SMTP id k7mr3377302ejz.167.1601958703495;
        Mon, 05 Oct 2020 21:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958703; cv=none;
        d=google.com; s=arc-20160816;
        b=PuIroPooBCyHgSopTElLXoXTOkGf07V9pniFLK0/7KW15KkgzyYaYiMUDBDEQpaoeu
         n5ZRtPk3b9scGaDZamJdzU8ICNrQ56HI3qJfOBWOEhUhkC9vJrAmeMG2skxTKF0Ty3lq
         OB/tbm/VyzKicLVbnbwzhuEiI7eFOvpDL1DRThprMe0FEy6TV74GyRd/k8+U0QNkicFK
         rObnw/yvN5KCjvcAOoIkPsVhaqkZ567cX8p8h8UDY0CLceGoWLlpkaaWHJlCVTMFKKHp
         Z0zsoEYH8WaYmiRs9/aaD99oXxx22DbYQKzJ6+4fn1ZmRC++pV7t6/K3gBdELeg9fJPX
         D34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0TWWFnc1wf94XyqXZ0kTwyZwb2NrG/VCjNAFGQd8Hyg=;
        b=k9hfK2w/b7gvAf2Y6tuOP+Rip2iwkzYHcKGKfdtDLg5EdX72S5kavg1UYoGwEbv5nJ
         9N6h0fJBUbL3IS/2E6V6YcS/PRwsfPV1UHyxnCa90J+Y4tmyeVg6I14LwoLb2ySpiRi3
         Y4AKzlKjMOagbK3uGcBZpk7FHxkHEEljVBP/vuHY1fBebxmGwPSxiWz3xlsB/OcUnzyG
         irBXOXspr22E391bnV1/DjLYCBnmfFNDVRERQubgNejHFBRFrRJCI/qh8yaRb3YsHPHh
         vIfpigudLnHB9Au5HQ9DmJ7gWlXK+Co44RS8tm04tn+v1v4JcDW0IuBD3n1ZIVXIHSis
         xuMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id g25si52211eds.3.2020.10.05.21.31.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964Vh2h028531
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:43 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7o008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:42 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 04/19] linux-jailhouse: Drop unused patch
Date: Tue,  6 Oct 2020 06:31:19 +0200
Message-Id: <a88ead0ce75cdb5d6fdb253913087ef367da0c06.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a88ead0ce75cdb5d6fdb253913087ef367da0c06.1601958694.git.jan.kiszka%40siemens.com.
