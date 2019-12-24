Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBNMCRDYAKGQEM3J4CTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43a.google.com (mail-pf1-x43a.google.com [IPv6:2607:f8b0:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1930A12A139
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 13:14:47 +0100 (CET)
Received: by mail-pf1-x43a.google.com with SMTP id c72sf13836671pfc.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 04:14:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577189685; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bly5a1nfTSkyL/Ic4a6DkKAN4xrfXMSwraxp1Zy+Je5VC7RlmwSxKusyRcauEIw6Lu
         tONRaI/U0DGyGCsI7l7I6efCpPkOlmouk234v3a3Su5+y3lRwayVVqA3v00JbToxpZg9
         JBlWKxXLtsXQK0sd8fZLz9FcnglWT8OrEEB/lo7kRivDkXvjgv1LAdH+a/IjD9ONRylB
         +g1b56CahUxs4fA4F/d+TFVXYNLQQX8Ac+5OkLvxfreS4/Se0EayPwSThfdTYSVfdaTS
         uo+1b7fFLa/79Zl5Yv9QGdxyNt1qK5gGkxl9DjwmNLA7hsTlR/DLBfco0puFKMierZHB
         TJfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=x4iEvtEKQ+s+xfIYCrbdLA3Z6kbDrpGjPcjMSLqbqbo=;
        b=cfYEELTFV57DDos4ZbxjKcV0QCUWLdNRKa1iYGLz5R9jKNRGQwJGxcQ7NVbIVQeyfD
         fJk0SS0jL+P5tLnryziUbiB8dFjJU4AaO1+BuyZ265q6+y0BoCkV53pzbZ9J/xpvKzwI
         WlPQuQzcoIuKPJpH/y1nmeHrpeMi3BCU/WcdyRL9gZoKcNX9R6cbFaSDf4aGQ3fz9EB7
         sEyTQBSLj5WFEDSrLetx1Z8AcsuInttqSTg4wVLyWeq3Uhqd8w9vIoYsI/dai9ZJLDdv
         sVA/cneWZKRGl9ZWWW1L1QXUOnuxummb9iTuFY+gsWbfSNgFjQc1M58A7m5W7yKSZWS+
         bDMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qqbzkI20;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=x4iEvtEKQ+s+xfIYCrbdLA3Z6kbDrpGjPcjMSLqbqbo=;
        b=T/AhQza8xdxrQeKUjcKYoLSFHGSVHbNP7/w1b1P2FWJDjYBOX5ogcdjXPLOvMnBba8
         BqrcbX4JkUCjiO+4uCbqPQCuoK8qBZaPipbx0uIi/zVIiivMNAziTJ3CmoKrUjTdvVjE
         R/YioUzgYbFCzQ2aDkIyhwHhnvkxh5Ie7Wc7IaZpH96Gg+r+3MWvh02GeJxCxN9GrZ5z
         TuYFmhUhcf0oYU1ecxcDsiTJHUabVpzCiCqISCAwXG9vb+odxXOm6+WJuIRbQU1s93cB
         zaOiQw6xJKwR/vXfW2X7uFKGUX47BeFYsZEWBQfsiTg93diAhfq4UUZDaIQHLCQff4EG
         fojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=x4iEvtEKQ+s+xfIYCrbdLA3Z6kbDrpGjPcjMSLqbqbo=;
        b=kK6mC64C7t+WgJFHCCUryaRMJIRxj7IrlCyI0i2lvTmGf7L7Ip18mPK+jNk9IfCr7l
         jfu0i2TZcEmq1XmRo6lHTQRnIYr2LQR/avLCoT+m+mnc/XpMYBwpdG3r28KplSsIpD91
         6F9lF/GuXeMmE+YjwC934l0Q4DiZIv4ka4dFZ3hPfMrdQBguubvA5l/0aUljKVeCps2i
         IndpGpS62vMJNPhWbdc0MRjfIc0N2kghizmK5dbxOail233TYQKUk3klAPbK00YExUyz
         LO++V3yfF5amG9N6Wth+88oFgzssIXIAwlHGQX07BIxCAP+ebZwCHxyOdgopsEtvPX+0
         f24g==
X-Gm-Message-State: APjAAAXOPXyEit0FwMNwSoUYDWU7PW14n88F9sd//qoTKaV8ykn1b5W5
	4bPiONmSTJgldcV+lVO2VPA=
X-Google-Smtp-Source: APXvYqyviH5e/rVn4lHwiu50pt3Xt9mOGS4LhzM5HGdrPdQUIN5vIXwB2rScfTmjtj95ktqT8E9ROw==
X-Received: by 2002:a17:902:bccc:: with SMTP id o12mr34462177pls.247.1577189685256;
        Tue, 24 Dec 2019 04:14:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:242:: with SMTP id 60ls5126814plc.10.gmail; Tue, 24
 Dec 2019 04:14:44 -0800 (PST)
X-Received: by 2002:a17:902:968c:: with SMTP id n12mr36212404plp.144.1577189684635;
        Tue, 24 Dec 2019 04:14:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577189684; cv=none;
        d=google.com; s=arc-20160816;
        b=P3l7u7+TVRtQV1agRMX83roGTx+fQseEONV7xht24aJRoZJ8LoMnNzyWNiehw/i1Gq
         i9yON/q6R1AZJcQOJqSTHEH2pJg+WVpr2PIvlwKat+3WLAjPHQypkgm5Ck6j0Z8+PpWm
         Fr6S7XFP3xI3xYvbQKBFbj5cujzgPIlndXpPqWrLTzoEj6crRzak609GH3I/WjDso40g
         if6pMO9vMkidqNIVtPsoQboLeTQRTsolcp6zB1xeCn7LCH4HHRUQg2/TdnfnYrq9+Bx2
         2PHgqbiWvdAx64LNqEOGnc+gR35Jmh+kC1R1Y3DF6PRJn2vd4lWVl2X1ey0eeXyusdmo
         CB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QzSp1DUqe2lSdkUVLb9E4NLUZQtM/PHlmqlBefv/0/8=;
        b=kvLLoXOLq9AwUQu0WovRBDyL5aDp0zme0BXAA22DCKsLNxbGmWZMJS9TdbYo4X0dSh
         syXqCfff8pO8S9nOcSCxknLZH1XP2bRjkJovhIx/0LC6G1WmYRkq6r8BfV/onDR9Z3MW
         +cRuNzMQ/eft9olP5MpgeP2WIsIkEwt3UNYCZRY388cCtlcRPXnVPSoIeYf2Z3TdigvW
         K+KKyFKYxWTFvknxSqFeqQ4akxLdClFan1DwenXwdfIYGUtHX+6yWs8/MScgV0fV9r0O
         4YoI4bAeckZpzpu8kbCSKPGC6f1xNk/QbfKFcgLjHwWbdbhY6w+aIP3XCe6P+BWa2/CG
         49Gg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qqbzkI20;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id v13si929632pga.4.2019.12.24.04.14.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Dec 2019 04:14:44 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBOCEhJG038572;
	Tue, 24 Dec 2019 06:14:43 -0600
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBOCEhxd023578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Dec 2019 06:14:43 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Dec 2019 06:14:43 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Dec 2019 06:14:43 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBOCEfgS039292;
	Tue, 24 Dec 2019 06:14:41 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v1] configs: amr64: k3-j721e-evm-linux: Fix GPIO failures
Date: Tue, 24 Dec 2019 17:43:33 +0530
Message-ID: <20191224121333.10214-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=qqbzkI20;       spf=pass
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

For K3-J721e devices, gpio virtualization is achieved by
replicating copies of GPIO controller.

Each cell gets a dedicated GPIO controller. However, there is
additional field in the pinctrl to select the GPIO group.

Add the mem_regions for main_gpio2 and main_gpio3
Program gpio_group in the pinctrl node for SW10 gpio_keys

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/dts/inmate-k3-j721e-evm.dts |  3 ++-
 configs/arm64/k3-j721e-evm-linux-demo.c   | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
index 51470a57..7edecda1 100644
--- a/configs/arm64/dts/inmate-k3-j721e-evm.dts
+++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
@@ -403,7 +403,8 @@
 &main_pmx0 {
 	sw10_button_pins_default: sw10_button_pins_default {
 		pinctrl-single,pins = <
-			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
+			/* PADCONFIG[5:4] = GPIO group select = 1 */
+			J721E_IOPAD(0x0, PIN_INPUT, 23) /* (AC18) EXTINTn.GPIO2_0 */
 		>;
 	};
 
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 12351ab3..55938b85 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[20];
+	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -89,6 +89,20 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
+		/* main_gpio2 */ {
+			.phys_start = 0x00610000,
+			.virt_start = 0x00610000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* main_gpio3 */ {
+			.phys_start = 0x00611000,
+			.virt_start = 0x00611000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
 		/* main sproxy target_data host_id=A72_3 */ {
 			.phys_start = 0x3240f000,
 			.virt_start = 0x3240f000,
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191224121333.10214-1-nikhil.nd%40ti.com.
