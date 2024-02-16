Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBV7SX2XAMGQEWKWUK5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id A073E85863C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Feb 2024 20:36:58 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id 38308e7fff4ca-2d101f2e09fsf20026081fa.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Feb 2024 11:36:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708112218; cv=pass;
        d=google.com; s=arc-20160816;
        b=zgqElis/Hnevy3tNnbXZmEc91cwSeXJ18fr2RMLgSQI2glCiRLwJBROUXy+Vz9oB3j
         SNlV2OZhXQTImpNO/Mw5xztyu2mViINhaCefawQgsw2W0Fk1FPyzj63uAEYE2KI0DKJ5
         vLuSidawFkLmg403xFD7C9RkD/AwkXyxnQoV0fK4QzefWnus2LePcejVS2STnFF2D8j3
         F7qLI5J5x3bOgF+nVgfaRQI6+1iZZxTGCKWDCBLo02KMyyJiOvVZ2V1Zj1KnWHfMSOtx
         kIGHXGolaowm8e7H9zaE5cQ7seVLNfB4xxLlCxgN9Q33KASsF2OTwFttBJwUE+mFbAwN
         59/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=KCmDevMZ3B4tCmttf92L9z1tlH+j5prKqep9VsLJDCU=;
        fh=4DwtjLJDkTdh/I58cMw2KnoTyZQQ4TFW+3V9ezJuG9g=;
        b=DP18jaOZjEC38y2CLH0STRe5JM4TNKGz1EB2s3PrVgIduUsyCiRCDAR8B9IqBrko7x
         Ym4Q4OxIhrU+nTKhMK9dY5yjmJzTM4rYf8LG9g8uCNqSlN6CDI7ZxDKw1UaT0zVM1kQv
         y6UI+mXLtCar0eXXzK+m78WuzphBx/VKT2vkL47LfJa8JehvNGiGodAhQCjNoinxxo5a
         H+S/HNEEpcjnZw9pnr3l+6emN50asZXDORtUf734KuokT2mrdutdVsK3OvoihPxcV/qS
         djoo/Sb0GZmA5srXcnOfDf2GprHu/x/vBiEVuQBR7mzKzMFw5Gdjn4Ml04HwxarpOz2R
         QgaA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=e2Mc9l21;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1708112218; x=1708717018; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KCmDevMZ3B4tCmttf92L9z1tlH+j5prKqep9VsLJDCU=;
        b=oNk2QYe14t/m+9ImpKiTxD5kat5dd9ndsO07ivtqEHR2mDGRyVwWuzecubTwLBS0Dl
         dntom28hU63/y0gJPsankf+m8xPaOGWoM+LVEDR+Ss2MGyP83yGaplnCAGvQYnjuLQLh
         Z7MikQuEmETV9W/iSkY0Hmls5FvCMT1norQ2/O3Jt/Rwbn1TgHYJeFYHTl/VpTK6tlhQ
         z9VPrrt1bzPHJPhC5vqW7+JecD0xIcw8w0rfT8La5UMY7yTJ0vXHsIYkh5yLu2e23rUd
         qU4dSqHlEMz9Xxw15g15xcu5UZJClj92LIYxSq6L9Pyjv0L0qXVG94md4TxkZmgRwZ+/
         rpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708112218; x=1708717018;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KCmDevMZ3B4tCmttf92L9z1tlH+j5prKqep9VsLJDCU=;
        b=Ae1DlpSeOEFHbijM9/eeVYyw/Di4yxXYqIirJfVYu3B0mKvv/Mq5kWj15N32+UvB4S
         SCv8VHsnU9iQgCnXlkU9dtAJgcJ95XF8HKl/zZH/ePN/HL7MJK/LM+CCQSIuJm3zPGwr
         XOj7472SHhty15vIlQtxahZ4atIfcmyvG0uciZpXdsgIBEG5oDTTd1ZgfIFe79zx9gFx
         o99f+WJuO3ECNJYGI390O21GeGd8D6TA+CfI147KsGAgmmkpNIQ90DXE3PDzsPMWKjxv
         zIuc27Nys0mukZbKAM8fUdjcg1VThmi3fSjaDixSVegKNzHvYIKuhHCqoqr2Csa46Zgh
         1xLw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCWZFbR28nZFyqIAjc/m1srbtRac3d9g6GKfsGdcKyHzqQbknvJ1yU+XusBk5+YRdYJs+scSxpC+vTcKibogaGGbHKJilB9XkpkiEXU=
X-Gm-Message-State: AOJu0YyJBaM+J+sbat3jDLQcSgLIYjL3juDLPL+jB23S4QP5C0TlgKbR
	OzQt2brJiFNZ+C133rO5sO83kT2kuSaZiliXleJssEDF1VNcc504
X-Google-Smtp-Source: AGHT+IER/ZNwZKGtGrWqEhWx1e/XbF+FJZn2Id1dUybdBuO7D39vxFGwq3z+H0P9nMzrli9yWLujYA==
X-Received: by 2002:a05:6512:2828:b0:511:5b50:4d11 with SMTP id cf40-20020a056512282800b005115b504d11mr4505134lfb.32.1708112217003;
        Fri, 16 Feb 2024 11:36:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:b9e:b0:511:623f:a563 with SMTP id
 b30-20020a0565120b9e00b00511623fa563ls596717lfv.0.-pod-prod-06-eu; Fri, 16
 Feb 2024 11:36:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5DpAg/kP67Ji5lqkHYb6/KQ1Jctxg245IviL4LRhaKM9jHSldrOJQnF+Wyn7J8L8I89vvaDYqEn7uDWZjZ/napy85A63LeMoWq6uTMXg=
X-Received: by 2002:a19:ca46:0:b0:511:483b:91c6 with SMTP id h6-20020a19ca46000000b00511483b91c6mr3758876lfj.48.1708112213762;
        Fri, 16 Feb 2024 11:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708112213; cv=none;
        d=google.com; s=arc-20160816;
        b=NNN+i99Ker9lruaHHDDwL/R/Q0bD2NXj6B8XpC2kkVYnUb3E/SkRduQGr7c3KHI5fh
         gtxrpXfc3LM6+S5RgBf+0MdTjpyp/W78OOjhvb7PiQJ/eA3cPCDOUCKGdhH6XXrfayqp
         GCJVQRkSs+kVcmBEMrQpWNOoveG/CvXhGi68wQ64EObbjRYhX/tEGo3fKEd4VLssJgx9
         ErKdaMl8KKTbAhaUHk8wzO1cBqCLwtRX4aDvrJbA6O4KAJki1O8k20qrwZQaZHsSXtcX
         zgvOZOgcO0UOZXJCFElC5k/rAev06/3CoaL7Niio/0du1W1ecGoChmCQ1ZbXA19cZ5h2
         MYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=CB11F2nN8tPW0fTdXwl/RghiHVyuY/jUrrL4SbV2N4Q=;
        fh=cOJ+LRySyXF2gDEMHGJgi9kQi5dsszgq61zyONLzg2I=;
        b=ZgdZw3zkXGJrASPOg2rmjTrkDo0nao7GhGeLyC+TqgFdaWizQrEmRWQqHjoWkxptqf
         KjmkaI92iB++Y3+kMfJm9szpNvuUNLkJNjPZ7HQKBoljVi7Ay0LtwMY0F2Tk7Z/uWV6z
         6weKxBreFwYHX93rJn3WLKivzvjbmmAqk1BM5NKQLVLytiZfnu458yz5KrDxgMDg7fFQ
         jNK4gcR5GhiBBKb8o+/VZH7d5+zc0GaagnvnOpJJ7fORrBoD9XezxVc7UfM9V50LMv3v
         KQlZoHFyyw2HFl1+HZ+EjBhmBr/N++el8Dl6VR2aE+I+Tf0ShoYty6zswpaH5YO6SwtH
         xGPw==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=e2Mc9l21;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id z2-20020a056512308200b0051183785260si18769lfd.4.2024.02.16.11.36.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 11:36:53 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 34D702A0354;
	Fri, 16 Feb 2024 20:36:51 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Tc2Hl4JwhzxsK;
	Fri, 16 Feb 2024 20:36:51 +0100 (CET)
Received: from atlantis.home (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 20:36:51 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] configs: x86: align with recent qemu device model
Date: Fri, 16 Feb 2024 20:36:43 +0100
Message-ID: <20240216193643.1524594-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=e2Mc9l21;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Devices slightly changed with recent Qemu versions. Adapt changes of
device topology.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

Tested with jailhouse enable, create, disable + apic demo.

 README.md              |  2 +-
 configs/x86/qemu-x86.c | 80 +++++++++++++++++++++---------------------
 2 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/README.md b/README.md
index 2ab2a60a..f6fe011b 100644
--- a/README.md
+++ b/README.md
@@ -255,7 +255,7 @@ https://github.com/siemens/jailhouse-images.
 
 The included system configuration qemu-x86.c can be used to run Jailhouse in
 QEMU/KVM virtual machine on x86 hosts (Intel and AMD are supported). Currently
-it requires Linux 4.4 or newer on the host side. QEMU version 2.8 or newer is
+it requires Linux 4.4 or newer on the host side. QEMU version 8.2 or newer is
 required.
 
 You also need a Linux guest image with a recent kernel (tested with >= 3.9) and
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index cdd3dd6d..7a585bd7 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -179,52 +179,52 @@ struct {
 			.size = 0x4000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: fea00000-fea3ffff : 0000:00:02.0 */
+		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
 		{
-			.phys_start = 0xfea00000,
-			.virt_start = 0xfea00000,
+			.phys_start = 0xfeb40000,
+			.virt_start = 0xfeb40000,
 			.size = 0x40000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: fea40000-fea5ffff : e1000e */
+		/* MemRegion: feb80000-feb9ffff : e1000e */
 		{
-			.phys_start = 0xfea40000,
-			.virt_start = 0xfea40000,
+			.phys_start = 0xfeb80000,
+			.virt_start = 0xfeb80000,
 			.size = 0x20000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: fea60000-fea7ffff : e1000e */
+		/* MemRegion: feba0000-febbffff : e1000e */
 		{
-			.phys_start = 0xfea60000,
-			.virt_start = 0xfea60000,
+			.phys_start = 0xfeba0000,
+			.virt_start = 0xfeba0000,
 			.size = 0x20000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: fea91000-fea93fff : e1000e */
+		/* MemRegion: febd0000-febd3fff : e1000e */
 		{
-			.phys_start = 0xfea91000,
-			.virt_start = 0xfea91000,
+			.phys_start = 0xfebd0000,
+			.virt_start = 0xfebd0000,
 			.size = 0x3000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: fea94000-fea97fff : 0000:00:1b.0 (ICH HD audio) */
+		/* MemRegion: febd4000-febd7fff : 0000:00:1b.0 (ICH HD audio) */
 		{
-			.phys_start = 0xfea94000,
-			.virt_start = 0xfea94000,
+			.phys_start = 0xfebd4000,
+			.virt_start = 0xfebd4000,
 			.size = 0x4000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: fea98000-fea98fff : 0000:00:01.0 (vesafd) */
+		/* MemRegion: febd8000-febd8fff : 0000:00:01.0 (vesafd) */
 		{
-			.phys_start = 0xfea98000,
-			.virt_start = 0xfea98000,
+			.phys_start = 0xfebd8000,
+			.virt_start = 0xfebd8000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* MemRegion: fea9a000-fea9afff : 0000:00:1f.2 (ahci) */
+		/* MemRegion: febd9000-febd9fff : 0000:00:1f.2 (ahci) */
 		{
-			.phys_start = 0xfea9a000,
-			.virt_start = 0xfea9a000,
+			.phys_start = 0xfebd9000,
+			.virt_start = 0xfebd9000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
@@ -264,6 +264,24 @@ struct {
 	},
 
 	.pci_devices = {
+		/* PCI bridge */
+		{
+			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
+			.domain = 0x0000,
+			.bdf = 0x0000,
+			.bar_mask = {
+				0xffffff00, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 11,
+			.num_caps = 5,
+			.num_msi_vectors = 1,
+			.msi_64bits = 1,
+			.msi_maskable = 1,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
 		{ /* VGA */
 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
 			.domain = 0x0000,
@@ -283,25 +301,7 @@ struct {
 			.msi_64bits = 1,
 			.num_msix_vectors = 5,
 			.msix_region_size = 0x1000,
-			.msix_address = 0xfea90000,
-		},
-		/* PCI bridge */
-		{
-			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
-			.domain = 0x0000,
-			.bdf = 0x0018,
-			.bar_mask = {
-				0xffffff00, 0x00000000, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 11,
-			.num_caps = 5,
-			.num_msi_vectors = 1,
-			.msi_64bits = 1,
-			.msi_maskable = 1,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
+			.msix_address = 0xfebd0000,
 		},
 		{ /* ICH HD audio */
 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-- 
2.43.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20240216193643.1524594-1-ralf.ramsauer%40oth-regensburg.de.
