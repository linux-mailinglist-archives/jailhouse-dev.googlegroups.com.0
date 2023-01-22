Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAM5W2PAMGQE4HZH37Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id E56666771DF
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:05 +0100 (CET)
Received: by mail-ej1-x63c.google.com with SMTP id hc30-20020a170907169e00b0086d90ee8b17sf6476911ejc.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415745; cv=pass;
        d=google.com; s=arc-20160816;
        b=BL0rN7Ya2cl57BsEubsIaDT3Je9bwJXQPGIK1BcP6sua9BSUajn8iozZo23OS2PIVb
         bifS6B8PI6MKm6rRkqCqUATvfzXJ6QhDEynvOpTfCCfp4yArqeg09ea3ENgHbTmGUHGj
         XQg8iwiw20kY98MuLQy4IGHctt8TiAUeAsLD73F5Eg+95trZ2OdVR7I0i3dEOwQ5Cv/b
         aVmV0RFZBWLIVbvOjskwy+dLUK41ICWl4AkiL/CWkaGm72y3gG684lJz8DpK7E8bXM6J
         lUpoMQ33Eio9lB/A81pjuS44l1+1B/KdK2xSfY9+bKIBfziz63Aa5v+KqMO/qzZ2ysa9
         ZO/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=UHgBl3rrwpxERXH9HUt2Iu5t5z2H9x8Trzm57hn2sCk=;
        b=P/X+irAhxqqrXEJnp6octdoXHOMLSYUcurh2Rc/pF/r4A0z4DQamEE0l7Bei04bZWb
         mtqxqecuQ1h1gVkeOizQnoBmwnM/9rLU9ICv2zraYvuZXfmv95pGvF55/ZQiLpVBa7KZ
         03uNJVIPgrE8SVJHVmQhcPWukVVU3I40iTqsdn9ANDFPQEPozkGfHzzu3rxhhn2jTQkE
         ASUp3618U2pCHhivcdbjk5QcccSKZl7EzJzt39fdDGBZ+fqoXjIFjNmlFTEAH1GLw2KJ
         BRFYZqpZJUlzUfbi1XblikParIluRaN6z5XaJusWQI5H8eXHvvdyaFo3AE5+UDdMlLHb
         HS9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b="dO/NNd7T";
       spf=pass (google.com: domain of fm-294854-202301221929035679dee7aff16977d6-0t7ell@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-202301221929035679dee7aff16977d6-0t7eLL@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHgBl3rrwpxERXH9HUt2Iu5t5z2H9x8Trzm57hn2sCk=;
        b=KJcVixEl9Rt2OJI+JydBZyTM8W+oAjbMut6WP0rs1h2eJLYirLd8GvTxgCw/M3P35k
         +zSQ7U+V21Mo6CGxoRlhkDL5EjG5SG4iCVT1PTsan8Luv8GHPhAW//G4h4ETL/JolJbR
         NEvIsGXHwzri0AklZZqToFElugqNgAMnIX3Gfrm9kpK6VighjXtnYrNQYYofmbO+zq89
         4MSvfL+1r0oKn4BboSYl8Jbtrmp2HDJmB61QN4ns3pVZ2nBGGaEk6+8hmAmhroOkqbW4
         6LasmuGfyDErN61+anyEtgRYT46IXRZz/VPFYRnHgO1xIApGBkV1sCPExMaYCiNAFDcY
         PZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHgBl3rrwpxERXH9HUt2Iu5t5z2H9x8Trzm57hn2sCk=;
        b=iR3dfHueGoLN6oDS1HW2sZotFPc+VtzbCvuelpv4D11vE7Hh/c9rkwJbJWr4XlR+gs
         /8yuPDlfxC6oh5a3AVh93dwsg5Nsgs76GFOeNbh4eB5KhzQSFANzFCE8TaqGr2Mq+yuM
         JqyszQLw464hjM5zip4YPwvy7hn5nSWZrFed6QXTpxMZYMTvbHLJViOFfbvU1fsknK9M
         YbLxzxVH35CxHXinTnHvKMIHzUWCyg3BbnSor1CeUCNPwwIebr7uHjk3dQ+sRFa0xqpB
         VEk+AF1pVQ6OBPLNqIm5vZYPluBXDSOPIpMhUl7rpuvabsYZ6fjo4hp6gu2Dfw9l5omG
         eSWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kreZ7/Ukf1BtmQs9MNzVZdQgFYFlclFQDpZ7YccPFG23Z04ekA1
	taJthzqWsgAoYlDz2xuawHw=
X-Google-Smtp-Source: AMrXdXtrMU5OLrAfo6tlPFOK2Kz9o//62DSMTXUV1mMpijed6Hh/nT41bMbayp0S9Xc5lOG2IxHOSQ==
X-Received: by 2002:a17:907:362:b0:872:492a:ae5 with SMTP id rs2-20020a170907036200b00872492a0ae5mr2506865ejb.191.1674415745573;
        Sun, 22 Jan 2023 11:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5617:b0:7c1:381b:406d with SMTP id
 f23-20020a170906561700b007c1381b406dls5855541ejq.11.-pod-prod-gmail; Sun, 22
 Jan 2023 11:29:04 -0800 (PST)
X-Received: by 2002:a17:907:8b09:b0:873:2612:e12c with SMTP id sz9-20020a1709078b0900b008732612e12cmr25119717ejc.21.1674415744079;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415744; cv=none;
        d=google.com; s=arc-20160816;
        b=sS/9VZ/AqmqT6TGS/M/eVKs4HI4adphHbNxpEPwp0xokZmeKfIvi1niK6Kl1Nb75Ie
         bOLZJi8Xikfr41L8MMDeow6CvVZTwm8fm6zZR8UppcW70Dz3Ao+FI0xl9AUxdehgtI/u
         oESEnmUJmmo1tfHI/mEiVGkV191iPcUYsWveyspyvjInERVuljPHlnhGV9D71FSvRhOb
         u0YpjxcYGbFsDxDAyfPxo3iFgmZzaUrxFlkTRWB0qWh+W+gUraDP3hiasv8uyAmWz98w
         4ENAWVbv7kdiaFVZctjLU7p2Uil/MQHfoCZ5dCzvNYAhdmiFWwRfw0v0gytnamojUsR+
         PMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=8hFPT0NU5pzJUFpZGBmNsHH+IMH9IgOuA0nqxgPwM4o=;
        b=FrbpQhG5rbXv+ZA9lWrDXviwWQ9r1RX3TPkZwb38OkpP3tHBFSYq3Ri4skEnlbUARY
         afkYz4yMaodof7NVmJaKJBMvtu1pfrhyeRS+QvkBZ0Z41XYCiZ048C3RzhVTs0/sMFDT
         SfuG2CUJZO4Vsle4vqLyh5MS5Q6kSFhTf5Z77g7Bb9DgpbBAhrvmv7APrZ9eFi5DViSL
         vhzWhcud1ZCcC7yOdtZq7F6CasKc3VoiGYB1YFoOIWxQ+Wkwj/fZLiyHzKFsQ83h1r9C
         G1iYR7heCMX4vajh+K4/8XDsqHzVpFJU/WIqOOYapqduU2QXx1FCisvUwPHMfeJAiDsy
         P0Ng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b="dO/NNd7T";
       spf=pass (google.com: domain of fm-294854-202301221929035679dee7aff16977d6-0t7ell@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-202301221929035679dee7aff16977d6-0t7eLL@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net. [185.136.65.226])
        by gmr-mx.google.com with ESMTPS id k20-20020a05640212d400b0047014e8771fsi2007424edx.3.2023.01.22.11.29.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-202301221929035679dee7aff16977d6-0t7ell@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) client-ip=185.136.65.226;
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202301221929035679dee7aff16977d6
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 09/14] configs: arm: emtrion-rzg1{h,m}: Fix config checker findings
Date: Sun, 22 Jan 2023 20:28:56 +0100
Message-Id: <d78d413449dbefce7a7e101d6676ead5181cfab6.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b="dO/NNd7T";       spf=pass
 (google.com: domain of fm-294854-202301221929035679dee7aff16977d6-0t7ell@rts-flowmailer.siemens.com
 designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-202301221929035679dee7aff16977d6-0t7eLL@rts-flowmailer.siemens.com;
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

In the emtrion-rzg1h, the APMU regions were overlapping. In the absence
if detailed information, keep the complete range mapped, analogously to
the emtrion-rzg1m.

The emtrion-rzg1h had a VSPDU region as duplicate of the VSPD2. Drop the
former.

While at it, remove JAILHOUSE_MEM_IO_32 where unneeded. This is only
relevant for sub-page regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/emtrion-rzg1h.c | 42 +++++++++++++------------------------
 configs/arm/emtrion-rzg1m.c | 21 +++++++------------
 2 files changed, 21 insertions(+), 42 deletions(-)

diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index 9469213b..385f45b7 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[40];
+	struct jailhouse_memory mem_regions[38];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -78,98 +78,84 @@ struct {
 			.virt_start = 0xe6700000,
 			.size = 0x10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* SYS-DMAC */ {
 			.phys_start = 0xe6720000,
 			.virt_start = 0xe6720000,
 			.size = 0x10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* SDHI1 */ {
 			.phys_start = 0xee120000,
 			.virt_start = 0xee120000,
 			.size = 0x20000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* PWM */ {
 			.phys_start = 0xe6e30000,
 			.virt_start = 0xe6e30000,
 			.size = 0x10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* R-GP2D */ {
 			.phys_start = 0xe6ec0000,
 			.virt_start = 0xe6ec0000,
 			.size = 0x10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* Thermal Sensor */ {
 			.phys_start = 0xe61f0000,
 			.virt_start = 0xe61f0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* CPG */ {
 			.phys_start = 0xe6150000,
 			.virt_start = 0xe6150000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
-		/* APMU Cortex-A7 */ {
+		/* APMU */ {
 			.phys_start = 0xe6151000,
 			.virt_start = 0xe6151000,
 			.size = 0xf000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
-		},
-		/* APMU Cortex-A15 */ {
-			.phys_start = 0xe6152000,
-			.virt_start = 0xe6152000,
-			.size = 0xf000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
-		},
-		/* APMU Cortex-A7 and Cortex-A15 */ {
-			.phys_start = 0xe6154000,
-			.virt_start = 0xe6154000,
-			.size = 0xf000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* RES */ {
 			.phys_start = 0xe6160000,
 			.virt_start = 0xe6160000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* IRQC */ {
 			.phys_start = 0xe61c0000,
 			.virt_start = 0xe61c0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* CMT0 */ {
 			.phys_start = 0xffca0000,
 			.virt_start = 0xffca0000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* CMT1 */ {
 			.phys_start = 0xe6130000,
 			.virt_start = 0xe6130000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* TMU0 */ {
 			.phys_start = 0xe61e0000,
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index 22f5e859..3977968b 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[27];
+	struct jailhouse_memory mem_regions[26];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -78,42 +78,42 @@ struct {
 			.virt_start = 0xe61f0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* CPG */ {
 			.phys_start = 0xe6150000,
 			.virt_start = 0xe6150000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* APMU */ {
 			.phys_start = 0xe6151000,
 			.virt_start = 0xe6151000,
 			.size = 0xf000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* IRQC */ {
 			.phys_start = 0xe61c0000,
 			.virt_start = 0xe61c0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* CMT0 */ {
 			.phys_start = 0xffca0000,
 			.virt_start = 0xffca0000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* CMT1 */ {
 			.phys_start = 0xe6130000,
 			.virt_start = 0xe6130000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+				JAILHOUSE_MEM_IO,
 		},
 		/* TMU0 */ {
 			.phys_start = 0xe61e0000,
@@ -150,13 +150,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* VSPDU */ {
-			.phys_start = 0xfe930000,
-			.virt_start = 0xfe930000,
-			.size = 0x00008000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
 		/* DU */ {
 			.phys_start = 0xfeb00000,
 			.virt_start = 0xfeb00000,
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d78d413449dbefce7a7e101d6676ead5181cfab6.1674415741.git.jan.kiszka%40siemens.com.
